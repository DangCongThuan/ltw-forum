package com.ltw.forum.controller;

import com.ltw.forum.model.User;
import com.ltw.forum.service.ForumService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {
    private ForumService forumService = ForumService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String username = request.getParameter("username");
       String password = request.getParameter("password");
       HttpSession session = request.getSession();
        User user = forumService.checkUser(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("list-topics");
        } else  {
            request.setAttribute("mess", "Sai tên đăng nhập hoặc mật khẩu");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
