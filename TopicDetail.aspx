<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TopicDetail.aspx.cs" Inherits="TopicDetail" MasterPageFile="~/navbar.master" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSection" runat="Server">
    <link rel="stylesheet" href="layui/css/layui.css">
    <div class="column is-10"></div>
    <div class="layui-container">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md8 content detail">
                <div class="fly-panel detail-box">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="fly-panel detail-box">
                                <h1><%#Eval("Ttiele")%></h1>
                                <div class="fly-detail-info">
                                    <!-- <span class="layui-badge">审核中</span> -->
                                    <span class="layui-badge layui-bg-green fly-detail-column">提问</span>

                                    <div class="fly-admin-box" data-id="123">
                                    </div>
                                    <span class="fly-list-nums">
                                        <a href="#comment"><i class="iconfont" title="回答">&#xe60c;</i> <%#Eval("ReplyCount")%></a>
                                        <i class="iconfont" title="人气">&#xe60b;</i> <%#Eval("BrowseCount")%>
                                    </span>
                                </div>
                                <div class="detail-about">
                                    <a class="fly-avatar">
                                        <img src="<%#Eval("HeadUrl")%>" alt="贤心">
                                    </a>
                                    <div class="fly-detail-user">
                                        <a class="fly-link">
                                            <cite><%#Eval("Uname")%></cite>
                                            <i class="iconfont icon-renzheng" title="认证信息：{{ rows.user.approve }}"></i>
                                            <i class="layui-badge fly-badge-vip">VIP1</i>
                                        </a>
                                        <span><%#Eval("Ttime")%></span>
                                    </div>
                                    <div class="detail-hits" id="LAY_jieAdmin" data-id="123">
                                        <span style="padding-right: 10px; color: #808080"><%#Eval("Udepartment")%></span>
                                        <span style="padding-right: 10px; color: #808080"><%#Eval("Umajor")%></span>

                                    </div>
                                </div>
                                <div class="detail-body photos">
                                    <p>
                                        <%#Eval("Tcontents") %>
                                    </p>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="fly-panel detail" id="flyReply">
                    <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                        <legend>回帖</legend>
                    </fieldset>

                    <ul class="jieda" id="jieda">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <li data-id="111" class="jieda-daan">
                                    <a name="item-1111111111"></a>
                                    <div class="detail-about detail-about-reply">
                                        <a class="fly-avatar">
                                            <img src="<%#Eval("HeadUrl")%>" alt=" ">
                                        </a>
                                        <div class="fly-detail-user">
                                            <a class="fly-link">
                                                <cite><%#Eval("Uname")%></cite>
                                                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                                                <i class="layui-badge fly-badge-vip">VIP1</i>
                                            </a>


                                        </div>

                                        <div class="detail-hits">
                                            <span><%#Eval("Rtime")%></span>
                                        </div>


                                    </div>
                                    <div class="detail-body jieda-body photos">
                                        <p><%#Eval("RStatement")%></p>
                                    </div>
                                    <div class="jieda-reply">
                                        <span class="jieda-zan" type="zan">
                                            <i class="iconfont icon-zan"></i>
                                            <em>0</em>
                                        </span>
                                        <span type="reply">
                                            <i class="iconfont icon-svgmoban53"></i>
                                            回复
                                        </span>
                                        <div class="jieda-admin">
                                            <span type="edit">编辑</span>
                                            <span type="del">删除</span>
                                            <span class="jieda-accept" type="accept">采纳</span>
                                        </div>
                                    </div>

                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                    <div class="layui-form layui-form-pane">
                        <div class="layui-form-item layui-form-text">

                            <div class="layui-input-block ">
                                <textarea id="demo" name="content" placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="column is-2 is-center">
                            <asp:Button class="button is-link is-small" ID="Button1" runat="server" Text="发表回复"
                                BorderStyle="None" OnClick="Button1_Click" />
                                </div>
                        </div>
                    </div>
                </div>
            </div>
              <div class="layui-col-md4">
                <dl class="fly-panel fly-list-one">
                    <dt class="fly-panel-title">本周热帖</dt>
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <dd>
                                <a href="TopicDetail.aspx?topicid=<%#Eval("Tid")%>"><%#Eval("Ttiele")%></a>
                                <span><i class="iconfont icon-pinglun1"></i><%#Eval("ReplyCount")%></span>
                            </dd>
                        </ItemTemplate>
                    </asp:Repeater>
                </dl>
                <div class="fly-panel">
                    <div class="fly-panel-title">
                        学校活动
                    </div>
                    <div class="fly-panel-main">
                        <img width="220px" height="220px" style="margin-left: 50px;" src="img/school.jpg" />
                    </div>
                </div>
                <div class="fly-panel fly-link">
                    <h3 class="fly-panel-title">推荐版块</h3>
                    <dl class="fly-panel-main">
                        <asp:Repeater ID="Repeater4" runat="server">
                            <ItemTemplate>
                                <dd><a href="sectiondetil.aspx?sessionid=<%#Eval("Sid")%>" ><%#Eval("Sname")%></a><dd>
                            </ItemTemplate>
                        </asp:Repeater>
                    </dl>
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
            var index = layedit.build('demo', {
                height: 100, //设置编辑器高度
                tool: ['face', 'image', 'link']
            });

            setInterval(function () {
                var tex = layedit.getContent(index);
                asidetext = tex;
                $.ajax({
                    type: "post",
                    url: "TopicDetail.aspx/cz",
                    data: "{'txt':'" + tex + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    },
                    error: function (err) {
                    }
                })
            }, 500);

            $("#<%=Button1.ClientID%>").live('click', function () {
                if (asidetext == "") {
                    alert('内容为空');
                    return;
                }
            })

        });

</script>
</asp:Content>


