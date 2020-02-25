<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forget.aspx.cs" Inherits="Forget" %>

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

            <div class="field is-grouped">
                <p class="control is-expanded">
                    <asp:TextBox class="input" type="text" placeholder="验证码" runat="server"></asp:TextBox>
                </p>
                <p class="control">
                    <a class="button is-info">发送
                    </a>
                </p>
            </div>

            <div class="field">
                <label class="label">新密码</label>
                <div class="control">
                    <asp:TextBox class="input " type="password" placeholder="新密码" runat="server" ID="password"></asp:TextBox>
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
                    <button class="button is-link">确定</button>
                </div>
                <div class="control">
                    <button class="button is-link  is-danger">取消</button>
                </div>
            </div>
            <p class="has-text-grey">
                <a href="login.aspx">登陆</a> &nbsp;·&nbsp;
                            <a href="Register.aspx">注册密码</a>
            </p>
        </div>
    </form>
</body>
</html>
