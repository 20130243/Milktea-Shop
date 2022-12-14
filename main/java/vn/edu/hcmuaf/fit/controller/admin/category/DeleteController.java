package vn.edu.hcmuaf.fit.controller.admin.category;

import vn.edu.hcmuaf.fit.services.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Category delete", value = "/admin/category/delete")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CategoryService category = new CategoryService();
        try {
            category.delete(id);
            System.out.println("true");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/category");
    }
}
