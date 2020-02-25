<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Publish.aspx.cs" Inherits="Publish" MasterPageFile="~/navbar.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/publish.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="layui/css/layui.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSection" runat="Server">
    <div class="column is-10"></div>
    <div class="container box">
        <ul class="post-ul">
            <li class="post-li">发表帖子</li>
        </ul>
        <div class="post-title">
            <asp:DropDownList class="post-select" ID="DropDownList1" runat="server"
                DataSourceID="LinqDataSource1" DataTextField="Sname"
                DataValueField="Sid">
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="JinLinTalkBBSDataContext" TableName="Section">
            </asp:LinqDataSource>
            <asp:TextBox class="post-t" placeholder="请输入一个标题" MaxLength="20" ID="TextBox1" runat="server"></asp:TextBox>
            <span id="zf">还可输入<strong>--</strong>个字符</span>
        </div>
        <textarea id="demo" style="display: none;"></textarea>
        <div class="column is-2 is-center"></div>
        <div class="buttons">
            <asp:Button class=" button is-link" ID="Button1" runat="server" Text="发表帖子"
                BorderStyle="None" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="Server">
    <script src="layui/layui.js"></script>
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.base64.js"></script>

    <script>
        var asidetxt;
        layui.use('layedit', function () {
            var layedit = layui.layedit;
            layedit.set({
                uploadImage: {
                    url: 'editImgUp.aspx' //接口url
                    , type: 'post' //默认post
                }
            });
            var index = layedit.build('demo', {
                height: 500 //设置编辑器高度
            });
            $(document).ready(function () {
                var counter = $(".post-t").val().length;
                $("#zf strong").text(20 - counter);
                $('.post-t').bind('input propertychange', function () {
                    var text = $(".post-t").val();
                    var counter = text.length;
                    $("#zf strong").text(20 - counter);
                });
            });

            setInterval(function () {
                var tex = layedit.getContent(index);
                asidetxt = tex;
                $.ajax({
                    type: "post",
                    url: "Publish.aspx/cz",
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
         $("#<%=Button1.ClientID%>").live('click', function () {
            var TopicName = $("#<%=TextBox1.ClientID%>").val().trim();
            if (TopicName == "") {
                alert('标题名为空');
                return;
            }
            if (asidetxt == "") {
                alert('内容为空');
                return;
            }
        })
</script>
</asp:Content>
