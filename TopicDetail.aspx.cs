using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TopicDetail : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    public static string text;//内容
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int tid = int.Parse(Request.QueryString["topicid"]);
            BrowCountadder(tid);
            thisDatabind(tid);
            thisDataBind1(tid);
        }
    }

    public void thisDatabind(int tid)
    {
        var result = from t in db.Topic
                     where t.Tid == tid
                     join u in db.user on t.Tuid equals u.UId
                     select new
                     {
                         u.Uname,
                         u.HeadUrl,
                         u.USex,
                         u.Udepartment,
                         u.Umajor,
                         t.Ttiele,
                         t.BrowseCount,
                         t.ReplyCount,
                         t.Ttime,
                         t.Tcontents
                     };
        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();



    }

    public void thisDataBind1(int tid)
    {
        var result = from r in db.Reply
                     where r.Rtid == tid
                     join u in db.user
                     on r.Ruid equals u.UId
                     select new
                     {
                         u.Uname,
                         u.HeadUrl,
                         u.Udepartment,
                         u.Umajor,
                         u.USex,
                         r.Rtime,
                         r.RStatement
                     };
        var result1 = (from u in db.user
                       join t in db.Topic on u.UId equals t.Tuid
                       where t.IsClose == "isseen"
                       orderby t.ReplyCount descending
                       select new
                       {
                           t.Tid,
                           t.Ttiele,
                           t.ReplyCount,
                       }).Take(10);
        var result2 = from s in db.Section
                      select s;

        this.Repeater2.DataSource = result;
        this.Repeater2.DataBind();

        this.Repeater3.DataSource = result1;
        this.Repeater3.DataBind();

        this.Repeater4.DataSource = result2;
        this.Repeater4.DataBind();

    }

    public void BrowCountadder(int tid)
    {
        var result = (from t in db.Topic
                      where t.Tid == tid
                      select t).First();
        if (result != null)
        {
            result.BrowseCount = result.BrowseCount + 1;
            db.SubmitChanges();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (text != "")
        {
            if (Session["user"] != null)
            {
                int uid = getuid(Session["user"].ToString());
                int tid = int.Parse(Request.QueryString["topicid"]);
                Insert(uid, tid);
                Replayadder(tid);
                Response.Redirect("TopicDetail.aspx?topicid=" + tid);
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('没有登陆！！！');</script>");
            }
        }
    }

    [WebMethod]
    public static string cz(string txt)
    {
        text = txt;
        return txt;
    }

    public int getuid(string username)
    {
        user M_user = (from u in db.user
                       where u.Uname == username
                       select u).First();
        if (M_user != null)
        {
            return M_user.UId;
        }
        else
        {
            return -1;
        }
    }

    public void Insert(int uid, int tid)
    {
        DateTime time = DateTime.Now;
        Reply reply = new Reply
        {
            Ruid = uid,
            Rtid = tid,
            Rtime = time,
            RStatement = text
        };
        db.Reply.InsertOnSubmit(reply);
        db.SubmitChanges();
    }

    public void Replayadder(int tid)
    {
        var result = (from t in db.Topic
                      where t.Tid == tid
                      select t).First();
        if (result != null)
        {
            result.ReplyCount = result.ReplyCount + 1;
            db.SubmitChanges();
        }
    }


}