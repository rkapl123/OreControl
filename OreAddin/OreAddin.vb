Imports Microsoft.Office.Interop.Excel
Imports System.Configuration

Public Module OREAddin

    Public currWb As Workbook
    Public OREdefinitions As Range
    Public OREcalldefnames As String() = {}
    Public OREcalldefs As Range() = {}
    Public rdefsheetColl As Dictionary(Of String, Dictionary(Of String, Range))
    Public rdefsheetMap As Dictionary(Of String, String)
    Public theRibbon As ExcelDna.Integration.CustomUI.IRibbonUI
    Public avoidFurtherMsgBoxes As Boolean
    Public dirglobal As String
    Public debugScript As Boolean
    Public oreexec As String

    ' definitions of current ORE invocation (scripts, args, results, diags...)
    Public OREdefDic As Dictionary(Of String, String()) = New Dictionary(Of String, String())

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' startOREprocess: started from GUI (button) and accessible from VBA (via Application.Run)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Public Function startOREprocess() As String
        Dim errStr As String
        avoidFurtherMsgBoxes = False
        ' get the definition range
        errStr = getOREDefinitions()
        If errStr <> vbNullString Then Return "Failed getting OREdefinitions: " + errStr
        Try
            If Not startORE() Then Return vbNullString
        Catch ex As Exception
            Return "Exception in Shell OREdefinitions run: " + ex.Message + ex.StackTrace
        End Try

        ' all is OK = return nullstring
        Return vbNullString
    End Function

    ' Msgbox that avoids further Msgboxes (click Yes) or cancels run altogether (click Cancel)
    Public Function myMsgBox(message As String) As Boolean
        If avoidFurtherMsgBoxes Then Return True
        Dim retval As MsgBoxResult = MsgBox(message + vbCrLf + "Avoid further Messages (Yes/No) or abort OREdefinition (Cancel)", MsgBoxStyle.YesNoCancel)
        If retval = MsgBoxResult.Yes Then avoidFurtherMsgBoxes = True
        Return (retval = MsgBoxResult.Yes Or retval = MsgBoxResult.No)
    End Function

    ' refresh OREnames from Workbook on demand (currently when invoking about box)
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

    ' gets defined named ranges for R script invocation in the current workbook 
    Public Function getORENames() As String
        ReDim Preserve OREcalldefnames(-1)
        ReDim Preserve OREcalldefs(-1)
        rdefsheetColl = New Dictionary(Of String, Dictionary(Of String, Range))
        rdefsheetMap = New Dictionary(Of String, String)
        Dim i As Integer = 0
        For Each namedrange As Name In currWb.Names
            Dim cleanname As String = Replace(namedrange.Name, namedrange.Parent.Name & "!", "")
            If Left(cleanname, 7) = "ORE_Addin" Then
                If namedrange.RefersToRange.Columns.Count <> 3 Then Return "OREdefinitions range " + namedrange.Parent.name + "!" + namedrange.Name + " doesn't have 3 columns !"
                ' final name of entry is without ORE_Addin and !
                Dim finalname As String = Replace(Replace(namedrange.Name, "ORE_Addin", ""), "!", "")
                Dim nodeName As String = Replace(Replace(namedrange.Name, "ORE_Addin", ""), namedrange.Parent.Name & "!", "")
                If nodeName = "" Then nodeName = "MainScript"
                ' first definition as standard definition (works without selecting a OREdefinition)
                If OREdefinitions Is Nothing Then OREdefinitions = namedrange.RefersToRange
                If Not InStr(namedrange.Name, "!") > 0 Then
                    finalname = currWb.Name + finalname
                End If
                ReDim Preserve OREcalldefnames(OREcalldefnames.Length)
                ReDim Preserve OREcalldefs(OREcalldefs.Length)
                OREcalldefnames(OREcalldefnames.Length - 1) = finalname
                OREcalldefs(OREcalldefs.Length - 1) = namedrange.RefersToRange
                If Not rdefsheetColl.ContainsKey(namedrange.Parent.Name) Then
                    ' add to new sheet "menu"
                    Dim scriptColl As Dictionary(Of String, Range) = New Dictionary(Of String, Range)
                    scriptColl.Add(nodeName, namedrange.RefersToRange)
                    rdefsheetColl.Add(namedrange.Parent.Name, scriptColl)
                    rdefsheetMap.Add("ID" + i.ToString(), namedrange.Parent.Name)
                    i = i + 1
                Else
                    ' add rdefinition to existing sheet "menu"
                    Dim scriptColl As Dictionary(Of String, Range)
                    scriptColl = rdefsheetColl(namedrange.Parent.Name)
                    scriptColl.Add(nodeName, namedrange.RefersToRange)
                End If
            End If
        Next
        If UBound(OREcalldefnames) = -1 Then Return "no ORENames"
        Return vbNullString
    End Function

    ' gets definitions from  current selected R script invocation range (Rdefinitions)
    Public Function getOREDefinitions() As String
        Try
            OREdefDic("args") = {}
            oreexec = Nothing : dirglobal = vbNullString
            For Each defRow As Range In OREdefinitions.Rows
                Dim deftype As String, defval As String, deffilepath As String
                deftype = LCase(defRow.Cells(1, 1).Value2)
                defval = defRow.Cells(1, 2).Value2
                deffilepath = defRow.Cells(1, 3).Value2
                If deftype = "rexec" Then ' setting for shell innvocation
                    oreexec = defval
                ElseIf deftype = "arg" Then
                    ReDim Preserve OREdefDic("args")(OREdefDic("args").Length)
                    OREdefDic("args")(OREdefDic("args").Length - 1) = defval
                    ReDim Preserve OREdefDic("argspaths")(OREdefDic("argspaths").Length)
                    OREdefDic("argspaths")(OREdefDic("argspaths").Length - 1) = deffilepath
                ElseIf deftype = "dir" Then
                    dirglobal = defval
                End If
            Next
            ' get default rexec path from user (or overriden in appSettings tag as redirect to global) settings. This can be overruled by individual rexec settings in OREdefinitions
            Try
                If oreexec Is Nothing Then oreexec = ConfigurationManager.AppSettings("ExePath")
            Catch ex As Exception
                Return "Error in getOREDefinitions: " + ex.Message
            End Try

            If OREdefDic("scripts").Count = 0 Then Return "Error in getOREDefinitions: no script(s) defined in " + OREdefinitions.Name.Name
        Catch ex As Exception
            Return "Error in getOREDefinitions: " + ex.Message
        End Try
        Return vbNullString
    End Function

    Function startORE() As Boolean
        Return False
    End Function

End Module
