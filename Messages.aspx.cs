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
    public partial class Messages : System.Web.UI.Page
    {
        public string logged_user_id;
        public string user_id;
        public string username;
        public List<Dictionary<string, string>> Msgs;

        public string err;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["recipehub_user_id"] == null)
                Response.Redirect("~/Sign in.aspx", true);

            if(Request.QueryString["usrid"] == null)
                Response.Redirect("~/Profile Page.aspx", true);

            logged_user_id = Request.Cookies["recipehub_user_id"].Value;
            user_id = Request.QueryString["usrid"];

            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");

            try
            {
                conn.Open();

                string sql = $"SELECT * FROM message_usr WHERE (sender, receiver) = ({logged_user_id}, {user_id}) OR (sender, receiver) = ({user_id}, {logged_user_id}) ORDER BY create_date ASC;";
                MySqlDataReader readMsgs = Func.executeSQLReader(conn, sql);
                Msgs = new List<Dictionary<string, string>>();

                while(readMsgs.Read())
                {
                    Dictionary<string, string> temp = new Dictionary<string, string>();

                    temp.Add("sender", readMsgs["sender"].ToString());
                    temp.Add("receiver", readMsgs["receiver"].ToString());
                    temp.Add("content", readMsgs["content"].ToString());
                    temp.Add("create_date", readMsgs["create_date"].ToString());
                    temp.Add("is_read", readMsgs["is_read"].ToString());

                    Msgs.Add(temp);
                }

                readMsgs.Close();

                sql = $"SELECT username FROM user WHERE user_id = {user_id}";
                MySqlDataReader readUsername = Func.executeSQLReader(conn, sql);
                
                if(readUsername.Read())
                    username = readUsername["username"].ToString();

                readUsername.Close();

                Page.Title = $"{username} chat";

                conn.Close();
            }
            catch(Exception ex)
            {
                err = ex.ToString();
            }
        }

        protected void SendMsg_Click(object sender, EventArgs e)
        {
            string msg_id;
            string content = Func.sanInput(MessageBox.Text);
            string sql;
            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");
            MySqlDataReader readId;

            try
            {
                conn.Open();

                do
                {
                    msg_id = Func.genId(100000, Int32.MaxValue).ToString();
                    sql = $"SELECT id FROM message_usr WHERE id = {msg_id}";
                    readId = Func.executeSQLReader(conn, sql);
                } while(readId.HasRows);

                readId.Close();

                sql = $"INSERT INTO message_usr (id, sender, receiver, content) VALUES ({msg_id}, {logged_user_id}, {user_id}, '{content}')";
                Func.executeSQL(conn, sql, false);

                Response.Redirect($"~/Messages.aspx?usrid={user_id}", true);
                
                conn.Close();
            }
            catch (Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}