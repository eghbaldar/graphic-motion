<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">.txt{background-color:#97c0ea;padding:5px;border:1px solid #317fce;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;width:320px}.txt:hover{background-color:#abd1f5}.txtCap{-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;padding:10px;border:1px solid red;width:400px}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
<div style="font:normal 20px titr;padding:10px">
فرم ارتباط با ما</div>
<div style="text-align:right;background-color:White">
<table>
<tr>
<td>
<div style="font:normal 14px koodak">
<table style="width:100%;text-align:right">
<tr>
<td>
دپارتمان موضوع:
</td>
<td>
<asp:DropDownList ID="cmd" runat="server" CssClass="txt">
<asp:ListItem Value="1">بخش پشتیبانی آموزش های تصویری</asp:ListItem>
<asp:ListItem Value="2">بخش پشتیبانی فنی سایت</asp:ListItem>
<asp:ListItem Value="3">بخش مدیریت کل سایت</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
<tr>
<td>
نام درخواست دهنده:
</td>
<td>
<asp:TextBox ID="txtName" CssClass="txt" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
شماره همراه:
</td>
<td>
<asp:TextBox ID="txtNum" CssClass="txt" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNum" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
ایمیل:
</td>
<td>
<asp:TextBox ID="txtEmail" CssClass="txt" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
توضیحات و عنوان درخواست:
</td>
<td>
<asp:TextBox ID="txtDetail" CssClass="txt" Height="300" runat="server" TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDetail" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
</td>
<td>
<asp:Button ID="btnInsertComment" CssClass="InsertComment" runat="server" Text="ارسال" ValidationGroup="1" />
<asp:Label ID="captcha" style="font-family:tahoma" runat="server"></asp:Label>
<asp:TextBox ID="txtCaptcha" CssClass="txtCap" runat="server" Width="39px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCaptcha" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
&nbsp;
</td>
<td>
<asp:Label ID="captchaWrong" Style="font-size:10px" runat="server"></asp:Label>
</td>
</tr>
</table>
</div>
</td>
<td>
<div style="width:450px;border-right:5px dotted #ccc">
<div style="background-color:White;padding:10px;font:normal 17px koodak">
<div>
زمان پاسخگویی تلفنی : شنبه تا چهارشنبه از ساعت ۹ الی ۱۶
</div>
<div>
تلفن تماس برای ارتباط با بخش پشتیبانی فروشگاه گرافیک موشن : 01333344429
</div>
<div>
آدرس پستی : گیلان - رشت - خیابان ملت - مجتمع مهر پیشکسوتان - غرفه چهارم
</div>
<div>
شما از طریق فرم پایین می توانید پیشنهادات ، مشکلات و نظرات خود را به مسئولان سایت
گرافیک موشن انتقال دهید
</div>
<div>
کاربر محترم ، با توجه به حجم بالای پیامها ، پاسخ دادن به آنها در زمان کوتاه امکان
پذیر نمی باشد. اما سعی می گردد تمامی مطالب مطالعه شده و در صورت نیاز واحد مربوطه
با شما مکاتبه نموده و پاسخ لازم را ارائه دهد.
</div>
<div>
لطفا برای تسریع در پاسخ به پیام ها، واحد مربوطه را به درستی انتخاب نمایید.
</div>
<div>
با تشکر
</div>
</div>
</div>
<div style="border-right:5px dotted #ccc">
<div>
<table style="width:100%;text-align:right">
<tr>
<td>
<img src="Content/img/contact_email.png" alt="توضیحات"/>
</td>
<td style="text-align:left">
support@graphic-motion.ir
</td>
</tr>
<tr>
<td>
<img src="Content/img/contact_forum.png" title="فروم" alt="توضیحات"/>
</td>
<td style="text-align:left">
forum.graphic-motion.ir
</td>
</tr>
<tr>
<td>
<img src="Content/img/contact_telegram.png"  title="تلگرام" alt="توضیحات"/>
</td>
<td style="text-align:left">
@graphic-motion
</td>
</tr>
<tr>
<td>
<img src="Content/img/contact_instagram.png"  title="اینستاگرام" alt="توضیحات"/>
</td>
<td style="text-align:left">
@graphic-motion
</td>
</tr>
<tr>
<td>
<img src="Content/img/contact_facebook.png"  title="فیسبوک" alt="توضیحات" />
</td>
<td style="text-align:left">
graphic-motion.ir
</td>
</tr>
</table>
</div>
</div>
</td>
</tr>
</table>
</div>
</asp:Content>