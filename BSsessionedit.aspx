<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BSsessionedit.aspx.cs" Inherits="BSsessionedit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="./backstage/lib/layui-v2.5.4/css/layui.css" media="all" />
    <link rel="stylesheet" href="./backstage/css/public.css" media="all" />
    <title></title>
    <style>
        html {
            background-color: rgb(242, 242, 242);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layuimini-container">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>板块信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <label class="layui-form-label">板块名</label>
                    <div class="layui-input-block">
                        <asp:TextBox type="text" name="session" ID="SessionName" placeholder="请输入板块名(最多20个字符)" class="layui-input" MaxLength="20" runat="server" autocomplete="off" Width="40%"></asp:TextBox>

                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">板块描述</label>

                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea" id="Sessionarea" runat="server" style="width: 50%"></textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <asp:Button class="layui-btn" Text="提交" ID="submit" OnClick="submit_Click" runat="server"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script>
        $("#submit").live('click', function () {
            var SessionName = $("#SessionName").val().trim();
            var SessionArea = $("#Sessionarea").val().trim();
            if (SessionName == "") {
                alert('板块名为空');
                return;
            }
            if (SessionArea == "") {
                alert('板块内容为空');
                return;
            }
        });
    </script>
</body>

</html>
