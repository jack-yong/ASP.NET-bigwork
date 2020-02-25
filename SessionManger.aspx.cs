using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SessionManger : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            thisDataBind("","","");
        }
    }

    public void thisDataBind(string Sname,string Sarea,string uname)
    {
        var result = from s in db.Section
                     join u in db.user on s.SmasterId equals u.UId
                     where System.Data.Linq.SqlClient.SqlMethods.Like(s.Sname, "%" + Sname + "%") &&
                     System.Data.Linq.SqlClient.SqlMethods.Like(u.Uname, "%" + uname + "%") &&
                      System.Data.Linq.SqlClient.SqlMethods.Like(s.Sstatement, "%" + Sarea + "%")
                     select new
                     {
                         s.Sid,
                         s.Sname,
                         s.Sstatement,
                         u.Uname
                     };
        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();

    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        string Searchmsg = searchmsg.Text.Trim();
        string Mangeruser = mangeruser.Text.Trim();
        string Sessionarea = sessionarea.Text.Trim();
        thisDataBind(Searchmsg, Sessionarea, Mangeruser);
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delsession")
        {
            var result = from s in db.Section
                         where s.Sid == int.Parse(e.CommandArgument.ToString())
                         select s;
            if(result!=null)
            {
                db.Section.DeleteAllOnSubmit(result);
                db.SubmitChanges();
                Response.Redirect("SessionManger.aspx");
            }
        }
    }
}