
Partial Class usercontrol_AddToCard
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DG.Rows.Count > 0 Then
            Shop.Visible = True
            DG.DataBind()
        End If
    End Sub

    Private Sub Action()

        Dim DS As New DSTableAdapters.Buy_UserTableAdapter
        Dim DS_Query As New DSTableAdapters.Query

        If Not Request.Cookies("BuyGM") Is Nothing Then
            'کوکی قبلا ایجاد شده است
            Shop.Visible = True
            If DG.Rows.Count >= 10 Then
                lblKerm.Visible = True
                Exit Sub
            End If

            DS.InsertBuy(Request.Cookies("BuyGM").Value, Page.RouteData.Values("id").ToString,
                         count.Text, DS_Query.getPrice(Page.RouteData.Values("id").ToString),
                          Val(count.Text) * Val(DS_Query.getPrice(Page.RouteData.Values("id").ToString)), 0, Now,
                          Now, 0, Now, Page.RouteData.Values("title").ToString)
            DG.DataBind()
        Else
            'کوکی برای اولین بار ایجاد میشود
            Dim myCook As HttpCookie = New HttpCookie("BuyGM")
            myCook("BuyGM") = Guid.NewGuid.ToString
            myCook.Expires = Now.AddYears(1)
            Response.Cookies.Add(myCook)

            Shop.Visible = True
            DS.InsertBuy(Request.Cookies("BuyGM").Value, Page.RouteData.Values("id").ToString,
                         count.Text, DS_Query.getPrice(Page.RouteData.Values("id").ToString),
                          Val(count.Text) * Val(DS_Query.getPrice(Page.RouteData.Values("id").ToString)), 0, Now,
                          Now, 0, Now, Page.RouteData.Values("title").ToString)
            DG.DataBind()

        End If
    End Sub

    Protected Sub aadd_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles aadd.Click
        Action()
    End Sub

    Protected Sub btnCardBox_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCardBox.Click
        Response.Redirect("~/سبد-خرید")
    End Sub

    Protected Sub link_aadd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_aadd.Click
        Action()
    End Sub

End Class
