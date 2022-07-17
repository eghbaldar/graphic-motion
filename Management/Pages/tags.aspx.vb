
Partial Class Management_Pages_tags
    Inherits System.Web.UI.Page

    Dim lst_complete As New List(Of String)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim ds As New DSTableAdapters.INDEXTableAdapter
            For i As Integer = 0 To ds.GetData().Rows.Count - 1
                getIndex(ds.GetData().Rows(i)(0).ToString)
            Next
        End If
    End Sub

    Function getIndex(ByVal index As Object) As String
        Dim Before As String = index.ToString.Replace("–", "*").Replace(",", "*").Replace("-", "*")
        Dim S() As String = Before.ToString.Split("*")
        For i As Byte = 0 To S.Length - 1
            CheckBoxList.Items.Add(S(i))
        Next

    End Function

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        txtresult.Text = ""
        For i As Integer = 0 To CheckBoxList.Items.Count - 1
            If CheckBoxList.Items(i).Selected Then
                txtresult.Text += CheckBoxList.Items(i).Value + " - "
            End If
        Next
        txtresult.Text = Left(txtresult.Text, txtresult.Text.Length - 2)
    End Sub

End Class
