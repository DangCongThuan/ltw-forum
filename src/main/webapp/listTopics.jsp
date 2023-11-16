<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 11/14/2023
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
    table {
    border-collapse: collapse;
    width: 100%;
    }

    th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
    }
    th {
        text-align: center;
    }
    </style>
</head>
<body>
  <div style="text-align: right">
    Chào ${user.username} | <a href="logout">Thoát</a>
  </div>
 <h1>Diễn đàn: Chuyện học phí và các chính sách hỗ trợ học tập</h1>
  <div>
 <button><a href="new-topic"> Gửi bài mới</a></button>
  </div>
<br>
<table>
    <thead>
        <tr>
            <th>Chủ đề</th>
            <th>Hồi âm</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="topic" items="${listTopics}">
            <tr>
                <td>
                    <b>
                    <a href="show-topic?id=${topic.id}">${topic.title}</a><br>
                    </b>
                    <c:if test="${topic.messages.size() > 0}">
                        <c:set var="newMessage" value="${topic.getNewMessage()}"/>
                        <span>Bài mới nhất by
                        <b>
                            <a href="">${newMessage.creator.username}</a>,
                        </b>
                        <fmt:formatDate value="${newMessage.createdTime.time}"  pattern = "dd-MM-yyyy HH:mm"/>
                            </span>
                    </c:if>
                    <c:if test="${topic.messages.size() == 0}">
                        <span>Bài mới nhất by
                        <b>
                            <a href="">${topic.creator.username}</a>,
                        </b>
                        <fmt:formatDate value="${topic.createdTime.time}"  pattern = "dd-MM-yyyy HH:mm"/>
                            </span>
                    </c:if>
                </td>
                <td>
                        ${topic.messages.size()}
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
