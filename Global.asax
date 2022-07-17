<%@ Application Language="VB" %>
 <%@ Import Namespace="System.Web.Routing" %>
 <%@ Import Namespace="System.Exception" %>
<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        RegisterRoutes(RouteTable.Routes)
    End Sub
    
    Sub RegisterRoutes(ByVal routes As RouteCollection)

        routes.MapPageRoute("request", "درخواست-آموزش-تصویری", "~/request_learning.aspx")
        routes.MapPageRoute("contact", "تماس-با-ما", "~/contact.aspx")
        routes.MapPageRoute("regualtion", "قوانین-و-مقررات", "~/regualtion.aspx")
        routes.MapPageRoute("cardbox", "سبد-خرید", "~/cardbox.aspx")
        routes.MapPageRoute("error", "خطای-سرور", "~/error.aspx")
        routes.MapPageRoute("aboutUS", "درباره-مرکز-گسترش-جلوه-های-تصویری", "~/about.aspx")
        routes.MapPageRoute("checkout", "مشخصات-سفارش-دهنده", "~/checkout.aspx")
        routes.MapPageRoute("search", "search/{title}", "~/search.aspx")
        routes.MapPageRoute("checkout_final", "اتمام-خرید", "~/checkout_final.aspx")
        routes.MapPageRoute("newsletter", "خبرنامه", "~/newsletter.aspx")

        routes.MapPageRoute("tags", "tags/{titleTags}", "~/tags.aspx")
        routes.MapPageRoute("tags_Empty", "tags/", "~/tags.aspx")
        
        'routes.MapPageRoute("sitemap", "sitemap.sitemap", "~/search.aspx")
                
        routes.MapPageRoute("ALL_Learning", "تمامی-آموزش-های-تصویری", "~/All_Learning.aspx")
        routes.MapPageRoute("Select_Learning", "{type}/{catName}/آموزش", "~/Select_Learning.aspx")
        routes.MapPageRoute("LearnPost", "post/{id}/{title}.html", "~/Post.aspx")
        
        routes.MapPageRoute("ALL_Store", "تمامی-بسته-های-آموزشی", "~/All_Store.aspx")
        routes.MapPageRoute("Select_Store", "{type}/{catName}/فروشگاه", "~/Select_store.aspx")
        routes.MapPageRoute("StorePost", "store/{id}/{title}", "~/store.aspx")
        
        routes.MapPageRoute("Select_Download", "{type}/{catName}/دانلود", "~/Select_Download.aspx")
        routes.MapPageRoute("download", "download/{id}/{title}", "~/download.aspx")
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/خطای-سرور")
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
    End Sub
       
</script>