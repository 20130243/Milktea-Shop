package vn.edu.hcmuaf.fit.controller.admin.coupon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Coupon create", value = "/admin/coupon/create")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println(request.getParameterMap().toString());
        String code = request.getParameter("code");
        int percent = Integer.parseInt(request.getParameter("percent"));
        float max_price_sale = Float.parseFloat(request.getParameter("max_price_sale"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        System.out.println(code+ percent+max_price_sale+quantity+request.getParameter("date")+request.getParameter("date_regis_acc"));
//        Date start_date = Date.valueOf(request.getParameter("start_date"));
//        Date end_date = Date.valueOf(request.getParameter("end_date"));
//        float min_price_order = Float.parseFloat(request.getParameter("min_price_order"));
//        Date date_regis_acc = Date.valueOf(request.getParameter("date_regis_acc"));
//        int min_num_order = Integer.parseInt(request.getParameter("min_num_order"));
//        String content = request.getParameter("content");
//        Coupon coupon = new Coupon(0, code, percent, max_price_sale, quantity, start_date, end_date, min_price_order, date_regis_acc, min_num_order, content);

    }
}
