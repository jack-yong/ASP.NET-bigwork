<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelfInformation.aspx.cs" Inherits="SelfInformation" %>

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
            background-color:rgb(242, 242, 242);
        }

    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="layuimini-container">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>用户个人信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <asp:TextBox  ID="username" class="layui-input" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <asp:TextBox  ID="password" class="layui-input" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-block">
                            <asp:TextBox   ID="major" class="layui-input" runat="server"></asp:TextBox>
                        </div>
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
                <asp:Button class="layui-btn "  runat="server" Text="修改用户" OnClientClick="return confirm('确定修改吗?')"  BorderStyle="None" OnClick="Submit_Click"  ID="Submit"/>
              </div>
            </div>
        </div>

    </form>
    <script src="js/jquery-3.2.1.min" type="text/javascript"></script>
</body>
</html>
