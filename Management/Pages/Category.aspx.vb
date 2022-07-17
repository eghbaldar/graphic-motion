
Partial Class Management_Pages_Category
    Inherits System.Web.UI.Page

    Protected Sub cmd_code_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmd_code.SelectedIndexChanged

        cmd_part.Items.Clear()
        Select Case cmd_code.SelectedValue
            Case 0 'آموزش های ویدئویی

                Dim itm As New List(Of ListItem)
                itm.Add(New ListItem("0 - جلوه های ویژه و کامپوزیت", "0"))
                itm.Add(New ListItem("1 - میکس ، مونتاژ و اصلاح رنگ", "1"))
                itm.Add(New ListItem("2 - صداگذاری و اصلاح", "2"))
                itm.Add(New ListItem("3 - مدل سازی", "3"))
                itm.Add(New ListItem("4 - طراحی دو بعدی", "4"))
                cmd_part.Items.AddRange(itm.ToArray())

            Case 1 'فروشگاه

                Dim itm As New List(Of ListItem)
                itm.Add(New ListItem("0 - جلوه های ویژه و کامپوزیت", "0"))
                itm.Add(New ListItem("1 - میکس ، مونتاژ و اصلاح رنگ", "1"))
                itm.Add(New ListItem("2 - صداگذاری و اصلاح", "2"))
                itm.Add(New ListItem("3 - مدل سازی", "3"))
                itm.Add(New ListItem("4 - طراحی دو بعدی", "4"))
                itm.Add(New ListItem("5 - مجموعه پلاگین", "5"))
                itm.Add(New ListItem("6 - نرم افزارها", "6"))
                cmd_part.Items.AddRange(itm.ToArray())

            Case 2 'سایر

                Dim itm As New List(Of ListItem)
                itm.Add(New ListItem("0 - فوتیج", "0"))
                itm.Add(New ListItem("1 - افکت های صوتی", "1"))
                itm.Add(New ListItem("2 - کتاب و جزوه آموزشی", "2"))
                itm.Add(New ListItem("3 - پروژه های آماده", "3"))
                itm.Add(New ListItem("4 - بانک پلاگین", "4"))
                cmd_part.Items.AddRange(itm.ToArray())

        End Select

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            cmd_code.SelectedIndex = -1
            cmd_part.SelectedIndex = -1
        End If
        Title = "دسته بندی ها"
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Dim ds As New DSTableAdapters.CategoryTableAdapter
        ds.InsertCat(cmd_code.SelectedValue, txtTitle.Text, cmd_part.SelectedValue)
        DG.DataBind()
    End Sub

End Class
