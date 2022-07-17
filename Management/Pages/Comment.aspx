<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master"
    AutoEventWireup="false" CodeFile="Comment.aspx.vb" Inherits="Management_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                زرد: ادمین&nbsp;&nbsp;&nbsp;&nbsp; سفید: کاربرها</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView_OK" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="ODS" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID_post" HeaderText="آیدی پست" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID_post" />
                        <asp:BoundField DataField="name" HeaderText="فرستنده">
                            <ItemStyle BackColor="#FF9966" Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="title" HeaderText="عنوان پست" 
                            SortExpression="title" />
                        <asp:BoundField DataField="ID_Comment" HeaderText="آیدی کامنت" InsertVisible="False"
                            ReadOnly="True" SortExpression="ID_Comment" />
                        <asp:TemplateField HeaderText="متن" SortExpression="Comment">
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" BackColor='<%# iif(eval("flag")=true,Drawing.Color.Yellow,
                                     Drawing.ColorTranslator.FromHtml("#FFFFFF")) %>' runat="server" CssClass="Comment">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Flag" SortExpression="Flag" Visible="False" />
                        <asp:CheckBoxField DataField="Enable" HeaderText="وضعیت" 
                            SortExpression="Enable" />
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                        <asp:BoundField DataField="DateTime" HeaderText="تاریخ و زمان" 
                            SortExpression="DateTime" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" OnClientClick="return confirm('are u sure MY LOVE?');"
                                    CommandArgument='<%# Eval("ID_Comment","{0}")%>' OnCommand="GoDelete" ImageUrl="~/Content/img/delete.png"
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("ID_post","{0}")%>'
                                    OnCommand="AdminComment" Text="پاسخ به کامنت" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text="OK" CommandArgument='<%# Eval("ID_Comment","{0}")%>'
                                    OnCommand="GoOK" BackColor="Green" ForeColor="Wheat" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# String.Format("../../post/{1}/{0}", Eval("title"), Eval("ID_post")).ToString().Replace(" ","-")+".html" %>'
                                 target="_blank" style="text-decoration: none;">
                                    دیدن پست</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DSTableAdapters.CommentCMSTableAdapter"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView_NOK" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="ODS_OK" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID_post" HeaderText="آیدی پست" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID_post" />
                        <asp:BoundField DataField="ID_Comment" HeaderText="آیدی کامنت" InsertVisible="False"
                            ReadOnly="True" SortExpression="ID_Comment" />
                        <asp:BoundField DataField="name" HeaderText="فرستنده">
                            <ItemStyle BackColor="#FF9933" Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="title" HeaderText="عنوان پست" 
                            SortExpression="title" />
                        <asp:TemplateField HeaderText="متن" SortExpression="Comment">
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" BackColor='<%# iif(eval("flag")=true,Drawing.Color.Yellow,
                                     Drawing.ColorTranslator.FromHtml("#FFFFFF")) %>' runat="server" CssClass="Comment">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" 
                            Visible="False" />
                        <asp:CheckBoxField DataField="Enable" HeaderText="وضعیت" 
                            SortExpression="Enable" />
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                        <asp:BoundField DataField="DateTime" HeaderText="تاریخ و زمان" 
                            SortExpression="DateTime" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" OnClientClick="return confirm('are u sure MY LOVE?');"
                                    CommandArgument='<%# Eval("ID_Comment","{0}")%>' OnCommand="GoDelete" ImageUrl="~/Content/img/delete.png"
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button3" CommandArgument='<%# Eval("ID_post","{0}")%>' OnCommand="AdminComment"
                                    runat="server" Text="پاسخ به کامنت" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# Eval("ID_post","../../post/{0}/پست")%>' target="_blank" style="text-decoration: none;">
                                    دیدن پست</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_OK" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DSTableAdapters.CommentCMS_OKTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="ID_Comment" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtComment" runat="server" Enabled="False" Height="200px" TextMode="MultiLine"
                    Width="600px"></asp:TextBox>
                <asp:Button ID="btnInsertAdmin" runat="server" Enabled="False" Text="ارسال" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
