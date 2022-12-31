package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        OrderService orderService = new OrderService();
        if (cart != null && user != null) {
            String nameUser = request.getParameter("nameUser");
            String phoneUser = request.getParameter("phoneUser");
            String addressUser = request.getParameter("addressUser");
            String noteUser = request.getParameter("noteUser");
            if(nameUser.equals("") || phoneUser.equals("") || addressUser.equals("")) {
                String error = "Điền đầy đủ thông tin";
                request.setAttribute("errorCheckout", error);
                request.getRequestDispatcher("checkout").forward(request, response);
            } else {
                Order order = new Order();
                order.setUser_id(user.getId());
                order.setName(nameUser);
                order.setPhone(phoneUser);
                order.setTime(new Date(System.currentTimeMillis()));
                order.setAddress(addressUser);
                order.setNote(noteUser);
                order.setCart(cart);
                order.setTotal(cart.getTotalMoney());
                orderService.addOrder(order);
                response.sendRedirect("account.jsp#order");
            }

        } else if(user == null){
            String error = "Đăng nhập để thanh toán";
            request.setAttribute("errorCheckout", error);
            request.getRequestDispatcher("checkout").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}