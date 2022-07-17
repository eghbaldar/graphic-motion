<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master" AutoEventWireup="false" CodeFile="EditPhoto.aspx.vb" Inherits="Management_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Image ID="img" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:FileUpload ID="FileUpload" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="btnUpdatePhoto" runat="server" Text="بروزرسانی عکس پست" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

