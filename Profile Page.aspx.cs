using System.Runtime.InteropServices;
using Internal;
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
    public partial class Profile_Page : System.Web.UI.Page
    {
        public string username;
        public string user_email;
        public string city;
        public string country;
        public string user_pic;
        public int followers;
        public int following;
        public string tempErr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["recipehub_user_id"] == null)
            {
                Response.Redirect("~/Sign in.aspx");
                Response.End();
            }


            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();

                /* Fetch user information */
                string sql = $"SELECT username, email, city, country, picture FROM user WHERE user_id = {int.Parse(Request.Cookies["recipehub_user_id"].Value)}";
                MySqlDataReader rdr_userInfo = Func.executeSQLReader(conn, sql, true);
                rdr_userInfo.Read();

                username = rdr_userInfo["username"].ToString();
                user_email = rdr_userInfo["email"].ToString();
                city = rdr_userInfo["city"].ToString();
                country = rdr_userInfo["country"].ToString();
                user_pic = rdr_userInfo["picture"].ToString();
                if(user_pic == "")
                    user_pic = "uploads/pictures/users/user.png";

                rdr_userInfo.Close();


                /* Fetch following information */
                // Count number of followers from follow_usr table
                sql = $"SELECT count(*) FROM follow_usr WHERE flw_user_id = {int.Parse(Request.Cookies["recipehub_user_id"].Value)}";
                MySqlCommand flwr_cmd = new MySqlCommand(sql, conn);
                followers = Convert.ToInt32(flwr_cmd.ExecuteScalar());

                // Count number of following from follow_usr table
                sql = $"SELECT count(*) FROM follow_usr WHERE flwr_user_id = {int.Parse(Request.Cookies["recipehub_user_id"].Value)}";
                MySqlCommand flw_cmd = new MySqlCommand(sql, conn);
                following = Convert.ToInt32(flw_cmd.ExecuteScalar());

                // Count number of following from follow_res table
                sql = $"SELECT count(*) FROM follow_res WHERE flwr_user_id = {int.Parse(Request.Cookies["recipehub_user_id"].Value)}";
                MySqlCommand flw_cmd2 = new MySqlCommand(sql, conn);
                following += Convert.ToInt32(flw_cmd2.ExecuteScalar());

                conn.Close();
            }
            catch (Exception ex)
            {
                tempErr = ex.Message;
            }
        }
    }
}
