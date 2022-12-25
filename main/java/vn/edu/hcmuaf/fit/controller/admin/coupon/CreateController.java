package vn.edu.hcmuaf.fit.controller.admin.coupon;

import vn.edu.hcmuaf.fit.bean.Coupon;
import vn.edu.hcmuaf.fit.services.CouponService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "Coupon create", value = "/admin/coupon/create")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String code = request.getParameter("code");
            int percent = Integer.parseInt(request.getParameter("percent"));
            float max_price_sale = Float.parseFloat(request.getParameter("max_price_sale"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float min_price_order = Float.parseFloat(request.getParameter("min_price_order"));
            java.sql.Date date_regis_acc = java.sql.Date.valueOf(request.getParameter("date_regis_acc"));
            int min_num_order = Integer.parseInt(request.getParameter("min_num_order"));
            String content = request.getParameter("content").isEmpty() ? "" : request.getParameter("content");

            String date = request.getParameter("date");
            Date start_date = new CouponService().convertStart_Date(date);
            Date end_date = new CouponService().convertEnd_Date(date);

            Coupon coupon = new Coupon(0, code, percent, max_price_sale, quantity, start_date, end_date, min_price_order, date_regis_acc, min_num_order, content);
            new CouponService().insert(coupon);
            response.sendRedirect("/admin/coupon");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
