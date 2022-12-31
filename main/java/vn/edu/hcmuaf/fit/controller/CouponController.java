package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Coupon;
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
        if(cart != null){
        if(coupon != null){
            System.out.println(coupon);
            try {
                List<Coupon> listCoupons = couponService.getAll();
                for (Coupon item:listCoupons) {
                    if(coupon.equals(item.getCode())){
                        Coupon newCoupon = item;
                        if(item.getQuantity() > 0) {
                            if (cart.getTotalMoney() >= item.getMin_price_order()) {
                                if(cart.getCoupon() == null) {
                                    cart.setCoupon(newCoupon);
                                    float pricePercent = (float) (item.getPercent() / 100.0) * cart.getTotalMoney();
                                    if (pricePercent > item.getMax_price_sale()) {
                                        pricePercent = item.getMax_price_sale();
                                    }
                                    cart.setTotalMoney(cart.getTotalMoney() - pricePercent);
                                    cart.setPriceSale(pricePercent);
                                    couponService.useCoupon(item);
                                } else {
                                    System.out.println("Mỗi giỏ hạng chỉ được 1 mã");
                                }
                            }
                        } else {
                            System.out.println("Hết số lượng");
                        }
                    }
                }
                if(cart.getItems().size() ==0) {
                    cart.setPriceSale(0);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        }
        response.sendRedirect("checkout");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
