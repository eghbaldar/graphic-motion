Imports System.IO

Partial Class Management_Pages_learning
    Inherits System.Web.UI.Page

    Dim DS As New DSTableAdapters.Learning_and_FilmsTableAdapter

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click

        Try
            If txtDetail.Value <> "" And txtIndex.Text <> "" And txtLead.Text <> "" _
            And txtLinkFilm.Text <> "" And txtSubject.Text <> "" Then

                Dim NamePhoto As String = Guid.NewGuid.ToString + Path.GetExtension(FilePhoto.FileName)
                FilePhoto.SaveAs(MapPath("~\Content\Upload\images\imageOnPost\" + NamePhoto))

                DS.InsertLearningFilm(cmd_cat.SelectedValue, txtSubject.Text, txtLead.Text, txtDetail.Value, _
                                         txtLinkFilm.Text, txtLinkProject.Text, _
                                       txtIndex.Text, NamePhoto, Now, False, Cmd_Type.SelectedValue)
                DS.InsertFirstInStatistic()
                DL_Preview.DataBind()
                MultiView.ActiveViewIndex = 2

            Else
                lblWrong.Text = "please fill all fields."
            End If
        Catch ex As Exception
            lblWrong.Text = ex.Message
        End Try

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click
        DS.UpdateOkFlag()
        Response.Redirect("~/Management/Pages/learning.aspx")
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        DS.DeleteLearning_Film()
        Response.Redirect("~/Management/Pages/learning.aspx")
    End Sub

    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        MultiView.ActiveViewIndex = 3
    End Sub

    Protected Sub btnOK2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK2.Click
        DS.UpdateOkFlag()
        Response.Redirect("~/Management/Pages/learning.aspx")
    End Sub

    Protected Sub btnGO_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGO.Click
        lblCat.Text = cmd_cat.SelectedItem.Text
        lblType.Text = Cmd_Type.SelectedItem.Text
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "درج پست جدید"
    End Sub

End Class
