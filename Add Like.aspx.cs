using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;


namespace Recipehub
{

    public partial class Add_Like : System.Web.UI.Page
    {
        public string err;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["prodid"] == null || Request.QueryString["prodid"] == "")
            {
                Response.Redirect("~/Default.aspx");
                Response.End();
            }
            if(Request.Cookies["recipehub_user_id"] == null)
            {
                Response.Redirect("~/Sign in.aspx");
                Response.End();
            }

            int user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
            int prod_id = int.Parse(Request.QueryString["prodid"]);
            

            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();

                string sql = $"INSERT INTO likes VALUES ({user_id}, {prod_id}); " +
                            $"UPDATE product SET likes = likes + 1 WHERE prod_id = {prod_id}";

                Func.executeSQL(conn, sql, false);


                conn.Close();
                Response.Redirect($"~/Product.aspx?prodid={prod_id}");
                Response.End();
            }
            catch(Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}