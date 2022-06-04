using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Recipehub
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cookies["recipehub_user_id"].Expires = DateTime.Now.AddDays(-1);
            Session.Abandon();
            Response.Redirect("~/Sign in.aspx");
        }
    }
}