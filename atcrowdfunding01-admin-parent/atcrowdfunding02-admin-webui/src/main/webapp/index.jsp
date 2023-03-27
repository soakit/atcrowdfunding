<%@ page language="java" contentType="text/html; chartset=utf-8" pageEncoding="utf-8" %>
<%
    int port = request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + (port != 80 ? ":" + port : "") + request.getContextPath() + "/";
    // 1.contextPath 前面不能加”/“，会干扰 Cookie 的path。
    // 2.contextPath 后面必须加”/“，是基准路径。
%>
<!DOCTYPE html>
<Html>
<head>
    <meta charset="utf-8">
    <title>home</title>
    <base href="<%=basePath%>">
</head>
<body>
<%--
    1.若以“/”开头，则路径是绝对路径
    2.不以“/”开头，则路径是以base标签为基准
--%>
<a href="test/ssm.html">测试SSM整合环境</a>
</body>
</Html>