package com.ltw.forum.controller;

import com.ltw.forum.model.Topic;
import com.ltw.forum.service.ForumService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "list-topics", value = "/list-topics")
public class ListTopics extends HttpServlet {
    private ForumService forumService = ForumService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Topic> listTopics = forumService.getTopics();
        request.setAttribute("listTopics", listTopics);
        request.getRequestDispatcher("listTopics.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
