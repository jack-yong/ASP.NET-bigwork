<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Topicedit.aspx.cs" ValidateRequest="false" Inherits="Topicedit" %>

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
    <form id="form1" runat="server">
        <div class="layuimini-container">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>帖子信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">状态</label>
                        <div class="select">
                            <asp:DropDownList class="ddlist" ID="isseen" runat="server">
                                <asp:ListItem>可见</asp:ListItem>
                                <asp:ListItem>不可见</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <asp:TextBox ID="TopicName" class="layui-input" runat="server" Width="150%"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <textarea id="editsouse" runat="server" style="display: none;"></textarea>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <asp:Button class="layui-btn" Text="更新帖子" ID="submit" OnClick="submit_Click" runat="server"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </form>
        <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="layui/layui.js"></script>
    <script src="js/jquery.base64.js"></script>
     <script>
        var asidetext;
        layui.use('layedit', function () {
            var layedit = layui.layedit;
            layedit.set({
                uploadImage: {
                    url: 'editImgUp.aspx' //接口url
                    , type: 'post' //默认post
                }
            });
            var index = layedit.build('editsouse', {
                height: 500 //设置编辑器高度
            });
            setInterval(function () {
                var tex = layedit.getContent(index);
                asidetext = tex;
                $.ajax({
                    type: "post",
                    url: "Topicedit.aspx/Formatetext",
                    data: "{'txt':'" + tex + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    },
                    error: function (err) {
                    }
                })
            }, 500);
            $("#submit").live('click', function () {
                var TopicName = $("#TopicName").val().trim();
                if (TopicName == "") {
                    alert('标题名为空');
                    return;
                }
                if (asidetext == "") {
                     alert('内容为空');
                    return;
                }
            })

        });
</script>
</body>
</html>
