package com.ltw.forum.controller;

import com.ltw.forum.model.Topic;
import com.ltw.forum.service.ForumService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "show-topic", value = "/show-topic")
public class ShowTopic extends HttpServlet {
    private ForumService forumService = ForumService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Topic topic = forumService.findTopic(id);
        if (topic != null) {
            request.setAttribute("topic", topic);
            request.getRequestDispatcher("showTopic.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
