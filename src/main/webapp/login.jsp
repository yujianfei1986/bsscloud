<%--
  Created by IntelliJ IDEA.
  User: Yujianfei
  Date: 2016/8/13
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title><%=rb.getString("JiFeiGuanLiXiTong")%></title>
    <link rel="stylesheet" href="${ctx}/css/loginstyle.css?_=${bss_ver}"/>
    <link rel="shortcut icon" href="${ctx}/images/favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js?_=${bss_ver}"></script>
    <script type="text/javascript">
        <%-- 提交表单 --%>
        function submit_form() {
            $('#slick-login').submit();
        }

        $(function () {
            <%-- 用户名、密码输入框，回车事件-提交表单 --%>
            $('.input_').bind("keyup", function (e) {
                if (e.keyCode == 13) {
                    submit_form();
                }
            });
        });
    </script>
</head>
<body>
<div class="loginbody">
    <form id="slick-login" action="${ctx}/bss/login/loginAction.do" method="post">
        <label>username</label><input type="text" class="input_" name="user_name"
                                      placeholder="<%=rb.getString("QingShuRuYongHuMing")%>">
        <label>password</label><input type="password" class="input_" name="user_passwd"
                                      placeholder="<%=rb.getString("QingShuRuMiMa")%>">
        <input type="submit" value="Log In" onclick="submit_form()">
        <p style="margin-left:8px;margin-top:10px;">
            <span style="color:red; font-size: 12px;">${tip}</span>
        </p>
    </form>
</div>
</body>
</html>
