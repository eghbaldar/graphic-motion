
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("Status")) Then
            If Request.QueryString("Status").Equals("OK") Then
                System.Net.ServicePointManager.Expect100Continue = False

                Dim Zarp As New PaymentGatewayImplementationService
                Dim Status As VariantType
                Dim Amount As Integer
                Dim RefID As UInt64
                '''''''''''''''''''''''''''' محاسبه قیمت سفارشات
                Dim dsSUM As New DSTableAdapters.Buy_UserTableAdapter
                Amount = Val(dsSUM.sum(Request.Cookies("BuyGM").Value))
                ''''''''''''''''''''''''''''
                Status = Zarp.PaymentVerification("a384f918-28c9-11e6-b16d-000c295eb8fc", Request.QueryString("Authority"), Amount, RefID)

                If Status = 100 Then
                    'RefID = شماره تراکنش در صورت تراکنش موفق
                    lbl_Detail.ForeColor = Drawing.Color.Green
                    lbl_Detail.Text = "پرداخت =  موفق" + "<br/>" + "کاربر عزیز، پرداخت شما با موفقیت انجام شد، کد پیگیری پرداخت را یاداشت کرده و تا رسیدن بسته پستی نزد خود نگه دارید."
                    lbl_codePey.Text = RefID.ToString
                    ' ثبت کد پرداخت در بانک
                    Dim ds As New DSTableAdapters.Buy_UserTableAdapter
                    ds.update_codePey(RefID.ToString, Request.Cookies("BuyGM").Value, Str(Convert.ToInt64(Request.QueryString("Authority"))).Trim)
                    '
                Else
                    lbl_Detail.ForeColor = Drawing.Color.Red
                    Select Case Val(Status)
                        Case 1
                            lbl_Detail.Text = "پرداخت = نا موفق" + "<br/>" + "اطلاعات ارسال شده ناقص است"
                        Case 3
                            lbl_Detail.Text = "پرداخت = نا موفق" + "<br/>" + "امکان پرداخت با رقم وارد شده میسر نیست"
                        Case 11
                            lbl_Detail.Text = "پرداخت = نا موفق" + "<br/>" + "درخواست مورد نظر یافت نشد"
                        Case 21
                            lbl_Detail.Text = "پرداخت = نا موفق" + "<br/>" + "هیچ نوع عملیات مالی برای این تراکنش یافت نشد"
                        Case 22
                            lbl_Detail.Text = "پرداخت = نا موفق" + "<br/>" + "تراکنش ناموفق بود"
                    End Select
                End If
            Else
                lbl_Detail.ForeColor = Drawing.Color.Red
                lbl_Detail.Text = "پرداخت = نا موفق" + "<br/>" + "خطایی در پرداخت پیش آماده است، لطفا دوباره اقدام کنید."
            End If
        Else
            lbl_Detail.ForeColor = Drawing.Color.Red
            lbl_Detail.Text = "پرداخت = نا موفق" + "<br/>" + "مقادیر ورودی اشتباه بوده است، لطفا دوباره اقدام کنید."
        End If
    End Sub

End Class
