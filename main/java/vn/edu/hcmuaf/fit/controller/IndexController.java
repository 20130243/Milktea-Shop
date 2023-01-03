package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexController", value = "")
public class IndexController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = request.getRequestURI();
        BlogService blogService = new BlogService();
        List<Blog> listBlog = blogService.getBlogIndex();
        ProductService productService = null;
        try {
            productService = new ProductService();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        List<Product> listProducts = productService.getProductNew();


        request.setAttribute("listBlog", listBlog);

        request.setAttribute("listProduct", listProducts);
        session.setAttribute("url", url);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
