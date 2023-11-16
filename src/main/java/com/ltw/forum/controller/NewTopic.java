package com.ltw.forum.controller;

import com.ltw.forum.model.Category;
import com.ltw.forum.model.Topic;
import com.ltw.forum.model.User;
import com.ltw.forum.service.ForumService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "new-topic", value = "/new-topic")
public class NewTopic extends HttpServlet {
    private ForumService forumService = ForumService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("newTopic.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        Integer id = forumService.getTopics().size() +1;
        Category cat1 = new Category("Học hành");
        Topic topic = new Topic(id, title, content, user, cat1);
        forumService.addTopic(topic);
        response.sendRedirect("list-topics");
    }
}
