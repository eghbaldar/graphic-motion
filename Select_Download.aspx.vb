
Partial Class Default2
    Inherits System.Web.UI.Page
    Dim S As New Statistic

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Title = Page.RouteData.Values("catName").ToString.Replace("-", " ").Replace(".html", "") + " | مرکز گسترش جلوه های تصویری"
        Catch ex As Exception

        End Try
    End Sub
    Public Function convertDATE(ByVal datetime As Object) As String
        Try
            Return ShamsiDate.Miladi2Shamsi(datetime.ToString, ShamsiDate.ShowType.LongDate)
        Catch ex As Exception
        End Try
    End Function
    Public Function GetVisit(ByVal id As Object) As String
        Try
            Return S.GetView(id.ToString).ToString
        Catch ex As Exception
        End Try
    End Function
    Public Function GetDown(ByVal id As Object) As String
        Try
            Return S.GetDown(id.ToString).ToString
        Catch ex As Exception
        End Try
    End Function

End Class
