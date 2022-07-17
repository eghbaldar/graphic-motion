
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "سبد خرید" + " | مرکز گسترش جلوه های تصویری"
        SUM()
    End Sub

    Sub SUM()
        Try
            Dim ds As New DSTableAdapters.Buy_UserTableAdapter
            If DG_DontPey.Rows.Count = 0 Then
                lblSum.Text = "سفارشی داده نشده است."
                btnContinue.Visible = False
            End If

            If ds.sum(Request.Cookies("BuyGM").Value).ToString.Trim = "" Then
                lblSum.Text = "سفارشی داده نشده است."
                btnContinue.Visible = False
            Else
                btnContinue.Visible = True
                lblSum.Text = "مجموع سفارشات: <span style='color:red;'>" & Val(ds.sum(Request.Cookies("BuyGM").Value)).ToString("N0") & "</span> هزار تومان "
            End If
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub btnDontPey_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDontPey.Click
        MultiView1.ActiveViewIndex = 0
        updateGRID()
    End Sub
    Protected Sub btnPey_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPey.Click
        MultiView1.ActiveViewIndex = 1
        updateGRID()
    End Sub
    Protected Sub btnWait_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnWait.Click
        MultiView1.ActiveViewIndex = 2
        updateGRID()
    End Sub
    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSend.Click
        MultiView1.ActiveViewIndex = 3
        updateGRID()
    End Sub

    Sub updateGRID()
        DG_DontPey.DataBind()
        DG_Pey.DataBind()
        DG_PeyWaiting0.DataBind()
        DG_PeyWaiting1.DataBind()
    End Sub

    Public Sub GoDelete(ByVal sender As Object, ByVal e As CommandEventArgs)
        Try
            Dim ds As New DSTableAdapters.Buy_UserTableAdapter
            ds.DeleteBuy(e.CommandArgument)
            DG_DontPey.DataBind()
            SUM()
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Response.Redirect("~\مشخصات-سفارش-دهنده")
    End Sub

End Class
