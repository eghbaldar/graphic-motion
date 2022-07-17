<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="store.aspx.vb" Inherits="Default2" %>
<%@ Register Src="usercontrol/AddToCard.ascx" TagName="AddToCard" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
<table>
<tr>
<td>
<div id="ViewPost_CenterPost">
<div id="ViewPost_Right">
<asp:DataList ID="DL_Right" runat="server" DataSourceID="SDS_Post" Width="340">
<ItemTemplate>
<div id="ViewPostRight_Statistic">
<div id="ViewPostRight_Statistic_Title">
آمار بازدید و فروش
</div>
<div id="ViewPostRight_Statistic_SS">
<table>
<tr>
<td>
آمار بازدید
</td>
<td>
<div class="VisitDownContent">
<asp:Label ID="Label2" runat="server" Text='<%# GetVisit() %>'></asp:Label>
</div>
</td>
<%--<td>
                                                    آمار دانلود
                                                </td>
                                                <td>
                                                    <div class="VisitDownContent">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# GetDown() %>'></asp:Label>
</div>
</td>--%>
</tr>
</table>
</div>
</div>
<div id="ViewPostRight_Store">
<a href="http://graphic-motion.ir/%D8%AA%D9%85%D8%A7%D9%85%DB%8C-%D8%A8%D8%B3%D8%AA%D9%87-%D9%87%D8%A7%DB%8C-%D8%A2%D9%85%D9%88%D8%B2%D8%B4%DB%8C" target="_blank">
<img width="335px" style="margin-bottom:5px;" src="<%= Page.ResolveUrl("Content/Upload/images/Store/BigPic/store_ae_1.jpg") %>" />
</a>
</div>
<div id="ViewPostRight_Relation">
<div id="ViewPostRight_Relation_Title">
بسته های آموزشی مرتبط</div>
<div>
<asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_Relation">
<ItemTemplate>
<a style="text-decoration:none;color:black" target="_blank" href='<%#  String.Format("../../store/{1}/{0}", Eval("title"), Eval("id")).ToString().Replace(" ","-")+".html" %>'>
<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
</a>
</ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SDS_Relation" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT      top 10  ID, Category, title, lid, text, link_film, link_project, [index], photo, DateTime, Flag, Type
FROM            tbl_Learning_and_Films
WHERE        (Category =
                             (SELECT        Category
                               FROM            tbl_Learning_and_Films AS tbl_Learning_and_Films_2
                               WHERE        (ID = @id))) AND (Type IN
                             (SELECT        Type
                               FROM            tbl_Learning_and_Films AS tbl_Learning_and_Films_1
                               WHERE        (ID = @id)))
order by newid()">
<SelectParameters>
<asp:RouteParameter Name="ID" RouteKey="id" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</div>
</ItemTemplate>
</asp:DataList>
<uc1:AddToCard ID="AddToCard1" runat="server" />
</div>
<div id="ViewPostLeft">
<div id="ViewPostLeft_Post">
<asp:DataList ID="DataList2" runat="server" DataSourceID="SDS_Post">
<ItemTemplate>
<table>
<tr style="font:normal 20px titr">
<td>
<div style="background-color:#37383c;padding:10px;width:578px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border:2px solid #bcbcbc">
<h4 style="margin-bottom:12px;margin-top:7px;color:White">
<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
</h4>
</div>
</td>
</tr>
<tr>
<td>
<asp:Image ID="Image2" runat="server" CssClass="VidePostLeft_Photo" ImageUrl='<%# Eval("photo","~\Content\Upload\images\imageOnPost\{0}") %>' Width="600" Height="425" />
</td>
</tr>
<tr style="font:normal 11px tahoma">
<td>
<asp:Label ID="DateTimeLabel" runat="server" Style="font:normal 11px tahoma;color:gray" Text='<%# convertDATE(Eval("DateTime")) %>' />
</td>
</tr>
<tr style="font:normal 11px tahoma;text-align:center">
<td>
<div style="color:#fff;font:normal 18px titr;text-shadow:1px 1px 1px #000;padding:5px;border:4px solid #1a68ff;background-color:#368be1">
<asp:Label ID="lidLabel" runat="server" Text='<%# Eval("lid") %>' /><span> تومان</span></div>
</td>
</tr>
<%--<tr>
                                            <td>
                                                <video width="595" height="340" controls>
                                              <source
                                              src='<%# String.Format("{0}",Eval("link_film")) %>'
type="video/mp4">
مرورگر شما از پخش فیلم پشتیبانی نمی کند.
</video>
</td>
</tr>--%>
<tr style="font:normal 15px koodak;color:#07547b">
<td>
توضیحات:
</td>
</tr>
<tr>
<td>
<div style="background-color:#afc0d1;padding:10px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;font-family:koodak">
<asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
</div>
</td>
</tr>
<tr style="font:normal 15px koodak;color:#07547b">
<td>
این آموزش بسته شامل موارد زیر است:
</td>
</tr>
<tr>
<td>
<div style="background-color:#83a0bd;padding:10px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;font:normal 14px tahoma">
<asp:Label ID="indexLabel" runat="server" Text='<%# getIndex(Eval("index")) %>' />
</div>
</td>
</tr>
</table>
</ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SDS_Post" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT top 1 * FROM [tbl_Learning_and_Films] WHERE (([ID] = @ID) AND ([Flag] = 1))">
<SelectParameters>
<asp:RouteParameter Name="id" RouteKey="id" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
</div>
<div id="ViewPostLeft_Comment">
<div id="ViewPostLeft_Comment_Title">
کامنت ها</div>
<div>
<div id="sendComment">
<table style="width:100%">
<tr>
<td style="width:50px">
فرستنده:
</td>
<td>
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
ایمیل:
</td>
<td>
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
کامنت:
</td>
<td>
<asp:TextBox ID="txtComment" CssClass="TextBoxComment" runat="server" Height="81px" Width="511px" TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtComment" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
</td>
<td>
<asp:Button ID="btnInsertComment" CssClass="InsertComment" runat="server" Text="ارسال" ValidationGroup="1" />
</td>
</tr>
<tr>
<td>
&nbsp;
</td>
<td>
<asp:Label ID="captcha" runat="server"></asp:Label>
<asp:TextBox ID="txtCaptcha" runat="server" Width="39px"></asp:TextBox>
<asp:Label ID="captchaWrong" runat="server"></asp:Label>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCaptcha" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
</table>
</div>
<asp:DataList ID="DL_Comment" runat="server" DataSourceID="SDS_Comment">
<ItemTemplate>
<asp:Panel ID="Panel1" BackColor='<%# iif(eval("flag")=true,Drawing.ColorTranslator.FromHtml("#9ED541"),
                                     Drawing.ColorTranslator.FromHtml("#FFFFFF")) %>' runat="server" CssClass="Comment">
<table style="width:100%">
<tr>
<td>
<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Style="font-weight:700" />
</td>
</tr>
<tr>
<td>
<asp:Label ID="DateTimeLabel" runat="server" Style="font:normal 11px tahoma;color:gray" Text='<%# convertDATE(Eval("DateTime")) %>' />
</td>
</tr>
<tr>
<td>
<asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' Style="color:#333333" />
</td>
</tr>
</table>
</asp:Panel>
</ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SDS_Comment" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT * FROM [tbl_Comments] WHERE (([Enable] = 1)
                                 AND ([ID_Post] = @ID_Post)) ORDER BY [ID]">
<SelectParameters>
<asp:RouteParameter Name="ID_Post" RouteKey="id" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</div>
</div>
</div>
</td>
</tr>
</table>
</asp:Content>