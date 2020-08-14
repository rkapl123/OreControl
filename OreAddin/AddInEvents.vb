Imports ExcelDna.Integration
Imports Microsoft.Office.Interop.Excel

''' <summary>Handling Events from Excel (most important: AutoOpen when starting Addin, Workbook_Activate for getting ORE Names of current workbook...)</summary>
Public Class AddInEvents
    Implements IExcelAddIn

    WithEvents Application As Application

    ''' <summary>connect to Excel when opening Addin</summary>
    Public Sub AutoOpen() Implements IExcelAddIn.AutoOpen
        Application = ExcelDnaUtil.Application
    End Sub

    ''' <summary>clean up when OREAddin is deactivated</summary>
    Public Sub AutoClose() Implements IExcelAddIn.AutoClose

    End Sub

    ''' <summary>is being treated in Workbook_Activate...</summary>
    ''' <param name="Wb"></param>
    Private Sub Workbook_Open(Wb As Workbook) Handles Application.WorkbookOpen
    End Sub

    ''' <summary>refresh ribbon with current workbook's Rnames</summary>
    ''' <param name="Wb"></param>
    Private Sub Workbook_Activate(Wb As Workbook) Handles Application.WorkbookActivate
        Dim errStr As String
        errStr = doDefinitions(Wb)
        If errStr = "no ORENames" Then Exit Sub
        If errStr <> vbNullString Then
            MsgBox("Error when getting definitions in Workbook_Activate: " + errStr)
            Exit Sub
        End If
        OREAddin.theRibbon.Invalidate()
    End Sub

    ''' <summary>get OREnames of current workbook and load OREdefinitions of first name in ORE_Addin Names</summary>
    ''' <param name="Wb"></param>
    Private Function doDefinitions(Wb As Workbook) As String
        Dim errStr As String
        currWb = Wb
        ' always reset OREdefinitions when changing Workbooks (may not be the current one, if saved programmatically!), otherwise this is not being refilled in getORENames
        OREdefinitions = Nothing
        ' get the defined ORE_Addin Names
        errStr = OREAddin.getORENames()
        If errStr = "no ORENames" Then Return errStr
        If errStr <> vbNullString Then
            Return "Error while getORENames in doDefinitions: " + errStr
        End If
        ' get the definitions from the current defined range (first name in ORE_Addin Names)
        errStr = OREAddin.getOREDefinitions()
        If errStr <> vbNullString Then Return "Error while getOREdefinitions in doDefinitions: " + errStr
        Return vbNullString
    End Function

End Class
