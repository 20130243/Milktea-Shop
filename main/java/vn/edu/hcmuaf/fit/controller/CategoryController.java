package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProducService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/category")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProducService productService = new ProducService();
        CategoryService categoryService = new CategoryService();
        List<Product> listProductByCategory = new ArrayList<Product>();
        String cid = request.getParameter("cid");
        int category_id = Integer.parseInt(cid);
        if(category_id == 0 ) {
            request.getRequestDispatcher( "/shop").include( request, response);
        } else {
            listProductByCategory = productService.getProductByCategory(category_id);
        }


        List<Category> listCategories = categoryService.getAll();
        listCategories.add(0, new Category(0,"Tất cả",0));
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listProduct", listProductByCategory);
        request.setAttribute("endPage", 0);
        request.setAttribute("tagCate", category_id);
        request.getRequestDispatcher("shop.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
