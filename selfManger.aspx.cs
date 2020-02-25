using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class selfManger : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] != null)
            {

                int userid = getuid(Session["user"].ToString());
                this.thisDataBind(userid);//将数据绑定到Repeater控件上
                user result = (from r in db.user
                               where r.UId == userid
                               select r).FirstOrDefault();
                username.Text = result.Uname.ToString();

                password.Text = result.Upassword.ToString();
                major.Text = result.Umajor.ToString();
                departent.SelectedValue = result.Udepartment.ToString();
                sex.SelectedValue = result.USex.ToString();
                HeadImg.ImageUrl = result.HeadUrl;
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        if (username.Text.Trim() != "" && password.Text.Trim() != "" && major.Text.Trim() != "")
        {
            int userid = getuid(Session["user"].ToString());
            var results = (from r in db.user
                           where r.UId == userid
                           select r).First();
            var headurl = results.HeadUrl;
            if (HiddenField1.Value != "")
            {
                headurl = HiddenField1.Value;
            }
            if (results != null)
            {
                results.Uname = username.Text;
                results.Upassword = password.Text;
                results.Umajor = major.Text;
                results.Udepartment = departent.SelectedValue;
                results.USex = sex.SelectedValue;
                results.HeadUrl = headurl;
                db.SubmitChanges();
                Session["user"] = username.Text.ToString();
                Response.Redirect("selfManger.aspx");
            }
        }
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
                int userid = getuid(Session["user"].ToString());
                Response.Redirect("selfManger.aspx");
            }
        }
    }

    public void thisDataBind(int uid)
    {
        var result = from t in db.Topic
                     where t.Tuid == uid
                     join u in db.user on t.Tuid equals u.UId
                     join s in db.Section on t.Tsid equals s.Sid

                     select new
                     {
                         u.Uname,
                         s.Sname,
                         t.Tid,
                         t.Ttiele,
                         t.BrowseCount,
                         t.ReplyCount,
                         t.Ttime
                     };
        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();
    }
}