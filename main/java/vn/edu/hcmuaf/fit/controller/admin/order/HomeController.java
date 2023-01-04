package vn.edu.hcmuaf.fit.controller.admin.order;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Order", value = "/admin/order")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        int index;
        if(page == null) {
            index = 1;
        } else {
            index = Integer.parseInt(page);
        }
        OrderService orderService = new OrderService();
        int count = orderService.getTotal();
        int endPage = count/10;
        if(count % 10 != 0) {
            endPage++;
        }

        List<Order> orderList = null;
        try {
            orderList = orderService.getPaging(index);
            request.setAttribute("orderList", orderList);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("order/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
