package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Login", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login-register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UserService userService = new UserService();
        String username = request.getParameter("username");
        String password = userService.hashPassword(request.getParameter("password"));

        User user = userService.login(username, password);
        if(user == null){
            request.setAttribute("error_register", "Tên đăng nhập hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
        }else{
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            response.sendRedirect("account");
        }
    }
}
