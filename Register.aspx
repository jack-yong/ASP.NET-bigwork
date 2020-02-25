<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Styles/bulma.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="layui/css/layui.css" />

    <title></title>
     <style>
        html {
            background-color: rgb(242, 246, 250);
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="column is-0"></div>
        <div class=" container box column is-4 is-center">
            <h4 class="title is-3 is-center">浦园Talk</h4>
            <div class="field">
                <label class="label">用户名</label>
                <div class="control">
                    <asp:TextBox class="input is-success" type="text" ID="username" placeholder="用户名" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="field">
                <label class="label">性别</label>
                <div class="control">
                    <div class="select">
                        <asp:DropDownList class="ddlist" ID="sex" runat="server">
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="field">
                <label class="label">院系</label>
                <div class="control">
                    <div class="select">
                        <asp:DropDownList class="ddlist" ID="departent" runat="server">
                            <asp:ListItem>信息科学与工程学院</asp:ListItem>
                            <asp:ListItem>传媒学院</asp:ListItem>
                            <asp:ListItem>商学院</asp:ListItem>
                            <asp:ListItem>外国语学院</asp:ListItem>
                            <asp:ListItem>化学与生命科学学院</asp:ListItem>
                            <asp:ListItem>城市与土木工程学院</asp:ListItem>
                            <asp:ListItem>艺术学院</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="field">
                <label class="label">专业</label>
                <div class="control">
                    <asp:TextBox class="input " type="text" ID="major" placeholder="专业" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="field">
                <label class="label">密码</label>
                <div class="control">
                    <asp:TextBox class="input " type="password" placeholder="密码" runat="server" ID="password"></asp:TextBox>
                </div>
            </div>
            <div class="field">
                <label class="label">确认密码</label>
                <div class="control">
                    <asp:TextBox class="input" type="password" placeholder="确认密码" runat="server" ID="passwordagain"></asp:TextBox>
                </div>
            </div>

            <div class="field is-grouped">
                <div class="control">
                    <asp:Button ID="submit" class="button is-link" runat="server" Text="注 册" OnClick="submit_Click"></asp:Button>
                </div>
            </div>
            <p class="has-text-grey">
                <a href="login.aspx">登陆</a> &nbsp;·&nbsp;
                            <a href="Forget.aspx">忘记密码</a>
            </p>
        </div>
    </form>
</body>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script>
        $("#submit").live('click', function () {
             var user = $("#username").val().trim();
            var password = $("#password").val().trim();
            var major = $("#major").val().trim();
            var pagain = $("#passwordagain").val().trim();
            if (user == '') {
                alert('用户名为空');
                return;
            }
           if (password == '') {
                alert('密码为空');
                return;
            }
           if (major == '') {
                alert('专业为空');
                return;
            }
            if (password != pagain) {
                     alert("两次输入的密码不一致");
		            return false;
                }
		    });
        </script>
</html>
