using System.Security.AccessControl;
using System;
using System.Collections;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Web.Security;

public class Func
{
    public static ArrayList executeSQL(MySqlConnection conn, string sql, bool fetch)
    {
        MySqlCommand cmd = new MySqlCommand(sql, conn);

        if (fetch)
        {
            MySqlDataReader read = cmd.ExecuteReader();
            ArrayList res = new ArrayList();

            while (read.Read())
            {
                object[] values = new object[read.FieldCount];
                read.GetValues(values);
                res.Add(values);
            }

            return res;
        }
        else
        {
            cmd.ExecuteNonQuery();
            return null;
        }
    }

    public static MySqlDataReader executeSQLReader(MySqlConnection conn, string sql, bool fetch, params object[] parameters)
    {
        MySqlCommand cmd = new MySqlCommand(sql, conn);

        MySqlDataReader read = cmd.ExecuteReader();
        return read;
    }

    public static string hashPassword(string password)
    {
        return FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
    }

    public static long genId(int min, int max)
    {
        Random rnd = new Random();
        return rnd.Next(min, max);
    }

    public static int calcAge(string birth_year, string current_year)
    {
        return int.Parse(current_year) - int.Parse(birth_year);
    }

    public static HttpCookie cookieSet(string key, string value, int expireInHours)
    {
        HttpCookie recipe_cookie = new HttpCookie(key);
        recipe_cookie.Value = value;
        recipe_cookie.Expires = DateTime.Now.AddHours(expireInHours);
        return recipe_cookie;
        // todo Response.SetCookie(recipe_cookie);
    }
}
