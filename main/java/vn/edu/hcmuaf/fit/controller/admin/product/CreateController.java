package vn.edu.hcmuaf.fit.controller.admin.product;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.services.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateController", value = "/admin/category-create")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("category/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            (new CategoryService()).insert(new Category(0, request.getParameter("name"), Integer.parseInt(request.getParameter("status").replaceAll("\\s+", ""))));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/category");
    }
}
