package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.RevenueService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Admin", value = "/admin")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RevenueService revenue = new RevenueService();
        int customerThisMonth = revenue.customerThisMonth();
        request.setAttribute("customerThisMonth", customerThisMonth);
        double percentCustomer = revenue.percentCustomer();
        request.setAttribute("percentCustomer", percentCustomer);
        int orderThisMonth = revenue.orderThisMonth();
        request.setAttribute("orderThisMonth", orderThisMonth);
        double percentOrder = revenue.percentOrder();
        request.setAttribute("percentOrder", percentOrder);
        float totalThisMonth = revenue.totalThisMonth();
        request.setAttribute("totalThisMonth", totalThisMonth);
        double percentTotal = revenue.percentTotal();
        request.setAttribute("percentTotal", percentTotal);
        float totalThisWeek = revenue.totalThisWeek();
        request.setAttribute("totalThisWeek", totalThisWeek);
        float totalPreviousWeek = revenue.totalPreviousWeek();
        request.setAttribute("totalPreviousWeek", totalPreviousWeek);
        List<Float> totalPerDayThisWeek = revenue.totalPerDayThisWeek();
        request.setAttribute("totalPerDayThisWeek", totalPerDayThisWeek);
        List<Float> totalPerDayPreviousWeek = revenue.totalPerDayPreviousWeek();
        request.setAttribute("totalPerDayPreviousWeek", totalPerDayPreviousWeek);
        float totalToday = revenue.totalToday();
        request.setAttribute("totalToday", totalToday);
        List<Map<Product, Integer>> top5Product = revenue.listTop5Products();
        request.setAttribute("top5Product", top5Product);
        List<Map<Category, Float>> totalCategory = revenue.totalCategory();
        request.setAttribute("totalCategory", totalCategory);
        Map<Category, Double> categoryPercentList = revenue.listPercentCategory();
        request.setAttribute("categoryPercentList", categoryPercentList);
        try {
            List<Order> newOrderList = revenue.newOrderList();
            request.setAttribute("newOrderList", newOrderList);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        request.getRequestDispatcher("admin/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
