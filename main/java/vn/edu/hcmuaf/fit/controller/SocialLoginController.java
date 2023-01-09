package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SocialLoginController", value = "/Login")
public class SocialLoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        UserService userService = new UserService();

        String action = request.getParameter("action");


        if(action.equals("Face")){
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String id = request.getParameter("id");

            String password = email;

            User userNew = new User(0,id, password, name, "", "", email,0,"");

            if(userService.checkUsername(userNew)) {
                userNew = userService.login(userNew);
                session.setAttribute("user", userNew);
                response.sendRedirect("/");
            } else {
                userService.insert(userNew);
                userNew = userService.login(userNew);
                session.setAttribute("user", userNew);
                response.sendRedirect("/");
            }
        }
        if(action.equals("Google")){
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String id = request.getParameter("id");
            String password = email;
            System.out.println(password);

            User user = new User(0,id,password,name,"","",email,0,"");

            if(userService.checkUsername(user)){
                user = userService.login(user);
                session.setAttribute("user", user);
                response.sendRedirect("/");
            } else {
                userService.insert(user);
                user = userService.login(user);
                session.setAttribute("user", user);
                response.sendRedirect("/");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
