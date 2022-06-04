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

    public partial class Product_Recipes : System.Web.UI.Page
    {
        public int prod_id;
        public string prod_name;
        public string err;

        public List<Dictionary<string, string>> RecipesData;

        List<Dictionary<string, string>> GetRecipesData(MySqlConnection conn)
        {
            string sql = "SELECT recipe.rec_id, recipe.user_id, " +
                            "recipe.time, recipe.cost, recipe.video, " +
                            "recipe.picture AS rec_pic, recipe.create_date, " +
                            "user.username, user.picture AS usr_pic FROM recipe " +
                        "INNER JOIN user ON recipe.user_id = user.user_id " +
                        $"WHERE recipe.prod_id = {prod_id} ORDER BY recipe.create_date DESC;";

            MySqlDataReader recData = Func.executeSQLReader(conn, sql);
            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            while(recData.Read())
            {
                Dictionary<string, string> temp = new Dictionary<string, string>();

                temp.Add("rec_id", recData["rec_id"].ToString());
                temp.Add("user_id", recData["user_id"].ToString());
                temp.Add("time", recData["time"].ToString());
                temp.Add("cost", recData["cost"].ToString());
                temp.Add("video", recData["video"].ToString());
                temp.Add("ric_pic", recData["rec_pic"].ToString());
                temp.Add("create_date", recData["create_date"].ToString());
                temp.Add("username", recData["username"].ToString());
                temp.Add("usr_pic", recData["usr_pic"].ToString());

                res.Add(temp);
            }

            recData.Close();

            return res;
        }

        MySqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["prodid"] == null)
            {
                Response.Redirect($"~/Default.aspx");
                Response.End();
            }


            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");
            
            try
            {
                conn.Open();

                prod_id = int.Parse(Request.QueryString["prodid"]);
                string sql = $"SELECT name FROM product WHERE prod_id = {prod_id};";
                MySqlDataReader rdr = Func.executeSQLReader(conn, sql);

                rdr.Read();
                prod_name = rdr["name"].ToString();

                rdr.Close();

                RecipesData = new List<Dictionary<string, string>>(GetRecipesData(conn));

                Page.Title = prod_name + " Recipes";

                conn.Close();
            }
            catch (Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}