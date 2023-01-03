package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/SearchController")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("search");
        ProductService service = null;
        try {
            service = new ProductService();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        CategoryService categoryService = new CategoryService();
        List<Product> listProduct = service.searchProduct(search);
        List<Category> listCategories = categoryService.getAll();
        listCategories.add(0, new Category(0,"Tất cả",0));
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("endPage", 0);
        request.setAttribute("tagCate", 0);
        request.setAttribute("sort", 0);

        session.setAttribute("url", request.getRequestURI());
        request.getRequestDispatcher("shop.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
