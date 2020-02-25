using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Replayedit : System.Web.UI.Page
{
    public static string text;//内容
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Rid"] != "")
            {
                int replayid = Convert.ToInt32(Request.QueryString["Replayid"]);
                thisdatabind(replayid);
            }
            else
            {

            }
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if(text!= null)
        {
            int replayid = Convert.ToInt32(Request.QueryString["Replayid"]);
            var result = (from r in db.Reply
                          where r.Rid == replayid
                          select r).First();
            if (result != null)
            {
                result.RStatement = text;
                db.SubmitChanges();
                Response.Redirect("ReplayManger.aspx");
            }
        }
    }

    //该方法接受前台发送的请求将数据编辑器中的内容赋值给text
    [WebMethod]
    public static string Formatetext(string txt)
    {
        text = txt;
        return txt;
    }

    public void thisdatabind(int  replayid)
    {
        var result = (from r in db.Reply
                      where r.Rid == replayid
                      select r).First();
        if(result != null)
        {
            editsouse.InnerHtml = result.RStatement;
        }
    }
}