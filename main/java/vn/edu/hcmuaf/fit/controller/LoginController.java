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
        Cookie cookies[] = request.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("userC")){
                    request.setAttribute("user", cookie.getValue());
                }
                if(cookie.getName().equals("passC")){
                    request.setAttribute("pass", cookie.getValue());
                }
                if(cookie.getName().equals("saveC")){
                    request.setAttribute("save", cookie.getValue());
                }
            }
        }



        request.getRequestDispatcher("login-register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UserService userService = new UserService();
        String username = request.getParameter("username");
        String password = userService.hashPassword(request.getParameter("password"));

        String save = request.getParameter("save");

        Cookie cUser = new Cookie("userC", username);
        Cookie cPass = new Cookie("passC", request.getParameter("password"));
        Cookie cSave = new Cookie("saveC", save);

        if(save!=null) {
            cUser.setMaxAge(60*60*24*7); // 7 days
            cPass.setMaxAge(60*60*24*7);
            cSave.setMaxAge(60*60*24*7);
        } else {
            cUser.setMaxAge(0);
            cPass.setMaxAge(0);
            cSave.setMaxAge(0);
        }

        response.addCookie(cUser);
        response.addCookie(cPass);
        response.addCookie(cSave);
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
