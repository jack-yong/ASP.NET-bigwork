<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Styles/bulma.min.css" rel="stylesheet" type="text/css" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section class="hero is-success is-fullheight">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="column is-4 is-offset-4">
                        <div class="box" id="login-dialog">
                            <figure class="avatar">
                                <img src="/img/logo.jpg" style="width: 35%; height: 35%">
                            </figure>
                            <form>
                                <div class="field">
                                    <div class="control">
                                        <asp:TextBox class="input is-large" type="text" placeholder="输入用户名" ID="username" autofocus="" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="field">
                                    <div class="control">
                                        <asp:TextBox class="input is-large" type="password" ID="passwd" placeholder="密码" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="checkbox">
                                        <input type="checkbox" />
                                        记住我
                                    </label>
                                </div>

                                  <asp:Button ID="submit" class="button is-block is-info is-large is-fullwidth" runat="server" Text="登 录" BorderStyle="None" 
                    onclick="submit_Click" />
                            </form>
                        </div>
                        <p class="has-text-grey">
                            <!--<a href="../">注册</a> &nbsp;·&nbsp;-->
                            <a href="Forget.aspx">忘记密码</a> &nbsp;·&nbsp;
                            <a href="Register.aspx">注册</a>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </form>
    <script src="js/jquery.min.js"></script>
    <script>

         $("#submit").live('click', function () {
            var dialog = $('#login-dialog');
            var username = dialog.find('#username').val().trim();
            if (username == '') {
                alert('用户名为空');
                return;
             }
             var passwd = dialog.find('#passwd').val().trim();
            if (passwd == '') {
                alert('密码为空');
                return;
            }
		    });
    </script>
</body>
</html>
