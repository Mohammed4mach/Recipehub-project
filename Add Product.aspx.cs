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
    public partial class Add_Product : System.Web.UI.Page
    {
        public string err;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["recipehub_user_id"] == null)
            {
                Response.Redirect("~/Sign in.aspx");
                Response.End();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            long prod_id = Func.genId(100000, Int32.MaxValue);
            int user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
            string prod_name = Func.sanInput(ProdName.Text);
            string description = Func.sanInput(ProdDescrip.Text);
            string prod_photo = null;
            string create_date = DateTime.Now.ToString("MM-dd-yyyy HH:mm:ss");
            double price = 0;

            if(ProdPrice.Text != "")
                price = Convert.ToDouble(ProdPrice.Text);

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
                    sql = $"SELECT prod_id FROM product WHERE prod_id = {prod_id};";
                    readId = Func.executeSQLReader(conn, sql);
                    if(readId.HasRows)
                    {
                        prod_id = Func.genId(100000, Int32.MaxValue);
                    }
                } while (readId.HasRows);
                readId.Close();

                if(ImgUpload.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(ImgUpload.PostedFile.FileName);
                    prod_photo = Server.MapPath("~/uploads/pictures/products/") + prod_id.ToString() + extension;
                    ImgUpload.SaveAs(prod_photo);
                    prod_photo = $"./uploads/pictures/products/{prod_id.ToString()}{extension}";
                    // Inserting data to product table
                    sql = $"INSERT INTO product (prod_id, user_id, res_id, cat_id, name, description, picture, create_date, price) VALUES ({prod_id}, {user_id}, NULL, NULL, '{prod_name}', '{description}', '{prod_photo}', STR_TO_DATE('{create_date}', '%m-%d-%Y %H:%i:%s'), ";
                }
                else
                    sql = $"INSERT INTO product (prod_id, user_id, res_id, cat_id, name, description, picture, create_date, price) VALUES ({prod_id}, {user_id}, NULL, NULL, '{prod_name}', '{description}', NULL, STR_TO_DATE('{create_date}', '%m-%d-%Y %H:%i:%s'), ";

                if(ProdPrice.Text == "")
                    sql += "NULL);";
                else
                    sql += $"{price});";

                Func.executeSQL(conn, sql, false);

                Response.Redirect($"~/Product.aspx?prodid={prod_id}");
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
