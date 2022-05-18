using System;
using System.IO;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Recipehub
{
    public partial class Sign_up : System.Web.UI.Page
    {
        public string err;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Cookies["recipehub_user_id"] != null)
            {
                Response.Redirect("~/Profile Page.aspx");
                Response.End();
            }


            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=world;");
            try
            {
                conn.Open();

                // Insert List Items for country selection
                string sql = $"SELECT Name FROM country ORDER BY Name ASC;";
                MySqlDataReader countries = Func.executeSQLReader(conn, sql, true);;

                int i = 0;
                while(countries.Read())
                {
                    country.Items.Insert(i, new ListItem(countries[0].ToString(), countries[0].ToString()));
                    i++;
                }
                countries.Close();


                // Insert List Items for city selection
                sql = $"SELECT Name FROM city ORDER BY Name ASC;";
                MySqlDataReader cities = Func.executeSQLReader(conn, sql, true);

                i = 0;
                while(cities.Read())
                {
                    city.Items.Insert(i, new ListItem(cities[0].ToString(), cities[0].ToString()));
                    i++;
                }
                cities.Close();

                conn.Close();
            }
            catch (System.Exception ex)
            {
                err = ex.ToString();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            long user_id = Func.genId(100000, Int32.MaxValue);
            string user_username = username.Text;
            string user_email = email.Text;
            string user_password = Func.hashPassword(password.Text);
            string user_country = country.SelectedValue;
            string user_city = city.SelectedValue;
            char user_gender;

            if (male.Checked)
                user_gender = male.Text[male.Text.Length - 4];
            else
                user_gender = female.Text[female.Text.Length - 6];

            /* Start validation */
            // Open Connection
            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();
                // Check for identical id in the database
                string sql;
                MySqlDataReader readId;

                do // If same id exists, generate new one
                {
                    sql = $"SELECT user_id FROM user WHERE user_id = {user_id};";
                    readId = Func.executeSQLReader(conn, sql, true);
                    if(readId.HasRows)
                    {
                        user_id = Func.genId(100000, Int32.MaxValue);
                    }
                } while (readId.HasRows);
                readId.Close();

                // Check for identical email address in the database
                sql = $"SELECT email FROM user WHERE email = '{user_email}'";
                MySqlDataReader readEmail = Func.executeSQLReader(conn, sql, true);

                if(readEmail.HasRows) // If same email exists, display the error
                {
                    readEmail.Close();
                    conn.Close();
                    err = "Email address is already registered __ " + password.Text;
                }
                else
                {
                    readEmail.Close();
                /* End validation */

                    /* Add user to the database */
                    string create_date = DateTime.Now.ToString("MM-dd-yyyy HH:mm:ss");
                    int user_age = 25;
                    
                    // Upload the picture and execute
                    string user_picture = null;
                    if(user_img.HasFile)
                    {
                        string extension = System.IO.Path.GetExtension(user_img.PostedFile.FileName);
                        user_picture = Server.MapPath("~/uploads/pictures/users/") + user_id.ToString() + extension;
                        user_img.SaveAs(user_picture);
                        // File.WriteAllBytes(Server.MapPath("~/") + user_img.PostedFile.FileName, user_img.FileBytes);
                        user_picture = "./uploads/pictures/users/" + user_id.ToString() + extension;
                        sql = $"INSERT INTO user(user_id, email, username, password, birth_date, create_date, gender, country, city, picture, age) VALUES ({user_id}, '{user_email}', '{user_username}', '{user_password}', STR_TO_DATE('{create_date}', '%m-%d-%Y %H:%i:%s'), STR_TO_DATE('{create_date}', '%m-%d-%Y %H:%i:%s'), '{user_gender}', '{user_country}', '{user_city}', '{user_picture}', {user_age})";
                    }
                    else
                        sql = $"INSERT INTO user(user_id, email, username, password, birth_date, create_date, gender, country, city, picture, age) VALUES ({user_id}, '{user_email}', '{user_username}', '{user_password}', STR_TO_DATE('{create_date}', '%m-%d-%Y %H:%i:%s'), STR_TO_DATE('{create_date}', '%m-%d-%Y %H:%i:%s'), '{user_gender}', '{user_country}', '{user_city}', NULL, {user_age})";

                    Func.executeSQL(conn, sql, false);

                    // Set cookie as user id for 30 days to identify the user
                    Response.SetCookie(Func.cookieSet("recipehub_user_id", user_id.ToString(), 24 * 14));
                    Response.Redirect("~/Profile Page.aspx");

                    conn.Close();
                    Response.End();
                }
            }
            catch (System.Exception ex)
            {
                err = err + ex.Message;
            }
        }
    }
}
