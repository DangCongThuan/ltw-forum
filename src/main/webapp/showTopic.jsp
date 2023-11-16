<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <style>
        h1 {
            margin: 0;
            padding: 0;
        }

        .topic-box {
            margin-top: 20px;
            border: 1px solid #000;
        }

        .user-box {
            width: 30%;
            display: inline-block;
            text-align: center;
        }

        .message-box {
            width: 69%;
            display: inline-block;
            border-left: 1px solid #000
        }

        .answer {
            float: right;
            margin-right: 20px
        }

        .title {
            background-color: #ceffff;
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
<h1>Chủ đề: ${topic.title}</h1>
<c:if test="${topic.messages.size() > 0}">
    <c:set var="newMessage" value="${topic.getNewMessage()}"/>
    <span>Bài mới nhất gửi lúc
        <fmt:formatDate value="${newMessage.createdTime.time}" pattern="dd-MM-yyyy HH:mm"/>, do
        <b>
            <a href="">${newMessage.creator.username}</a>,
        </b>
        gửi. ${topic.messages.size()} hồi âm.
    </span>
</c:if>
<c:if test="${topic.messages.size() == 0}">
    <span>Bài mới nhất gửi
        <fmt:formatDate value="${topic.createdTime.time}" pattern="dd-MM-yyyy HH:mm"/>, do
        <b>
            <a href="">${topic.creator.username}</a>,
        </b>
        gửi. ${topic.messages.size()} hồi âm.
    </span>
</c:if>
<br>
<div class="topic-box">
    <div style="border: 1px solid #000"><fmt:formatDate value="${topic.createdTime.time}"
                                                        pattern="dd-MM-yyyy HH:mm"/></div>
    <div>
        <div class="user-box">
            <h3>${topic.creator.username}</h3>
            <span>Tham gia <fmt:formatDate value="${topic.creator.joinDate}"
                                           pattern="dd-MM-yyyy HH:mm"/></span>
        </div>
        <div class="message-box">
            <div class="title">
                <b>${topic.title}</b>
                <a href="reply-topic?id=${topic.id}" class="answer">Trả lời</a>
            </div>
            <p>
                ${topic.content}
            </p>
        </div>
    </div>
</div>
<c:forEach var="message" items="${topic.messages}">
    <div class="topic-box">
        <div style="border: 1px solid #000"><fmt:formatDate value="${message.createdTime.time}"
                                                            pattern="dd-MM-yyyy HH:mm"/></div>
        <div>
            <div class="user-box">
                <h3>${message.creator.username}</h3>
                <span>Tham gia <fmt:formatDate value="${message.creator.joinDate}"
                                               pattern="dd-MM-yyyy HH:mm"/></span>
            </div>
            <div class="message-box">
                <div class="title">
                    <b>${message.title}</b>
                    <a href="reply-topic?id=${topic.id}" class="answer">Trả lời</a>
                </div>
                <p>
                        ${message.content}
                </p>
            </div>
        </div>
    </div>
</c:forEach>
<br>
<a href="list-topics" style="float: right">Danh sách chủ đề</a>
<br><br>
</body>
</html>
