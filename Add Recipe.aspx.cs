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
    public partial class Add_Recipe : System.Web.UI.Page
    {
        public string err;
        public string prod_name;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["recipehub_user_id"] == null || Request.QueryString["prodid"] == null)
            {
                Response.Redirect("~/Sign in.aspx");
                Response.End();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            long rec_id = Func.genId(100000, Int32.MaxValue);
            int prod_id = int.Parse(Request.QueryString["prodid"]);
            int user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
            string video = Func.sanInput(RecVideo.Text);
            string ingred = Func.sanInput(RecIngred.Text);
            string method = Func.sanInput(RecMethod.Text);
            string rec_photo = null;

            // Open Connection
            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();

                string sql;
                // Fetch product name
                sql = $"SELECT name FROM product WHERE prod_id = {prod_id};";
                MySqlDataReader readProdName = Func.executeSQLReader(conn, sql);
                readProdName.Read();
                prod_name = readProdName["name"].ToString();
                readProdName.Close();

                // Check for identical id in the database
                MySqlDataReader readId;

                do // If same id exists, generate new one
                {
                    sql = $"SELECT rec_id FROM recipe WHERE rec_id = {rec_id};";
                    readId = Func.executeSQLReader(conn, sql);
                    if(readId.HasRows)
                    {
                        rec_id = Func.genId(100000, Int32.MaxValue);
                    }
                } while (readId.HasRows);
                readId.Close();

                if(ImgUpload.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(ImgUpload.PostedFile.FileName);
                    rec_photo = Server.MapPath("~/uploads/pictures/products/") + rec_id.ToString() + extension;
                    ImgUpload.SaveAs(rec_photo);
                    rec_photo = $"./uploads/pictures/products/{rec_id.ToString()}{extension}";
                    // Inserting data to recipe table
                    sql = $"INSERT INTO recipe (rec_id, prod_id, user_id, picture, ingredients, method, video, time, cost) VALUES ({rec_id}, {prod_id}, {user_id}, '{rec_photo}', '{ingred}', '{method}', '{video}', ";
                }
                else
                    sql = $"INSERT INTO recipe (rec_id, prod_id, user_id, picture, ingredients, method, video, time, cost) VALUES ({rec_id}, {prod_id}, {user_id}, NULL, '{ingred}', '{method}', '{video}', ";

                if(RecTime.Text != "")
                    sql += $"{int.Parse(RecTime.Text)}, ";
                else
                    sql += "NULL, ";

                if(RecCost.Text != "")
                    sql += $"{Convert.ToDouble(RecCost.Text)});";
                else
                    sql += "NULL);";

                Func.executeSQL(conn, sql, false);

                Response.Redirect($"~/Recipe.aspx?recid={rec_id}");
                Response.End();

                conn.Close();
            }
            catch(Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}
