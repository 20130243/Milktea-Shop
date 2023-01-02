package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.CartOrderService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Servlet", value = "/cancel")
public class CancelOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String orderId = request.getParameter("orderid");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            OrderService  orderService = new OrderService();
            CartOrderService cartOrderService = new CartOrderService();
            if(orderId != null && user != null){
                int id = Integer.parseInt(orderId);
                try {
                    List<Order> orders = cartOrderService.orderByUser(user.getId());
                    Order order = new Order();
                    for (Order item : orders){
                        if(item.getId() == id){
                         order = item;
                        }
                    }
                    if(order.getStatus() < 1) {
                        orderService.updateStatus(order,3);
                        response.sendRedirect("account");
                    } else {
                        String error =  "101";
                        String url ="orderDetail?orderid="+order.getId();
                        System.out.println(url);
                        session.setAttribute("errorCancelOrder",error);
                        response.sendRedirect(url);
                    }

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
