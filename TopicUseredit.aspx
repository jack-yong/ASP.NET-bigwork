<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TopicUseredit.aspx.cs" Inherits="TopicUseredit" MasterPageFile="~/navbar.master" ValidateRequest="false"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/publish.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="layui/css/layui.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSection" runat="Server">
    <div class="column is-0"></div>
    <div class="container box">
        <div class="layuimini-container">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>帖子信息</legend>
                </fieldset>
                <div class="layui-form-item">
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
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="Server">
    <script src="layui/layui.js"></script>
     <script src="js/jquery.min.js" type="text/javascript"></script>
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
            var index = layedit.build('<%=editsouse.ClientID%>', {
                height: 500 //设置编辑器高度
            });


            setInterval(function () {
                var tex = layedit.getContent(index);
                asidetext = tex;
                $.ajax({
                    type: "post",
                    url: "TopicUseredit.aspx/Formatetext",
                    data: "{'txt':'" + tex + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    },
                    error: function (err) {
                    }
                })
            }, 500);


        });

         $("#<%=submit.ClientID%>").live('click', function () {
            var TopicName = $("#<%=TopicName.ClientID%>").val().trim();
            if (TopicName == "") {
                alert('标题名为空');
                return;
            }
            if (asidetext == "") {
                alert('内容为空');
                return;
            }
        })
    </script>
</asp:Content>
