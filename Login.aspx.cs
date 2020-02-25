using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.Focus();
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
        var name = username.Text.Trim();
        var password = passwd.Text.Trim();
        if (name != "" && name != null && password != "" && name != null)
        {
            try
            {
                user customer = (from c in db.user
                                 where c.Uname == name && c.Upassword == password 
                                 select c).FirstOrDefault();
                if (customer != null)
                {
                    
                    //Session.Clear();
                    if (customer.Enabled == "admain") 
                    {
                        Session["admain"] = name;
                        Session.Timeout = 1440;
                        Response.Redirect("Backstarge.aspx"); 
                    }
                    else
                    {
                        Session["user"] = name; 
                        Session.Timeout = 1440;
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch (SqlException es)
            {
                Response.Write("异常" + es);
            }
        }
    }
}