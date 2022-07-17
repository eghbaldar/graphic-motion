<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master"
    AutoEventWireup="false" CodeFile="Editing.aspx.vb" Inherits="Management_Pages_Default2" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 104px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table class="style1">
            <tr>
                <td>
                    <asp:CheckBox ID="chkALL" runat="server" Text="تمامی پست ها" AutoPostBack="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="PAll" runat="server" Visible="False">
                        <asp:GridView ID="GE_All" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                            DataSourceID="SDS_All" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="title" HeaderText="عنوان" SortExpression="title" />
                                <asp:TemplateField HeaderText="ویرایش" SortExpression="Type">
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~\Content\img\edit.png" CommandArgument='<%# Eval("id","{0}")%>'
                                            OnCommand="GoEdit" ID="ImageButton12" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle BackColor="#CCCCCC" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="حذف" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~\Content\img\delete.png" OnClientClick="return confirm('are u sure MY LOVE?');"
                                            CommandArgument='<%# Eval("id","{0}")%>' OnCommand="GoDelete" ID="ImageButton32"
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle BackColor="#FF9966" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDS_All" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                            SelectCommand="SELECT * FROM [tbl_Learning_and_Films] ORDER BY [ID] DESC"></asp:SqlDataSource>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="Cat" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style4">
                            اتنخاب طبقه و بخش مربوط:&nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            طبقه:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmd_cat" runat="server" AutoPostBack="True" CssClass="PAD">
                                <asp:ListItem Value="0">ویدیوهای آموزشی- 0</asp:ListItem>
                                <asp:ListItem Value="1">فروشگاه - 1</asp:ListItem>
                                <asp:ListItem Value="2">سایر مطالب (فوتیج و افکت، پلاگین و ... ) در این قسمت - 2</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            بخش:
                        </td>
                        <td>
                            <asp:DropDownList ID="Cmd_Type" runat="server" DataSourceID="SDS_Type" CssClass="PAD"
                                DataTextField="Name" DataValueField="Type">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SDS_Type" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                                SelectCommand="SELECT * FROM [tbl_Category] WHERE ([Code] = @Code)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmd_cat" Name="Code" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnGO" runat="server" Text="مرحله بعدی" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;<asp:Button ID="btnShowALL" runat="server" BackColor="Red" ForeColor="#FFFFCC" Text="نمایش تمامی پست ها چه آموزشی و چه غیر آموزشی"
                                Width="500px" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="ShowALL" runat="server">
                <table class="style1">
                    <tr>
                        <td>
                            نمایش تمامی پست ها
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gr_All" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_AllPost"
                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                ForeColor="Black" GridLines="None" AllowPaging="True">
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="ID" HeaderText="آیدی" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" />
                                    <asp:TemplateField HeaderText="طبقه" SortExpression="Category">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid green;">
                                                <asp:Label ID="Label4" runat="server" Text='<%# setCategoryName(Eval("Category", "{0}")) %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="بخش" SortExpression="Type">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid red;">
                                                <asp:Label ID="Label3" runat="server" Text='<%# setTypeName(Eval("Category"),Eval("type")) %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="عنوان" SortExpression="title">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid green;">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="lid" HeaderText="یک خطی" SortExpression="lid" />
                                    <asp:TemplateField HeaderText="لینک فیلم" SortExpression="link_film">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("link_film") %>'
                                                Target="_blank">
                                                <asp:Label ID="Label1" runat="server" Text='کلیک شود'></asp:Label>
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="لینک پروژه" SortExpression="link_project">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl='<%# Bind("link_project") %>'
                                                Target="_blank">
                                                <asp:Label ID="Label2" runat="server" Text='کلیک شود'></asp:Label>
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="شاخص ها" SortExpression="index" Visible="False">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid green;">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("index") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DateTime" HeaderText="تاریخ" SortExpression="DateTime" />
                                    <asp:TemplateField HeaderText="عکس" SortExpression="photo">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl='<%# String.Format("EditPhoto.aspx?name={0}&id={1}",eval("photo"),eval("id")) %>'
                                                Target="_blank">
                                           <img src="../../Content/img/picture.png" border="0" />
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="متن پست" SortExpression="text">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl='<%# String.Format("EditPhoto.aspx?name={0}&;&id={1}",eval("photo"),eval("id")) %>'
                                                Target="_blank">
                                           <img src="../../Content/img/text.png" border="0" />
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="Flag" HeaderText="وضعیت" SortExpression="Flag" />
                                    <asp:TemplateField HeaderText="ویرایش">
                                        <ItemTemplate>
                                            <asp:ImageButton ImageUrl="~\Content\img\edit.png" CommandArgument='<%# Eval("id","{0}")%>'
                                                OnCommand="GoEdit" ID="ImageButton12" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle BackColor="#CCCCCC" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="حذف">
                                        <ItemTemplate>
                                            <asp:ImageButton ImageUrl="~\Content\img\delete.png" OnClientClick="return confirm('are u sure MY LOVE?');"
                                                CommandArgument='<%# Eval("id","{0}")%>' OnCommand="GoDelete" ID="ImageButton32"
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle BackColor="#FF9966" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="Tan" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SDS_AllPost" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                                SelectCommand="SELECT * FROM [tbl_Learning_and_Films] ORDER BY [ID] DESC"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Show" runat="server">
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblCat" runat="server" Text="نمایش پست: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gr_All0" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                DataSourceID="SDS_OneOfOne" ForeColor="Black" GridLines="None">
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="ID" HeaderText="آیدی" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" />
                                    <asp:TemplateField HeaderText="طبقه" SortExpression="Category">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid green;">
                                                <asp:Label ID="Label4" runat="server" Text='<%# setCategoryName(Eval("Category", "{0}")) %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="بخش" SortExpression="Type">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid red;">
                                                <asp:Label ID="Label3" runat="server" Text='<%# setTypeName(Eval("Category"),Eval("type")) %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="عنوان" SortExpression="title">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid green;">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="lid" HeaderText="یک خطی" SortExpression="lid" />
                                    <asp:TemplateField HeaderText="لینک فیلم" SortExpression="link_film">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("link_film") %>'
                                                Target="_blank">
                                                <asp:Label ID="Label1" runat="server" Text='کلیک شود'></asp:Label>
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="لینک پروژه" SortExpression="link_project">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl='<%# Bind("link_project") %>'
                                                Target="_blank">
                                                <asp:Label ID="Label2" runat="server" Text='کلیک شود'></asp:Label>
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="شاخص ها" SortExpression="index" Visible="False">
                                        <ItemTemplate>
                                            <div style="padding: 4px; border: 1px solid green;">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("index") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DateTime" HeaderText="تاریخ" SortExpression="DateTime" />
                                    <asp:TemplateField HeaderText="عکس" SortExpression="photo">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl='<%# String.Format("EditPhoto.aspx?name={0}&id={1}",eval("photo"),eval("id")) %>'
                                                Target="_blank">
                                           <img src="../../Content/img/picture.png" border="0" />
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="متن پست" SortExpression="text">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl='<%# eval("photo","~\Content\Upload\images\imageOnPost\{0}") %>'
                                                Target="_blank">
                                           <img src="../../Content/img/text.png" border="0" />
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="Flag" HeaderText="وضعیت" SortExpression="Flag" />
                                    <asp:TemplateField HeaderText="ویرایش">
                                        <ItemTemplate>
                                            <asp:ImageButton ImageUrl="~\Content\img\edit.png" CommandArgument='<%# Eval("id","{0}")%>'
                                                OnCommand="GoEdit" ID="ImageButton12" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle BackColor="#CCCCCC" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="حذف">
                                        <ItemTemplate>
                                            <asp:ImageButton ImageUrl="~\Content\img\delete.png" OnClientClick="return confirm('are u sure MY LOVE?');"
                                                CommandArgument='<%# Eval("id","{0}")%>' OnCommand="GoDelete" ID="ImageButton32"
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle BackColor="#FF9966" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="Tan" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                            </asp:GridView>
                            &nbsp;<asp:SqlDataSource ID="SDS_OneOfOne" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                                SelectCommand="SELECT * FROM [tbl_Learning_and_Films] WHERE (([Category] = @Category) AND ([Type] = @Type)) ORDER BY [ID] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmd_cat" Name="Category" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="Cmd_Type" Name="Type" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Edit" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td>
                            <asp:RadioButton ID="rbEnable" runat="server" GroupName="1" Style="font-weight: 700;
                                font-size: medium" Text="فعال" />
                            <asp:RadioButton ID="rbDisable" runat="server" GroupName="1" Style="font-weight: 700;
                                font-size: medium" Text="غیر فعال" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            طبقه:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmd_cat_Edit" runat="server" AutoPostBack="True" CssClass="PAD">
                                <asp:ListItem Value="0">ویدیوهای آموزشی- 0</asp:ListItem>
                                <asp:ListItem Value="1">فروشگاه - 1</asp:ListItem>
                                <asp:ListItem Value="2">سایر مطالب (فوتیج و افکت، پلاگین و ... ) در این قسمت - 2</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            بخش:
                        </td>
                        <td>
                            <asp:DropDownList ID="Cmd_Type_Edit" runat="server" CssClass="PAD" DataSourceID="SDS_Type_Edit"
                                DataTextField="Name" DataValueField="Type">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SDS_Type_Edit" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                                SelectCommand="SELECT * FROM [tbl_Category] WHERE ([Code] = @Code)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmd_cat_Edit" Name="Code" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            عنوان:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubject" runat="server" Width="363px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            متن:
                        </td>
                        <td>
                            <FCKeditorV2:FCKeditor ID="txtDetail" runat="server" 
                                BasePath="~/content/fckeditor/" Height="500px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </FCKeditorV2:FCKeditor>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            توضیح یک خطی:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLead" runat="server" Width="726px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            لینک فیلم:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLinkFilm" runat="server" Width="431px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            لینک پروژه:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLinkProject" runat="server" Width="431px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            شامل موارد ... :
                        </td>
                        <td>
                            <asp:TextBox ID="txtIndex" runat="server" Height="51px" TextMode="MultiLine" Width="798px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                            <asp:Label ID="lblWrong" runat="server" Style="color: #FF0000"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnUpdate" runat="server" Style="height: 26px" Text="بروزرسانی" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
