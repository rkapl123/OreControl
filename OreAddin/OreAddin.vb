Imports Microsoft.Office.Interop.Excel
Imports System.Configuration

Public Module OREAddin

    Public currWb As Workbook
    Public OREdefinitions As Range
    Public OREcalldefnames As String() = {}
    Public OREcalldefs As Range() = {}
    Public OREdefsheetColl As Dictionary(Of String, Dictionary(Of String, Range))
    Public OREdefsheetMap As Dictionary(Of String, String)
    Public theRibbon As ExcelDna.Integration.CustomUI.IRibbonUI
    Public avoidFurtherMsgBoxes As Boolean
    Public dirglobal As String
    Public debugRun As Boolean
    Public oreexec As String

    ''' <summary>definitions of current ORE invocation (args = input xmls, results, ...)</summary>
    Public OREdefDic As Dictionary(Of String, String()) = New Dictionary(Of String, String())

    ''' <summary>startOREprocess: started from GUI (button) and accessible from VBA (via Application.Run)</summary>
    ''' <returns>error message in case of error (otherwise nothing)</returns>
    Public Function startOREprocess() As String
        Dim errStr As String
        avoidFurtherMsgBoxes = False
        ' get the definition range
        errStr = getOREDefinitions()
        If errStr <> vbNullString Then Return "Failed getting OREdefinitions: " + errStr
        Try
            If Not startORE() Then Return vbNullString
        Catch ex As Exception
            Return "Exception in OREdefinitions run: " + ex.Message + ex.StackTrace
        End Try

        ' all is OK = return nullstring
        Return vbNullString
    End Function

    ''' <summary>Msgbox that avoids further Msgboxes (click Yes) or cancels run altogether (click Cancel)</summary>
    ''' <param name="message">Message to be displayed</param>
    ''' <returns>true if Yes or No selected (Cancel = False)</returns>
    Public Function myMsgBox(message As String) As Boolean
        If avoidFurtherMsgBoxes Then Return True
        Dim retval As MsgBoxResult = MsgBox(message + vbCrLf + "Avoid further Messages (Yes/No) or abort ORE execution (Cancel)", MsgBoxStyle.YesNoCancel)
        If retval = MsgBoxResult.Yes Then avoidFurtherMsgBoxes = True
        Return (retval = MsgBoxResult.Yes Or retval = MsgBoxResult.No)
    End Function

    ''' <summary>refresh OREnames from Workbook On demand (currently When invoking about box)</summary>
    ''' <returns>error message in case of error (otherwise nothing)</returns>
    Public Function startORENamesRefresh() As String
        Dim errStr As String
        ' always reset Rdefinitions when changing Workbooks, otherwise this is not being refilled in getORENames
        OREdefinitions = Nothing
        ' get the defined ORE_Addin Names
        errStr = getORENames()
        If errStr = "no definitions" Then
            Return vbNullString
        ElseIf errStr <> vbNullString Then
            Return "Error while getORENames in startORENamesRefresh: " + errStr
        End If
        theRibbon.Invalidate()
        Return vbNullString
    End Function

    ''' <summary>gets defined named ranges For ORE invocation In the current workbook</summary>
    ''' <returns>error message in case of error (otherwise nothing)</returns>
    Public Function getORENames() As String
        ReDim Preserve OREcalldefnames(-1)
        ReDim Preserve OREcalldefs(-1)
        OREdefsheetColl = New Dictionary(Of String, Dictionary(Of String, Range))
        OREdefsheetMap = New Dictionary(Of String, String)
        Dim i As Integer = 0
        For Each namedrange As Name In currWb.Names
            Dim cleanname As String = Replace(namedrange.Name, namedrange.Parent.Name & "!", "")
            If Left(cleanname, 9) = "ORE_Addin" Then
                If namedrange.RefersToRange.Columns.Count <> 3 Then Return "OREdefinitions range " + namedrange.Parent.name + "!" + namedrange.Name + " doesn't have 3 columns !"
                ' final name of entry is without ORE_Addin and !
                Dim finalname As String = Replace(Replace(namedrange.Name, "ORE_Addin", ""), "!", "")
                Dim nodeName As String = Replace(Replace(namedrange.Name, "ORE_Addin", ""), namedrange.Parent.Name & "!", "")
                If nodeName = "" Then nodeName = "MainDefinition"
                ' first definition as standard definition (works without selecting a OREdefinition)
                If OREdefinitions Is Nothing Then OREdefinitions = namedrange.RefersToRange
                If Not InStr(namedrange.Name, "!") > 0 Then
                    finalname = currWb.Name + finalname
                End If
                ReDim Preserve OREcalldefnames(OREcalldefnames.Length)
                ReDim Preserve OREcalldefs(OREcalldefs.Length)
                OREcalldefnames(OREcalldefnames.Length - 1) = finalname
                OREcalldefs(OREcalldefs.Length - 1) = namedrange.RefersToRange
                If Not OREdefsheetColl.ContainsKey(namedrange.Parent.Name) Then
                    ' add to new sheet "menu"
                    Dim defColl As Dictionary(Of String, Range) = New Dictionary(Of String, Range)
                    defColl.Add(nodeName, namedrange.RefersToRange)
                    OREdefsheetColl.Add(namedrange.Parent.Name, defColl)
                    OREdefsheetMap.Add("ID" + i.ToString(), namedrange.Parent.Name)
                    i += 1
                Else
                    ' add rdefinition to existing sheet "menu"
                    Dim defColl As Dictionary(Of String, Range)
                    defColl = OREdefsheetColl(namedrange.Parent.Name)
                    defColl.Add(nodeName, namedrange.RefersToRange)
                End If
            End If
        Next
        If UBound(OREcalldefnames) = -1 Then Return "no ORENames"
        Return vbNullString
    End Function

    ''' <summary>gets definitions from  current selected ORE invocation definition range (OREdefinitions)</summary>
    ''' <returns>error message in case of error (otherwise nothing)</returns>
    Public Function getOREDefinitions() As String
        Try
            OREdefDic("args") = {}
            OREdefDic("argContents") = {}
            OREdefDic("argPaths") = {}
            OREdefDic("res") = {}
            OREdefDic("resTargets") = {}
            OREdefDic("resPaths") = {}
            oreexec = Nothing : dirglobal = vbNullString
            For Each defRow As Range In OREdefinitions.Rows
                Dim deftype As String, defval As String, defPath As String
                deftype = LCase(defRow.Cells(1, 1).Value2)
                defval = defRow.Cells(1, 2).Value2
                defPath = defRow.Cells(1, 3).Value2
                If deftype = "exec" Then
                    oreexec = defval
                ElseIf deftype = "dir" Then
                    dirglobal = defval
                ElseIf left(deftype, 3) = "res" Then
                    ReDim Preserve OREdefDic("results")(OREdefDic("results").Length)
                    OREdefDic("results")(OREdefDic("results").Length - 1) = Replace(deftype, "res", "")
                    ReDim Preserve OREdefDic("resTargets")(OREdefDic("res").Length)
                    OREdefDic("resTargets")(OREdefDic("results").Length - 1) = defval
                    ReDim Preserve OREdefDic("resPaths")(OREdefDic("res").Length)
                    OREdefDic("resPaths")(OREdefDic("results").Length - 1) = defPath
                Else
                    ReDim Preserve OREdefDic("args")(OREdefDic("args").Length)
                    OREdefDic("args")(OREdefDic("args").Length - 1) = deftype
                    ReDim Preserve OREdefDic("argContents")(OREdefDic("args").Length)
                    OREdefDic("argContents")(OREdefDic("args").Length - 1) = defval
                    ReDim Preserve OREdefDic("resPaths")(OREdefDic("argPaths").Length)
                    OREdefDic("argPaths")(OREdefDic("args").Length - 1) = defPath
                End If
            Next
            If OREdefDic("args").Count = 0 Then Return "Error in getOREDefinitions: no invocation definition argument(s) defined in " + OREdefinitions.Name.Name
            ' get default ORE exec path from user (or overriden in appSettings tag as redirect to global) settings. This can be overruled by individual exec settings in OREdefinitions
            Try
                If oreexec Is Nothing Then oreexec = ConfigurationManager.AppSettings("ExePath")
            Catch ex As Exception
                Return "Error in getOREDefinitions: " + ex.Message
            End Try
        Catch ex As Exception
            Return "Error in getOREDefinitions: " + ex.Message
        End Try
        Return vbNullString
    End Function

    Function startORE() As Boolean
        Return False
    End Function

    Public Sub LogInfo(message As String)
        If debugRun Then Trace.TraceInformation(message)
    End Sub

End Module
