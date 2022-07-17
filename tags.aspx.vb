
Partial Class Default2
    Inherits System.Web.UI.Page
    Function getColor(ByVal color As Object) As Drawing.Color
        Select Case color.ToString
            Case 0
                Return Drawing.ColorTranslator.FromHtml("#92A33B")
            Case 1
                Return Drawing.ColorTranslator.FromHtml("#F79F2F")
            Case 2
                Return Drawing.ColorTranslator.FromHtml("#8E909C")
        End Select
    End Function
    '
    Function getAnchor(ByVal category As Object, ByVal id As Object, ByVal title As Object) As String
        Select Case category.ToString
            Case 0
                Return ("/post/" + id.ToString + "/" + title.ToString).ToString().Replace(" ", "-") + ".html"
            Case 1
                Return ("/store/" + id.ToString + "/" + title.ToString).ToString().Replace(" ", "-") + ".html"
            Case 2
                Return ("/download/" + id.ToString + "/" + title.ToString).ToString().Replace(" ", "-") + ".html"
        End Select
    End Function
    '
    Function getName(ByVal color As Object) As String
        Select Case color.ToString
            Case 0
                Return "دانلود آموزش های تصویری"
            Case 1
                Return "بسته های آموزشی"

            Case 2
                Return "دانلود فایل"
        End Select
    End Function
    
End Class
