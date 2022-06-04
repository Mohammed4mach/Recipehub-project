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
    public partial class Default : System.Web.UI.Page
    {
        public MySqlDataReader read;
        public MySqlConnection conn;

        public string err;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();
                int user_id;

                if(Request.Cookies["recipehub_user_id"] != null)
                    user_id = int.Parse(Request.Cookies["recipehub_user_id"].Value);
                else
                    user_id = 0;

                string sql = $"SELECT user_id, username, picture FROM user WHERE user_id != {user_id} LIMIT 25;";
                read = Func.executeSQLReader(conn, sql);
            }
            catch(Exception ex)
            {
                err = ex.Message;
            }
        }
    }
}
