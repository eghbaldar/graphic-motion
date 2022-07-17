<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="newsletter.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    <style type="text/css">
        .txt
        {
            background-color: #97c0ea;
            padding: 5px;
            border: 1px solid #317fce;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            width: 320px;
            text-align: left;
        }
        .txt:hover
        {
            background-color: #abd1f5;
        }
        .txtCap
        {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            padding: 10px;
            border: 1px solid red;
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
    <div style="font: normal 20px titr; padding: 10px">
        عضویت در خبرنامه سایت گرافیک موشن
    </div>
    <div style="text-align: right; background-color: White;padding:20px;">
        <table class="style1">
            <tr style="font-family: koodak;">
                <td>
                    لطفا ایمیل خود را در کادر زیر وارد کنید:
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtN" CssClass="txt" runat="server" Width="351px" ValidationGroup="20"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtN" style="color: #FF0000" 
                        ValidationGroup="20"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtN"
                        ErrorMessage="فرمت ایمیل شما اشتباه است." ForeColor="Red" Style="font-family: koodak;"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="20"></asp:RegularExpressionValidator>
                   
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button Style="font-family: koodak;" ID="btn" runat="server" Text="ثبت ایمیل"
                        ValidationGroup="20" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl" runat="server" Style="color: #009900; font-family: koodak;"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
