using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_page_ManageUserJuris : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.thisDataBind("","","");//将数据绑定到Repeater控件上
        }
    }

    public void thisDataBind(string searchmsg,string depadepartment,string major)
    {
        var result = from r in db.user
                     where System.Data.Linq.SqlClient.SqlMethods.Like(r.Uname, "%" + searchmsg + "%") &&
                     System.Data.Linq.SqlClient.SqlMethods.Like(r.Udepartment, "%" + depadepartment + "%") &&
                     System.Data.Linq.SqlClient.SqlMethods.Like(r.Umajor, "%" + major + "%")
                     select  r;
        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delcustomer")
        {
            var result = from r in db.user
                         where r.UId == int.Parse(e.CommandArgument.ToString())
                         select r;
            if(result!=null)
            {
                db.user.DeleteAllOnSubmit(result);
                db.SubmitChanges();
                Response.Redirect("ManageUserJuris.aspx");
            }
          
        }
    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        thisDataBind(searchmsg.Text.Trim(), department.Text.Trim(),major.Text.Trim());
    }
}