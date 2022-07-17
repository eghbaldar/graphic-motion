
Partial Class Management_Pages_Default2
    Inherits System.Web.UI.Page

    Dim ds As New DSTableAdapters.Contact_RequestTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "درخواست و ارتباط با ما"
    End Sub

    Public Function setFlag(ByVal flag As Boolean) As String
        Select Case flag
            Case False
                Return "بررسی نشده"
            Case True
                Return "بررسی شده"
        End Select
    End Function

    Public Function setPart(ByVal code As Integer) As String
        Select Case code    
            Case 0
                Return "پشتیبانی آموزش"
            Case 1
                Return "پشتیبانی فنی"
            Case 2
                Return "مدیریت کل سایت"
        End Select
    End Function
    '
    Public Function setFlagBC(ByVal flag As Boolean) As Drawing.Color
        Select Case flag
            Case False
                Return Drawing.Color.Red
            Case True
                Return Drawing.Color.Green
        End Select
    End Function

    Public Function convertDATE(ByVal datetime As Object) As String
        Try
            Return ShamsiDate.Miladi2Shamsi(datetime.ToString, ShamsiDate.ShowType.LongDate)
        Catch ex As Exception
        End Try
    End Function

    Sub GoDelete(ByVal sender As Object, ByVal e As CommandEventArgs)
        ds.DeleteContactRequest(Val(e.CommandArgument.ToString))
        grReq.DataBind()
        grCon.DataBind()
    End Sub

    Sub GoChecked(ByVal sender As Object, ByVal e As CommandEventArgs)
        ds.UpdateFlag(Val(e.CommandArgument.ToString))
        grReq.DataBind()
        grCon.DataBind()
    End Sub
    '
End Class
