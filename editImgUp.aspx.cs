using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editImgUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpFileCollection files = Request.Files;
        HttpPostedFile postedFile = files["file"];

        string fileName, fileExtension;
        fileName = System.IO.Path.GetFileName(postedFile.FileName);
        string SaveFilePath = "";
        if (fileName != "")
        {
            fileExtension = System.IO.Path.GetExtension(fileName).ToLower(); //获取文件的扩展名
            if (fileExtension != ".jpg" && fileExtension != ".png")
            {
                Response.Write("<script>alert('文件格式不正确，你只能上传jpg格式或者png文件！')</script>");
                return;
            }
            SaveFilePath = "img/" + System.DateTime.Now.ToString("yyyymmddhhmmss") + fileExtension;
            postedFile.SaveAs(Server.MapPath(SaveFilePath));
            Response.Write("{\"code\":0,\"msg\":\"\",\"data\":{\"src\":\"" + SaveFilePath +"\",\"title\":\"\"}}");
        }
    }
}