<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default"  %>
<%@ Register Src="usercontrol/slider.ascx" TagName="slider" TagPrefix="uc1" %>
<%@ Register Src="usercontrol/Slider_Store.ascx" TagName="Slider_Store" TagPrefix="uc2" %>
<%--<%@ OutputCache Duration="360" VaryByParam="none" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<title>آموزش‌های تخصصی جلوه‌های ویژه و میکس و مونتاژ</title>
<meta name="Description" content="دانلود,سورس گرافیکی,پلاگین,نرم‌افزار,آموزش, افکت‌های صوتی، آموزشی‌های تصویری رایگان، آموزش افتر‌افکت،  after effect ، آموزش premiere ، آموزش ادیوس، فتوشاپ،فوتیج، سینما فور دی,پروژه آماده,ادیوس,افترافکت میکس و مونتاژ،آموزش و دانلود جلوه‌های تصویری ویژه ، فروش بسته‌های آموزشی تخصصی و حرفه‌ای سینمایی، مرکز گسترش جلوه‌های تصویری" />
<link href="Content/Slider/styles.css" rel="stylesheet" type="text/css" />
<script src="Content/Slider/js/jquery.min.js" type="text/javascript"></script>
<script src="Content/Slider/js/jquery.flexslider-min.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">    var $ = jQuery.noConflict(); $(window).load(function () { $(".flexslider").flexslider({ animation: "fade" }); $(function () { $(".show_menu").click(function () { $(".menu").fadeIn(); $(".show_menu").fadeOut(); $(".hide_menu").fadeIn() }); $(".hide_menu").click(function () { $(".menu").fadeOut(); $(".show_menu").fadeIn(); $(".hide_menu").fadeOut() }) }) });</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
<table id="icon_slider">
<tr>
<td>
<div style="padding-left:5px;padding-right:5px;padding-bottom:5px">
<img src="Content/img/mnu_MAYA.png" alt="توضیحات"  title="مایا"/></div>
<div style="padding-left:5px;padding-right:5px;padding-bottom:5px">
<img src="Content/img/mnu_sg.png" alt="توضیحات" title="اسپیدگرید" /></div>
</td>
<td>
<div style="padding-left:5px;padding-bottom:5px">
<img src="Content/img/mnu_ae.png" alt="توضیحات" title="افترافکت" /></div>
<div>
<img src="Content/img/mnu_au.png" alt="توضیحات"  title="آدیشن"/></div>
</td>
<td>
<div id="slider">
<uc1:slider ID="slider1" runat="server" />
</div>
</td>
<td>
<div style="padding-left:5px;padding-right:5px;padding-bottom:5px">
<img src="Content/img/mnu_c4d.png" alt="توضیحات"  title="سینما4دی"/></div>
<div style="padding-left:5px;padding-right:5px">
<img src="Content/img/mnu_pr.png" alt="توضیحات"  title="پریمیر"/></div>
</td>
<td>
<div style="padding-left:5px;padding-right:5px;padding-bottom:5px">
<img src="Content/img/mnu_edius.png" alt="توضیحات"  title="ادیوس"/></div>
<div style="padding-left:5px;padding-right:5px">
<img src="Content/img/mnu_3dmax.png" alt="توضیحات"  title="تری دی مکس"/></div>
</td>
</tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
<table style="width:100%">
<tr>
<td style="display:none;"><span style="font:normal 17px koodak">پست‌های آموزشی تصادفی</span></td>
<td style="display:none;"><span style="font:normal 17px koodak">آخرین پست‌های ارسال شده مرکز</span></td>
</tr>
<tr>
<td>
<div id="posts">
<asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_4Post" RepeatColumns="1">
<ItemTemplate>
<asp:Panel ID="Panel1" runat="server" CssClass="Post_Right" BackImageUrl='<%# Eval("photo","~/Content/Upload/images/imageOnPost\{0}") %>'>
<div class="Post_Right_Title">
<a style="text-decoration:none;color:White" href='<%# String.Format("post/{1}/{0}", Eval("title"), Eval("id")).ToString().Replace(" ","-")+".html" %>'>
<h4>
<asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("title") %>' />
</h4>
</a>
</div>
<div>
<table style="width:100%">
<tr>
<td>
<div style="width:370px">
</div>
</td>
<td>
<a style="text-decoration:none;color:White" target="_blank" href='<%# String.Format("post/{1}/{0}", Eval("title"), Eval("id")).ToString().Replace(" ","-")+".html" %>'>
<div class="Menu_Post_Right">
<img src="Content/img/mnu_download.png" border="0" alt="توضیحات" />
<img src="Content/img/mnu_project.png" border="0" alt="توضیحات" />
<%--<table style="width: 100%; color: White;">
                                                            <tr>
                                                                <td>
                                                                    بازدیدها
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    434
                                                                </td>
                                                            </tr>
                                                        </table>--%>
</div>
</a>
</td>
</tr>
</table>
</div>
</asp:Panel>
</ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SDS_4Post" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="select top 4 * from tbl_Learning_and_Films WHERE ([Category] = @Category and [Flag] = 1) order by NEWID()">
<SelectParameters>
<asp:Parameter DefaultValue="0" Name="Category" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</td>
<td>
<div class="10Post">
<asp:DataList ID="DataList2" runat="server" DataSourceID="SDS_10Post">
<ItemTemplate>
<a href='<%# getAnchor(Eval("category","{0}"),Eval("id","{0}"),Eval("title","{0}")) %>' style="color:Black;text-decoration:none" target="_blank">
<div id="Posts10">
<table>
<tr>
<%-- <td>
                                                <a>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("photo","~\Content\Upload\images\imageOnPost\{0}") %>'
Width="80" Height="60" />
</a>
</td>--%>
<td>

<div style="padding:2px;height:47px;">
<div style="text-shadow:1px 1px 1px #000;font-family:koodak;font-size:16px">
<h4 style="margin-bottom:13px;margin-top:14px">
<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title","{0}") %>' />
</h4>
</div>
<div style="color:#ff6a17;font-size:11px;padding-top:4px;text-shadow:1px 1px 1px #000">
<asp:Label ID="lidLabel" runat="server" Text='<%# getTitle(Eval("lid","{0}"),Eval("category","{0}")) %>' />
</div>
</div>

</td>
</tr>
</table>
</div>
</a>
</ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SDS_10Post" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>" SelectCommand="SELECT top 12 * FROM [tbl_Learning_and_Films] WHERE ([Flag] = 1) ORDER BY [ID] DESC">
<SelectParameters>
<asp:Parameter DefaultValue="true" Name="Flag" Type="Boolean" />
</SelectParameters>
</asp:SqlDataSource>
</div>
<div class="Store">
<%--<img src="Content/Upload/images/Store/BigPic/store_ae_1.jpg" />--%>
<uc2:Slider_Store ID="Slider_Store1" runat="server" />
</div>

</td>

</tr>
</table>
</asp:Content>