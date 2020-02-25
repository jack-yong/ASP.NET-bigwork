<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedbackedit.aspx.cs" Inherits="Feedbackedit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="./backstage/lib/layui-v2.5.4/css/layui.css" media="all" />
    <link rel="stylesheet" href="./backstage/css/public.css" media="all" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layuimini-container">
            <div class="layuimini-main">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>反馈信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <label class="layui-form-label">反馈标题</label>
                    <div class="layui-input-block">
                        <asp:TextBox type="text" name="FeedBackTitle" ID="FeedBackTitle" class="layui-input"  runat="server" autocomplete="off"  ReadOnly="true" Width="40%"></asp:TextBox>

                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">反馈描述</label>
                        <div class="layui-input-block">
                            <textarea  class="layui-textarea"  readonly="readonly" id="FeedBackarea" runat="server" style="width: 50%"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
