<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master" AutoEventWireup="false" CodeFile="Category.aspx.vb" Inherits="Management_Pages_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style2
    {
            width: 78px;
        }
        .style3
        {
            width: 266px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <table class="style1">
                <tr>
                    <td class="style2">
                        کد:</td>
                    <td>
                        <asp:DropDownList ID="cmd_code" runat="server" AutoPostBack="True" CssClass="PAD">
                            <asp:ListItem Value="0">آموزش - 0</asp:ListItem>
                            <asp:ListItem Value="1">فروشگاه - 1</asp:ListItem>
                            <asp:ListItem Value="2">سایر - 2</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        <asp:GridView ID="DG_Full" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="ID" DataSourceID="SDS_SelectFull" 
                            ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="Code" HeaderText="کد طبقه" SortExpression="Code">
                                <ItemStyle BackColor="#FF9999" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="عنوان" SortExpression="Name" />
                                <asp:BoundField DataField="Type" HeaderText="کد بخش" SortExpression="Type" />
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
                        <asp:SqlDataSource ID="SDS_SelectFull" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" 
                            DeleteCommand="DELETE FROM tbl_Category WHERE (ID = @id)" 
                            SelectCommand="SELECT * FROM [tbl_Category] WHERE ([Code] = @Code)" 
                            UpdateCommand="UPDATE tbl_Category SET Name = @name WHERE (ID = @id)">
                            <DeleteParameters>
                                <asp:Parameter Name="id" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmd_code" Name="Code" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="name" />
                                <asp:Parameter Name="id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        بخش:        </td>
                    <td>
                        <asp:DropDownList ID="cmd_part" runat="server" AutoPostBack="True" CssClass="PAD">
                        </asp:DropDownList>
                        <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="ID" DataSourceID="SDS_SelectCat" 
                            ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="Code" HeaderText="کد طبقه" SortExpression="Code" />
                                <asp:BoundField DataField="Name" HeaderText="عنوان" SortExpression="Name" />
                                <asp:BoundField DataField="Type" HeaderText="کد بخش" SortExpression="Type">
                                <ItemStyle BackColor="#FF66CC" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDS_SelectCat" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" 
                            DeleteCommand="DELETE FROM tbl_Category WHERE (ID = @id)" 
                            SelectCommand="SELECT * FROM [tbl_Category] WHERE (([Code] = @Code) AND ([Type] = @Type)) ORDER BY [ID] DESC" 
                            UpdateCommand="UPDATE tbl_Category SET Name = @name WHERE (ID = @id)">
                            <DeleteParameters>
                                <asp:Parameter Name="id" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmd_code" Name="Code" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="cmd_part" Name="Type" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="name" />
                                <asp:Parameter Name="id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        عنوان:</td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" Width="426px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnInsert" runat="server" Text="درج" />
                    </td>
                </tr>
                </table>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

