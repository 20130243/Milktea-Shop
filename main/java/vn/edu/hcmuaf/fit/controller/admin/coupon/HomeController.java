package vn.edu.hcmuaf.fit.controller.admin.coupon;

import vn.edu.hcmuaf.fit.bean.Coupon;
import vn.edu.hcmuaf.fit.services.CouponService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Coupon", value = "/admin/coupon")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        int index;
        if (page == null) {
            index = 1;
        } else {
            index = Integer.parseInt(page);
        }
        CouponService couponService = new CouponService();
        int count = couponService.getTotal();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }

        try {
            List<Coupon> couponList = null;
            couponList = couponService.getPaging(index);
            request.setAttribute("couponList", couponList);
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("coupon/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
