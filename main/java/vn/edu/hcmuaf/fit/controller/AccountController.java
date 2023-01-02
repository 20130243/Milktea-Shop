package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.CartOrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "account", value = "/account")
public class AccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CartOrderService cartOrderService = new CartOrderService();
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        if(user != null) {
            List<Order> orders = new ArrayList<>();
            try {
                orders = cartOrderService.orderByUser(user.getId());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("orders", orders);
        }
        request.getRequestDispatcher("account.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
