
Partial Class Management_Pages_Master
    Inherits System.Web.UI.MasterPage

    Protected Sub btnCategory__Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCategory_.Click
        Response.Redirect("Category.aspx")
    End Sub

    Protected Sub btnLearning__Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLearning_.Click
        Response.Redirect("learning.aspx")
    End Sub

    Protected Sub btnComment__Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnComment_.Click
        Response.Redirect("comment.aspx")
    End Sub

    Protected Sub btnEditDeleteShow__Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEditDeleteShow_.Click
        Response.Redirect("Editing.aspx")
    End Sub

    Protected Sub btnStatistic_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnStatistic.Click
        Response.Redirect("Statistic.aspx")
    End Sub

    Protected Sub btnShow_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnShow.Click
        Response.Redirect("~\")
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("request_contact.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim ds_contact As New DSTableAdapters.Contact_RequestTableAdapter
            lblUnreadContact.Text = "<div style=padding:5px;width:20px;text-align:center;color:white;background-color:red;-moz-border-radius: 9px;	-webkit-border-radius: 9px;	 border-radius:9px;'>" + ds_contact.HowManyUnRead.ToString + "</div>"
            Dim ds_comment As New DSTableAdapters.CommentsTableAdapter
            lblUnreadComment.Text = "<div style=padding:5px;width:20px;text-align:center;color:white;background-color:red;-moz-border-radius: 9px;	-webkit-border-radius: 9px;	 border-radius:9px;'>" + ds_comment.HowManyUnreadComment.ToString + "</div>"

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LoginStatus1_LoggedOut(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginStatus1.LoggedOut
        Response.Redirect("~/")
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("shop.aspx")
    End Sub

End Class