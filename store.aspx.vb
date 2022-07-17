
Partial Class Default2
    Inherits System.Web.UI.Page

    Dim S As New Statistic
    Dim Metag As New CreateMeta

    Function getIndex(ByVal index As Object) As String
        Dim Before As String = index.ToString.Replace("–", "*").Replace(",", "*").Replace("-", "*")
        Dim S() As String = Before.ToString.Split("*")
        Dim result As String
        For i As Byte = 0 To S.Length - 1
            result += "<a href='../../tags/" + S(i).Trim.Replace(" ", "-") + "' style='color:blue;text-decoration:none;' target='_blank'>" + S(i) + "</a>" + " // "
        Next
        Return result
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            S.InsertUpdateStatistical(Val(Page.RouteData.Values("id").ToString), True)
            CP()
        End If
        Title = Page.RouteData.Values("title").ToString.Replace("-", " ").Replace(".html", "") + " | فروشگاه محصولات آموزشی"
        'اضافه کردن اتوماتیک متاتگ به بدنه صفحه
        Try
            Metag.Create_MetaTag(Page.Master.FindControl("mainHead"), Page.RouteData.Values("id").ToString)
        Catch ex As Exception
        End Try

    End Sub

    Public Function convertDATE(ByVal datetime As Object) As String
        Try
            Return ShamsiDate.Miladi2Shamsi(datetime.ToString, ShamsiDate.ShowType.LongDate)
        Catch ex As Exception
        End Try
    End Function

    Sub CP()
        ''''''''''''''''' Captcha
        Dim x As Integer = Rnd() * 20
        Dim y As Integer = Rnd() * 20
        Session("CaptchaComment") = x + y
        captcha.Text = x.ToString & "+" & y.ToString & "=?"
        '''''''''''''''''
    End Sub

    Public Function GetVisit() As String        
        Return S.GetView(Page.RouteData.Values("id").ToString).ToString
    End Function

    Public Function GetDown() As String
        Return S.GetDown(Page.RouteData.Values("id").ToString).ToString
    End Function

    Public Sub SetDownload(ByVal sender As Object, ByVal e As CommandEventArgs)
        S.InsertUpdateStatistical(Val(Page.RouteData.Values("id").ToString), False)
        Response.Redirect(e.CommandArgument.ToString)

    End Sub

    Protected Sub btnInsertComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertComment.Click
        Try
            If Val(Session("CaptchaComment")) = Val(txtCaptcha.Text.Trim) Then
                Dim ds As New DSTableAdapters.CommentsTableAdapter
                ds.InsertComment(Page.RouteData.Values("id").ToString, Server.HtmlEncode(txtComment.Text.Trim), _
                                 Server.HtmlEncode(txtName.Text.Trim), Server.HtmlEncode(txtEmail.Text.Trim), Now, False, False)
                txtCaptcha.Text = ""
                txtComment.Text = ""
                txtEmail.Text = ""
                txtName.Text = ""
                captchaWrong.Text = ""
                captchaWrong.Text = "کامنت شما با موفقیت ثبت شد. پس از تایید به نمایش در می آید."
                captchaWrong.ForeColor = Drawing.Color.Green
            Else
                captchaWrong.Text = "عدد وارد شده صحیح نمی باشد، دوباره تلاش کنید."
                captchaWrong.ForeColor = Drawing.Color.Red
                CP()
            End If
        Catch ex As Exception

        End Try
    End Sub

End Class
