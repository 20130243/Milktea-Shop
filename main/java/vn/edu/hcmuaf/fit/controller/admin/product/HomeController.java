package vn.edu.hcmuaf.fit.controller.admin.product;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Admin-Product", value = "/admin/product")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String page = request.getParameter("page");
            int index;
            if (page == null) {
                index = 1;
            } else {
                index = Integer.parseInt(page);
            }
            ProductService productService = new ProductService();
            CategoryService categoryService = new CategoryService();
            int count = productService.getTotalProduct();
            int endPage = count / 12;
            if (count % 12 != 0) {
                endPage++;
            }

            List<Product> productList = productService.getPagingProductAdmin(index);
            List<Category> categoryList = categoryService.getAll();

            request.setAttribute("productList", productList);
            request.setAttribute("categoryList", categoryList);

            request.setAttribute("endPage", endPage);
            request.getRequestDispatcher("product/index.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
