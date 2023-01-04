package vn.edu.hcmuaf.fit.controller.admin.sale;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.Sale;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.CouponService;
import vn.edu.hcmuaf.fit.services.ProductService;
import vn.edu.hcmuaf.fit.services.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Sale create", value = "/admin/sale/create")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Category> categoryList = (new CategoryService()).getAll();
            request.setAttribute("categoryList", categoryList);
            List<Product> productList = (new ProductService()).getAll();
            request.setAttribute("productList", productList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String name = request.getParameter("name");
            int percent = Integer.parseInt(request.getParameter("percent"));
            String date = request.getParameter("date");
            Date start_date = new CouponService().convertStart_Date(date);
            Date end_date = new CouponService().convertEnd_Date(date);
            String[] categories = request.getParameterValues("category");
            List<Category> categoryList = new ArrayList<>();
            if (categories != null) {
                for (String c : categories) {
                    Category cate = new Category();
                    cate.setId(Integer.parseInt(c.replaceAll(" ", "")));
                    categoryList.add(cate);
                }
            }
            String[] products = request.getParameterValues("product");
            List<Product> productList = new ArrayList<>();
            if (products !=null) {
                for (String c : products) {
                    Product pro = new Product();
                    pro.setId(Integer.parseInt(c.replaceAll(" ", "")));
                    productList.add(pro);
                }
            }

            new SaleService().insert(new Sale(0, name, percent, start_date, end_date, productList, categoryList));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/sale");
    }
}
