package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "forgotPassword", value = "/forgotPassword")
public class ForgotPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user-name");
        String email = request.getParameter("user-email");
        UserService userService = new UserService();
        if (username != null && email != null) {
            userService.passwordRecovery(username, email);
            response.sendRedirect("/login");
        } else {
            response.sendRedirect("/forgotPassword.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
