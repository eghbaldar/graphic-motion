
Partial Class Management_Pages_Default2
    Inherits System.Web.UI.Page

    Public Function DateMiladiTOSHAMSI(ByVal date_ As Object) As String
        Return ShamsiDate.Miladi2Shamsi(date_, ShamsiDate.ShowType.LongDate)
    End Function

    Public Sub GoDelete(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim ds As New DSTableAdapters.Buy_UserTableAdapter
        ds.DeleteAllRequest(e.CommandArgument)
        dg_down.DataBind()
        dg_dontPey.DataBind()
    End Sub

End Class
