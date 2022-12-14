package vn.edu.hcmuaf.fit.controller.admin.topping;

import vn.edu.hcmuaf.fit.services.ToppingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Topping delete", value = "/admin/topping/delete")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ToppingService toppingService = new ToppingService();
        try {
            toppingService.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/topping");
    }
}
