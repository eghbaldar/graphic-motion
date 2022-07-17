<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="All_Store.aspx.vb" Inherits="Default2" %>
<%@ OutputCache Duration="360" VaryByParam="none" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .div_store
        {
            width: 218px;
            height: 318px;
            border: 1px solid #848484;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px; /* permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#feffff+0,ddf1f9+35,6d97c4+100 */
            background: rgb(254,255,255); /* old browsers */
            background: -moz-linear-gradient(top, rgba(254,255,255,1) 0%, rgba(221,241,249,1) 35%, rgba(109,151,196,1) 100%); /* ff3.6-15 */
            background: -webkit-linear-gradient(top, rgba(254,255,255,1) 0%,rgba(221,241,249,1) 35%,rgba(109,151,196,1) 100%); /* chrome10-25,safari5.1-6 */
            background: linear-gradient(to bottom, rgba(254,255,255,1) 0%,rgba(221,241,249,1) 35%,rgba(109,151,196,1) 100%); /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#feffff', endColorstr='#6d97c4',GradientType=0 ); /* ie6-9 */
            padding: 10px;
            text-align: center;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin-bottom: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Up" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Down" runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DL_AllStore" runat="server" DataSourceID="SDS_AllStore" RepeatColumns="4">
                    <ItemTemplate>
                        <div class="div_store">
                            <a style="text-decoration: none; color: Black;" target="_blank" href='<%#  "store/"+Eval("id","{0}")+"/"+Eval("title","{0}").ToString().Replace(" ","-")+".html" %>'>
                                <!-- Aks -->
                                <div style="text-align: center;">
                                    <img src='<%# Eval("link_project") %>' width="222px" height="190px" />
                                </div>
                                <!-- Title -->
                                <div style="font: normal 18px titr;">
                                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /></div>
                                <!-- Price -->
                                <div style="color: Red; font: normal 18px titr;">
                                    <asp:Label ID="lidLabel" runat="server" Text='<%# Eval("lid") %>' /><span> تومان</span></div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SDS_AllStore" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_Learning_and_Films] WHERE ([Category] = 1 and flag=1) ORDER BY [ID] DESC">
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
