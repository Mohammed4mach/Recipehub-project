using System.Text.RegularExpressions;
using System.Security.AccessControl;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Web.Security;

public class Func
{
    public static List<Dictionary<string, string>> executeSQL(MySqlConnection conn, string sql, bool fetch = true)
    {
        MySqlCommand cmd = new MySqlCommand(sql, conn);

        if (fetch)
        {
            MySqlDataReader read = cmd.ExecuteReader();
            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            while (read.Read())
            {
                Dictionary<string, string> temp = new Dictionary<string, string>();
                foreach (string columnName in read.GetSchemaTable().Columns)
                {
                    temp.Add(columnName, read[columnName].ToString());
                }
                res.Add(temp);
            }

            return res;
        }
        else
        {
            cmd.ExecuteNonQuery();
            return null;
        }
    }

    public static MySqlDataReader executeSQLReader(MySqlConnection conn, string sql)
    {
        MySqlCommand cmd = new MySqlCommand(sql, conn);

        MySqlDataReader read = cmd.ExecuteReader();
        return read;
    }

    public static string hashPassword(string password) => FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

    public static int genId(int min, int max)
    {
        Random rnd = new Random();
        return rnd.Next(min, max);
    }

    public static HttpCookie cookieSet(string key, string value, int expireInHours)
    {
        HttpCookie recipe_cookie = new HttpCookie(key);
        recipe_cookie.Value = value;
        recipe_cookie.Expires = DateTime.Now.AddHours(expireInHours);
        return recipe_cookie;
        // todo Response.SetCookie(recipe_cookie);
    }

    public static string sanInput(string input) => input.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("'", "\\'").Replace("<", "\\<").Replace(">", "\\>");

}
