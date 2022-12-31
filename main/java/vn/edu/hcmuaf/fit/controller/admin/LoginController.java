package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.services.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Admin login", value = "/admin/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        AdminService adminService = new AdminService();
        String username = request.getParameter("username");
        String password = adminService.hashPassword(request.getParameter("password"));

        Admin admin = adminService.login(username, password);
        if (admin == null) {
            Map<String, String> messages = new HashMap<String, String>();
            messages.put("error_login", "Tên đăng nhập hoặc mật khẩu không đúng");
            messages.put("username", username);
            request.setAttribute("messages", messages);
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", admin);
            response.sendRedirect("/admin");
        }
    }
}
