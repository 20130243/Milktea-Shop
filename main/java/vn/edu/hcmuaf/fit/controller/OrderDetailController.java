package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.CartOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "orderDetail", value = "/orderDetail")
public class OrderDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderid");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (orderId != null && user != null) {
            try {
                int id = Integer.parseInt(orderId);
                Order order = new CartOrderService().orderByUserAndOrderId(user.getId(), id);
                request.setAttribute("order", order);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("orderdetail.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("/").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
