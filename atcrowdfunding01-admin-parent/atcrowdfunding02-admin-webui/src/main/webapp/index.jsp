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
    <script type="text/javascript" src="js/jquery/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn01").click(function () {
                $.ajax({
                    "url": "send/array1.do",
                    "type": "post",
                    "data": {
                        "array": [5, 6, 7]
                    },
                    "dataType": "text",
                    "success": function (response) {
                        alert(response);
                    },
                    "error": function (response) {
                        alert(response);
                    }
                });
            });

            $("#btn02").click(function () {
                // 准备好要发送到服务端的数组
                var array = [5, 8, 12];

                // 将JSON数组转换为JSON字符串
                var requestBody = JSON.stringify(array);
                $.ajax({
                    "url": "send/array2.do",
                    "type": "post",
                    "data": requestBody,
                    contentType: "application/json;character=UTF-8",
                    "dataType": "text",
                    "success": function (response) {
                        alert(response);
                    },
                    "error": function (response) {
                        alert(response);
                    }
                });
            });

            // 准备要发送的数据
            var student = {
                stuId: 5,
                stuName: "tom",
                address: {
                    province: "江苏",
                    city: "南京",
                    street: "秣陵街道"
                },
                subjectList: [
                    {
                        subName: "java",
                        subScore: 100
                    },
                    {
                        subName: "c++",
                        subScore: 98
                    }
                ],
                map: {
                    key1: "value1",
                    key2: "value2"
                }
            };
            // 将JSON对象转换为JSON字符串
            var requestBody = JSON.stringify(student);
            $("#btn03").click(function () {

                // 发送Ajax请求
                $.ajax({
                    url: "send/compose/object.do",
                    type: "post",
                    data: requestBody,
                    contentType: "application/json;character=UTF-8",
                    dataType: "text",
                    success: function (resp) {
                        alert(resp);
                    },
                    error: function (resp) {
                        alert(resp)
                    }
                })
            })

            $("#btn04").click(function () {
                $.ajax({
                    url: "send/compose/object2.do",
                    type: "post",
                    data: requestBody,
                    contentType: "application/json;character=UTF-8",
                    dataType: "json",
                    success: function (resp) {
                        alert(resp.result)
                    },
                    error: function (resp) {
                        console.log(resp)
                    }
                })
            })
        })
    </script>
</head>
<body>
<%--
    1.若以“/”开头，则路径是绝对路径
    2.不以“/”开头，则路径是以base标签为基准
--%>
<a href="test/ssm.html">测试SSM整合环境</a>

<div>
    <button id="btn01">发送数组-方式1</button>
    <button id="btn02">发送数组-方式2</button>
    <button id="btn03">发送对象</button>
    <button id="btn04">发送对象2</button>
</div>

<a href="test/err.html">测试出错</a>

</body>
</Html>