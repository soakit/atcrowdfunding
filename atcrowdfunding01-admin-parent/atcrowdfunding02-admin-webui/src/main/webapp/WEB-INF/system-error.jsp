<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>出错了....</title>
</head>
<body>
<h1>出错了！</h1>
<!-- 从请求域取出Exception对象，再进一步访问message属性就能显示错误消息 -->
${ requestScope.exception.message }
</body>
</body>
</html>
<head>

</head>
<body>

