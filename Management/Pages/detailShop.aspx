<%@ Page Language="VB" AutoEventWireup="false" CodeFile="detailShop.aspx.vb" Inherits="Management_Pages_detailShop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        body
        {
            direction: rtl;
            font: normal 10px tahoma;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <asp:Label ID="lblStatus" runat="server" Text="سفارشات در حال انتظار است، عجله کنید، مشتری منتظر است"></asp:Label>
    </h1>
    <asp:Panel ID="pnlStatus" runat="server">
        <table class="style1">
        <tr>
            <td>
                <div style="margin: 10px; padding: 10px; border: 3px solid red; background-color: #B6BECD;
                    width: 200px;">
                    <table>
                        <tr>
                            <td>
                                cookie
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCookie" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin: 10px; padding: 10px; border: 3px solid green; background-color: #B6BECD;
                    width: 200px;">
                    <table>
                        <tr>
                            <td>
                                کد پرداخت
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label style="font-size:20px;" ID="lblPey" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin: 10px; padding: 10px; border: 3px solid blue; background-color: #B6BECD;
                    width: 200px;">
                    <table>
                        <tr>
                            <td>
                                شناسه پرداخت
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblauth" style="font-size:20px;"  runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin: 10px; padding: 10px; border: 3px solid yellow; background-color: #B6BECD;
                    width: 200px;">
                    <table>
                        <tr>
                            <td>
                                مجموع پرداختی
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sds_sum"
                                    ShowHeader="False">
                                    <Columns>
                                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sds_sum" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                                    SelectCommand="select sum([sum]) FROM [tbl_Buy_User] WHERE (([CodePey] = @CodePey) AND ([Authority] = @Authority) AND ([CookieID] = @CookieID))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="CodePey" QueryStringField="codepey" Type="String" />
                                        <asp:QueryStringParameter Name="CookieID" QueryStringField="cookieID" Type="String" />
                                        <asp:QueryStringParameter Name="authority" QueryStringField="authority" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td>
                <asp:DataList ID="dl_person" runat="server" CellPadding="4" DataSourceID="sds_person"
                    ForeColor="#333333" Style="font-family: Tahoma; font-size: small">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#E3EAEB" />
                    <ItemTemplate>
                        <b>CookieID:</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="CookieIDLabel" runat="server" Text='<%# Eval("CookieID") %>' />
                        </div>
                        <br />
                        <b>نام</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </div>
                        <br />
                        <b>فامیلی</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="FamilyLabel" runat="server" Text='<%# Eval("Family") %>' />
                        </div>
                        <br />
                        <b>استان</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="OstanLabel" runat="server" Text='<%# Eval("Ostan") %>' />
                        </div>
                        <br />
                        <b>شهر</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </div>
                        <br />
                        <b>کد پستی</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="CodePostLabel" runat="server" Text='<%# Eval("CodePost") %>' />
                        </div>
                        <br />
                        <b>آدرس</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </div>
                        <br />
                        <b>تلفن</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="TelLabel" runat="server" Text='<%# Eval("Tel") %>' />
                        </div>
                        <br />
                        <b>موبایل</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="MobLabel" runat="server" Text='<%# Eval("Mob") %>' />
                        </div>
                        <br />
                        <b>ایمیل</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </div>
                        <br />
                        <b>توضیحات</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="DetailsLabel" runat="server" Text='<%# Eval("Details") %>' />
                        </div>
                        <br />
                        <b>کد پرداخت</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="CodePeyLabel" runat="server" Text='<%# Eval("CodePey") %>' />
                        </div>
                        <br />
                        <b>کد شناسایی</b>
                        <div style="padding:2px;margin:2px;border:1px solid blue;">
                        <asp:Label ID="AuthorityLabel" runat="server" Text='<%# Eval("Authority") %>' />
                        </div>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                <asp:SqlDataSource ID="sds_person" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_Buy_User_Address] WHERE (([Authority] = @Authority) AND ([CodePey] = @CodePey))">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Authority" QueryStringField="authority" Type="String" />
                        <asp:QueryStringParameter Name="CodePey" QueryStringField="codepey" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <div>
        <asp:GridView ID="gr_shop" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="sds_shop" ForeColor="#333333" GridLines="None" Style="font-family: Tahoma;
            font-size: x-small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" Visible="False" />
                <asp:TemplateField HeaderText="نام کالا" SortExpression="TitleStore">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# name_(eval("TitleStore")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CookieID" HeaderText="CookieID" SortExpression="CookieID"
                    Visible="False" />
                <asp:BoundField DataField="CodeStore" HeaderText="کد کالا" SortExpression="CodeStore" />
                <asp:BoundField DataField="Count" HeaderText="تعداد سفارش داده شده" SortExpression="Count">
                    <ItemStyle BackColor="#9999FF" Font-Bold="True" Font-Size="Larger" />
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="ارزش هر کالا" SortExpression="Price" />
                <asp:BoundField DataField="Sum" HeaderText="جمع کالا" SortExpression="Sum">
                    <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
                <asp:TemplateField HeaderText="تاریخ سفارش" SortExpression="DateTime_Record">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# DateMiladiTOSHAMSI(eval("DateTime_Record")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#99FF99" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ خرید" SortExpression="DateTime_Buy">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# DateMiladiTOSHAMSI(eval("DateTime_Buy")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFCCCC" />
                </asp:TemplateField>
                <asp:BoundField DataField="CodePey" HeaderText="CodePey" SortExpression="CodePey"
                    Visible="False" />
                <asp:BoundField DataField="DateTime_Receive" HeaderText="DateTime_Receive" SortExpression="DateTime_Receive"
                    Visible="False" />
                <asp:BoundField DataField="Authority" HeaderText="Authority" SortExpression="Authority"
                    Visible="False" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="sds_shop" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_Buy_User] WHERE (([CodePey] = @CodePey) AND ([CookieID] = @CookieID) AND ([Authority] = @Authority) and flag=1) ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="CodePey" QueryStringField="codepey" Type="String" />
                <asp:QueryStringParameter Name="CookieID" QueryStringField="cookieid" Type="String" />
                <asp:QueryStringParameter Name="Authority" QueryStringField="authority" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </asp:Panel>
    <hr />
    <hr />
    <div>
        <asp:Button ID="btnBaresi" runat="server" Text="بررسی توسط گروه فروش" />
        <asp:Button ID="btnSent" runat="server" Text="ارسال شده" />
    </div>
    </form>
</body>
</html>
