package com.ltw.forum.controller;

import com.ltw.forum.model.Category;
import com.ltw.forum.model.Message;
import com.ltw.forum.model.Topic;
import com.ltw.forum.model.User;
import com.ltw.forum.service.ForumService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "reply-topic", value = "/reply-topic")
public class ReplyTopic extends HttpServlet {
    private ForumService forumService = ForumService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Topic topic = forumService.findTopic(id);
        request.setAttribute("topic", topic);
        request.getRequestDispatcher("replyTopic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        Message message = new Message(title, content, user);
        forumService.findTopic(id).addMessage(message);
        response.sendRedirect("list-topics");
    }
}
