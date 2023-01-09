package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.services.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "Admin login", value = "/admin-login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("admin login");
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
            response.getWriter().write("1");
        } else {
            adminService.updateToken(admin);
            String save = request.getParameter("save");
            Cookie cAdminToken = new Cookie("tokenAdminID", admin.getToken());
            if (save != null) {
                cAdminToken.setMaxAge(60 * 60 * 24 * 7); // 7 days
                response.addCookie(cAdminToken);
            }else{
                cAdminToken.setMaxAge(0);
                cAdminToken.setValue("");
                cAdminToken.setPath("/");
                response.addCookie(cAdminToken);
            }
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", admin);
            System.out.println(admin);
            response.getWriter().write("2");
        }
    }
}
