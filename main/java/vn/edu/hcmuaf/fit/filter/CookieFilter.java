package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.AdminService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "Cookie")
public class CookieFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpRespond = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(true);

        javax.servlet.http.Cookie cookies[] = httpRequest.getCookies();
        if (cookies != null) {
            for (javax.servlet.http.Cookie cookie : cookies) {
                if (cookie.getName().equals("tokenAdminID") && session.getAttribute("admin") == null ){
                    String token = cookie.getValue();
                    AdminService adminService = new AdminService();
                    Admin admin = adminService.login(token);
                    if (admin != null) {
                        System.out.println("admin cookie checked");
                        session.setAttribute("admin", admin);
                    } else {
                        System.out.println("admin null");
                    }
                }
                if (cookie.getName().equals("tokenID") && session.getAttribute("user") == null ) {
                    String token = cookie.getValue();
                    UserService userService = new UserService();
                    User user = userService.login(token);
                    System.out.println(user + " 1");
                    if (user != null) {
                        session.setAttribute("user", user);
                    } else {
                        System.out.println("user null");
                    }
                }
            }
        }
        chain.doFilter(request, response);
    }
}
