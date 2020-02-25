<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selfManger.aspx.cs" Inherits="selfManger" MasterPageFile="~/navbar.master" %>

<asp:Content ID="contenthead" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="layui/css/layui.css">
</asp:Content>
<asp:Content ID="ContentSection" ContentPlaceHolderID="cphSection" runat="server">
    <div class="column is-0"></div>
    <div class=" container box">
        <div class="tabs">
            <ul>
                <li id="selfmanger"><a>个人管理</a></li>
                <li id="selfTopic"><a>贴子管理</a></li>
            </ul>
        </div>
        <div class="layuimini-container" id="selfinfo">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>用户个人信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <asp:TextBox ID="username" class="layui-input" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <asp:TextBox ID="password" class="layui-input" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-block">
                            <asp:TextBox ID="major" class="layui-input" runat="server"></asp:TextBox>
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
                    <div class="layui-inline">
                        <label class="layui-form-label">头像</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="uploadimg" type="file" onchange="chooseImg(this)" style="display: none">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <a id="headimg" onclick="uploadimg.click()">
                            <asp:Image ID="HeadImg" runat="server" Style="width: 60px; height: 60px" /></a>
                    </div>

                </div>
                <div class="layui-form-item">
                    <asp:Button class="layui-btn " runat="server" Text="修改" BorderStyle="None" OnClick="Submit_Click" ID="Submit" />
                </div>
            </div>
        </div>
        <div class="layuimini-container" id="topicinfo">
            <div class="layuimini-main">
                <div style="margin: 10px 10px 10px 10px">
                    <table class="layui-table">
                        <colgroup>
                            <col width="100">
                            <col width="200">
                            <col width="200">
                            <col width="100">
                            <col width="100">
                            <col width="200">
                            <col width="150">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>发帖人</th>
                                <th>所属板块</th>
                                <th>帖子标题</th>
                                <th>浏览次数</th>
                                <th>回复次数</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Uname")%></td>
                                        <td><%#Eval("Sname")%></td>
                                        <td><%#Eval("Ttiele")%></td>
                                        <td><%#Eval("BrowseCount")%></td>
                                        <td><%#Eval("ReplyCount")%></td>
                                        <td><%#Eval("Ttime")%></td>
                                        <td>
                                            <div class="layui-table-cell">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal" href="TopicUseredit.aspx?Topicid=<%#Eval("Tid")%>">编辑</a>

                                                <asp:Button CssClass="layui-btn layui-btn-xs layui-btn-danger" runat="server" CommandName="delTopic" OnClientClick="return confirm('删除改帖子吗?')" CommandArgument='<%#Eval("Tid")%>' ID="delTopic" Text="删除" />
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="Server">
    <script src="js/jquery.min.js"></script>
    <script>
        var newImg = document.getElementById("<%=HeadImg.ClientID%>");
        var HNewImg = document.getElementById("<%=HiddenField1.ClientID%>");
        $(document).ready(function () {
            $("#topicinfo").hide();
            $("#selfmanger").click(function () {
                $("#topicinfo").hide();
                $("#selfinfo").show();
            })
            $("#selfTopic").click(function () {
                $("#selfinfo").hide();
                $("#topicinfo").show();
            })
        })
        $("#<%=Submit.ClientID%>").live('click', function () {
            var Username = $("#<%=username.ClientID%>").val().trim();
            var Password = $("#<%=password.ClientID%>").val().trim();
            var Major = $("#<%=major.ClientID%>").val().trim();
            if (Username == "") {
                alert('用户名为空!');
                return;
            }
            if (Password == "") {
                alert('密码为空!');
                return;
            }
            if (Major == "") {
                alert('专业为空!');
                return;
            }
            confirm("确定要修改吗?");
        })
        function chooseImg(file) {

            var fileObj = file.files[0];
            //创建formdata对象，formData用来存储表单的数据，表单数据时以键值对形式存储的。
            var formData = new FormData();
            formData.append('image', fileObj);
            $.ajax({
                url: "Upload.aspx",
                type: "post",
                dataType: "json",
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (json_data) {
                    if (json_data["code"] == 1) {
                        newImg.src = json_data["url"];
                        HNewImg.value = json_data["url"];
                    }
                },
            });
        }
</script>
</asp:Content>


