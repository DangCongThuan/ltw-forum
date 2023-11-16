<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 11/14/2023
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    form {
      width: 90%;
      margin: auto;
    }
    input, textarea {
      width: 100%;
    }
  </style>
</head>
<body>
<div style="text-align: right">
  <b>
    Chào ${user.username} | <a href="logout">Thoát</a>
  </b>
</div>
<form action="reply-topic" method="post">
  <input name="id" value="${topic.id}" hidden>
  <div>
    <h2><label for="title">Tiêu đề</label></h2>
    <input name="title" value="Re: ${topic.title}" id="title" type="text">
  </div>
  <div>
    <h2><label for="content">Nội dung</label><br></h2>
    <textarea name="content" id="content"></textarea>
  </div>
  <br>
  <button type="submit">Gửi</button>
  <button><a href="list-topics">Hủy bỏ</a></button>
</form>
</body>
</html>
