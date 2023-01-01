package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Coupon;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.CouponService;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "coupon", value = "/coupon")
public class CouponController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CouponService couponService = new CouponService();
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String coupon = request.getParameter("coupon");
        User user = (User) session.getAttribute("user");
        if(user != null) {
            if (cart != null) {
                if (coupon != null) {
                    try {
                        List<Coupon> listCoupons = couponService.getAll();
                        for (Coupon item : listCoupons) {
                            if (coupon.equals(item.getCode())) {
                                Coupon newCoupon = item;
                                if (newCoupon.getQuantity() > 0) {
                                    if (cart.getTotalMoney() >= newCoupon.getMin_price_order()) {
                                        if (cart.getCoupon() == null) {
                                            cart.setCoupon(newCoupon);
                                            float pricePercent = (float) (item.getPercent() / 100.0) * cart.getTotalMoney();
                                            if (pricePercent > item.getMax_price_sale()) {
                                                pricePercent = item.getMax_price_sale();
                                            }
                                            cart.setTotalMoney(cart.getTotalMoney() - pricePercent);
                                            cart.setPriceSale(pricePercent);
                                            couponService.useCoupon(item);
                                            session.setAttribute("cart", cart);
                                        }
                                    }
                                } else {
                                    String errorCoupon = "102";
                                    session.setAttribute("errorCheckout", errorCoupon);
                                }
                                cart.setCoupon(newCoupon);
                            }
                        }
                        if (cart.getItems().size() == 0) {
                            cart.setPriceSale(0);
                        }

                        session.setAttribute("cart", cart);

                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        } else {
            String error = "204";
            session.setAttribute("errorCheckout", error);
        }
        request.getRequestDispatcher("checkout").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
