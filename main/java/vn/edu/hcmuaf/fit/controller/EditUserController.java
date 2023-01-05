package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "editUser", value = "/editUser")
public class EditUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String address = request.getParameter("address");
        UserService userService = new UserService();
        if(address != null) {
            String name = request.getParameter("first-name");
            String phone = request.getParameter("user-number");
            user.setName(name);
            user.setPhone(phone);
            user.setAddress(address);
            userService.update(user);
        } else {
            if(user!=null) {
                String name = request.getParameter("first-name");
                String email = request.getParameter("email-name");
                String phone = request.getParameter("user-number");
                user.setName(name);
                user.setEmail(email);
                user.setPhone(phone);
                userService.update(user);
            }
        }

        session.setAttribute("user", user);

        response.sendRedirect("account");
    }
}
