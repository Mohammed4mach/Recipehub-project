using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using Newtonsoft.Json.Serialization;

namespace Recipehub
{
    public partial class Sign_in : System.Web.UI.Page
    {
        public string err;
        protected void Page_Load(object sender, EventArgs e)
        {
            errorLabel.Text = err;

            if (Request.Cookies["recipehub_user_id"] != null)
            {
                Response.Redirect("~/profile.aspx");
                Response.End();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string user_email = email.Text;
            string user_password = password.Text;//Func.hashPassword(password.Text);

            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");
            try
            {
                conn.Open();

                string sql = $"SELECT user_id, password FROM user WHERE email = '{user_email}'";
                MySqlDataReader read = Func.executeSQLReader(conn, sql, true);
                conn.Close();
                if (read.HasRows)
                {
                    read.Read();
                    if (read["password"].ToString() == user_password)
                    {
                        // Set cookie as user id for 30 days to identify the user
                        Response.SetCookie(Func.cookieSet("recipehub_user_id", read["user_id"].ToString(), 24 * 14));
                        Response.Redirect("~/Profile.aspx");
                        Response.End();
                    }
                    else
                        err = $"Either email or password is wrong1";
                }
                else
                    err = $"Either email or password is wrong2";

                read.Close();
            }
            catch (Exception ex)
            {
                err = ex.ToString();
            }

            email.Text = null;
            password.Text = null;
        }

    }
}
