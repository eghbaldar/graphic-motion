<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master"
    AutoEventWireup="false" CodeFile="Statistic.aspx.vb" Inherits="Management_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                بیشترین دانلود ها:
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView_Down" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ODS_CountDown"
                    AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="ID_Post" HeaderText="ID_Post" SortExpression="ID_Post"
                            Visible="False" />
                        <asp:BoundField DataField="CountView" HeaderText="تعداد بازدید" SortExpression="CountView" />
                        <asp:BoundField DataField="CountDown" HeaderText="تعداد دانلود" SortExpression="CountDown" />
                        <asp:BoundField DataField="title" HeaderText="عنوان پست" SortExpression="title" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# Eval("ID_post","../../post/{0}/پست")%>' target="_blank" style="text-decoration: none;">
                                    دیدن پست</a>
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
                <asp:ObjectDataSource ID="ODS_CountDown" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DSTableAdapters.Statistic_CountDownTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                بیشتر بازدیدها:
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView_View" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                    DataSourceID="ODS_CountView" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="ID_Post" HeaderText="ID_Post" SortExpression="ID_Post"
                            Visible="False" />
                        <asp:BoundField DataField="CountView" HeaderText="تعداد بازدید" SortExpression="CountView" />
                        <asp:BoundField DataField="CountDown" HeaderText="تعداد دانلود" SortExpression="CountDown" />
                        <asp:BoundField DataField="title" HeaderText="عنوان پست" SortExpression="title" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# Eval("ID_post","../../post/{0}/پست")%>' target="_blank" style="text-decoration: none;">
                                    دیدن پست</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_CountView" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DSTableAdapters.Statistic_CountViewTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
