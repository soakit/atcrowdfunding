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
    <script type="text/javascript">
        $(function () {
            $("button").click(function () {
                // 相当于浏览器的后退按钮
                window.history.back();
            });
        });
    </script>
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
    <h2 class="form-signin-heading" style="text-align: center;"><i class="glyphicon glyphicon-log-in"></i>尚筹网系统消息
    </h2>
    <!--
        requestScope对应的是存放request域数据的Map
        requestScope.exception相当于request.getAttribute("exception")
        requestScope.exception.message相当于exception.getMessage()
    -->
    <h3 style="text-align: center;"> ${ requestScope.exception.message } </h3>
    <button style="width: 150px;margin: 50px auto 0px auto;" type="submit" class="btn btn-lg btn-success btn-block">
        返回上一步
    </button>

</div>
</body>
</html>

