<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageUserJuris.aspx.cs" Inherits="backstage_page_ManageUserJuris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="./backstage/lib/layui-v2.5.4/css/layui.css" media="all" />
    <link rel="stylesheet" href="./backstage/css/public.css" media="all" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="layuimini-container">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layuimini-search">
                    <legend>搜索信息</legend>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">用户姓名</label>
                                <div class="layui-input-inline">
                                    <asp:TextBox type="text" ID="searchmsg" class="layui-input" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">院系</label>
                                <div class="layui-input-inline">
                                    <asp:TextBox type="text" ID="department" class="layui-input" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">专业</label>
                                <div class="layui-input-inline">
                                    <asp:TextBox type="text" ID="major" class="layui-input" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="layui-form-item">
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="layui-inline">
                                <asp:Button class="layui-btn " Text="搜索" runat="server" ID="searchbtn" OnClick="searchbtn_Click"></asp:Button>
                                <a class="layui-btn layui-btn-normal" href="BSuseradd.aspx">添加</a>
                            </div>
                        </div>
                </fieldset>

                <div style="margin: 0 10px 0 10px">
                    <table class="layui-table">
                        <colgroup>
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="80">
                            <col width="80">
                            <col width="100">
                            <col width="150">
                            <col width="150">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>头像</th>
                                <th>用户名</th>
                                <th>院系</th>
                                <th>专业</th>
                                <th>性别</th>
                                <th>发帖数</th>
                                <th>权限</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <img style="width: 40px; height: 40px" src="<%#Eval("HeadUrl")%>"></td>
                                        <td>
                                            <%#Eval("Uname")%>
                                        </td>
                                        <td>
                                            <%#Eval("Udepartment")%> 
                                        </td>
                                        <td>
                                            <%#Eval("Umajor")%> 
                                        </td>
                                        <td>
                                            <%#Eval("USex")%> 
                                        </td>
                                        <td>
                                            <%#Eval("TopicCount")%> 
                                        </td>
                                        <td>
                                            <%#Eval("Enabled")%>
                                        </td>
                                        <td>
                                            <%#Eval("RegistrationTime")%>
                                        </td>
                                        <td>
                                            <div class="layui-table-cell">
                                            <a class="layui-btn layui-btn-xs layui-btn-normal" href='SelfInformation.aspx?userid=<%#Eval("UId")%>'>编辑</a>

                                            <asp:Button ID="Button2" CssClass="layui-btn layui-btn-xs layui-btn-danger" OnClientClick="return confirm('删除用户吗?')" CommandName="delcustomer" CommandArgument='<%#Eval("UId")%>' runat="server" Text="删除" BorderStyle="None" />
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
    </form>
</body>
</html>

