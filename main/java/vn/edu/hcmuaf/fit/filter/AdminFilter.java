package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AdminFilter")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {


        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpRespond = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(true);


        User user = (User) session.getAttribute("user");
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null && user == null) {
            System.out.println("admin cookie");
            chain.doFilter(request, response);
        } else if (admin == null && user == null) {
            System.out.println("user not found");
            httpRespond.sendError(HttpServletResponse.SC_NOT_FOUND, "");
        } else if (admin == null && user != null) {
            if (!(new UserService()).checkAdmin(user)) {
                System.out.println("user not admin");
                httpRespond.sendError(HttpServletResponse.SC_NOT_FOUND, "");
            } else {
                System.out.println("admin not found");
                request.getRequestDispatcher("/admin-login").forward(request, response);
            }
        } else {
            chain.doFilter(request, response);
        }

    }
}
