package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProducService;
import vn.edu.hcmuaf.fit.services.SizeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listProducts", value = "/shop")
public class ProductsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        int index;
        if(indexPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(indexPage);
        }
        ProducService producService = new ProducService();
        CategoryService categoryService = new CategoryService();
        int count = producService.getTotalProduct();
        int endPage = count/12;
        if(count % 12 != 0) {
            endPage++;
        }
        int indexCate = 0;


        List<Product> listProduct = producService.getPagingProduct(index);
        List<Category> listCategories = categoryService.getAll();
        listCategories.add(0, new Category(0,"Tất cả",0));
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageIndex", index);
        request.setAttribute("tagCate", 0);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
