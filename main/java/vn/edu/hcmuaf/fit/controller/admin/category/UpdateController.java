package vn.edu.hcmuaf.fit.controller.admin.category;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.services.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CUpdateController", value = "/admin/category/update")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id: " + id);
        try {
            Category category = (new CategoryService()).getById(id);
            System.out.println(category.toString());
            request.setAttribute("object", category);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            (new CategoryService()).update(new Category(Integer.parseInt(request.getParameter("id").replaceAll("\\s+", "")), request.getParameter("name").substring(0, 1).toUpperCase() + request.getParameter("name").substring(1).toLowerCase(), Integer.parseInt(request.getParameter("status").replaceAll("\\s+", ""))));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/category");
    }
}
