using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelfInformation : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["userid"] != null)
            {
                int userid = Convert.ToInt32(Request.QueryString["userid"]);
                user result = (from r in db.user
                               where r.UId == userid
                               select r).FirstOrDefault();
                username.Text = result.Uname.ToString();
                password.Text = result.Upassword.ToString();
                major.Text = result.Umajor.ToString();
                departent.SelectedValue = result.Udepartment.ToString();
                sex.SelectedValue = result.USex.ToString();
                if (result.Enabled.ToString().Trim() == "user")
                {
                    enable.SelectedValue = "普通用户";
                }
                else
                {
                    enable.SelectedValue = "管理员";
                }
            }
            else
            {
                
            }
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Request.QueryString["userid"]);
        var results = (from r in db.user
                       where r.UId == userid
                       select r).First();
        if (results != null)
        {
            results.Uname = username.Text;
            results.Upassword = password.Text;
            results.Umajor = major.Text;
            results.Udepartment = departent.SelectedValue;
            results.USex = sex.SelectedValue;
            if (enable.SelectedValue == "普通用户")
            {
                results.Enabled = "user";
            }
            else
            {
                results.Enabled = "admain";
            }
            db.SubmitChanges();
            Response.Redirect("ManageUserJuris.aspx");
        }


    }
}