<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="search.aspx.vb" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">.gridviewPagging{font:normal 14px titr;background-color:#fff;padding:5px;margin:2px}.gridviewPagging a{font:normal 14px titr;margin:2px 2px 2px 2px;padding:8px;border-radius:20%;background-color:#444;padding:3px 8px 3px 8px;color:#fff;text-decoration:none;-o-box-shadow:1px 1px 1px #111;-moz-box-shadow:1px 1px 1px #111;-webkit-box-shadow:1px 1px 1px #111;box-shadow:1px 1px 1px #111}.gridviewPagging a:hover{background-color:#245e98;color:#fff}</style>
<style type="text/css">.style1{width:100%}.divSearch{padding:5px;background-color:White;width:740px;font:normal 20px koodak;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border:1px solid #b6b9cc}.divSearch:hover{background-color:#abd1f5;cursor:pointer}.Pnl{padding:5px;font:normal 20px koodak;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border:1px solid #b6b9cc}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
<table class="style1">
<tr>
<td style="font:normal 18px titr;padding-right:5px;color:#245e98">
نتایج جستجو:
</td>
</tr>
<tr>
<td>
<asp:GridView ID="dgResult" runat="server" DataSourceID="SDS_Result" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" AllowPaging="True" PageSize="30" Width="968">
<Columns>
<asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
<asp:TemplateField HeaderText="Type" SortExpression="Type">
<ItemTemplate>
<table>
<tr>
<td>
<a href='<%# getAnchor(Eval("category","{0}"),Eval("id","{0}"),Eval("title","{0}")) %>' style="color:Black;text-decoration:none" target="_blank">
<div class="divSearch">
<asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
</div>
</a>
</td>
<td>
<asp:Panel ID="Panel1" CssClass="Pnl" runat="server" BackColor='<%# getColor(Eval("category","{0}")) %>'>
<asp:Label ID="Label2" runat="server" Text='<%# getName(Eval("category","{0}")) %>'></asp:Label>
</asp:Panel>
</td>
</tr>
</table>
</ItemTemplate>
</asp:TemplateField>
</Columns>
<PagerStyle CssClass="gridviewPagging" VerticalAlign="Middle" HorizontalAlign="Center" Height="40"></PagerStyle>
</asp:GridView>
<asp:SqlDataSource ID="SDS_Result" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="Search" SelectCommandType="StoredProcedure">
<SelectParameters>
<asp:RouteParameter Name="strSearch" RouteKey="title" Type="String" />
</SelectParameters>
</asp:SqlDataSource>
</td>
</tr>
<tr>
<td>
&nbsp;
</td>
</tr>
</table>
</asp:Content>