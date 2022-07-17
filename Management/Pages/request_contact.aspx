<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master"
    AutoEventWireup="false" CodeFile="request_contact.aspx.vb" Inherits="Management_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                درخواست آموزش:
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grReq" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SDS_Request"
                    AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" Visible="False" />
                        <asp:BoundField DataField="Name" HeaderText="فرستنده" SortExpression="Name" />
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                        <asp:BoundField DataField="num" HeaderText="شماره" SortExpression="num" />
                        <asp:BoundField DataField="text" HeaderText="درخواست" SortExpression="text">
                            <HeaderStyle Width="600px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="زمان و تاریخ" SortExpression="datetime">
                            <ItemTemplate>
                                <asp:Label ID="DateTimeLabel" runat="server" Style="font: normal 11px tahoma; color: gray"
                                    Text='<%# convertDATE(Eval("DateTime")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="وضعیت" SortExpression="flag">
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" runat="server" BackColor='<%# setFlagBC(Eval("flag", "{0}")) %>'
                                    Style="padding: 4px; color: White;">
                                    <asp:Label ID="Label4" runat="server" Text='<%# setFlag(Eval("flag", "{0}")) %>'></asp:Label>
                                    <asp:Button ID="Button1" runat="server" Text="OK" CommandArgument='<%# Eval("id","{0}")%>'
                                        OnCommand="GoChecked" />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="حذف" SortExpression="flag">
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~\Content\img\delete.png" OnClientClick="return confirm('are u sure MY LOVE?');"
                                    CommandArgument='<%# Eval("id","{0}")%>' OnCommand="GoDelete" ID="ImageButton32"
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Request" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_contact_request] WHERE ([code] = @code) ORDER BY [ID]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="code" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                ارتباط با ما:
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:GridView ID="grCon" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_Contact" AllowPaging="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="بخش" SortExpression="code">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# setPart(Eval("code", "{0}")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BackColor="#FF6666" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="فرستنده" SortExpression="Name" />
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                        <asp:BoundField DataField="num" HeaderText="شماره" SortExpression="num" />
                        <asp:BoundField DataField="text" HeaderText="درخواست" SortExpression="text">
                            <HeaderStyle Width="600px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="زمان و تاریخ" SortExpression="datetime">
                            <ItemTemplate>
                                <asp:Label ID="DateTimeLabel" runat="server" Style="font: normal 11px tahoma; color: gray"
                                    Text='<%# convertDATE(Eval("DateTime")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="وضعیت" SortExpression="flag">
                            <ItemTemplate>
                                <asp:Panel ID="Panel2" runat="server" BackColor='<%# setFlagBC(Eval("flag", "{0}")) %>'
                                    Style="padding: 4px; color: White;">
                                    <asp:Label ID="Label61" runat="server" Text='<%# setFlag(Eval("flag", "{0}")) %>'></asp:Label>
                                    <asp:Button ID="Button2" runat="server" Text="OK" CommandArgument='<%# Eval("id","{0}")%>'
                                        OnCommand="GoChecked" />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="حذف" SortExpression="flag">
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~\Content\img\delete.png" OnClientClick="return confirm('are u sure MY LOVE?');"
                                    CommandArgument='<%# Eval("id","{0}")%>' OnCommand="GoDelete" ID="ImageButton33"
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Contact" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_contact_request] WHERE ([code] &lt;&gt; @code) ORDER BY [ID] DESC">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="code" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
