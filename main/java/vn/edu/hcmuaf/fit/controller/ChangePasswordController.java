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

                System.out.println(newPassword);
                System.out.println(comfirmPassword);


                boolean checkOldPassword =  password.equals(oldPassword);
                System.out.println(checkOldPassword);
                boolean checkComfirmPassword = newPassword.equals(comfirmPassword);
                System.out.println(checkComfirmPassword);
                if(oldPassword != null && newPassword != null && comfirmPassword != null
                        && checkOldPassword
                        && checkComfirmPassword ){
                    user.setPassword(userService.hashPassword(newPassword));
                    userService.update(user);
                    session.setAttribute("user", user);
                    response.sendRedirect("account.jsp");
                } else {
                    response.sendRedirect("changePassword.jsp");
                }



            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
