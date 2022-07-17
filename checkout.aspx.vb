
Partial Class Default2
    Inherits System.Web.UI.Page

    'Dim CodeBuy As String 'کد یکتای هر کالا که در اصل همان کد کالاست

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مشخصات سفارش دهنده" + " | مرکز گسترش جلوه های تصویری"
        If Not IsPostBack Then CP()
        'CodeBuy = 12 'Guid.NewGuid.ToString 'این کد برای آن است که اگر کاربری چندی رکورد ایجاد کرد مشخصص شود که کدام خرید برای کدام کالاس
    End Sub

    Sub CP()
        ''''''''''''''''' Captcha
        Dim x As Integer = Rnd() * 20
        Dim y As Integer = Rnd() * 20
        Session("CaptchaComment") = x + y
        captcha.Text = x.ToString & "+" & y.ToString & "=?"
        '''''''''''''''''
    End Sub
    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click

        If Val(Session("CaptchaComment")) = Val(txtCaptcha.Text.Trim) Then
            captchaWrong.Text = "" 'یعنی کپچا درست بود
            lblWrong.Text = ""
            If Not Request.Cookies("BuyGM") Is Nothing Then
                'کوکی وجود دارد
                If Request.Form("Ostan").ToString.Trim <> "" And Request.Form("city").ToString.Trim <> "" Then
                   
                    '''''''''''''''''''''''''''''
                    'insert to tbl_Buy_User_Address and Zarinpal
                    Dim dsSUM As New DSTableAdapters.Buy_UserTableAdapter
                    Dim Amount As Integer = Val(dsSUM.sum(Request.Cookies("BuyGM").Value))
                    zarinpal(Amount, "بسته‌های گرافیک موشن", "0911", "email")
                    '''''''''''''''''''''''''''''
                Else
                    lblWrong.Text = "استان و شهر شما حتما باید مشخص باشد."
                End If
            Else
                'کوکی وجود ندارد
                lblWrong.Text = "عملیات انتخاب بسته های آموزشی باید دوباره انجام شود."
            End If
        Else
            captchaWrong.Text = "عدد وارد شده صحیح نمی باشد، دوباره تلاش کنید."
            captchaWrong.ForeColor = Drawing.Color.Red
            CP()
        End If
        
    End Sub

    Sub zarinpal(ByVal amount As Integer, ByVal detail As String, ByVal mob As String, ByVal email As String)
        System.Net.ServicePointManager.Expect100Continue = False
        Dim Zarp As New PaymentGatewayImplementationService, Status As Integer, Authority As String

        Status = Zarp.PaymentRequest("a384f918-28c9-11e6-b16d-000c295eb8fc", amount, detail, email _
                                     , mob, "http://graphic-motion.ir/اتمام-خرید", Authority)
        ''''''''''''''''''''''''''''''
        Dim DS As New DSTableAdapters.Buy_User_AddressTableAdapter
        DS.Insert(Request.Cookies("BuyGM").Value, Server.HtmlEncode(txtName.Text), Server.HtmlEncode(txtFamily.Text) _
                  , Request.Form("Ostan"), _
                  Request.Form("city"), Server.HtmlEncode(txtCodePost.Text), _
                  Server.HtmlEncode(txtAddress.Text), Server.HtmlEncode(txtTell.Text), Server.HtmlEncode(txtMob.Text) _
                  , Server.HtmlEncode(txtEmail.Text), Server.HtmlEncode(txtDetail.Text), 1, "", Convert.ToInt64(Authority))
        ''''''''''''''''''''''''''''''
        If Status.Equals(100) Then
            Response.Redirect("https://www.zarinpal.com/pg/StartPay/" & Authority)
        Else
            Response.Write("error: " & Status)
        End If
    End Sub

End Class
