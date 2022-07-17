<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AddToCard.ascx.vb" Inherits="usercontrol_AddToCard" %>
<div style="background-color: White; padding: 5px; margin: 3px; width: 200px; border: 1px solid #848484;
    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
    <table style="width: 100%; text-align: right;">
        <tr>
            <td>
                <asp:ImageButton ID="aadd" ImageUrl="~/Content/img/cart.png" runat="server" 
                    ValidationGroup="110" />
                <br />
            </td>
            <td style="font-family: koodak;font-size:14px;">
                &nbsp;<asp:LinkButton 
                    ID="link_aadd" runat="server"
                style="color:#19448E;"
                Font-Underline="False">افزودن به سبد خرید</asp:LinkButton>
            </td>
            <td>
                <asp:TextBox ID="count" Style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                    border-radius: 5px; padding: 3px; width: 30px; text-align: center;" runat="server"
                    Text="1"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>
<asp:Panel ID="Shop" Visible="false" runat="server">
    <div style="background-color: White; padding: 5px; margin: 3px; width: 324px; border: 1px solid #848484;
        -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; font-family: Tahoma;
        font-size: 11px;">
        <div>
            <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" DataSourceID="SDS"
                GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" Visible="False" />
                    <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Count" SortExpression="Count">
                        <ItemTemplate>
                            <asp:Image ID="Image1" ImageUrl="~/Content/img/tick.png" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TitleStore" SortExpression="TitleStore">
                      
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# String.Format(Eval("TitleStore","{0}")).ToString().Replace(".html","").Replace("-"," ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                SelectCommand="SELECT * FROM [tbl_Buy_User] WHERE [CookieID] = @CookieID and flag=0 ORDER BY [ID] DESC">
                <SelectParameters>
                    <asp:CookieParameter CookieName="BuyGM" Name="CookieID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:Label ID="lblKerm" runat="server" 
                Text="شما نمیتوانید بیش از 10 خرید همزمان داشته باشید." style="color: #FF0000" 
                Visible="False"></asp:Label>
        </div>
        <div>
            <asp:ImageButton ID="btnCardBox" ImageUrl="~/Content/img/CardBox.png" runat="server" />
        </div>
    </div>
</asp:Panel>
