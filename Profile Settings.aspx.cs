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


    public partial class Profile_Settings : System.Web.UI.Page
    {
        public int user_id;
        public string username;
        public string user_pic;
        public string err;

        MySqlConnection conn;
        string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["recipehub_user_id"] == null)
            {
                Response.Redirect("~/Profile Page.aspx");
            }

            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();

                user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
                string sql = $"SELECT username, picture FROM user WHERE user_id = {user_id};";

                MySqlDataReader userData = Func.executeSQLReader(conn, sql);
                userData.Read();

                username = userData["username"].ToString();
                user_pic = userData["picture"].ToString() != "" ?
                           userData["picture"].ToString() :
                           "./uploads/pictures/users/user.png";
            
                Page.Title = username + " Settings";

                userData.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                err = ex.ToString();
            }

        }

        protected void SaveImg_Click(object sender, EventArgs e)
        {
            string user_picture;

            if (user_img.HasFile)
            {
                conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

                try
                {
                    conn.Open();

                    string extension = System.IO.Path.GetExtension(user_img.PostedFile.FileName);
                    user_picture = Server.MapPath("~/uploads/pictures/users/") + user_id.ToString() + extension;
                    user_img.SaveAs(user_picture);
                    // File.WriteAllBytes(Server.MapPath("~/") + user_img.PostedFile.FileName, user_img.FileBytes);
                    user_picture = "./uploads/pictures/users/" + user_id.ToString() + extension;

                    sql = $"UPDATE user SET picture = '{user_picture}' WHERE user_id = {user_id};";
                    Func.executeSQL(conn, sql);

                    conn.Close();
                }
                catch (Exception ex)
                {
                    err = ex.ToString();
                }
            }

            Response.Redirect("~/Profile Settings.aspx");
            Response.End();
        }

        protected void DeleteImg_Click(object sender, EventArgs e)
        {
            sql = $"UPDATE user SET picture = NULL WHERE user_id = {user_id}";
            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");
            try
            {
                conn.Open();

                Func.executeSQL(conn, sql);

                conn.Close();
            }
            catch (Exception ex)
            {
                err = ex.ToString();
            }

            Response.Redirect("~/Profile Settings.aspx");
            Response.End();
        }

        protected void SaveName_Click(object sender, EventArgs e)
        {
            if (Username.Text != null)
            {
                string chng_name = Func.sanInput(Username.Text);

                conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

                try
                {
                    conn.Open();

                    sql = $"UPDATE user SET username = '{chng_name}' WHERE user_id = {user_id};";

                    Func.executeSQL(conn, sql);

                    conn.Close();
                }
                catch (Exception ex)
                {
                    err = ex.ToString();
                }
            }

            Response.Redirect("~/Profile Settings.aspx");
            Response.End();
        }

        protected void SavePass_Click(object sender, EventArgs e)
        {
            if (password.Text != null)
            {
                string chng_pass = Func.hashPassword(password.Text);

                conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

                try
                {
                    conn.Open();

                    sql = $"UPDATE user SET password = '{chng_pass}' WHERE user_id = {user_id};";
                    Func.executeSQL(conn, sql);


                    conn.Close();
                }
                catch (Exception ex)
                {
                    err = ex.ToString();
                }

            }

            Response.Redirect("~/Profile Settings.aspx");
            Response.End();
        }
    }
}
