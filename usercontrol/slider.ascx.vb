
Partial Class usercontrol_slider
    Inherits System.Web.UI.UserControl
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
End Class
