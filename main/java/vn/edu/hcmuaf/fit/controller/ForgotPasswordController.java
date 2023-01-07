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
            try {
                if (userService.checkUsernameAndMail(username, email)) {
                    userService.passwordRecovery(username, email);
                    response.sendRedirect("/login");
                } else {
                    request.setAttribute("error_forgotpassword","Tài khoản không tồn tại");
                    request.getRequestDispatcher("/forgotPass.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("error_forgotpassword","Nhập tài khoản và email");
            request.getRequestDispatcher("/forgotPass.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
