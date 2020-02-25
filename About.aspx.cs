using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (title.Text.Trim() != "" && textarea.InnerText.Trim() != "")
        {
            if (Session["user"] != null)
            {
                int uid = getuid(Session["user"].ToString());
                string Title = title.Text.Trim();
                string Area = textarea.InnerText;
                Insert(uid, Title, Area);
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('请登录后发表！');</script>");
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

    public void Insert(int uid, string title, string area)
    {
        DateTime time = DateTime.Now;
        Feedback fd = new Feedback
        {
            UserID = uid,
            Ftiele = title,
            Opinion = area,
            Time = time,
            IsSee = "noseen"
        };
        db.Feedback.InsertOnSubmit(fd);
        db.SubmitChanges();
    }
}