Imports System.IO
Imports System.Text
Imports Microsoft.Office.Interop.Excel

''' <summary>all functions for the Rscript invocation method (by writing files and retrieving the results from files after invocation)</summary>
Module OREShellInvocation
    ''' <summary>prepare parameter (script, args, results, diags) for usage in invokeScripts, storeArgs, getResults and getDiags</summary>
    ''' <param name="index">index of parameter to be prepared in OREdefDic</param>
    ''' <param name="name">name (type) of parameter: script, scriptrng, args, results, diags</param>
    ''' <param name="RDataRange">returned Range of data area for scriptrng, args, results and diags</param>
    ''' <param name="returnName">returned name of data file for the parameter: same as range name</param>
    ''' <param name="returnPath">returned path of data file for the parameter</param>
    ''' <param name="ext">extension of filename that should be used for file containing data for that type (e.g. txt for args/results or png for diags)</param>
    ''' <returns>True if success, False otherwise</returns>
    Private Function prepareParam(index As Integer, name As String, ByRef RDataRange As Range, ByRef returnName As String, ByRef returnPath As String, ext As String) As String
        Dim value As String = OREdefDic(name)(index)
        If value = "" Then Return "Empty definition value for parameter " + name + ", index: " + index.ToString()

        ' only for args, results and diags (scripts dont have a target range)
        Dim RDataRangeAddress As String = ""
        If name = "args" Or name = "results" Or name = "diags" Or name = "scriptrng" Then
            Try
                RDataRange = currWb.Names.Item(value).RefersToRange
                RDataRangeAddress = RDataRange.Parent.Name + "!" + RDataRange.Address
            Catch ex As Exception
                Return "Error occured when looking up " + name + " range '" + value + "' in Workbook " + currWb.Name + " (defined correctly ?), " + ex.Message
            End Try
        End If
        ' if argvalue refers to a WS Name, cut off WS name prefix for R file name...
        Dim posWSseparator = InStr(value, "!")
        If posWSseparator > 0 Then
            value = value.Substring(posWSseparator)
        End If
        ' get path of data file, if it is defined
        If OREdefDic.ContainsKey(name + "paths") Then
            If Len(OREdefDic(name + "paths")(index)) > 0 Then
                returnPath = OREdefDic(name + "paths")(index)
            End If
        End If
        returnName = value + ext
        LogInfo("prepared param in index:" + index.ToString() + ",type:" + name + ",returnName:" + returnName + ",returnPath:" + returnPath + IIf(RDataRangeAddress <> "", ",RDataRange: " + RDataRangeAddress, ""))
        Return vbNullString
    End Function

    ''' <summary>creates Inputfiles for defined arg ranges, tab separated, decimalpoint always ".", dates are stored as "yyyy-MM-dd"
    ''' otherwise: "what you see is what you get"
    '''</summary>
    ''' <returns>True if success, False otherwise</returns>
    Public Function storeArgs() As Boolean
        Dim argFilename As String = vbNullString, argdir As String
        Dim RDataRange As Range = Nothing
        Dim outputFile As StreamWriter = Nothing

        argdir = dirglobal
        For c As Integer = 0 To OREdefDic("args").Length - 1
            Try
                Dim errMsg As String
                errMsg = prepareParam(c, "args", RDataRange, argFilename, argdir, ".txt")
                If Len(errMsg) > 0 Then
                    If Not OREAddin.myMsgBox(errMsg) Then Return False
                End If

                ' absolute paths begin with \\ or X:\ -> dont prefix with currWB path, else currWBpath\argdir
                Dim curWbPrefix As String = IIf(Left(argdir, 2) = "\\" Or Mid(argdir, 2, 2) = ":\", "", currWb.Path + "\")
                outputFile = New StreamWriter(curWbPrefix + argdir + "\" + argFilename)
                ' make sure we're writing a dot decimal separator
                Dim customCulture As System.Globalization.CultureInfo
                customCulture = System.Threading.Thread.CurrentThread.CurrentCulture.Clone()
                customCulture.NumberFormat.NumberDecimalSeparator = "."
                System.Threading.Thread.CurrentThread.CurrentCulture = customCulture

                ' write the RDataRange to file
                Dim i As Integer = 1
                Do
                    Dim j As Integer = 1
                    Dim writtenLine As String = ""
                    If RDataRange(i, 1).Value2 IsNot Nothing Then
                        Do
                            Dim printedValue As String
                            If RDataRange(i, j).NumberFormat.ToString().Contains("yy") Then
                                printedValue = DateTime.FromOADate(RDataRange(i, j).Value2).ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture)
                            ElseIf IsNumeric(RDataRange(i, j).Value2) Then
                                printedValue = String.Format("{0:###################0.################}", RDataRange(i, j).Value2)
                            Else
                                printedValue = RDataRange(i, j).Value2
                            End If
                            writtenLine += printedValue + vbTab
                            j += +1
                        Loop Until j > RDataRange.Columns.Count
                        outputFile.WriteLine(Left(writtenLine, Len(writtenLine) - 1))
                    End If
                    i += 1
                Loop Until i > RDataRange.Rows.Count
                LogInfo("stored args to " + curWbPrefix + argdir + "\" + argFilename)
            Catch ex As Exception
                If outputFile IsNot Nothing Then outputFile.Close()
                If Not OREAddin.myMsgBox("Error occured when creating inputfile '" + argFilename + "', " + ex.Message + " (maybe defined the wrong cell format for values?)") Then Return False
            End Try
            If outputFile IsNot Nothing Then outputFile.Close()
        Next
        Return True
    End Function


    ''' <summary>get Outputfiles for defined results ranges, tab separated
    ''' otherwise:  "what you see is what you get"
    ''' </summary>
    ''' <returns>True if success, False otherwise</returns>
    Public Function getResults() As Boolean
        Dim resFilename As String = vbNullString, readdir As String
        Dim RDataRange As Range = Nothing
        Dim previousResultRange As Range
        Dim errMsg As String

        readdir = dirglobal
        For c As Integer = 0 To OREdefDic("results").Length - 1
            errMsg = prepareParam(c, "results", RDataRange, resFilename, readdir, ".txt")
            If Len(errMsg) > 0 Then
                If Not OREAddin.myMsgBox(errMsg) Then Return False
            End If

            ' absolute paths begin with \\ or X:\ -> dont prefix with currWB path, else currWBpath\readdir
            Dim curWbPrefix As String = IIf(Left(readdir, 2) = "\\" Or Mid(readdir, 2, 2) = ":\", "", currWb.Path + "\")
            If Not File.Exists(curWbPrefix + readdir + "\" + resFilename) Then
                If Not OREAddin.myMsgBox("Results file '" + curWbPrefix + readdir + "\" + resFilename + "' not found!") Then Return False
            End If
            ' remove previous content, might not exist, so catch any exception
            If OREdefDic("rresults")(c) Then
                Try
                    previousResultRange = currWb.Names.Item("___RaddinResult" + OREdefDic("results")(c)).RefersToRange
                    previousResultRange.ClearContents()
                Catch ex As Exception
                End Try
            Else ' if we changed from rresults to results, need to remove hiddent ___RaddinResult name, otherwise results would still be removed when saving
                Try
                    currWb.Names.Item("___RaddinResult" + OREdefDic("results")(c)).Delete()
                Catch ex As Exception
                End Try
            End If

            Try
                Dim newQueryTable As QueryTable
                newQueryTable = RDataRange.Worksheet.QueryTables.Add(Connection:="TEXT;" & curWbPrefix + readdir + "\" + resFilename, Destination:=RDataRange)
                '                    .TextFilePlatform = 850
                With newQueryTable
                    .Name = "Data"
                    .FieldNames = True
                    .RowNumbers = False
                    .FillAdjacentFormulas = False
                    .PreserveFormatting = True
                    .RefreshOnFileOpen = False
                    .RefreshStyle = XlCellInsertionMode.xlOverwriteCells
                    .SavePassword = False
                    .SaveData = True
                    .AdjustColumnWidth = False
                    .RefreshPeriod = 0
                    .TextFileStartRow = 1
                    .TextFileParseType = XlTextParsingType.xlDelimited
                    .TextFileTabDelimiter = True
                    .TextFileSpaceDelimiter = False
                    .TextFileSemicolonDelimiter = False
                    .TextFileCommaDelimiter = False
                    .TextFileDecimalSeparator = "."
                    .TextFileThousandsSeparator = ","
                    .TextFileTrailingMinusNumbers = True
                    .Refresh(BackgroundQuery:=False)
                End With
                If OREdefDic("rresults")(c) Then
                    currWb.Names.Add(Name:="___RaddinResult" + OREdefDic("results")(c), RefersTo:=newQueryTable.ResultRange, Visible:=False)
                End If
                newQueryTable.Delete()
                LogInfo("inserted results from " + curWbPrefix + readdir + "\" + resFilename)
            Catch ex As Exception
                If Not OREAddin.myMsgBox("Error in placing results in to Excel: " + ex.Message) Then Return False
            End Try
        Next
        Return True
    End Function


    ''' <summary>remove result, diagram and temporary R script files</summary>
    ''' <returns>True if success, False otherwise</returns>
    Public Function removeFiles() As Boolean
        Dim filename As String = vbNullString
        Dim readdir As String = dirglobal
        Dim RDataRange As Range = Nothing
        Dim errMsg As String

        ' check for script existence before creating any potential missing folders below...
        For c As Integer = 0 To OREdefDic("scripts").Length - 1
            Dim script As String = vbNullString
            ' returns script and readdir !
            errMsg = prepareParam(c, "scripts", Nothing, script, readdir, "")
            If Len(errMsg) > 0 Then
                If Not OREAddin.myMsgBox(errMsg) Then Return False
            End If

            ' absolute paths begin with \\ or X:\ -> dont prefix with currWB path, else currWBpath\scriptpath
            Dim curWbPrefix As String = IIf(Left(readdir, 2) = "\\" Or Mid(readdir, 2, 2) = ":\", "", currWb.Path + "\")
            Dim fullScriptPath = curWbPrefix + readdir
            If Not File.Exists(fullScriptPath + "\" + script) Then
                OREAddin.myMsgBox("Script '" + fullScriptPath + "\" + script + "' not found!" + vbCrLf)
                Return False
            End If

        Next

        ' remove input argument files
        For c As Integer = 0 To OREdefDic("args").Length - 1
            ' returns filename and readdir !
            errMsg = prepareParam(c, "args", RDataRange, filename, readdir, ".txt")
            If Len(errMsg) > 0 Then
                If Not OREAddin.myMsgBox(errMsg) Then Return False
            End If

            ' absolute paths begin with \\ or X:\ -> dont prefix with currWB path, else currWBpath\argdir
            Dim curWbPrefix As String = IIf(Left(readdir, 2) = "\\" Or Mid(readdir, 2, 2) = ":\", "", currWb.Path + "\")
            ' special comfort: if containing folder doesn't exist, create it now:
            If Not Directory.Exists(curWbPrefix + readdir) Then
                Try
                    Directory.CreateDirectory(curWbPrefix + readdir)
                Catch ex As Exception
                    If Not OREAddin.myMsgBox("Error occured when trying to create input arguments containing folder '" + curWbPrefix + readdir + "', " + ex.Message) Then Return False
                End Try
            End If
            ' remove any existing input files...
            If File.Exists(curWbPrefix + readdir + "\" + filename) Then
                File.Delete(curWbPrefix + readdir + "\" + filename)
                LogInfo("deleted input " + curWbPrefix + readdir + "\" + filename)
            End If
        Next

        ' remove result files
        For c As Integer = 0 To OREdefDic("results").Length - 1
            ' returns filename and readdir !
            errMsg = prepareParam(c, "results", RDataRange, filename, readdir, ".txt")
            If Len(errMsg) > 0 Then
                If Not OREAddin.myMsgBox(errMsg) Then Return False
            End If

            ' absolute paths begin with \\ or X:\ -> dont prefix with currWB path, else currWBpath\argdir
            Dim curWbPrefix As String = IIf(Left(readdir, 2) = "\\" Or Mid(readdir, 2, 2) = ":\", "", currWb.Path + "\")
            ' special comfort: if containing folder doesn't exist, create it now:
            If Not Directory.Exists(curWbPrefix + readdir) Then
                Try
                    Directory.CreateDirectory(curWbPrefix + readdir)
                Catch ex As Exception
                    If Not OREAddin.myMsgBox("Error occured when trying to create result containing folder '" + curWbPrefix + readdir + "', " + ex.Message) Then Return False
                End Try
            End If
            ' remove any existing result files...
            If File.Exists(curWbPrefix + readdir + "\" + filename) Then
                Try
                    File.Delete(curWbPrefix + readdir + "\" + filename)
                    LogInfo("deleted result " + curWbPrefix + readdir + "\" + filename)
                Catch ex As Exception
                    If Not OREAddin.myMsgBox("Error occured when trying to remove '" + curWbPrefix + readdir + "\" + filename + "', " + ex.Message) Then Return False
                End Try
            End If
        Next

        Return True
    End Function

End Module
