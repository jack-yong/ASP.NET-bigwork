using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReplayManger : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            thisDataBind("","");
        }
    }

    public void thisDataBind(string uname,string ttitle)
    {
        var result = from r in db.Reply
                     join u in db.user on r.Ruid equals u.UId
                     join t in db.Topic on r.Rtid equals t.Tid
                     where System.Data.Linq.SqlClient.SqlMethods.Like(u.Uname, "%" + uname + "%") &&
                     System.Data.Linq.SqlClient.SqlMethods.Like(t.Ttiele, "%" + ttitle + "%")
                     select new
                     {
                         u.Uname,
                         t.Ttiele,
                         r.Rid,
                         r.Rtime
                     };
        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();

    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        string uname = mangeruser.Text.Trim();
        string Title = title.Text.Trim();
        thisDataBind(uname, Title);
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delReplay")
        {
            var result = from r in db.Reply
                         where r.Rid == int.Parse(e.CommandArgument.ToString())
                         select r;
            if (result != null)
            {
                db.Reply.DeleteAllOnSubmit(result);
                db.SubmitChanges();
                Response.Redirect("ReplayManger.aspx");
            }
        }
    }
}