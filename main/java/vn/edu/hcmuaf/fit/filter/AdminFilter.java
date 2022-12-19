package vn.edu.hcmuaf.fit.filter;

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

//        User user =  (User) session.getAttribute("user");
//        if(user == null){
//            RequestDispatcher dd = request.getRequestDispatcher("/404.html");
//
//            dd.forward(request, response);
////            httpRespond.sendRedirect("404.html");
//        }else{
//            if(!(new UserService()).checkAdmin(user)){
//                RequestDispatcher dd = request.getRequestDispatcher("/404.html");
//
//                dd.forward(request, response);
//            }
//        }

        chain.doFilter(request, response);
    }
}
