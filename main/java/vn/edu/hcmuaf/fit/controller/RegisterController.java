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

@WebServlet(name = "Register", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/login-register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String password = userService.hashPassword(request.getParameter("password"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        User user = new User(0, username, password, name, "", phone, email, 0, "");
        System.out.println(user);
        System.out.println(userService.checkUsername(user));
        if(userService.checkUsername(user)){
            userService.insert(user);
            user = userService.login(user);
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        }else{
            request.setAttribute("error_register", "Tên đăng nhập đã được sử dụng");
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
        }



    }
}