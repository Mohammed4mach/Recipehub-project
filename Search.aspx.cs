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
    public partial class Search : System.Web.UI.Page
    {
        public string toSearch;

        public string err;

        public MySqlConnection conn;

        public MySqlDataReader read;
        public List<Dictionary<string, string>> ProdData;
        public List<Dictionary<string, string>> UsersData;


        List<Dictionary<string, string>> GetProdData(MySqlConnection conn)
        {
            string sql = "SELECT user.user_id, user.username, user.picture AS usr_pic, " +
                            "product.prod_id, product.name AS prod_name, product.picture AS prod_pic, " +
                            "product.create_date, product.price FROM product " +
                            $"INNER JOIN user ON product.user_id = user.user_id WHERE product.name LIKE '%{toSearch}%'";

            MySqlDataReader prodRead = Func.executeSQLReader(conn, sql);
            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            while(prodRead.Read())
            {
                Dictionary<string, string> temp = new Dictionary<string, string>();
                
                temp.Add("user_id", prodRead["user_id"].ToString());
                temp.Add("username", prodRead["username"].ToString());
                temp.Add("usr_pic", prodRead["usr_pic"].ToString());
                temp.Add("prod_id", prodRead["prod_id"].ToString());
                temp.Add("prod_name", prodRead["prod_name"].ToString());
                temp.Add("prod_pic", prodRead["prod_pic"].ToString());
                temp.Add("create_date", prodRead["create_date"].ToString());
                temp.Add("price", prodRead["price"].ToString());

                res.Add(temp);
            }

            prodRead.Close();

            return res;
        }

        // List<Dictionary<string, string>> GetUsersData(MySqlConnection conn)
        // {
        //     string sql = $"SELECT user_id, username, picture FROM user WHERE username LIKE '%{toSearch}%'";

        //     MySqlDataReader usrRead = Func.executeSQLReader(conn, sql);
            
        //     List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

        //     while(usrRead.Read())
        //     {
        //         Dictionary<string, string> temp = new Dictionary<string, string>();

        //         temp.Add("user_id", usrRead["user_id"].ToString());
        //         temp.Add("username", usrRead["username"].ToString());
        //         temp.Add("usr_pic", usrRead["picture"].ToString());
        //     }

        //     usrRead.Close();

        //     return res;
        // }

        protected void Page_Load(object sender, EventArgs e)
        {

            if(Request.QueryString["srch"] == null || Request.QueryString["srch"] == "")
            {
                Response.Redirect("~/Search.aspx?srch=a");
                Response.End();
            }

            toSearch = Request.QueryString["srch"];
            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub");

            try
            {
                conn.Open();

                string sql = $"SELECT user_id, username, picture FROM user WHERE username LIKE '%{toSearch}%'";


                ProdData = new List<Dictionary<string, string>>(GetProdData(conn));
                // UsersData = new List<Dictionary<string, string>>(GetUsersData(conn));
                read = Func.executeSQLReader(conn, sql);

                Page.Title = $"'{toSearch}' Results";
            }
            catch(Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}
