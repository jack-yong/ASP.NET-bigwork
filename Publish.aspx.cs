using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Publish : System.Web.UI.Page
{
    public static string text;//内容
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(TextBox1.Text != "" && text != "")
        {
            if (Session["user"] != null)
            {
                int uid = getuid(Session["user"].ToString());
                int sid = int.Parse(DropDownList1.SelectedValue);
                string title = TextBox1.Text;
                try
                {
                    Insert(sid, uid, title, text);
                    FreshUserTopicCount(uid);
                    Response.Redirect("Default.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script type='text/javascript'>alert('发表失败');</script>");
                }
            }
            else{
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

    public void Insert(int sid, int uid, string title, string contents)
    {
        DateTime time = DateTime.Now;
        Topic topic = new Topic
        {
            Tsid = sid,
            Tuid = uid,
            Ttiele = title,
            Tcontents = contents,
            BrowseCount = 0,
            ReplyCount = 0,
            IsClose = "isseen",
            Ttime = time
        };
        db.Topic.InsertOnSubmit(topic);
        db.SubmitChanges();
    }

    public void FreshUserTopicCount(int uid)
    {
        user result = (from u in db.user
                       where u.UId == uid
                       select u).First();
        if (result != null)
        {
            result.TopicCount = result.TopicCount + 1;
            db.SubmitChanges();
        }
    }
}