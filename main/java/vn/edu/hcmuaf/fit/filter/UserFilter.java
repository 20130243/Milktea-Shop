package vn.edu.hcmuaf.fit.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "UserFilter")
public class UserFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpRespond = (HttpServletResponse) response;
        HttpSession session = ((HttpServletRequest) request).getSession(true);
        String url = httpRequest.getServletPath();
//        if (session.getAttribute("user") == null) {
//            httpRespond.sendRedirect("login-register.jsp");
//        }


        chain.doFilter(request, response);
    }
}
