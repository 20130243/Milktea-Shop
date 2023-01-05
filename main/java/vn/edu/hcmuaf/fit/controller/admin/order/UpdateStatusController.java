package vn.edu.hcmuaf.fit.controller.admin.order;

import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateStatusController", value = "/admin/order/UpdateStatusController")
public class UpdateStatusController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        OrderService orderService = new OrderService();
        orderService.updateStatus(id, status);
        if (status == 1) {
            response.getWriter().write("1");
        } else if (status == 2) {
            response.getWriter().write("2");
        }
    }
}
