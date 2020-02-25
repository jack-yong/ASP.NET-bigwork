using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sectiondetil : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["sessionid"] != null)
        {
            int sessionid = Convert.ToInt32(Request.QueryString["sessionid"]);
            thisDataBind(sessionid);//将数据绑定到Repeater控件上 
            Section result = (from s in db.Section
                              where s.Sid == sessionid
                              select s).FirstOrDefault();
            if (result != null)
            {
                sessionname.InnerText= result.Sname;
                sessionsrea.InnerText = result.Sstatement;
            }

        }
    }

    public void thisDataBind(int  sid)
    {
        //选取最新发布的13条记录
        var result = (from u in db.user
                      join t in db.Topic on u.UId equals t.Tuid
                      where t.IsClose == "isseen" && t.Tsid == sid
                      orderby t.Ttime descending
                      select new
                      {
                          u.HeadUrl,
                          u.Uname,
                          t.Tid,
                          t.Ttiele,
                          t.ReplyCount,
                          t.BrowseCount,
                          t.Ttime
                      }).Take(13);
        //选择回复数最多的前10条记录

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


        this.Repeater1.DataSource = result;
        this.Repeater1.DataBind();

        this.Repeater2.DataSource = result1;
        this.Repeater2.DataBind();

        this.Repeater3.DataSource = result2;
        this.Repeater3.DataBind();

    }
}