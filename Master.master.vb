
Partial Class Master
    Inherits System.Web.UI.MasterPage

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSearch.Click
        Try
            If txtSearch.Text.Trim <> "" Then
                Response.Redirect("~/search/" + Server.HtmlEncode(txtSearch.Text.Trim))
            End If
        Catch ex As Exception
        End Try
    End Sub

End Class

