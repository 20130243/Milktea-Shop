package vn.edu.hcmuaf.fit.controller.admin.blog;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.services.BlogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Blog", value = "/admin/blog")
public class    HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        int index;
        if(page == null) {
            index = 1;
        } else {
            index = Integer.parseInt(page);
        }
        BlogService blogService = new BlogService();
        int count = blogService.getTotal();
        int endPage = count/10;
        if(count % 10 != 0) {
            endPage++;
        }

        List<Blog> blogList = blogService.getPaging(index);

        request.setAttribute("blogList", blogList);
        request.setAttribute("endPage", endPage);
        System.out.println(endPage);
        request.getRequestDispatcher("blog/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
