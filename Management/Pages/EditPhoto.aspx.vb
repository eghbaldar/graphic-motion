Imports System.IO

Partial Class Management_Pages_Default2
    Inherits System.Web.UI.Page

    Shared _ID As Integer
    Dim ds As New DSTableAdapters.Query

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            _ID = Request.QueryString("id")
            img.ImageUrl = "~\Content\Upload\images\imageOnPost\" + Request.QueryString("name")
        End If
        Title = "ویرایش عکس"
    End Sub

    Protected Sub btnUpdatePhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdatePhoto.Click
        Dim NamePhoto As String = Guid.NewGuid.ToString + Path.GetExtension(FileUpload.FileName)
        FileUpload.SaveAs(MapPath("~\Content\Upload\images\imageOnPost\" + NamePhoto))
        img.ImageUrl = "~\Content\Upload\images\imageOnPost\" + NamePhoto
        ds.UpdatePhoto(NamePhoto, _ID)
        btnUpdatePhoto.Enabled = False
        FileUpload.Enabled = False
    End Sub

End Class
