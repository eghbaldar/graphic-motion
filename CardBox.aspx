<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="CardBox.aspx.vb" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">.title{width:955px;background-color:White;padding:5px;font-family:titr;font-size:14px;margin:5px}.content{margin:5px;padding:5px}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
<div style="padding:10px">
<asp:ImageButton ID="btnDontPey" runat="server" ImageUrl="~/Content/img/buy_dontpey.png" />
<asp:ImageButton ID="btnPey" runat="server" ImageUrl="~/Content/img/buy_pey.png" />
<asp:ImageButton ID="btnWait" runat="server" ImageUrl="~/Content/img/buy_waiting.png" />
<asp:ImageButton ID="btnSend" runat="server" ImageUrl="~/Content/img/buy_send.png" />
</div>
<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
<asp:View ID="View1" runat="server">
<div class="title">
سفارش های پرداخت نشده</div>
<div class="content">
<asp:GridView ID="DG_DontPey" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_DontPey" CellPadding="4" Font-Names="tahoma" Font-Size="11px" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
<Columns>
<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
<asp:BoundField DataField="CookieID" HeaderText="CookieID" SortExpression="CookieID" Visible="False" />
<asp:TemplateField HeaderText="کد محصول" SortExpression="CodeStore">
<ItemTemplate>
<asp:Label ID="Label1" runat="server" Text='<%# Bind("CodeStore") %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="نام محصول" SortExpression="titlestore">
<ItemTemplate>
<asp:Label ID="Label12" runat="server" Text='<%# eval("titlestore").tostring.replace(".html","").tostring.replace("-"," ") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle Width="560px" />
<ItemStyle Font-Bold="True" />
</asp:TemplateField>
<asp:BoundField DataField="Count" HeaderText="تعداد سفارش محصول" SortExpression="Count" />
<asp:BoundField DataField="Price" HeaderText="ارزش واحد" SortExpression="Price" />
<asp:BoundField DataField="Sum" HeaderText="مجموع خرید" SortExpression="Sum" />
<asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
<asp:TemplateField HeaderText="">
<ItemTemplate>
<asp:ImageButton ImageUrl="~/Content/img/delete.png" ID="ImageButton1" CommandArgument='<%# Eval("id","{0}")%>' OnCommand="GoDelete" OnClientClick="return confirm('مطمئن هستید؟');" runat="server" />
</ItemTemplate>
<HeaderStyle Width="40px" />
</asp:TemplateField>
</Columns>
<EmptyDataTemplate>
رکوردی برای نمایش وجود ندارد.
</EmptyDataTemplate>
<FooterStyle BackColor="White" ForeColor="#333333" />
<HeaderStyle BackColor="#EF0905" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="White" ForeColor="#333333" />
<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
<SortedAscendingCellStyle BackColor="#F7F7F7" />
<SortedAscendingHeaderStyle BackColor="#487575" />
<SortedDescendingCellStyle BackColor="#E5E5E5" />
<SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
<asp:SqlDataSource ID="SDS_DontPey" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT * FROM [tbl_Buy_User] WHERE (([CookieID] = @CookieID) AND ([Flag] = @Flag)) ORDER BY [ID] DESC">
<SelectParameters>
<asp:CookieParameter CookieName="BuyGM" Name="CookieID" Type="String" />
<asp:Parameter DefaultValue="0" Name="Flag" Type="String" />
</SelectParameters>
</asp:SqlDataSource>
</div>
<div style="padding:10px;background-color:White;font-family:titr;font-size:17px">
<table>
<tr>
<td>
<asp:Label ID="lblSum" runat="server" Text="Label"></asp:Label>
</td>
<td>
<asp:Button ID="btnContinue" runat="server" Text="ادامه فرآیند خرید" />
</td>
</tr>
</table>
</div>
</asp:View>
<asp:View ID="View2" runat="server">
<div class="title">
سفارش های در حال انتظار و پرداخت شده</div>
<div class="content">
<asp:GridView ID="DG_Pey" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDG_Pey" CellPadding="4" Font-Names="tahoma" Font-Size="11px" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
<Columns>
<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
<asp:BoundField DataField="CookieID" HeaderText="CookieID" SortExpression="CookieID" Visible="False" />
<asp:TemplateField HeaderText="کد محصول" SortExpression="CodeStore">
<ItemTemplate>
<asp:Label ID="Label2" runat="server" Text='<%# Bind("CodeStore") %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="نام محصول" SortExpression="titlestore">
<ItemTemplate>
<asp:Label ID="Label3" runat="server" Text='<%# eval("titlestore").tostring.replace(".html","").tostring.replace("-"," ") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle Width="610px" />
<ItemStyle Font-Bold="True" />
</asp:TemplateField>
<asp:BoundField DataField="Count" HeaderText="تعداد سفارش محصول" SortExpression="Count" />
<asp:BoundField DataField="Price" HeaderText="ارزش واحد" SortExpression="Price" />
<asp:BoundField DataField="Sum" HeaderText="مجموع خرید" SortExpression="Sum" />
<asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
</Columns>
<EmptyDataTemplate>
رکوردی برای نمایش وجود ندارد.
</EmptyDataTemplate>
<FooterStyle BackColor="White" ForeColor="#333333" />
<HeaderStyle BackColor="#4DDB53" Font-Bold="True" ForeColor="black" />
<PagerStyle BackColor="#4DDB53" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="White" ForeColor="#333333" />
<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
<SortedAscendingCellStyle BackColor="#F7F7F7" />
<SortedAscendingHeaderStyle BackColor="#487575" />
<SortedDescendingCellStyle BackColor="#E5E5E5" />
<SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
<asp:SqlDataSource ID="sqlDG_Pey" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT * FROM [tbl_Buy_User] WHERE (([CookieID] = @CookieID) AND ([Flag] = @Flag)) ORDER BY [ID] DESC">
<SelectParameters>
<asp:CookieParameter CookieName="BuyGM" Name="CookieID" Type="String" />
<asp:Parameter DefaultValue="1" Name="Flag" Type="String" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</asp:View>
<asp:View ID="View3" runat="server">
<div class="title">
سفارش های در حال بررسی توسط گروه فروش</div>
<div class="content">
<asp:GridView ID="DG_PeyWaiting0" runat="server" AutoGenerateColumns="False" DataSourceID="sqlWait" CellPadding="4" Font-Names="tahoma" Font-Size="11px" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
<Columns>
<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
<asp:BoundField DataField="CookieID" HeaderText="CookieID" SortExpression="CookieID" Visible="False" />
<asp:TemplateField HeaderText="کد محصول" SortExpression="CodeStore">
<ItemTemplate>
<asp:Label ID="Label4" runat="server" Text='<%# Bind("CodeStore") %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="نام محصول" SortExpression="titlestore">
<ItemTemplate>
<asp:Label ID="Label5" runat="server" Text='<%# eval("titlestore").tostring.replace(".html","").tostring.replace("-"," ") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle Width="610px" />
<ItemStyle Font-Bold="True" />
</asp:TemplateField>
<asp:BoundField DataField="Count" HeaderText="تعداد سفارش محصول" SortExpression="Count" />
<asp:BoundField DataField="Price" HeaderText="ارزش واحد" SortExpression="Price" />
<asp:BoundField DataField="Sum" HeaderText="مجموع خرید" SortExpression="Sum" />
<asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
</Columns>
<EmptyDataTemplate>
رکوردی برای نمایش وجود ندارد.
</EmptyDataTemplate>
<FooterStyle BackColor="White" ForeColor="#333333" />
<HeaderStyle BackColor="#0D70A1" Font-Bold="True" ForeColor="white" />
<PagerStyle BackColor="#4DDB53" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="White" ForeColor="#333333" />
<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
<SortedAscendingCellStyle BackColor="#F7F7F7" />
<SortedAscendingHeaderStyle BackColor="#487575" />
<SortedDescendingCellStyle BackColor="#E5E5E5" />
<SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
<asp:SqlDataSource ID="sqlWait" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT * FROM [tbl_Buy_User] WHERE (([CookieID] = @CookieID) AND ([Flag] = @Flag)) ORDER BY [ID] DESC">
<SelectParameters>
<asp:CookieParameter CookieName="BuyGM" Name="CookieID" Type="String" />
<asp:Parameter DefaultValue="2" Name="Flag" Type="String" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</asp:View>
<asp:View ID="View4" runat="server">
<div class="title">
سفارش های ارسال شده</div>
<div class="content">
<asp:GridView ID="DG_PeyWaiting1" runat="server" AutoGenerateColumns="False" DataSourceID="sqlSend" CellPadding="4" Font-Names="tahoma" Font-Size="11px" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
<Columns>
<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
<asp:BoundField DataField="CookieID" HeaderText="CookieID" SortExpression="CookieID" Visible="False" />
<asp:TemplateField HeaderText="کد محصول" SortExpression="CodeStore">
<ItemTemplate>
<asp:Label ID="Label6" runat="server" Text='<%# Bind("CodeStore") %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="نام محصول" SortExpression="titlestore">
<ItemTemplate>
<asp:Label ID="Label7" runat="server" Text='<%# eval("titlestore").tostring.replace(".html","").tostring.replace("-"," ") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle Width="610px" />
<ItemStyle Font-Bold="True" />
</asp:TemplateField>
<asp:BoundField DataField="Count" HeaderText="تعداد سفارش محصول" SortExpression="Count" />
<asp:BoundField DataField="Price" HeaderText="ارزش واحد" SortExpression="Price" />
<asp:BoundField DataField="Sum" HeaderText="مجموع خرید" SortExpression="Sum" />
<asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
</Columns>
<EmptyDataTemplate>
رکوردی برای نمایش وجود ندارد.
</EmptyDataTemplate>
<FooterStyle BackColor="White" ForeColor="#333333" />
<HeaderStyle BackColor="#F9887A" Font-Bold="True" ForeColor="black" />
<PagerStyle BackColor="#4DDB53" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="White" ForeColor="#333333" />
<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
<SortedAscendingCellStyle BackColor="#F7F7F7" />
<SortedAscendingHeaderStyle BackColor="#487575" />
<SortedDescendingCellStyle BackColor="#E5E5E5" />
<SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
<asp:SqlDataSource ID="sqlSend" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT * FROM [tbl_Buy_User] WHERE (([CookieID] = @CookieID) AND ([Flag] = @Flag)) ORDER BY [ID] DESC">
<SelectParameters>
<asp:CookieParameter CookieName="BuyGM" Name="CookieID" Type="String" />
<asp:Parameter DefaultValue="3" Name="Flag" Type="String" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</asp:View>
</asp:MultiView>
</asp:Content>