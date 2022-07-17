
Partial Class Default2
    Inherits System.Web.UI.Page

    Sub CP()
        ''''''''''''''''' Captcha
        Dim x As Integer = Rnd() * 20
        Dim y As Integer = Rnd() * 20
        Session("CaptchaComment") = x + y
        captcha.Text = x.ToString & "+" & y.ToString & "=?"
        '''''''''''''''''
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then CP()
        Title = "درخواست آموزش های تصویری" + " | مرکز گسترش جلوه های تصویری"
    End Sub


    Protected Sub btnInsertComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertComment.Click
        Try
            If Val(Session("CaptchaComment")) = Val(txtCaptcha.Text.Trim) Then
                Dim ds As New DSTableAdapters.Contact_RequestTableAdapter
                ds.InsertRequest_And_Contact(0, Server.HtmlEncode(txtName.Text), Server.HtmlEncode(txtEmail.Text), _
                                             Server.HtmlEncode(txtNum.Text), Server.HtmlEncode(txtDetail.Text), Now)
                txtCaptcha.Text = ""
                txtDetail.Text = ""
                txtNum.Text = ""
                txtEmail.Text = ""
                txtName.Text = ""
                captchaWrong.Text = ""
                captchaWrong.Text = "درخواست شما با موفقیت ثبت شد. در اسرع وقت جواب مناسب داده خواهد شد."
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
