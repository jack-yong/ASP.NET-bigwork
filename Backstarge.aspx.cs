using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admain"] != null)
        {
               welcome.InnerText = Session["admain"].ToString();
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
}