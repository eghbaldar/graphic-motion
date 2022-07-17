<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Footer.ascx.vb" Inherits="usercontrol_Footer" %>
<%@ OutputCache Duration="2592000" VaryByParam="none" %>
<div>
    <table style="width: 100%;">
        <tr>
            <td>
                <a href="http://graphic-motion.ir" style="text-decoration: none;">
                    <img src="<%= Page.ResolveUrl("~/Content/img/logo_footer.png") %>" />
                </a>
            </td>
            <td>
                <div style="font: normal 18px Titr; color: #10122E;">
                    بسته های آموزشی</div>
                <div>
                    <ul style="font: normal 17px koodak; color: White; text-shadow: 1px 1px 1px #000000;">
                        <li>
                         <a href='<%= Page.ResolveUrl("~/0/جلوه-های-ویژه-و-کامپوزیت/فروشگاه")%>'
                         target="_blank" style="text-decoration:none;color:White;">
                        جلوه‌های ویژه و کامپوزیت
                        </a>
                        </li>
                        <li>
                         <a href='<%= Page.ResolveUrl("~/5/مجموعه-پلاگین/فروشگاه")%>'
                         target="_blank" style="text-decoration:none;color:White;">
                        بانک پلاگین
                        </a>
                        </li>
                        <li>
                         <a href='<%= Page.ResolveUrl("~/3/مدل-سازی-سه-بعدی/فروشگاه")%>'
                         target="_blank" style="text-decoration:none;color:White;">
                        مدل سازی سه بعدی
                        </a>
                        </li>
                        <li>
                         <a href='<%= Page.ResolveUrl("~/2/صداگذاری-و-اصلاح-صدا/فروشگاه")%>'
                         target="_blank" style="text-decoration:none;color:White;">
                        صداگذاری و تصحیح صدا
                        </a>
                        </li>
                        <li>
                         <a href='<%= Page.ResolveUrl("~/1/میکس-،-مونتاژ-و-اصلاح-رنگ/فروشگاه")%>'
                         target="_blank" style="text-decoration:none;color:White;">
                        میکس و مونتاژ
                        </a>
                        </li>
                    </ul>
                </div>
            </td>
            <td>
                <div style="font: normal 18px Titr; color: #10122E;">
                    دانلود فایل های ضروری</div>
                <div>
                    <ul style="font: normal 17px koodak; color: White; text-shadow: 1px 1px 1px #000000;">
                        <li>
                        <a href='<%= Page.ResolveUrl("~/0/فوتیج،-مدل-و-بافت-های-آماده/دانلود")%>'
                         target="_blank" style="text-decoration:none;color:White;"> فوتیج و ترانزیشن</a>
                       </li>
                        <li>
                        <a href='<%= Page.ResolveUrl("~/1/افکت-های-صوتی/دانلود")%>'
                         target="_blank" style="text-decoration:none;color:White;"> افکت‌های صوتی</a>
                       </li>
                        <li>
                        <a href='<%= Page.ResolveUrl("~/4/بانک-پلاگین/دانلود")%>'
                         target="_blank" style="text-decoration:none;color:White;">  بانک پلاگین</a>
                      </li>
                        <li>
                        <a href='<%= Page.ResolveUrl("~/3/پروژه-های-آماده/دانلود")%>'
                         target="_blank" style="text-decoration:none;color:White;"> پروژه‌های آماده</a>
                       </li>
                        <li>
                        <a href='<%= Page.ResolveUrl("~/2/کتاب-و-جزوه-های-آموزشی/دانلود")%>'
                         target="_blank" style="text-decoration:none;color:White;">  کتاب و جزوه‌های آموزشی</a>
                      </li>
                    </ul>
                </div>
            </td>
            <td>
                <a href="https://telegram.me/GraphicMotion" target="_blank">
                    <img src="<%= Page.ResolveUrl("~/Content/img/mnu_telegram.png") %>" title="تلگرام" /></a>
                <%--<a href="#">
                                    <img src="<%= Page.ResolveUrl("~/Content/img/mnu_instagram.png") %>" /></a>
                            <a href="#">
                                <img src="<%= Page.ResolveUrl("~/Content/img/mnu_facebook.png") %>" />
                            </a>--%>
            </td>
        </tr>
    </table>
</div>
<div id="copyright">
    <a href="http://eghbaldar.ir" target="_blank" style="text-decoration: none; color: White;">
         تمامی حقوق مادی و معنوی این سایت متعلق به مرکز گسترش جلوه‌های تصویری می‌باشد./ فروردین 1395 </a>
</div>
