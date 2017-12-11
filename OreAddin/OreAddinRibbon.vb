Imports System.Runtime.InteropServices
Imports ExcelDna.Integration.CustomUI
Imports System.Configuration

' Events from Ribbon
<ComVisible(True)>
Public Class OREAddinRibbon
    Inherits ExcelRibbon

    Public Sub startOREprocess(control As IRibbonControl)
        Dim errStr As String
        ' set OREdefinition to invocaters range... invocating sheet is put into Tag
        OREAddin.OREdefinitions = OREAddin.rdefsheetColl(control.Tag).Item(control.Id)
        OREAddin.OREdefinitions.Parent.Select()
        OREAddin.OREdefinitions.Select()
        errStr = OREAddin.startOREprocess()
        If errStr <> "" Then MsgBox(errStr)
    End Sub

    ' reflect the change in the togglebuttons title
    Public Function getImage(control As IRibbonControl) As String
        If (OREAddin.debugScript And control.Id = "debug") Then
            Return "AcceptTask"
        Else
            Return "DeclineTask"
        End If
    End Function

    ' reflect the change in the togglebuttons title
    Public Function getPressed(control As IRibbonControl) As Boolean
        If control.Id = "debug" Then
            Return OREAddin.debugScript
        Else
            Return False
        End If
    End Function

    ' toggle shell or Rdotnet mode buttons
    Public Sub toggleButton(control As IRibbonControl, pressed As Boolean)
        If control.Id = "debug" Then
            OREAddin.debugScript = pressed
        End If
        ' invalidate to reflect the change in the togglebuttons image
        OREAddin.theRibbon.InvalidateControl(control.Id)
    End Sub

    Public Sub refreshRdefs(control As IRibbonControl)
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

        Catch ex As Exception
            MsgBox("Error reading default run configuration:" + ex.Message)
        End Try
    End Sub

    ' creates the Ribbon <buttonGroup id='buttonGroup'> <box id='box2' boxStyle='horizontal'>
    Public Overrides Function GetCustomUI(RibbonID As String) As String
        Dim customUIXml As String = "<customUI xmlns='http://schemas.microsoft.com/office/2006/01/customui' onLoad='ribbonLoaded' ><ribbon><tabs><tab id='OREAddinTab' label='R Addin'>" +
            "<group id='OREAddinGroup' label='General settings'>" +
              "<dropDown id='scriptDropDown' label='OREdefinition:' sizeString='12345678901234567890' getItemCount='GetItemCount' getItemID='GetItemID' getItemLabel='GetItemLabel' onAction='selectItem'/>" +
              "<buttonGroup id='buttonGroup'>" +
              "<toggleButton id='shell' label='run via shell' onAction='toggleButton' getImage='getImage' getPressed='getPressed' tag='1' screentip='toggles whether to run R script via Shell/Files' supertip='toggles whether to run R script via Shell/Files' />" +
              "<toggleButton id='rdotnet' label='run via DLL' onAction='toggleButton' getImage='getImage' getPressed='getPressed' tag='2' screentip='toggles whether to run R script via RdotNet' supertip='toggles whether to run R script via RdotNet' />" +
              "</buttonGroup><toggleButton id='debug' label='debug script' onAction='toggleButton' getImage='getImage' getPressed='getPressed' tag='3' screentip='toggles whether to debug R script' supertip='toggles whether to debug R script (leave cmd shell open)' />" +
              "" +
              "<dialogBoxLauncher><button id='dialog' label='About OREAddin' onAction='refreshOREdefs' tag='3' screentip='Show Aboutbox and refresh OREdefinitions from current Workbook'/></dialogBoxLauncher></group>" +
              "<group id='OREscriptsGroup' label='Run ORE-Jobs defined in WB/sheet names'>"
        Dim presetSheetButtonsCount As Integer = Int16.Parse(ConfigurationManager.AppSettings("presetSheetButtonsCount"))
        Dim thesize As String = IIf(presetSheetButtonsCount < 15, "normal", "large")
        For i As Integer = 0 To presetSheetButtonsCount
            customUIXml = customUIXml + "<dynamicMenu id='ID" + i.ToString() + "' " +
                                            "size='" + thesize + "' getLabel='getSheetLabel' imageMso='SignatureLineInsert' " +
                                            "screentip='Select script to run' " +
                                            "getContent='getDynMenContent' getVisible='getDynMenVisible'/>"
        Next
        customUIXml = customUIXml + "</group></tab></tabs></ribbon></customUI>"
        Return customUIXml
    End Function

    ' set the name of the WB/sheet dropdown to the sheet name (for the WB dropdown this is the WB name) 
    Public Function getSheetLabel(control As IRibbonControl) As String
        getSheetLabel = vbNullString
        If OREAddin.rdefsheetMap.ContainsKey(control.Id) Then getSheetLabel = OREAddin.rdefsheetMap(control.Id)
    End Function

    ' create the buttons in the WB/sheet dropdown
    Public Function getDynMenContent(control As IRibbonControl) As String
        Dim xmlString As String = "<menu xmlns='http://schemas.microsoft.com/office/2009/07/customui'>"
        Dim currentSheet As String = OREAddin.rdefsheetMap(control.Id)
        For Each nodeName As String In OREAddin.rdefsheetColl(currentSheet).Keys
            xmlString = xmlString + "<button id='" + nodeName + "' label='run " + nodeName + "' imageMso='SignatureLineInsert' onAction='startRprocess' tag ='" + currentSheet + "' screentip='run " + nodeName + " Rdefinition' supertip='runs R script defined in " + nodeName + " R_Addin range on sheet " + currentSheet + "' />"
        Next
        xmlString = xmlString + "</menu>"
        Return xmlString
    End Function

    ' shows the sheet button only if it was collected...
    Public Function getDynMenVisible(control As IRibbonControl) As Boolean
        Return OREAddin.rdefsheetMap.ContainsKey(control.Id)
    End Function

End Class