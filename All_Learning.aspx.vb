
Partial Class Default2
    Inherits System.Web.UI.Page

    Dim S As New Statistic

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "تمامی آموزش های تصویری | مرکز گسترش جلوه های تصویری"
    End Sub

    Public Function GetVisit(ByVal id As Object) As String
        Return S.GetView(id.ToString).ToString
    End Function
    Public Function GetDown(ByVal id As Object) As String
        Return S.GetDown(id.ToString).ToString
    End Function

    Public Function convertDATE(ByVal datetime As Object) As String
        Try
            Return ShamsiDate.Miladi2Shamsi(datetime.ToString, ShamsiDate.ShowType.LongDate)
        Catch ex As Exception
        End Try
    End Function

End Class
