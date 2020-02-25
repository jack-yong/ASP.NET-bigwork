using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FeedbackManger : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            thisDataBind("");
        }
    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        thisDataBind(FDtitle.Text.Trim());
    }

    public void thisDataBind(string OptionName)
    {
        var result = from f in db.Feedback
                     join u in db.user on f.UserID equals u.UId
                     where System.Data.Linq.SqlClient.SqlMethods.Like(f.Ftiele, "%" + OptionName + "%")
                     select new
                     {
                         u.Uname,
                         f.OpinionID,
                         f.Ftiele,
                         f.Time,
                         f.IsSee
                     };
        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();


    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delFeedBack")
        {
            var result = from f in db.Feedback
                         where f.OpinionID == int.Parse(e.CommandArgument.ToString())
                         select f;
            if (result != null)
            {
                db.Feedback.DeleteAllOnSubmit(result);
                db.SubmitChanges();
                Response.Redirect("FeedbackManger.aspx");
            }
        }
    }
}