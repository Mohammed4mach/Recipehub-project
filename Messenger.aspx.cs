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
    public partial class Messenger : System.Web.UI.Page
    {
        public string user_id;
        public string username;
        public string usr_pic;

        public List<Dictionary<string, string>> Msgs;
        public string err;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["recipehub_user_id"] == null)
                Response.Redirect("~/Sign in.aspx", true);

            user_id = Request.Cookies["recipehub_user_id"].Value;

            MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");


            try
            {
                conn.Open();

                string sql = $"SELECT username, picture FROM user WHERE user_id = {user_id}";
                MySqlDataReader readUserInfo = Func.executeSQLReader(conn, sql);

                if(readUserInfo.Read())
                {
                    username = readUserInfo["username"].ToString();
                    usr_pic = readUserInfo["picture"].ToString() != "" ?
                              readUserInfo["picture"].ToString() :
                              "./uploads/pictures/users/user.png";
                }

                readUserInfo.Close();

                // sql = "SELECT user.username, user.user_id, user.picture, message_usr.sender AS sndr, message_usr.receiver AS recv, message_usr.content FROM message_usr " +
                //       "INNER JOIN user ON "+ 
                //      $"user.user_id = sndr AND user.user_id != {user_id} OR " +
                //      $"user.user_id = recv AND user.user_id != {user_id} " +
                //      $"WHERE sndr = {user_id} OR recv = {user_id} ORDER BY create_date ASC";

                sql = $"SELECT sender, receiver, content, create_date, is_read WHERE sender = {user_id} OR receiver = {user_id} ORDER BY create_date DESC;";
                MySqlDataReader readMsgs = Func.executeSQLReader(conn, sql);
                Msgs = new List<Dictionary<string, string>>();
                
                MySqlConnection otherConn = new MySqlConnection("server=127.0.0.1;user=root;password=root;database=recipehub;");
                MySqlDataReader readMsgrInfo;

                // Fetch messages info
                while(readMsgs.Read())
                {
                    Dictionary<string, string> temp = new Dictionary<string, string>();
                    
                    string msgr_id = readMsgs["sender"].ToString() != user_id ?
                                     readMsgs["sender"].ToString() :
                                     readMsgs["receiver"].ToString();

                    sql = $"SELECT username, picture FROM user WHERE user_id = {msgr_id};";
                    readMsgrInfo = Func.executeSQLReader(otherConn, sql);
                    readMsgrInfo.Read();

                    temp.Add("msgr_id", msgr_id);
                    temp.Add("", readMsgs[""].ToString());
                    temp.Add("", readMsgs[""].ToString());
                    temp.Add("", readMsgs[""].ToString());
                    temp.Add("", readMsgs[""].ToString());
                    temp.Add("", readMsgs[""].ToString());
                    readMsgrInfo.Close();
                }

                readMsgs.Close();

                otherConn.Close();
                conn.Close();
            }
            catch(Exception ex)
            {
                err = ex.ToString();
            }
        }
    }
}
