Imports ExcelDna.Integration
Imports Microsoft.Office.Interop.Excel

' Events from Excel (Workbook_Save ...)
Public Class AddInEvents
    Implements IExcelAddIn

    WithEvents Application As Application

    ' connect to Excel when opening Addin
    Public Sub AutoOpen() Implements IExcelAddIn.AutoOpen
        Application = ExcelDnaUtil.Application
    End Sub

    ' clean up when OREAddin is deactivated
    Public Sub AutoClose() Implements IExcelAddIn.AutoClose

    End Sub

    ' save arg ranges to text files as well 
    Private Sub Workbook_Save(Wb As Workbook, ByVal SaveAsUI As Boolean, ByRef Cancel As Boolean) Handles Application.WorkbookBeforeSave
        Dim errStr As String
        errStr = doDefinitions(Wb)
        If errStr = "no ORENames" Then Exit Sub
        If errStr <> vbNullString Then
            MsgBox("Error when getting definitions in Workbook_Save: " + errStr)
            Exit Sub
        End If
        OREAddin.avoidFurtherMsgBoxes = False
    End Sub

    Private Sub Workbook_Open(Wb As Workbook) Handles Application.WorkbookOpen
        ' is being treated in Workbook_Activate...
    End Sub

    ' refresh ribbon with current workbook's Rnames
    Private Sub Workbook_Activate(Wb As Workbook) Handles Application.WorkbookActivate
        Dim errStr As String
        errStr = doDefinitions(Wb)
        If errStr = "no ORENames" Then Exit Sub
        If errStr <> vbNullString Then
            MsgBox("Error when getting definitions in Workbook_Activate: " + errStr)
            Exit Sub
        End If
        OreAddin.theRibbon.Invalidate()
    End Sub

    ' get OREnames of current workbook and load OREdefinitions of first name in ORE_Addin Names
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
