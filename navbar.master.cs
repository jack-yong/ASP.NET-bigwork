using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class navbar : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            welcome.InnerText = "欢迎 " + Session["user"].ToString();
            login.Text = "注销";
            login.CssClass = "button is-danger  is-small";
        }
    }

    protected void login_Click(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Session["user"] = null;
            Response.Redirect("Login.aspx");
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToString();
    }
}
