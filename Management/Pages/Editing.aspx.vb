
Partial Class Management_Pages_Default2
    Inherits System.Web.UI.Page

    Dim ds As New DSTableAdapters.Learning_and_FilmsTableAdapter
    Dim ds_one As New DSTableAdapters.Learning_and_Films_OneTableAdapter
    Dim query As New DSTableAdapters.Query

    Shared ID_Edit As Integer

    Protected Sub btnShowALL_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowALL.Click
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnGO_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGO.Click
        MultiView.ActiveViewIndex = 2
    End Sub

    Sub GoDelete(ByVal sender As Object, ByVal e As CommandEventArgs)
        ds.DeleteOne(Val(e.CommandArgument.ToString))
        gr_All0.DataBind()
        gr_All.DataBind()
    End Sub

    Public Function setCategoryName(ByVal Category As Object) As String
        Select Case Category
            Case 0
                Return "آموزش های تصویری"
            Case 1
                Return "فروشگاه"
            Case 2
                Return "سایر موارد - دانلودها"
        End Select
    End Function

    Public Function setTypeName(ByVal Category As Object, ByVal type As Object) As String
        Return query.getTypeName(Val(Category.ToString), Val(type.ToString))
    End Function

    Public Sub GoEdit(ByVal sender As Object, ByVal e As CommandEventArgs)
        ID_Edit = e.CommandArgument
        MultiView.ActiveViewIndex = 3

        With ds_one.GetData(ID_Edit)

            cmd_cat_Edit.SelectedValue = .Rows(0)("category").ToString
            Cmd_Type_Edit.SelectedValue = .Rows(0)("type").ToString

            Select Case .Rows(0)("flag").ToString
                Case True
                    rbEnable.Checked = True
                    rbDisable.Checked = False
                Case False
                    rbDisable.Checked = True
                    rbEnable.Checked = False
            End Select

            txtDetail.Value = .Rows(0)("text").ToString
            txtIndex.Text = .Rows(0)("index").ToString
            txtLead.Text = .Rows(0)("lid").ToString
            txtLinkFilm.Text = .Rows(0)("link_film").ToString
            txtLinkProject.Text = .Rows(0)("link_project").ToString
            txtSubject.Text = .Rows(0)("title").ToString
        End With

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        Dim FLAG As Boolean

        If rbEnable.Checked = True Then FLAG = True
        If rbDisable.Checked = True Then FLAG = False

        ds_one.UpdateOn(cmd_cat_Edit.SelectedValue, txtSubject.Text, txtLead.Text, txtDetail.Value, _
                         txtLinkFilm.Text, txtLinkProject.Text, txtIndex.Text, FLAG, Cmd_Type_Edit.SelectedValue, ID_Edit)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "ویرایش پست"
    End Sub

    Protected Sub chkALL_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkALL.CheckedChanged
        If chkALL.Checked Then PAll.Visible = True
        If Not chkALL.Checked Then PAll.Visible = False
    End Sub
End Class
