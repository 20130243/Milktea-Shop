package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.services.BlogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogController", value = "/blog")
public class BlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BlogService blogService = new BlogService();
        List<Blog> allBlog = blogService.getAll();

        int sumBlog = allBlog.size();
        int endPage = sumBlog/9;
        System.out.println(endPage);
        if((sumBlog % 9) != 0){
            endPage++;
        }
        String indexPage = request.getParameter("index");
        int index;
        if(indexPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(indexPage);
        }

        List<Blog> pageBlogs = blogService.pageBlogs(index);

        request.setAttribute("endPage", endPage);
        request.setAttribute("pageIndex", index);
        request.setAttribute("listBlog", pageBlogs);
        request.getRequestDispatcher("blog.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
