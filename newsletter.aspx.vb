
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn.Click
        Try
            Dim ds As New DSTableAdapters.NewsletterTableAdapter
            ds.InsertN(txtN.Text)
            txtN.Text = ""
            lbl.Text = "ایمیل شما با موفقت به ثبت رسید."
        Catch ex As Exception

        End Try
    End Sub
End Class
