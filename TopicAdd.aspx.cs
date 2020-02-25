using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TopicAdd : System.Web.UI.Page
{
    public static string text;//内容
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var result = from s in db.Section
                         select s;
            section.DataSource = result;
            section.DataBind();
  
        }
    }

    //该方法接受前台发送的请求将数据编辑器中的内容赋值给text
    [WebMethod]
    public static string Formatetext(string txt)
    {
        text = txt;
        return txt;
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (topictitle.Text.Trim() != "" && text!="")
        {
            int uid = getuid(Session["admain"].ToString());
            int sid = int.Parse(section.SelectedValue);
            string title = topictitle.Text;
            try
            {
                Insert(sid, uid, title, text);
                FreshUserTopicCount(uid);
                Response.Redirect("TopicManger.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript'>alert('发表失败');</script>");
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
            result.TopicCount = result.TopicCount+ 1;
            db.SubmitChanges();
        }
    }
}