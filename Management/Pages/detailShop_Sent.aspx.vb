
Partial Class Management_Pages_detailShop
    Inherits System.Web.UI.Page
    Public Function DateMiladiTOSHAMSI(ByVal date_ As Object) As String
        Return ShamsiDate.Miladi2Shamsi(date_, ShamsiDate.ShowType.LongDate)
    End Function
    Public Function name_(ByVal TitleStore As Object) As String
        Return TitleStore.ToString.Replace("-", " ").Replace(".html", "")
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCookie.Text = Request.QueryString("cookieid")
        lblPey.Text = Request.QueryString("codepey")
        lblauth.Text = Request.QueryString("authority")
    End Sub

End Class
