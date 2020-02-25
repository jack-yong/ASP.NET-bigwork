using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BSsessionedit : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["sessionid"] != null)
            {
                int sessionid = Convert.ToInt32(Request.QueryString["sessionid"]);
                Section result = (from s in db.Section
                                  where s.Sid == sessionid
                                  select s).FirstOrDefault();
                if (result != null)
                {
                    SessionName.Text = result.Sname;
                    Sessionarea.InnerText = result.Sstatement;
                }

            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string Sname = SessionName.Text.Trim();
        string Sarea = Sessionarea.InnerText.Trim();
        if (Request.QueryString["sessionid"] != null)
        {
            int sid = Convert.ToInt32(Request.QueryString["sessionid"]);
            if (Sname != "" && Sarea != "")
            {
                var result = (from s in db.Section
                              where s.Sid == sid
                              select s).First();
                result.Sname = Sname;
                result.Sstatement = Sarea;
                db.SubmitChanges();
                Response.Redirect("SessionManger.aspx");
            }
        }
        else
        {
            if (Sname != "" && Sarea != "")
            {
                if (IsNameExist(Sname))
                {
                    Response.Write("<script>alert('该板块已存在！');</script>");
                }
                else
                {
                    Insert(Sname, Sarea);
                    Response.Redirect("SessionManger.aspx"); 
                }
            }
        }

    }
    public bool IsNameExist(string name)
    {
        Section M_section = (from c in db.Section
                             where c.Sname == name
                             select c).FirstOrDefault();
        if (M_section != null)
        {
            return true;

        }
        else
        {
            return false;
        }
    }
    public void Insert(string sname, string sarea)
    {
        if (Session["admain"] != null)
        {
            int uid = getuid(Session["admain"].ToString());
            Section newsection = new Section
            {
                Sname = sname,
                Sstatement = sarea,
                SmasterId = uid
            };
            db.Section.InsertOnSubmit(newsection);
            db.SubmitChanges();
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
}

   
