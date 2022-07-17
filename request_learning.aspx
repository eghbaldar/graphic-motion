<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="request_learning.aspx.vb" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">.txt{background-color:#97c0ea;padding:5px;border:1px solid #317fce;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px}.txt:hover{background-color:#abd1f5}.txtCap{-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;padding:10px;border:1px solid red;width:400px}.style1{width:190px}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
<div style="font:normal 20px titr;padding:10px">
درخواست آموزش تصویری</div>
<div style="background-color:White;padding:7px;font:normal 17px koodak">
<table style="width:100%;text-align:right">
<tr>
<td class="style1">
نام درخواست دهنده:
</td>
<td>
<asp:TextBox ID="txtName" CssClass="txt" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td class="style1">
شماره همراه:
</td>
<td>
<asp:TextBox ID="txtNum" CssClass="txt" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNum" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td class="style1">
ایمیل:
</td>
<td>
<asp:TextBox ID="txtEmail" CssClass="txt" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td class="style1">
توضیحات و عنوان درخواست:
</td>
<td>
<asp:TextBox ID="txtDetail" CssClass="txt" Height="300px" runat="server" TextMode="MultiLine" Width="367px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDetail" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td class="style1">
</td>
<td>
<asp:Button ID="btnInsertComment" CssClass="InsertComment" runat="server" Text="ارسال" ValidationGroup="1" />
<asp:Label ID="captcha" Style="font-family:tahoma" runat="server"></asp:Label>
<asp:TextBox ID="txtCaptcha" CssClass="txtCap" runat="server" Width="39px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCaptcha" ErrorMessage="*" Style="color:#FF0000" ValidationGroup="1"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td class="style1">
&nbsp;
</td>
<td>
<asp:Label ID="captchaWrong" Style="font-size:10px" runat="server"></asp:Label>
</td>
</tr>
</table>
</div>
</asp:Content>