using System.Runtime.InteropServices;
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
        public int user_id;
        public string username;
        public string user_email;
        public string city;
        public string country;
        public string user_pic;
        public int followers;
        public int following;
        public bool isOwner;
        public bool isFollow;

        public List<Dictionary<string, string>> UserPosts;
        public List<Dictionary<string, string>> FavPosts;
        public List<Dictionary<string, string>> FollowersData;
        public List<Dictionary<string, string>> FollowingData;

        public string tempErr;

        /* Some page functions */
        int CountFollowing(MySqlConnection conn)
        {
            int counter;
            string sql;

            // Count number of following from follow_usr table
            sql = $"SELECT count(*) FROM follow_usr WHERE flwr_user_id = {user_id}";
            MySqlCommand flw_cmd = new MySqlCommand(sql, conn);
            counter = Convert.ToInt32(flw_cmd.ExecuteScalar());

            // Count number of following from follow_res table
            sql = $"SELECT count(*) FROM follow_res WHERE flwr_user_id = {user_id}";
            MySqlCommand flw_cmd2 = new MySqlCommand(sql, conn);
            counter += Convert.ToInt32(flw_cmd2.ExecuteScalar());

            return counter;
        }

        int CountFollowers(MySqlConnection conn)
        {
            int counter;
            string sql;

            // Count number of followers from follow_usr table
            sql = $"SELECT count(*) FROM follow_usr WHERE flw_user_id = {user_id}";
            MySqlCommand flwr_cmd = new MySqlCommand(sql, conn);
            counter = Convert.ToInt32(flwr_cmd.ExecuteScalar());

            return counter;
        }

        bool CheckOwner()
        {
            if(Request.Cookies["recipehub_user_id"] == null)
                return false;

            if(Request.QueryString["usrid"] == null)
                return true;
            else
            {
                if(Request.QueryString["usrid"] == Request.Cookies["recipehub_user_id"].Value)
                    return true;
                else
                    return false;
            }
        }

        bool IsFollow(MySqlConnection conn)
        {
            if(Request.Cookies["recipehub_user_id"] == null)
                return false;

            int flwr_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
            int flw_id = user_id;

            string sql = $"SELECT * FROM follow_usr WHERE flwr_user_id = {flwr_id} AND flw_user_id = {flw_id}";

            MySqlDataReader read = Func.executeSQLReader(conn, sql);
            read.Read();
            
            if(read.HasRows)
            {
                read.Close();
                return true;
            }
            else
            {
                read.Close();
                return false;
            }
        }

        List<Dictionary<string, string>> GetUserPosts(MySqlConnection conn)
        {
            string sql = $"SELECT prod_id, name, picture, price, description, create_date FROM product WHERE user_id = {user_id} " +
                         $"ORDER BY create_date DESC;";

            MySqlDataReader read = Func.executeSQLReader(conn, sql);
            MySqlConnection alternConn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub");

            alternConn.Open();            

            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            int logged_user_id = Request.Cookies["recipehub_user_id"] != null ?
                                    int.Parse(Request.Cookies["recipehub_user_id"].Value) :
                                    0; 

            while (read.Read())
            {


                sql = $"SELECT COUNT(*) FROM favorite WHERE user_id = {logged_user_id} AND prod_id = {read["prod_id"]}";
                MySqlCommand cmdFav = new MySqlCommand(sql, alternConn);
                string isFavorite = cmdFav.ExecuteScalar().ToString();
                
                sql = $"SELECT COUNT(*) FROM likes WHERE user_id = {logged_user_id} AND prod_id = {read["prod_id"]}";
                MySqlCommand cmdLike = new MySqlCommand(sql, alternConn);
                string isLike = cmdLike.ExecuteScalar().ToString();

                sql = $"SELECT COUNT(*) FROM recipe WHERE prod_id = {read["prod_id"]}";
                MySqlCommand cmdRec = new MySqlCommand(sql, alternConn);
                string recipesNum = cmdRec.ExecuteScalar().ToString();


                Dictionary<string, string> temp = new Dictionary<string, string>();

                temp.Add("prod_id", read["prod_id"].ToString());
                temp.Add("name", read["name"].ToString());
                temp.Add("picture", read["picture"].ToString());
                temp.Add("price", read["price"].ToString());
                temp.Add("description", read["description"].ToString());
                temp.Add("create_date", read["create_date"].ToString());
                temp.Add("isFavorite", isFavorite);
                temp.Add("isLike", isLike);
                temp.Add("recipes_num", recipesNum);

                res.Add(temp);
            }

            read.Close();
            alternConn.Close();

            return res;
        }

        List<Dictionary<string, string>> GetFavPosts(MySqlConnection conn)
        {
            string sql = $"SELECT product.user_id, user.username, user.picture AS usr_pic, " +
    		             $"product.prod_id, product.name AS prod_name, product.picture AS prod_pic, " +
                         $"product.price, product.description, product.create_date FROM favorite " +
		                 $"INNER JOIN product ON product.prod_id = favorite.prod_id " +
                         $"INNER JOIN user ON product.user_id = user.user_id " +
		                 $"WHERE favorite.user_id = {user_id} ORDER BY product.create_date DESC;";

            MySqlDataReader read = Func.executeSQLReader(conn, sql);
            MySqlConnection alternConn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub");

            alternConn.Open();

            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            int logged_user_id = Request.Cookies["recipehub_user_id"] != null ?
                                    int.Parse(Request.Cookies["recipehub_user_id"].Value) :
                                    0; 

            while (read.Read())
            {
                // Is favorite
                sql = $"SELECT COUNT(*) FROM favorite WHERE user_id = {logged_user_id} AND prod_id = {read["prod_id"]}";
                MySqlCommand cmdFav = new MySqlCommand(sql, alternConn);
                string isFavorite = cmdFav.ExecuteScalar().ToString();

                // Is Like
                sql = $"SELECT COUNT(*) FROM likes WHERE user_id = {logged_user_id} AND prod_id = {read["prod_id"]}";
                MySqlCommand cmdLike = new MySqlCommand(sql, alternConn);
                string isLike = cmdLike.ExecuteScalar().ToString();

                sql = $"SELECT COUNT(*) FROM recipe WHERE prod_id = {read["prod_id"]}";
                MySqlCommand cmdRec = new MySqlCommand(sql, alternConn);
                string recipesNum = cmdRec.ExecuteScalar().ToString();


                Dictionary<string, string> temp = new Dictionary<string, string>();

                temp.Add("user_id", read["user_id"].ToString());
                temp.Add("username", read["username"].ToString());
                temp.Add("usr_pic", read["usr_pic"].ToString());

                temp.Add("prod_id", read["prod_id"].ToString());
                temp.Add("prod_name", read["prod_name"].ToString());
                temp.Add("prod_pic", read["prod_pic"].ToString());
                temp.Add("price", read["price"].ToString());
                temp.Add("description", read["description"].ToString());
                temp.Add("create_date", read["create_date"].ToString());
                temp.Add("isFavorite", isFavorite);
                temp.Add("isLike", isLike);
                temp.Add("recipes_num", recipesNum);

                res.Add(temp);
            }

            read.Close();
            alternConn.Close();

            return res;
        }

        List<Dictionary<string, string>> GetFollowersData(MySqlConnection conn)
        {
            string sql = "SELECT follow_usr.flwr_user_id, user.username, user.picture FROM follow_usr " +
                         "INNER JOIN user ON follow_usr.flwr_user_id = user.user_id " +
                        $"WHERE flw_user_id = {user_id};";

            MySqlDataReader usrData = Func.executeSQLReader(conn, sql);
            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            while(usrData.Read())
            {
                Dictionary<string, string> temp = new Dictionary<string, string>();

                temp.Add("user_id", usrData["flwr_user_id"].ToString());
                temp.Add("username", usrData["username"].ToString());
                temp.Add("usr_pic", usrData["picture"].ToString());

                res.Add(temp);
            }

            usrData.Close();

            return res;
        }

        List<Dictionary<string, string>> GetFollowingData(MySqlConnection conn)
        {
            string sql = "SELECT follow_usr.flw_user_id, user.username, user.picture FROM follow_usr " +
                         "INNER JOIN user ON follow_usr.flw_user_id = user.user_id " +
                        $"WHERE flwr_user_id = {user_id};";

            MySqlDataReader usrData = Func.executeSQLReader(conn, sql);
            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            while(usrData.Read())
            {
                Dictionary<string, string> temp = new Dictionary<string, string>();

                temp.Add("user_id", usrData["flw_user_id"].ToString());
                temp.Add("username", usrData["username"].ToString());
                temp.Add("usr_pic", usrData["picture"].ToString());

                res.Add(temp);
            }

            usrData.Close();

            return res;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            isOwner = CheckOwner();
            // If isOwner = true, user_id will be that restored in the cookies
            
            if(isOwner)
            {
                if(Request.Cookies["recipehub_user_id"] == null)
                    user_id = 0;
                else
                    Int32.TryParse(Request.Cookies["recipehub_user_id"].Value, out user_id);
            /*
                Important Note:
                    Error may occurs due to this part of code. If occurred, check cookies.
                    Loging out and sign in again may solve this problem
            */
            }
            else
            {
                user_id = Request.QueryString["usrid"] != null? 
                            int.Parse(Request.QueryString["usrid"]) :
                            0;
            }


            if(user_id == 0)
            {
                Response.Redirect("~/Sign in.aspx");
                Response.End();
            }


            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();

                /* Fetch user information */
                string sql = $"SELECT username, email, city, country, picture FROM user WHERE user_id = {user_id}";
                MySqlDataReader rdr_userInfo = Func.executeSQLReader(conn, sql);
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
                following = CountFollowing(conn);
                followers = CountFollowers(conn);
                isFollow = IsFollow(conn);
                
                Page.Title = username;

                FollowersData = new List<Dictionary<string, string>>(GetFollowersData(conn));
                FollowingData = new List<Dictionary<string, string>>(GetFollowingData(conn));
                UserPosts = new List<Dictionary<string, string>>(GetUserPosts(conn));
                FavPosts = new List<Dictionary<string, string>>(GetFavPosts(conn));


                conn.Close();
            }
            catch (Exception ex)
            {
                tempErr = ex.ToString();
            }
        }
    }
}
