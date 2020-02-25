using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TopicUseredit : System.Web.UI.Page
{

    public static string text;//内容
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["topicid"] != "")
            {
                int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
                thisdatabind(topicid);
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (TopicName.Text.Trim() != "" && text != "")
        {
            int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
            var result = (from t in db.Topic
                          where t.Tid == topicid
                          select t).First();
            if (result != null)
            {
                result.Ttiele = TopicName.Text.Trim();
                result.Tcontents = text;
                db.SubmitChanges();
                Response.Redirect("selfManger.aspx");
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

    public void thisdatabind(int topicid)
    {
        var result = (from t in db.Topic
                      where t.Tid == topicid
                      select t).First();
        if (result != null)
        {
            TopicName.Text = result.Ttiele;
            editsouse.InnerText = result.Tcontents;
        }

    }
}