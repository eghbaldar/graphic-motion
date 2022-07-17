<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Menu.ascx.vb" Inherits="usercontrol_Menu" %>
<%@ OutputCache Duration="2592000" VaryByParam="none" %>
<div class="container">
    <ul id="nav">
        <li><a class="hsubs" href='<%= Page.ResolveUrl("~/تماس-با-ما") %>'>تماس با ما</a></li>
        <li><a class="hsubs" href='<%= Page.ResolveUrl("~/قوانین-و-مقررات") %>'>قوانین و مقررات</a></li>
        <li><a class="hsubs" href='<%= Page.ResolveUrl("~/درخواست-آموزش-تصویری")%>'>درخواست
            آموزش</a> </li>
        <li><a class="hsubs" href="http://forum.graphic-motion.ir" target="_blank">انجمن سایت</a>
        </li>
        <li><a class="hsubs" href="#">دانلود</a>
            <ul class="subs">
                <li><a href='<%= Page.ResolveUrl("~/0/فوتیج،-مدل-و-بافت-های-آماده/دانلود")%>'>فوتیج،
                    مدل و بافت های آماده</a></li>
                <li><a href='<%= Page.ResolveUrl("~/1/افکت-های-صوتی/دانلود")%>'>افکت های صوتی</a></li>
                <li><a href='<%= Page.ResolveUrl("~/2/کتاب-و-جزوه-های-آموزشی/دانلود")%>'>کتاب و جزوه
                    های آموزشی</a></li>
                <li><a href='<%= Page.ResolveUrl("~/3/پروژه-های-آماده/دانلود")%>'>پروژه های آماده</a></li>
                <li><a href='<%= Page.ResolveUrl("~/4/بانک-پلاگین/دانلود")%>'>بانک پلاگین</a></li>
            </ul>
        </li>
        <li><a href="#">بسته های آموزشی</a>
            <ul class="subs">
                <li><a href='<%= Page.ResolveUrl("~/تمامی-بسته-های-آموزشی")%>' style="color: Red;">تمامی
                    بسته های آموزشی</a></li>
                <li><a href='<%= Page.ResolveUrl("~/0/جلوه-های-ویژه-و-کامپوزیت/فروشگاه")%>'>جلوه های
                    ویژه و کامپوزیت</a></li>
                <li><a href='<%= Page.ResolveUrl("~/1/میکس-،-مونتاژ-و-اصلاح-رنگ/فروشگاه")%>'>میکس، مونتاژ
                    و اصلاح رنگ</a></li>
                <li><a href='<%= Page.ResolveUrl("~/2/صداگذاری-و-اصلاح-صدا/فروشگاه")%>'>صداگذاری و اصلاح
                    صدا</a></li>
                <li><a href='<%= Page.ResolveUrl("~/3/مدل-سازی-سه-بعدی/فروشگاه")%>'>مدل سازی سه بعدی</a></li>
                <li><a href='<%= Page.ResolveUrl("~/4/طراحی-دو-بعدی/فروشگاه")%>'>طراحی دو بعدی</a></li>
                <li><a href='<%= Page.ResolveUrl("~/5/مجموعه-پلاگین/فروشگاه")%>'>مجموعه پلاگین</a></li>
                <li><a href='<%= Page.ResolveUrl("~/6/نرم-افزارها/فروشگاه")%>'>نرم افزارها</a></li>
            </ul>
            <%--<asp:DataList ID="lst_store" runat="server" DataSourceID="SDS_Store" Width="250px">
                    <ItemTemplate>
                        <li><a href="#">
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></a></li>
                    </ItemTemplate>
                </asp:DataList>--%>
        </li>
        <li><a href="#">آموزش ها</a>
            <ul class="subs">
                <li><a href='<%= Page.ResolveUrl("~/تمامی-آموزش-های-تصویری")%>' style="color: Red;">
                    تمام آموزش های تصویری</a></li>
                <li><a href='<%= Page.ResolveUrl("~/0/جلوه-های-ویژه-و-کامپوزیت/آموزش")%>'>جلوه های ویژه
                    و کامپوزیت</a></li>
                <li><a href='<%= Page.ResolveUrl("~/1/میکس-،-مونتاژ-و-اصلاح-رنگ/آموزش")%>'>میکس، مونتاژ
                    و اصلاح رنگ</a></li>
                <li><a href='<%= Page.ResolveUrl("~/2/صداگذاری-و-اصلاح-صدا/آموزش")%>'>صداگذاری و اصلاح
                    صدا</a></li>
                <li><a href='<%= Page.ResolveUrl("~/3/مدل-سازی-سه-بعدی/آموزش")%>'>مدل سازی سه بعدی</a></li>
                <li><a href='<%= Page.ResolveUrl("~/4/طراحی-دو-بعدی/آموزش")%>'>طراحی دو بعدی</a></li>
            </ul>
            <%-- <ul class="subs">
                <li><a href='<%= Page.ResolveUrl("~/تمامی آموزش های تصویری")%>' style="color: Red;">تمام آموزش های تصویری</a></li>
                <asp:DataList ID="lst_Learning" runat="server" DataSourceID="SDS_Learning" Width="250px">
                    <ItemTemplate>
                        <li><a href='<%# Page.ResolveUrl("~/"+String.Format("{0}/{1}/آموزش", Eval("type"), Eval("name")))%>'>
                            <asp:Label CssClass="lili" ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></a></li>
                    </ItemTemplate>
                </asp:DataList>
            </ul>--%>
        </li>
        <li><a href='<%= Page.ResolveUrl("~/")%>'>سایت</a></li>
        <div id="lavalamp">
        </div>
    </ul>
</div>
<asp:SqlDataSource ID="SDS_Learning" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
    SelectCommand="SELECT * FROM [tbl_Category] WHERE ([Code] = @Code) ORDER BY [ID] DESC">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="Code" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_Store" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
    SelectCommand="SELECT * FROM [tbl_Category] WHERE ([Code] = @Code) ORDER BY [ID] DESC">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="Code" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_Other" runat="server" ConnectionString="<%$ ConnectionStrings:GraphicMotionConnectionString %>"
    SelectCommand="SELECT * FROM [tbl_Category] WHERE ([Code] = @Code) ORDER BY [ID] DESC">
    <SelectParameters>
        <asp:Parameter DefaultValue="3" Name="Code" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
