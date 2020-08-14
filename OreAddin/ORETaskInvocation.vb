﻿Imports Microsoft.Office.Interop.Excel

''' <summary>all functions for the Rdotnet invocation method (here the scripts and input args are passed to an inmemory engine and results are retrieved from there with one exception: graphics are still taken from the filesystem)</summary>
Module ORETaskInvocation

    ''' <summary></summary>
    ''' <returns>True if success, False otherwise</returns>
    Public Function storeArgs() As Boolean
        For c As Integer = 0 To OREdefDic("args").Length - 1
            Dim argname As String = OREdefDic("args")(c)

            ' if argvalue refers to a WS Name, cut off WS name prefix for R argname...
            Dim posWSseparator = InStr(argname, "!")
            If posWSseparator > 0 Then argname = argname.Substring(posWSseparator)
            Dim RDataRange As Range = currWb.Names.Item(OREdefDic("args")(c)).RefersToRange
            Dim dfDataColumns(RDataRange.Columns.Count - 1) As IEnumerable
            Dim columnNames(RDataRange.Columns.Count - 1) As String
            Dim rowNames(RDataRange.Rows.Count) As String
            Try
                ' write the RDataRange to dfDataColumns
                Dim j As Integer = 1
                Do
                    Dim columnValues(RDataRange.Rows.Count - 1) As String
                    Dim i As Integer = 1
                    Do
                        columnValues(i - 1) = IIf(RDataRange(i, j).Value2 IsNot Nothing, IIf(IsNumeric(RDataRange(i, j).Value2), Replace(RDataRange(i, j).Value2, ",", "."), RDataRange(i, j).Value2), Nothing)
                        i += 1
                    Loop Until i > RDataRange.Rows.Count
                    dfDataColumns(j - 1) = columnValues
                    j += 1
                Loop Until j > RDataRange.Columns.Count

                LogInfo("set symbol to name, argname:" + argname)
            Catch ex As Exception
                If Not OREAddin.myMsgBox("Error occured when creating RdotNet arg '" + argname + "', " + ex.Message) Then Return False
            End Try
        Next
        Return True
    End Function


    ''' <summary>get Outputfiles for defined results ranges, tab separated
    ''' otherwise:  "what you see is what you get"
    ''' </summary>
    ''' <returns>True if success, False otherwise</returns>
    Public Function getResults() As Boolean
        ' then evaluate (return) resultnames
        For c As Integer = 0 To OREdefDic("results").Length - 1
            Dim resname As String = OREdefDic("results")(c)
            ' if argvalue refers to a WS Name, cut off WS name prefix for R argname...
            Dim posWSseparator = InStr(resname, "!")
            If posWSseparator > 0 Then resname = resname.Substring(posWSseparator)

            ' first get data from RdotNet engine
            Dim resultData As Object = Nothing
            Dim columnNames As Object = Nothing
            Dim rowNames As Object = Nothing
            Dim columnCount As Integer : Dim rowCount As Integer

            ' if we have row names then add one column
            Dim columnOffset As Integer = IIf(Not IsNothing(rowNames), 1, 0)
            ' if we have column names then add one row
            Dim rowOffset As Integer = IIf(Not IsNothing(columnNames), 1, 0)

            ' put data into excel range
            Dim RDataRange As Range = currWb.Names.Item(OREdefDic("results")(c)).RefersToRange
            Dim j As Integer = 0
            Do
                Try
                    If Not IsNothing(columnNames) Then RDataRange(1, j + 1 + columnOffset).Value2 = columnNames(j)
                Catch ex As Exception
                    If Not OREAddin.myMsgBox("Error occured when putting headers from '" + resname + "', " + ex.Message) Then Return False
                End Try
                j += 1
            Loop Until j > columnCount - 1

            Dim i As Integer = 0
            Do
                If columnCount = 1 Then
                    RDataRange(i + 1, 1).Value2 = resultData(i)
                Else
                    j = 0
                    Do
                        Try
                            If Not IsNothing(rowNames) And j = 0 Then
                                RDataRange(i + 1 + rowOffset, j + 1).Value2 = rowNames(i)
                            Else
                                RDataRange(i + 1 + rowOffset, j + 1).Value2 = resultData(i, j - columnOffset)
                            End If
                        Catch ex As Exception
                            If Not OREAddin.myMsgBox("Error occured when putting result '" + resname + "', " + ex.Message) Then Return False
                        End Try
                        j += 1
                    Loop Until j > columnCount - 1 + columnOffset
                End If
                i += 1
            Loop Until i > rowCount - 1
            LogInfo("Put results in resname:" + resname)
        Next
        Return True
    End Function

End Module
