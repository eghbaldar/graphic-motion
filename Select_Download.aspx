<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="Select_Download.aspx.vb" Inherits="Default2" %>
<%@ OutputCache Duration="360" VaryByParam="none" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">.gridviewPagging{font:normal 14px titr;background-color:#fff;padding:5px;margin:2px}.gridviewPagging a{font:normal 14px titr;margin:2px 2px 2px 2px;padding:8px;border-radius:20%;background-color:#444;padding:3px 8px 3px 8px;color:#fff;text-decoration:none;-o-box-shadow:1px 1px 1px #111;-moz-box-shadow:1px 1px 1px #111;-webkit-box-shadow:1px 1px 1px #111;box-shadow:1px 1px 1px #111}.gridviewPagging a:hover{background-color:#245e98;color:#fff}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
<div style="padding:10px;background-color:#38393d;font:normal 11px tahoma;margin-right:8px;margin-left:8px;margin-bottom:4px;-moz-border-radius:0 0 5px 5px;-webkit-border-radius:0 0 5px 5px;border-radius:0 0 5px 5px">
<asp:DataList ID="dl_ListOfPost" runat="server" DataSourceID="SDS_All_list" RepeatColumns="2">
<ItemTemplate>
<div style="padding:2px">
<table>
<tr>
<td>
<img src="<%= Page.ResolveUrl("~/Content/img/explore.png") %>" alt="توضیحات"/>
</a>
</td>
<td>
<a style="text-decoration:none;color:White" target="_blank" href='<%#  String.Format("../../download/{1}/{0}", Eval("title"), Eval("id")).ToString().Replace(" ","-")+".html" %>'>
<asp:Label ID="Label5" runat="server" Text='<%# Eval("title") %>' />
</a>
</td>
</tr>
</table>
</div>
</ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SDS_All_list" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT top 20 * FROM [tbl_Learning_and_Films] WHERE ([Type] = @Type and flag=1 and category=2) ORDER BY [ID] DESC">
<SelectParameters>
<asp:RouteParameter Name="Type" RouteKey="type" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
</div>
<div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_All" GridLines="None" ShowHeader="False" Width="975px" AllowPaging="True" PageSize="15">
<Columns>
<asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
<asp:TemplateField HeaderText="Type" SortExpression="Type">
<ItemTemplate>
<div style="background-color:White;-moz-border-radius:5px;-webkit-border-radius:5px;border:1px solid #848484;border-radius:5px;box-shadow:1px 1px 1px 1px #848484;margin:5px;padding:5px">
<table style="width:100%">
<tr>
<td>
<a style="text-decoration:none;color:black" target="_blank" href='<%#  String.Format("../../download/{1}/{0}", Eval("title"), Eval("id")).ToString().Replace(" ","-")+".html" %>'>
<asp:Image ID="Image2" runat="server" CssClass="VidePostLeft_Photo" ImageUrl='<%# Eval("photo","~\Content\Upload\images\imageOnPost\{0}") %>' Width="595" Height="320" />
</a>
</td>
<td>
<div style="width:330px;height:315px;background:#fff;background:-moz-linear-gradient(left,rgba(255,255,255,1) 0,rgba(225,225,225,1) 51%,rgba(246,246,246,1) 100%);background:-webkit-linear-gradient(left,rgba(255,255,255,1) 0,rgba(225,225,225,1) 51%,rgba(246,246,246,1) 100%);background:linear-gradient(to right,rgba(255,255,255,1) 0,rgba(225,225,225,1) 51%,rgba(246,246,246,1) 100%);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',endColorstr='#f6f6f6',GradientType=1)">
<table style="width:100%;font:normal 15px koodak">
<tr>
<td style="font:normal 17px titr">
<a style="text-decoration:none;color:black" target="_blank" href='<%#  String.Format("../../download/{1}/{0}", Eval("title"), Eval("id")).ToString().Replace(" ","-")+".html" %>'>
<asp:Label ID="Label4" runat="server" Text='<%# Eval("title") %>' />
</a>
</td>
</tr>
<tr>
<td style="color:Gray;font-size:11px">
<asp:Label ID="DateTimeLabel" runat="server" Style="font:normal 11px tahoma;color:gray" Text='<%# convertDATE(Eval("DateTime")) %>' />
</td>
</tr>
<tr>
<td>
<asp:Label ID="Label1" runat="server" Text='<%# Eval("lid") %>' />
</td>
</tr>
<tr>
<td>
<div style="background-color:#494a4f;padding-right:5px;padding-bottom:5px;padding-top:5px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;font-family:Tahoma;font-size:11px">
<table>
<tr>
<td style="color:White">
آمار بازدید
</td>
<td>
<div class="VisitDownContent">
<asp:Label ID="Label2" runat="server" Text='<%# GetVisit(Eval("id")) %>'></asp:Label>
</div>
</td>
<td style="color:White">
آمار دانلود
</td>
<td>
<div class="VisitDownContent">
<asp:Label ID="Label3" runat="server" Text='<%# GetDown(Eval("id")) %>'></asp:Label>
</div>
</td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td>
</td>
</tr>
<tr>
<td style="color:Red;text-shadow:1px 1px 1px #ccc">
<a style="text-decoration:none;color:Red" target="_blank" href='<%#  String.Format("../../download/{1}/{0}", Eval("title"), Eval("id")).ToString().Replace(" ","-")+".html" %>'>
دانلود فایل مورد نظر </a>
</td>
</tr>
</table>
</div>
</td>
</tr>
</table>
</div>
</ItemTemplate>
</asp:TemplateField>
</Columns>
<PagerStyle CssClass="gridviewPagging" VerticalAlign="Middle" HorizontalAlign="Center" Height="40"></PagerStyle>
</asp:GridView>
<asp:SqlDataSource ID="SDS_All" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT * FROM [tbl_Learning_and_Films] WHERE ([Type] = @Type and flag=1 and category=2) ORDER BY [ID] DESC">
<SelectParameters>
<asp:RouteParameter Name="Type" RouteKey="type" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</asp:Content>