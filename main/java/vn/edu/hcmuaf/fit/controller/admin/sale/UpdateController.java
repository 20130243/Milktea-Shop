package vn.edu.hcmuaf.fit.controller.admin.sale;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.Sale;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProductService;
import vn.edu.hcmuaf.fit.services.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Sale update", value = "/admin/sale/update")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            List<Category> categoryList = (new CategoryService()).getAll();
            request.setAttribute("categoryList", categoryList);
            List<Product> productList = (new ProductService()).getAll();
            request.setAttribute("productList", productList);
            Sale sale = (new SaleService()).getById(id);
            request.setAttribute("object", sale);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        response.sendRedirect("/admin/sale");
    }
}
