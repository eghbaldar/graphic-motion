<%@ Control Language="VB" AutoEventWireup="false" CodeFile="slider.ascx.vb" Inherits="usercontrol_slider" %>
<%@ OutputCache Duration="360" VaryByParam="none" %>
<div class="slider_container">
    <div class="flexslider">
        <ul class="slides">
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_Slider">
  <ItemTemplate>
    <li><a
     href='<%# getAnchor(Eval("category","{0}"),Eval("id","{0}"),Eval("title","{0}")) %>'
    target="_blank">
        <asp:Image  ID="Image1" ImageUrl='<%# Eval("photo","~/Content/Upload/images/imageOnPost/{0}") %>'
            runat="server" />
        <div class="flex-caption">
            <div class="caption_title_line">
                <h2>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("title") %>' style="font:normal 15px titr;" /></h2>
                <p>
                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("lid") %>'  style="font:normal 11px tahoma;" /></p>
            </div>
        </div></li>
  </ItemTemplate>
</asp:Repeater>
        </ul>
    </div>
</div>

<asp:SqlDataSource ID="SDS_Slider" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
    SelectCommand="SELECT top 4 * FROM [tbl_Learning_and_Films] WHERE ([Flag] = 1 ) ORDER BY [ID] DESC">
</asp:SqlDataSource>
