<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sectiondetil.aspx.cs" Inherits="sectiondetil" MasterPageFile="~/navbar.master" %>



<asp:Content ID="contenthead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentSection" ContentPlaceHolderID="cphSection" runat="server">
    <link rel="stylesheet" href="layui/css/layui.css">
    <div class="column is-0"></div>
    <div class="layui-container">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md8">
                <div class="fly-panel">
                    <div class="fly-panel-title fly-filter">
                        <a>板块介绍</a>
                        <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;"></a>
                    </div>
                    <ul class="fly-list">
                        <li>
                            <a class="fly-avatar">
                                <img src="/img/sectionlogo.png">
                            </a>
                            <h2>
                                <a id="sessionname" runat="server"></a>
                            </h2>

                            <div style="margin: 10px 0 0; line-height: 26px; font-size: 16px; color: #4a4a4a; word-wrap: break-word;">
                                <p id="sessionsrea" runat="server"></p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="fly-panel" style="margin-bottom: 0;">
                    <ul class="fly-list">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a class="fly-avatar">
                                        <img src="<%#Eval("HeadUrl")%>">
                                    </a>
                                    <h2>
                                        <a class="layui-badge">提问</a>
                                        <a href="TopicDetail.aspx?topicid=<%#Eval("Tid")%>"><%#Eval("Ttiele")%></a>
                                    </h2>
                                    <div class="fly-list-info">
                                        <a>
                                            <cite><%#Eval("Uname")%></cite>
                                            <!--
                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                <i class="layui-badge fly-badge-vip">VIP3</i>
                -->
                                        </a>
                                        <span><%#Eval("Ttime")%></span>


                                        <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
                                        <span class="fly-list-nums">
                                            <i class="iconfont icon-pinglun1" title="回答"></i><%#Eval("ReplyCount")%>
                                        </span>
                                    </div>
                                    <div class="fly-list-badge">

                                        <!--<span class="layui-badge layui-bg-red">精帖</span>-->
                                    </div>
                                </li>
                                <!--动态内容-->
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
             <div class="layui-col-md4">
                <dl class="fly-panel fly-list-one">
                    <dt class="fly-panel-title">本周热帖</dt>
                    <asp:Repeater ID="Repeater2" runat="server">
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
                        <asp:Repeater ID="Repeater3" runat="server">
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
