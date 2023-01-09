package vn.edu.hcmuaf.fit.controller.admin.category;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.services.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Category create", value = "/admin/category/create")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            (new CategoryService()).insert(new Category(0, request.getParameter("name"), Integer.parseInt(request.getParameter("status").replaceAll("\\s+", ""))));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }
}
