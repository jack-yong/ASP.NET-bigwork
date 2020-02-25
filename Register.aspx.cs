using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    JinLinTalkBBSDataContext db = new JinLinTalkBBSDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        username.Focus();
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        if (username.Text.Trim() != "" && major.Text.Trim() != "" && password.Text.Trim() == passwordagain.Text.Trim())
        {
            if (IsNameExist(username.Text.Trim()))
            {
                Response.Write("<script>alert('用户已存在！');</script>");
            }
            else
            {
                Insert(username.Text.Trim(), password.Text.Trim(), departent.SelectedValue, major.Text.Trim(), sex.SelectedValue);
                Response.Redirect("Login.aspx");
            }


        }
    }

    public bool IsNameExist(string name)
    {
        user M_user = (from c in db.user
                       where c.Uname == name
                       select c).FirstOrDefault();
        if (M_user != null)
        {
            return true;

        }
        else
        {
            return false;
        }
    }

    public void Insert(string uname, string upassword, string udepartment, string umajor, string uSex)
    {
        DateTime time = DateTime.Now;
        Random rnd = new Random();
        user M_user = new user
        {
            Uname = uname,
            Upassword = upassword,
            Udepartment = udepartment,
            Umajor = umajor,
            USex = uSex,
            Enabled = "user",
            RegistrationTime = time,
            HeadUrl = "img/userdefimg" + rnd.Next(1, 4) + ".png",
            TopicCount = 0
        };
        db.user.InsertOnSubmit(M_user);
        db.SubmitChanges();
    }
}