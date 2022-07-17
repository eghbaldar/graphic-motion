<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master"
    AutoEventWireup="false" CodeFile="learning.aspx.vb" Inherits="Management_Pages_learning" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 104px;
        }
        .style4
        {
            width: 131px;
        }
        .style8
        {
            width: 53px;
        }
        .style9
        {
            width: 240px;
        }
        .style10
        {
            width: 44px;
        }
        .aal
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="CatType" runat="server">
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
                                    <asp:Button ID="btnGO" runat="server" Text="مرحله بعدی" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="Insert" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td>
                                    <div style="border: 3px dotted black;">
                                        <table class="style1">
                                            <tr>
                                                <td class="style8">
                                                    طبقه:
                                                </td>
                                                <td class="style9">
                                                    <asp:Label ID="lblCat" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
                                                </td>
                                                <td class="style10">
                                                    بخش:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblType" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style8">
                                                    &nbsp;
                                                </td>
                                                <td class="style9">
                                                    &nbsp;
                                                </td>
                                                <td class="style10">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    انتخاب بخش:
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    عنوان:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSubject" runat="server" Width="363px"></asp:TextBox>
                                    &nbsp;تمامی پست ها بسته به طبقه خودش دارای یک شماره&nbsp; باشد.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    متن:
                                </td>
                                <td>
                                    <FCKeditorV2:FCKeditor ID="txtDetail" runat="server" BasePath="~/content/fckeditor/"
                                        Height="500px">
                                    </FCKeditorV2:FCKeditor>
                                    <br />
                                    عکس درون متنی نباید بزرگتر از اندازه 580*326 باشد.
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    توضیح یک خطی:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLead" runat="server" Width="726px"></asp:TextBox>
                                    &nbsp;قیمت در فروشگاه
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    لینک فیلم:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="aal" ID="txtLinkFilm" runat="server" Width="636px">http://dl.graphic-motion.ir/</asp:TextBox>
                                    <br />
                                    گذاشتن نقطه به معنی حذف آیکن دانلود است.<br />
                                    برای تمامی پست ها یعنی آموزشی-فروشگاه-دانلودها فیلم باید داشته باشیم، ولو بسیار
                                    کوتاه.
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    لینک پروژه:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="aal" ID="txtLinkProject" runat="server" Width="632px"></asp:TextBox>
                                    <br />
                                    برای قسمت فروشگاه بعنوان عکس کوچک استفاده می شود.
                                    <br />
                                    فقط با http:// نوشته شود.
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    شامل موارد ... :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtIndex" runat="server" Height="51px" TextMode="MultiLine" Width="798px"></asp:TextBox>
                                    <br />
                                    فقط با علامت - کوچک
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td>
                                    <a href="tags.aspx" target="_blank">لیست کلمات کلیدی </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    عکس اصلی:
                                </td>
                                <td>
                                    <asp:FileUpload ID="FilePhoto" runat="server" />
                                    <br />
                                    برای قسمت فروشگاه بعنوان عکس بزرگ استفاده می شود.
                                    <br />
                                    اندازه عکس باید 500*281 باشد.
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;
                                    <asp:Label ID="lblWrong" runat="server" Style="color: #FF0000"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="btnInsert" runat="server" Text="درج" Width="678px" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="Check" runat="server">
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:DataList ID="DL_Preview" runat="server" DataSourceID="SDS_Check">
                                        <ItemTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td>
                                                        عنوان
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        یک خطی:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lidLabel" runat="server" Text='<%# Eval("lid") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        متن:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        موارد:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="indexLabel" runat="server" Text='<%# Eval("index") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a href='<%# Eval("link_film") %>' target="_blank">
                                                            <asp:Label ID="link_filmLabel" runat="server" Text='<%# Eval("link_film") %>' />
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a href='<%# Eval("link_project") %>' target="_blank">
                                                            <asp:Label ID="link_projectLabel" runat="server" Text='<%# Eval("link_project") %>' />
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        تصویر
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# eval("photo","~/Content/Upload/images/imageOnPost/{0}") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:SqlDataSource ID="SDS_Check" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                                        SelectCommand="SELECT top 1 * FROM [tbl_Learning_and_Films] ORDER BY [ID] DESC">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnOK" runat="server" BackColor="#66FF66" Text="تایید و نمایش" />
                                    <asp:Button ID="btnDelete" runat="server" BackColor="#FF3300" Text="حذف" />
                                    <asp:Button ID="btnEdit" runat="server" BackColor="#99CCFF" Text="ویرایش" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="Edit" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Edit"
                            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" DataKeyNames="id">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"
                                    Visible="False" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                <asp:BoundField DataField="lid" HeaderText="lid" SortExpression="lid" />
                                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" Visible="False" />
                                <asp:BoundField DataField="link_film" HeaderText="link_film" SortExpression="link_film" />
                                <asp:BoundField DataField="link_project" HeaderText="link_project" SortExpression="link_project" />
                                <asp:BoundField DataField="index" HeaderText="index" SortExpression="index" />
                                <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" Visible="False" />
                                <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime"
                                    Visible="False" />
                                <asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        <asp:Button ID="btnOK2" runat="server" BackColor="#66FF66" Text="تایید و نمایش" />
                        <asp:SqlDataSource ID="SDS_Edit" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                            SelectCommand="SELECT top 1 * FROM [tbl_Learning_and_Films] ORDER BY [ID] DESC"
                            UpdateCommand="UPDATE tbl_Learning_and_Films SET title = @title, lid = @lid, text = @text, link_film = @link_film, link_project = @link_project, [index] = @index WHERE (ID = (SELECT TOP (1) ID FROM tbl_Learning_and_Films AS tbl_Learning_and_Films_1 ORDER BY ID DESC))">
                            <UpdateParameters>
                                <asp:Parameter Name="title" />
                                <asp:Parameter Name="lid" />
                                <asp:Parameter Name="text" />
                                <asp:Parameter Name="link_film" />
                                <asp:Parameter Name="link_project" />
                                <asp:Parameter Name="index" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
