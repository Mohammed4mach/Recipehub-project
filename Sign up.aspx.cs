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
    public partial class Sign_up : System.Web.UI.Page
    {
        string err;

        protected void Page_Load(object sender, EventArgs e)
        {
            email.Text = null;
            password.Text = null;

            if (err != null)
                errorLabel.Text = err;

            if (Request.Cookies["recipehub_user_id"] != null)
            {
                Response.Redirect("~/profile.aspx");
                Response.End();
            }

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string user_username = username.Text;
            string user_email = email.Text;
            string user_password = password.Text;
            string user_country = country.SelectedValue;
            string user_city = city.SelectedValue;
            string user_gender;
            string user_birth_date;

            if (male.Checked)
                user_gender = male.Text;
            else
                user_gender = female.Text;

        }
    }
}