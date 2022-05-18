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
    public partial class unfollow : System.Web.UI.Page
    {
        public string err;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["recipehub_user_id"] == null)
            {
                Response.Redirect("~/Sign in.aspx");
                Response.End();
            }


            int flwr_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
            int flw_id = int.Parse(Request.QueryString["usrid"]);

            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");
            
            try
            {
                conn.Open();

                // Deleting specified record
                string sql = $"DELETE FROM follow_usr WHERE flwr_user_id = {flwr_id} AND flw_user_id = {flw_id};";
                Func.executeSQL(conn, sql, false);
                
                /* Decrementing following and followers fields */
                sql = $"UPDATE user SET following = following - 1 WHERE user_id = {flwr_id}; UPDATE user SET followers = followers - 1 WHERE user_id = {flw_id};";
                Func.executeSQL(conn, sql, false);

                conn.Close();
            }
            catch(Exception ex)
            {
                err = ex.Message;
            }

            Response.Redirect("~/Profile Page.aspx?usrid=" + flw_id);
        }
    }
}