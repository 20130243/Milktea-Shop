package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.CartOrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "orderDetail", value = "/orderDetail")
public class OrderDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderid");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(orderId!=null && user != null) {
            try {
                List<Order> orders = new CartOrderService().orderByUser(user.getId());
                int id = Integer.parseInt(orderId);
                for (Order order : orders) {
                    if(order.getId()==id){
                        request.setAttribute("order",order);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        request.getRequestDispatcher("orderdetail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
