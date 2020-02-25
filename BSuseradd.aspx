<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BSuseradd.aspx.cs" Inherits="BSuseradd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="./backstage/lib/layui-v2.5.4/css/layui.css" media="all" />
    <link href="Styles/bulma.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="./backstage/css/public.css" media="all" />
    <title></title>
    <style>
        html {
            background-color: rgb(242, 242, 242);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div class="layuimini-container">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>新增账号</legend>
                </fieldset>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <asp:TextBox type="text" name="username" ID="username" placeholder="请输入用户名" class="layui-input" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">专业</label>
                    <div class="layui-input-block">
                        <asp:TextBox type="text" ID="major" placeholder="请输入专业" runat="server" class="layui-input" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">学院</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                    <div class="layui-inline">
                        <label class="layui-form-label">权限</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="select">
                            <asp:DropDownList class="ddlist" ID="enable" runat="server">
                                <asp:ListItem>普通用户</asp:ListItem>
                                <asp:ListItem>管理员</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="layui-inline">
                        <label class="layui-form-label">性别</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="select">
                            <asp:DropDownList class="ddlist" ID="sex" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <asp:TextBox type="password" ID="password" placeholder="请输入密码" autocomplete="off" class="layui-input" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <asp:TextBox type="password" ID="passwordagain" placeholder="请输入确认密码" autocomplete="off" class="layui-input" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <asp:Button class="layui-btn"  Text="提交"  ID="submit"  OnClick="submit_Click" runat="server"></asp:Button>
                    </div>
                </div>
            </div>
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
        if (major == '') {
            alert('专业为空');
            return;
        }
        if (password == '') {
            alert('密码为空');
            return;
        }
        if (password != pagain) {
            alert("两次输入的密码不一致");
            return false;
        }
    });
</script>
</html>
