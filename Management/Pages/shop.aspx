<%@ Page Title="" Language="VB" MasterPageFile="~/Management/Pages/Master.master"
    AutoEventWireup="false" CodeFile="shop.aspx.vb" Inherits="Management_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            color: #009933;
        }
        .style3
        {
            color: #FF0000;
        }
        .style4
        {
            color: #0000FF;
        }
        .style5
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                <strong>سفارشات پرداخت شده</strong>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_OK" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="cookieID" HeaderText="cookieID" SortExpression="cookieID"
                            Visible="False" />
                        <asp:BoundField DataField="authority" HeaderText="authority" SortExpression="authority"
                            Visible="False" />
                        <asp:BoundField DataField="nameFamily" HeaderText="نام و نام خانوادگی" ReadOnly="True"
                            SortExpression="nameFamily" />
                        <asp:BoundField DataField="CodePey" HeaderText="کد پرداخت" SortExpression="CodePey" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# String.format("detailShop.aspx?cookieID={0}&codepey={1}&authority={2}",Eval("cookieID"),Eval("codepey"),Eval("authority")) %>'
                                    style="text-decoration: none;" onclick="window.open(this.href,'newwindow','width:200,height:300');
                                return false;">مشاهده جزییات و پیگیری سفارش</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_OK" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="select id,cookieID,authority,Name+' '+Family as 'nameFamily',CodePey from dbo.tbl_Buy_User_Address where LTRIM(rtrim(authority))<>'' and LTRIM(rtrim(codepey))<>'' and cookieid in (select cookieid from tbl_Buy_User where flag=1)">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <strong>سفارشات ارسال نشده</strong>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:SqlDataSource ID="SDS_NonSent" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="select id,cookieID,authority,Name+' '+Family as 'nameFamily',CodePey from dbo.tbl_Buy_User_Address where LTRIM(rtrim(authority))<>'' and LTRIM(rtrim(codepey))<>'' and cookieid in (select cookieid from tbl_Buy_User where flag=2)">
                </asp:SqlDataSource>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_NonSent" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="cookieID" HeaderText="cookieID" SortExpression="cookieID"
                            Visible="False" />
                        <asp:BoundField DataField="authority" HeaderText="authority" SortExpression="authority"
                            Visible="False" />
                        <asp:BoundField DataField="nameFamily" HeaderText="نام و نام خانوادگی" ReadOnly="True"
                            SortExpression="nameFamily" />
                        <asp:BoundField DataField="CodePey" HeaderText="کد پرداخت" SortExpression="CodePey" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# String.format("detailShop_NonSent.aspx?cookieID={0}&codepey={1}&authority={2}",Eval("cookieID"),Eval("codepey"),Eval("authority")) %>'
                                    style="text-decoration: none;" onclick="window.open(this.href,'newwindow','width:200,height:300');
                                return false;">مشاهده جزییات و پیگیری سفارش</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <strong>سفارشات ارسال شده</strong>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:SqlDataSource ID="SDS_Sent" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="select id,cookieID,authority,Name+' '+Family as 'nameFamily',CodePey from dbo.tbl_Buy_User_Address where LTRIM(rtrim(authority))<>'' and LTRIM(rtrim(codepey))<>'' and cookieid in (select cookieid from tbl_Buy_User where flag=3)">
                </asp:SqlDataSource>
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataSourceID="SDS_Sent" ForeColor="Black" GridLines="Vertical" BackColor="White"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="cookieID" HeaderText="cookieID" SortExpression="cookieID"
                            Visible="False" />
                        <asp:BoundField DataField="authority" HeaderText="authority" SortExpression="authority"
                            Visible="False" />
                        <asp:BoundField DataField="nameFamily" HeaderText="نام و نام خانوادگی" ReadOnly="True"
                            SortExpression="nameFamily" />
                        <asp:BoundField DataField="CodePey" HeaderText="کد پرداخت" SortExpression="CodePey" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# String.format("detailShop_Sent.aspx?cookieID={0}&codepey={1}&authority={2}",Eval("cookieID"),Eval("codepey"),Eval("authority")) %>'
                                    style="text-decoration: none;" onclick="window.open(this.href,'newwindow','width:200,height:300');
                                return false;">مشاهده جزییات </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>سفارشات پرداخت نشده</strong>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SDS_DontPey" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="select id,cookieID,authority,Name+' '+Family as 'nameFamily',CodePey from dbo.tbl_Buy_User_Address where LTRIM(rtrim(authority))='' or LTRIM(rtrim(codepey))='' and cookieid in (select cookieid from tbl_Buy_User where flag=0)">
                </asp:SqlDataSource>
                <asp:GridView ID="dg_dontPey" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_DontPey" BackColor="White" BorderColor="#CC9966" BorderStyle="None"
                    BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="cookieID" HeaderText="cookieID" SortExpression="cookieID"
                            Visible="False" />
                        <asp:BoundField DataField="nameFamily" HeaderText="نام و نام خانوادگی" ReadOnly="True"
                            SortExpression="nameFamily" />
                        <asp:BoundField DataField="authority" HeaderText="کد شناسایی - قبل از پرداخت" SortExpression="authority" />
                        <asp:BoundField DataField="CodePey" HeaderText="کد پرداخت - بعد از پرداخت" SortExpression="CodePey" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='<%# String.format("detailShop_DontPey.aspx?cookieID={0}&codepey={1}&authority={2}",Eval("cookieID"),Eval("codepey"),Eval("authority")) %>'
                                    style="text-decoration: none;" onclick="window.open(this.href,'newwindow','width:200,height:300');
                                return false;">مشاهده جزییات </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <strong>جدول اصلی </strong>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropType" runat="server" AutoPostBack="True" Style="font-family: Tahoma">
                    <asp:ListItem Value="0">سفارشات پرداخت نشده</asp:ListItem>
                    <asp:ListItem Value="1">پرداخت شده - در حال انتظار</asp:ListItem>
                    <asp:ListItem Value="2">در حال بررسی توسط گروه فروش</asp:ListItem>
                    <asp:ListItem Value="3">ارسال شده</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dg_down" runat="server" DataSourceID="SDS_AllPey" AllowPaging="True"
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                    BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" />
                        <asp:BoundField DataField="CookieID" HeaderText="CookieID" SortExpression="CookieID" />
                        <asp:BoundField DataField="CodeStore" HeaderText="CodeStore" SortExpression="CodeStore" />
                        <asp:BoundField DataField="Count" HeaderText="Count" SortExpression="Count" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Sum" HeaderText="Sum" SortExpression="Sum" />
                        <asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" />
                        <asp:TemplateField HeaderText="DateTime_Record" SortExpression="DateTime_Record">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# DateMiladiTOSHAMSI(Eval("DateTime_Record")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DateTime_Buy" SortExpression="DateTime_Buy">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# DateMiladiTOSHAMSI(Eval("DateTime_Buy")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CodePey" HeaderText="CodePey" SortExpression="CodePey" />
                        <asp:TemplateField HeaderText="DateTime_Receive" SortExpression="DateTime_Receive">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# DateMiladiTOSHAMSI(Eval("DateTime_Receive")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TitleStore" HeaderText="TitleStore" SortExpression="TitleStore" />
                        <asp:BoundField DataField="Authority" HeaderText="Authority" 
                            SortExpression="Authority" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" ImageUrl="~/Content/img/delete.png"
                                CommandArgument='<%# Eval("CookieID","{0}")%>'
                                            OnCommand="GoDelete" 
                                             OnClientClick="return confirm('با اینکار این رکورد از تمامی جداول حذف میشود؟');" 
                                 runat="server" />
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_AllPey" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_Buy_User] WHERE ([Flag] = @Flag) ORDER BY [ID] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropType" Name="Flag" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
