Imports System.Runtime.InteropServices
Imports ExcelDna.Integration.CustomUI
Imports System.Configuration

''' <summary>Handling Events from Ribbon</summary>
<ComVisible(True)>
Public Class OREAddinRibbon
    Inherits ExcelRibbon
    ''' <summary></summary>
    Public runShell As Boolean
    ''' <summary></summary>
    Public runTask As Boolean

    ''' <summary>starts the ORE engine</summary>
    ''' <param name="control"></param>
    Public Sub startOREprocess(control As IRibbonControl)
        Dim errStr As String
        ' set OREdefinition to invocaters range... invocating sheet is put into Tag
        OREAddin.OREdefinitions = OREAddin.OREdefsheetColl(control.Tag).Item(control.Id)
        OREAddin.OREdefinitions.Parent.Select()
        OREAddin.OREdefinitions.Select()
        errStr = OREAddin.startOREprocess()
        If errStr <> "" Then MsgBox(errStr, MsgBoxStyle.Critical)
    End Sub

    ''' <summary>reflect the change in the togglebuttons title</summary>
    Public Function getImage(control As IRibbonControl) As String
        If (OREAddin.debugRun And control.Id = "debug") Or (runTask And control.Id = "task") Or (runShell And control.Id = "shell") Then
            Return "AcceptTask"
        Else
            Return "DeclineTask"
        End If
    End Function

    ''' <summary>reflect the change in the togglebuttons title</summary>
    Public Function getPressed(control As IRibbonControl) As Boolean
        If control.Id = "shell" Then
            Return runShell
        ElseIf control.Id = "task" Then
            Return runTask
        ElseIf control.Id = "debug" Then
            Return OREAddin.debugRun
        Else
            Return False
        End If
    End Function

    ''' <summary>toggle Shell or Task mode buttons</summary>
    Public Sub toggleButton(control As IRibbonControl, pressed As Boolean)
        If control.Id = "shell" Then
            runShell = pressed
            runTask = Not pressed
        ElseIf control.Id = "task" Then
            runTask = pressed
            runShell = Not pressed
        ElseIf control.Id = "debug" Then
            OREAddin.debugRun = pressed
            ' invalidate to reflect the change in the togglebuttons image
            OREAddin.theRibbon.InvalidateControl(control.Id)
            Exit Sub
        End If
        ' for shell/rdotnet toggle always invalidate both controls
        OREAddin.theRibbon.InvalidateControl("shell")
        OREAddin.theRibbon.InvalidateControl("task")
    End Sub

    Public Sub showAbout(control As IRibbonControl)
        Dim myAbout As AboutBox1 = New AboutBox1
        myAbout.ShowDialog()
    End Sub

    Public Function GetItemCount(control As IRibbonControl) As Integer
        Return (OREAddin.OREcalldefnames.Length)
    End Function

    Public Function GetItemLabel(control As IRibbonControl, index As Integer) As String
        Return OREAddin.OREcalldefnames(index)
    End Function

    Public Function GetItemID(control As IRibbonControl, index As Integer) As String
        Return OREAddin.OREcalldefnames(index)
    End Function

    Public Sub selectItem(control As IRibbonControl, id As String, index As Integer)
        OREAddin.OREdefinitions = OREcalldefs(index)
        OREAddin.OREdefinitions.Parent.Select()
        OREAddin.OREdefinitions.Select()
    End Sub

    Public Sub ribbonLoaded(myribbon As IRibbonUI)
        OREAddin.theRibbon = myribbon
        ' set default run via methods ..
        Try
            runShell = CBool(ConfigurationManager.AppSettings("runShell"))
            runTask = CBool(ConfigurationManager.AppSettings("runTask"))
        Catch ex As Exception
            MsgBox("Error reading default run configuration:" + ex.Message)
        End Try
    End Sub

    ''' <summary>creates the Ribbon</summary>
    Public Overrides Function GetCustomUI(RibbonID As String) As String
        Dim customUIXml As String = "<customUI xmlns='http://schemas.microsoft.com/office/2006/01/customui' onLoad='ribbonLoaded' ><ribbon><tabs><tab id='OREAddinTab' label='ORE Addin'>" +
            "<group id='OREAddinGroup' label='General settings'>" +
              "<dropDown id='scriptDropDown' label='OREdefinition:' sizeString='12345678901234567890' getItemCount='GetItemCount' getItemID='GetItemID' getItemLabel='GetItemLabel' onAction='selectItem'/>" +
              "<buttonGroup id='buttonGroup'>" +
              "<toggleButton id='shell' label='run via Shell' onAction='toggleButton' getImage='getImage' getPressed='getPressed' tag='1' screentip='toggles whether to run ORE via Shell/Files in Batchmode' supertip='toggles whether to run R script via Shell/Files' />" +
              "<toggleButton id='task' label='run via Task' onAction='toggleButton' getImage='getImage' getPressed='getPressed' tag='2' screentip='toggles whether to run ORE via Task/Pipe in Onlinemode' supertip='toggles whether to run R script via RdotNet' />" +
              "</buttonGroup><toggleButton id='debug' label='debug script' onAction='toggleButton' getImage='getImage' getPressed='getPressed' tag='3' screentip='toggles whether to debug R script' supertip='toggles whether to debug R script (leave cmd shell open)' />" +
              "" +
              "<dialogBoxLauncher><button id='dialog' label='About OREAddin' onAction='showAbout' tag='3' screentip='Show Aboutbox and refresh OREdefinitions from current Workbook'/></dialogBoxLauncher></group>" +
              "<group id='OREscriptsGroup' label='Run ORE-Jobs defined in WB/sheet names'>"
        Dim presetSheetButtonsCount As Integer = Int16.Parse(ConfigurationManager.AppSettings("presetSheetButtonsCount"))
        Dim thesize As String = IIf(presetSheetButtonsCount < 15, "normal", "large")
        For i As Integer = 0 To presetSheetButtonsCount
            customUIXml = customUIXml + "<dynamicMenu id='ID" + i.ToString() + "' " +
                                            "size='" + thesize + "' getLabel='getSheetLabel' imageMso='SignatureLineInsert' " +
                                            "screentip='Select script to run' " +
                                            "getContent='getDynMenContent' getVisible='getDynMenVisible'/>"
        Next
        customUIXml += "</group></tab></tabs></ribbon></customUI>"
        Return customUIXml
    End Function

    ''' <summary>set the name of the WB/sheet dropdown to the sheet name (for the WB dropdown this is the WB name) </summary>
    Public Function getSheetLabel(control As IRibbonControl) As String
        getSheetLabel = vbNullString
        If OREAddin.OREdefsheetMap.ContainsKey(control.Id) Then getSheetLabel = OREAddin.OREdefsheetMap(control.Id)
    End Function

    ''' <summary>create the buttons in the WB/sheet dropdown</summary>
    Public Function getDynMenContent(control As IRibbonControl) As String
        Dim xmlString As String = "<menu xmlns='http://schemas.microsoft.com/office/2009/07/customui'>"
        Dim currentSheet As String = OREAddin.OREdefsheetMap(control.Id)
        For Each nodeName As String In OREAddin.OREdefsheetColl(currentSheet).Keys
            xmlString = xmlString + "<button id='" + nodeName + "' label='run " + nodeName + "' imageMso='SignatureLineInsert' onAction='startOREprocess' tag ='" + currentSheet + "' screentip='run " + nodeName + " ORE definition' supertip='runs ORE definition from " + nodeName + " ORE_Addin range on sheet " + currentSheet + "' />"
        Next
        xmlString += "</menu>"
        Return xmlString
    End Function

    ''' <summary>shows the sheet button only if it was collected...</summary>
    Public Function getDynMenVisible(control As IRibbonControl) As Boolean
        Return OREAddin.OREdefsheetMap.ContainsKey(control.Id)
    End Function

End Class