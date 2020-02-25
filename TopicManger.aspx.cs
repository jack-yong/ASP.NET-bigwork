using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TopicManger : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.thisDataBind("", "", "");//将数据绑定到Repeater控件上
        }
    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        string topicmangeruser = Topicmangeruser.Text.Trim();
        string topicsection = Topicsection.Text.Trim();
        string topicName = TopicName.Text.Trim();
        thisDataBind(topicmangeruser, topicsection, topicName);
    }

    public void thisDataBind(string topicmangeruser, string topicsection, string topicName)
    {
        var result = from t in db.Topic
                     join u in db.user on t.Tuid equals u.UId
                     join s in db.Section on t.Tsid equals s.Sid
                     where System.Data.Linq.SqlClient.SqlMethods.Like(u.Uname, "%" + topicmangeruser + "%") &&
                     System.Data.Linq.SqlClient.SqlMethods.Like(s.Sname, "%" + topicsection + "%") &&
                     System.Data.Linq.SqlClient.SqlMethods.Like(t.Ttiele, "%" + topicName + "%")
                     select new
                     {
                         u.Uname,
                         s.Sname,
                         t.Tid,
                         t.Ttiele,
                         t.BrowseCount,
                         t.ReplyCount,
                         t.IsClose,
                         t.Ttime
                     };
        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delTopic")
        {
            var result = from t in db.Topic
                         where t.Tid == int.Parse(e.CommandArgument.ToString())
                         select t;
            var reply = from r in db.Reply
                        where r.Rtid == int.Parse(e.CommandArgument.ToString())
                        select r;
            if (result != null)
            {
                if (reply != null)
                {
                    db.Reply.DeleteAllOnSubmit(reply);
                }
                db.Topic.DeleteAllOnSubmit(result);
                db.SubmitChanges();
                Response.Redirect("TopicManger.aspx");
            }
        }
    }
}