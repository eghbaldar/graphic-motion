using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;
using System.Xml;
using System.Text;
using System.Data.SqlClient;

public partial class sitemap : System.Web.UI.Page
{
    public string changefreq = "hourly";
    public string priority = "0.9";
    protected void Page_Load(object sender, EventArgs e)
    {
        using (XmlWriter writer = XmlWriter.Create(Server.MapPath("~/sitemap.xml")))
        {
            //برای لینک های ثابت که تو سایتتمون هست
            writer.WriteStartDocument();
            writer.WriteStartElement("urlset", "http://www.sitemaps.org/schemas/sitemap/0.9");
            string[] Home = new string[] { "http://www.graphic-motion.ir/تمامی-آموزش-های-تصویری", "http://www.graphic-motion.ir/تمامی-بسته-های-آموزشی", "http://www.graphic-motion.ir/0/فوتیج،-مدل-و-بافت های-آماده/دانلود", "http://www.graphic-motion.ir/1/افکت-های-صوتی/دانلود", "http://www.graphic-motion.ir/2/کتاب-و-جزوه-های-آموزشی/دانلود", "http://www.graphic-motion.ir/3/پروژه-های-آماده/دانلود", "http://www.graphic-motion.ir/4/بانک-پلاگین/دانلود", "http://www.graphic-motion.ir/0/جلوه-های-ویژه-و-کامپوزیت/فروشگاه", "http://www.graphic-motion.ir/2/صداگذاری-و-اصلاح-صدا/فروشگاه", "http://www.graphic-motion.ir/3/مدل-سازی-سه-بعدی/فروشگاه", "http://www.graphic-motion.ir/4/طراحی-دو-بعدی/فروشگاه", "http://www.graphic-motion.ir/1/میکس-،-مونتاژ-و-اصلاح-رنگ/فروشگاه", "http://www.graphic-motion.ir/5/مجموعه-پلاگین/فروشگاه", "http://www.graphic-motion.ir/6/نرم-افزارها/فروشگاه", "http://www.graphic-motion.ir/0/جلوه-های-ویژه-و-کامپوزیت/آموزش", "http://www.graphic-motion.ir/1/میکس-،-مونتاژ-و-اصلاح-رنگ/آموزش", "http://www.graphic-motion.ir/2/صداگذاری-و-اصلاح-صدا/آموزش", "http://www.graphic-motion.ir/3/مدل-سازی-سه-بعدی/آموزش", "http://www.graphic-motion.ir/4/طراحی-دو-بعدی/آموزش", "http://www.graphic-motion.ir/درخواست-آموزش-تصویری", "http://www.graphic-motion.ir/ارتباط-با-ما" };
            for (int i = 0; i <= Home.Length-1; i++)
            {
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", Home[i]);
                writer.WriteElementString("changefreq", changefreq);
                writer.WriteElementString("priority", priority);
                writer.WriteEndElement();
            }
            //برای لینک هایی که ار دیتا بیس استخراج میشه . مثل اخبار و . . . 
            SqlConnection cnn = new SqlConnection("Data Source=185.94.97.180,9992;Initial Catalog=GraphicMotion;User ID=GraphicAdmin;Password=dbgm2016_;");
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            ///////////////////////// برای قسمت آموزش های تصویری
            cmd.CommandText = "Select * From tbl_Learning_and_Films where category=0";
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();
            DataSet ds2 = new DataSet();
            dap.Fill(ds, "ds");
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string Loc = "http://www.graphic-motion.ir/post/" + dr["id"].ToString() + "/" + dr["title"].ToString().Replace(" ", "-") + ".html";
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", Loc);
                writer.WriteElementString("changefreq", changefreq);
                writer.WriteElementString("priority", priority);
                writer.WriteEndElement();
            }
            //////////////////////// برای قسمت فروشگاه
            cmd.CommandText = "Select * From tbl_Learning_and_Films where category=1";
            cmd.CommandType = CommandType.Text;
            dap = new SqlDataAdapter(cmd);
            dap.Fill(ds1, "ds1");
            foreach (DataRow dr in ds1.Tables[0].Rows)
            {
                string Loc = "http://www.graphic-motion.ir/store/" + dr["id"].ToString() + "/" + dr["title"].ToString().Replace(" ", "-") + ".html";
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", Loc);
                writer.WriteElementString("changefreq", changefreq);
                writer.WriteElementString("priority", priority);
                writer.WriteEndElement();
            }
            //////////////////////// برای قسمت دانلود
            cmd.CommandText = "Select * From tbl_Learning_and_Films where category=2";
            cmd.CommandType = CommandType.Text;
            dap = new SqlDataAdapter(cmd);
            dap.Fill(ds2, "ds2");
            foreach (DataRow dr in ds2.Tables[0].Rows)
            {
                string Loc = "http://www.graphic-motion.ir/download/" + dr["id"].ToString() + "/" + dr["title"].ToString().Replace(" ", "-") + ".html";
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", Loc);
                writer.WriteElementString("changefreq", changefreq);
                writer.WriteElementString("priority", priority);
                writer.WriteEndElement();
            }
            //پایان شی XML
            writer.WriteEndDocument();
            writer.Flush();
        }

        Response.End();
    }
}