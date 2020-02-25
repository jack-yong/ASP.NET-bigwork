using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedbackedit : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Opinionid"] != null)
            {
                int fid = Convert.ToInt32(Request.QueryString["Opinionid"]);
                var result = (from f in db.Feedback
                              where f.OpinionID == fid
                              select f).First();
                

                FeedBackTitle.Text = result.Ftiele;
                FeedBackarea.InnerText = result.Opinion;
                result.IsSee = "haseen";
                db.SubmitChanges();
            }
        }
    }
}