package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.services.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Category", value = "/admin/category")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String indexPage = request.getParameter("page");
        int index;
        if(indexPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(indexPage);
        }
        CategoryService categoryService = new CategoryService();
        int count = categoryService.getTotal();
        int endPage = count/2;
        if(count % 12 != 0) {
            endPage++;
        }

        List<Category> listCategory = categoryService.getPaging(index);

        request.setAttribute("listProduct", listCategory);
        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("category.jsp").forward(request, response);
//        response.sendRedirect("category.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
