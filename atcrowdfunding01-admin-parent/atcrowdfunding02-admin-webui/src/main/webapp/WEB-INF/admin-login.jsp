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
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="jquery/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="index.html" style="font-size:32px;">尚筹网-创意产品众筹平台</a></div>
        </div>
    </div>
</nav>

<div class="container">
    <form action="security/do/login.do" method="post" class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i>管理员登录</h2>
        <p>${requestScope.exception.message}</p>
        <p>${SPRING_SECURITY_LAST_EXCEPTION.message }</p>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="inputSuccess4" name="loginAcct" placeholder="请输入登录账号"
                   autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="inputSuccess5" name="userPswd" placeholder="请输入登录密码"
                   style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
    </form>
</div>
</body>