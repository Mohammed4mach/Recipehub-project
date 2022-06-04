using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Recipehub
{
    public partial class Product : System.Web.UI.Page
    {
        // User Product owner Variables
        public int user_id;
        public string user_pic;
        public string username;

        // Product Variables
        public int prod_id;
        public string prod_pic;
        public string prod_name;
        public string prod_date;
        public double price;
        public string prod_descrip;
        public int recipes_num;
        public bool isLike;
        public bool isFavorite;
        public List<Dictionary<string, string>> prodComments;
        public int comments_num;

        // Logged user info
        public int logged_user_id;
        public string logged_user_pic;
        public string logged_username;

        // Debugging Variables
        public string err;

        MySqlConnection conn;


        // Some page functions
        bool IsLike(MySqlConnection conn)
        {
            string sql;
            int user_id;

            if (Request.Cookies["recipehub_user_id"] == null)
                return false;

            user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
            sql = $"SELECT user_id FROM likes WHERE user_id = {user_id} AND prod_id = {prod_id}";
            MySqlDataReader rdr = Func.executeSQLReader(conn, sql);
            rdr.Read();

            if (rdr.HasRows)
            {
                rdr.Close();
                return true;
            }
            else
            {
                rdr.Close();
                return false;
            }
        }

        bool IsFavorite(MySqlConnection conn)
        {
            string sql;
            int user_id;

            if (Request.Cookies["recipehub_user_id"] == null)
                return false;

            user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
            sql = $"SELECT user_id FROM favorite WHERE user_id = {user_id} AND prod_id = {prod_id}";
            MySqlDataReader rdr = Func.executeSQLReader(conn, sql);
            rdr.Read();

            if (rdr.HasRows)
            {
                rdr.Close();
                return true;
            }
            else
            {
                rdr.Close();
                return false;
            }
        }

        int CountRecipes(MySqlConnection conn)
        {
            string sql = $"SELECT COUNT(prod_id) FROM recipe WHERE prod_id = {prod_id}";
            MySqlCommand cmd = new MySqlCommand(sql, conn);

            return int.Parse(cmd.ExecuteScalar().ToString());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["prodid"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
               conn.Open();

               // Assigning Variables
               prod_id = int.Parse(Request.QueryString["prodid"]);

               // Retrieve product information
               string sql = $"SELECT user_id, name, description, picture, create_date, price, comments FROM product WHERE prod_id = {prod_id}";
               MySqlDataReader prodData = Func.executeSQLReader(conn, sql);
               prodData.Read();

               // Assigning product variables
               prod_pic = prodData["picture"].ToString();
               prod_name = prodData["name"].ToString();
               prod_date = prodData["create_date"].ToString();

               if (prodData["price"].ToString() != "")
                   price = Convert.ToDouble(prodData["price"].ToString());

               prod_descrip = prodData["description"].ToString();
               comments_num = int.Parse(prodData["comments"].ToString());

               // Assigning user variables
               user_id = int.Parse(prodData["user_id"].ToString());
               prodData.Close();

               // Fetch user info
               sql = $"SELECT username, picture FROM user WHERE user_id = {user_id}";
               MySqlDataReader userData = Func.executeSQLReader(conn, sql);
               userData.Read();

               username = userData["username"].ToString();
               user_pic = userData["picture"].ToString() != "" ?
                           userData["picture"].ToString() :
                           "./uploads/pictures/users/user.png";

               userData.Close();

               recipes_num = CountRecipes(conn);

               isLike = IsLike(conn);
               isFavorite = IsFavorite(conn);

               Page.Title = prod_name;

               // Check logged in to display comment form
               bool loggedIn = Request.Cookies["recipehub_user_id"] != null ? true : false;
               CommentFormPanel.Visible = loggedIn;

               // Fetch logged user info
               if (loggedIn)
               {
                   logged_user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
                   sql = $"SELECT username, picture FROM user WHERE user_id = {logged_user_id}";
                   MySqlDataReader loggedUserData = Func.executeSQLReader(conn, sql);
                   loggedUserData.Read();

                   logged_username = loggedUserData["username"].ToString();
                   logged_user_pic = loggedUserData["picture"].ToString() != "" ?
                           loggedUserData["picture"].ToString() :
                           "./uploads/pictures/users/user.png";

                   loggedUserData.Close();
               }


               prodComments = new List<Dictionary<string, string>>();

               // Retrieve product comments
               if (comments_num != 0)
               {
                   sql = $"SELECT comment.user_id, user.username, user.picture, comment.content, comment.create_date FROM comment "
                       + $"INNER JOIN user ON comment.user_id = user.user_id WHERE comment.prod_id = {prod_id} ORDER BY comment.create_date DESC;";
                   MySqlDataReader cmntsRdr = Func.executeSQLReader(conn, sql);
                   Dictionary<string, string> temp = new Dictionary<string, string>();

                   while (cmntsRdr.Read())
                   {
                       temp.Add("user_id", cmntsRdr["user_id"].ToString());
                       temp.Add("username", cmntsRdr["username"].ToString());
                       temp.Add("picture", cmntsRdr["picture"].ToString());
                       temp.Add("content", cmntsRdr["content"].ToString());
                       temp.Add("date", cmntsRdr["create_date"].ToString());

                       prodComments.Add(new Dictionary<string, string>(temp));
                       temp.Clear();
                   }
               }


               conn.Close();
            }
            catch (Exception ex)
            {
               err = ex.ToString();
            }
        }

        protected void Comment_Click(object sender, EventArgs e)
        {
            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub");

            try
            {
                conn.Open();

                string sql;
                MySqlDataReader rdr;
                long comm_id;

                do
                {
                    comm_id = Func.genId(100000, Int32.MaxValue);
                    sql = $"SELECT comm_id FROM comment WHERE comm_id = {comm_id}";
                    rdr = Func.executeSQLReader(conn, sql);
                } while (rdr.HasRows);
                rdr.Close();

                string comment = Func.sanInput(CommentContent.Text);
                sql = $"INSERT INTO comment (comm_id, user_id, prod_id, content) VALUES ({comm_id}, {logged_user_id}, {prod_id}, '{comment}');";
                Func.executeSQL(conn, sql, false);

                sql = $"UPDATE product SET comments = comments + 1 WHERE prod_id = {prod_id};";
                Func.executeSQL(conn, sql, false);

                CommentContent.Text = null;
                Response.Redirect($"~/Product.aspx?prodid={prod_id}");

                conn.Close();
            }
            catch (Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}
