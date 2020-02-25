<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" MasterPageFile="~/navbar.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="layui/css/layui.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSection" runat="server">
    <link rel="stylesheet" href="/css/contact.css">
    <div class="column is-10"></div>
    <div class="container box">
        <div class="container has-text-centered">
            <div class="columns is-8 is-variable ">
                <div class="column is-two-thirds has-text-left">
                    <h1 class="title is-1">联系我们</h1>
                    <p class="is-size-4">
                        你的建议可以让我们变得更好
                    </p>
                </div>
                <div class="column is-one-third has-text-left">
                    <div class="field">
                        <label class="label">标题</label>
                        <div class="control">
                            <asp:TextBox class="input is-medium" ID="title" type="text" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">消息内容</label>
                        <div class="control">
                            <textarea class="textarea is-medium" runat="server" id="textarea"></textarea>
                        </div>
                    </div>
                    <div class="control">
                        <asp:Button type="submit" class="button is-link is-fullwidth has-text-weight-medium is-medium" Text="发送消息" ID="submit" runat="server" OnClick="submit_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="Server">
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script>
        $("#<%=submit.ClientID%>").live('click', function () {
            var TopicName = $("#<%=title.ClientID%>").val().trim();
            var asidetext = $("#<%=textarea.ClientID%>").val().trim();
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
