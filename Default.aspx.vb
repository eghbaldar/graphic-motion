
Partial Class _Default
    Inherits System.Web.UI.Page
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
    Function getTitle(ByVal title As Object, ByVal category As Object) As String
        Select Case category.ToString
            Case 0
                Return title
            Case 1
                Return "<span style='color:yellow'>(" + title + " " + "هزار تومان" + ")</span> - " + "برای مشاهده جزئیات بسته کلیک کنید"
            Case 2
                Return title
        End Select
    End Function
    '
End Class
