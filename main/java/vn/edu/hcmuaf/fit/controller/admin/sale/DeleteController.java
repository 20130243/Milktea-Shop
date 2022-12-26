package vn.edu.hcmuaf.fit.controller.admin.sale;

import vn.edu.hcmuaf.fit.services.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Sale delete", value = "/admin/sale/delete")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SaleService sale = new SaleService();
        try {
            sale.delete(id);
            System.out.println("true");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/sale");
    }
}
