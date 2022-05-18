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
    public partial class Recipe : System.Web.UI.Page
    {
        // Product Variables
        public int prod_id;
        public string prod_name;
        
        // Recipe Variables
        public int rec_id;
        public string rec_pic; 
        public int time;
        public double cost;
        public string ingredients;
        public string method;
        public string video;
        public string rec_date;

        // User data Variables
        public int user_id;
        public string username;
        public string user_pic;

        // Debugging Variables
        public string err;

        MySqlConnection conn;

        // Some page functions
        int getProductId()
        {
            int result;
            string sql = $"SELECT prod_id FROM recipe WHERE rec_id = {rec_id};";
            
            MySqlDataReader readId = Func.executeSQLReader(conn, sql);
            readId.Read();
            result = int.Parse(readId["prod_id"].ToString());
            
            readId.Close();

            return result;
        }

        string getProductName()
        {
            string result;
            string sql = $"SELECT name FROM product WHERE prod_id = {prod_id}";
            
            MySqlDataReader readName = Func.executeSQLReader(conn, sql);
            readName.Read();
            result = readName["name"].ToString();

            readName.Close();

            return result;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["recid"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();

                // Assigning variables
                rec_id = int.Parse(Request.QueryString["recid"]);
                prod_id = getProductId();
                prod_name = getProductName();

                // Retrieve recipe information
                string sql = $"SELECT user_id, picture, time, cost, ingredients, method, video, create_date FROM recipe WHERE rec_id = {rec_id}";
                MySqlDataReader readRecInfo = Func.executeSQLReader(conn, sql);
                readRecInfo.Read();

                // Assigning recipe variables
                rec_pic = readRecInfo["picture"].ToString() != "" ?
                            readRecInfo["picture"].ToString() :
                            "./assets/img/background.jpg";

                if(readRecInfo["time"].ToString() != "")
                    time = int.Parse(readRecInfo["time"].ToString());
                if(readRecInfo["cost"].ToString() != "")
                    cost = Convert.ToDouble(readRecInfo["cost"].ToString());

                ingredients = readRecInfo["ingredients"].ToString();
                method = readRecInfo["method"].ToString();
                video = readRecInfo["video"].ToString();
                rec_date = readRecInfo["create_date"].ToString();

                // Assigning user variables
                user_id = int.Parse(readRecInfo["user_id"].ToString());
                readRecInfo.Close();

                // Fetch user info
                sql = $"SELECT username, picture FROM user WHERE user_id = {user_id}";
                MySqlDataReader readUserInfo = Func.executeSQLReader(conn, sql);
                readUserInfo.Read();

                username = readUserInfo["username"].ToString();
                user_pic = readUserInfo["picture"].ToString() != "" ?
                            readUserInfo["picture"].ToString() :
                            "./uploads/pictures/users/user.png";

                Page.Title = prod_name + " Recipe";

                readUserInfo.Close();
                conn.Close();
            }
            catch(Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}
