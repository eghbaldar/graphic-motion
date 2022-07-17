<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="checkout_final.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
    <div style="padding: 10px; font: normal 20px titr;">
        اتمام خرید
    </div>
    <div style="background-color: White; padding: 10px; font: normal 25px koodak; text-align: center;">
        <div style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            border: 10px solid green;">
            <div>
                <asp:Label ID="lbl_Detail" runat="server"></asp:Label>
            </div>
            <div>
                <asp:Label ID="lbl_codePey" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:Image ID="Image2" Height="150" runat="server" ImageUrl="http://graphic-motion.ir/Content/img/logo_footer.png" />
                        </td>
                        <td>
                            <script type="text/javascript" src="https://www.zarinpal.com/webservice/TrustCode"></script>
                            <noscript>
                                <a href="https://www.zarinpal.com/users/receptive_websites">ZarinPal Receptive Websites</a></noscript>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
