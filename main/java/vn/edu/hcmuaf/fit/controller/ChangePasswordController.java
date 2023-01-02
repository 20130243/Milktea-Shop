package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changePassword", value = "/changePassword")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            UserService userService = new UserService();
            if(user != null) {
                String password = user.getPassword();
                String oldPassword =userService.hashPassword((String) request.getParameter("password-old"));
                String newPassword = (String) request.getParameter("password-new");
                String comfirmPassword = (String) request.getParameter("password-new-confirm");
                boolean checkOldPassword =  password.equals(oldPassword);
                boolean checkComfirmPassword = newPassword.equals(comfirmPassword);
                if(oldPassword != null && newPassword != null && comfirmPassword != null
                        && checkOldPassword
                        && checkComfirmPassword ){
                    user.setPassword(userService.hashPassword(newPassword));
                    userService.update(user);
                    session.setAttribute("user", user);
                    response.sendRedirect("account");
                } else {
                    request.setAttribute("erorr_changePassword", "Mật khẩu cũ không đúng hoặc mật khẩu mới không khớp");
                    request.getRequestDispatcher("changePassword").forward(request, response);
                }
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
