<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TopicAdd.aspx.cs" Inherits="TopicAdd" %>

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
                    <legend>新增帖子</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">类别</label>
                        <div class="select">
                            <asp:DropDownList class="ddlist" ID="section" runat="server" DataTextField="Sname" DataValueField="Sid">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <asp:TextBox type="text"  ID="topictitle" placeholder="请输入标题(最多20个字符)" class="layui-input" MaxLength="20" runat="server" autocomplete="off" Width="150%"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <textarea id="editsouse" style="display: none;"></textarea>

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
                    url: "TopicAdd.aspx/Formatetext",
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
                var TopicName = $("#topictitle").val().trim();
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
