package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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
        String password = request.getParameter("password");

        User user = userService.login(username, password);
        if (user == null) {
            request.setAttribute("error_register", "Tên đăng nhập hoặc mật khẩu không đúng.");
            response.getWriter().write("1");
        } else {
            userService.updateToken(user);
            String save = request.getParameter("save");
            Cookie cToken = new Cookie("tokenID", user.getToken());
            if (save != null) {
                cToken.setMaxAge(60 * 60 * 24 * 7); // 7 days
                response.addCookie(cToken);
            }

            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            response.getWriter().write("2");
        }
    }
}
