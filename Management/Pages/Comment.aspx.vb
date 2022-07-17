
Partial Class Management_Pages_Default2
    Inherits System.Web.UI.Page

    Dim ds As New DSTableAdapters.CommentCMSTableAdapter
    Dim ds_cms As New DSTableAdapters.CommentCMS_OKTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "بررسی کامنت ها"
    End Sub

    Sub GoDelete(ByVal sender As Object, ByVal e As CommandEventArgs)
        ds.DeleteComment(e.CommandArgument)
        GridView_OK.DataBind()
        GridView_NOK.DataBind()
    End Sub

    Sub GoOK(ByVal sender As Object, ByVal e As CommandEventArgs)
        ds.UpdateEnable(e.CommandArgument)
        GridView_OK.DataBind()
        GridView_NOK.DataBind()
    End Sub

    '
    Sub AdminComment(ByVal sender As Object, ByVal e As CommandEventArgs)
        ID_Comment.Text = e.CommandArgument
        txtComment.Enabled = True
        btnInsertAdmin.Enabled = True
    End Sub

    Protected Sub btnInsertAdmin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertAdmin.Click
        ds.InsertAdminComment(ID_Comment.Text, txtComment.Text, Now)
        GridView_NOK.DataBind()
        GridView_OK.DataBind()
        txtComment.Text = ""
        txtComment.Enabled = False
        btnInsertAdmin.Enabled = False
    End Sub
End Class
