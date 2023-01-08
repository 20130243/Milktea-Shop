package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.dao.OrderDAO;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RevenueService {
    private OrderDAO dao = new OrderDAO();

    public int customerThisMonth() {
        return dao.countCustomerThisMonth();
    }

    public int customerPreviousMonth() {
        return dao.countCustomerPreMonth();
    }

    public double percentCustomer() {
        if (customerPreviousMonth() == 0 && customerThisMonth() == 0) return 0;
        if (customerPreviousMonth() == 0) return 100;
        if (customerThisMonth() == 0) return -100;
        int a = customerThisMonth() - customerPreviousMonth();
        return (double) Math.round(((a / customerPreviousMonth()) * 100 )* 100) / 100;
    }

    public int orderThisMonth() {
        return dao.countOrderThisMonth();
    }

    public int orderPreviousMonth() {
        return dao.countOrderPreMonth();
    }

    public double percentOrder() {
        if (orderPreviousMonth() == 0 && orderThisMonth() == 0) return 0;
        if (orderPreviousMonth() == 0) return 100;
        if (orderThisMonth() == 0) return -100;
        int a = orderThisMonth() - orderPreviousMonth();
        return (double) Math.round(((a / orderPreviousMonth()) * 100) * 100) / 100;
    }

    public float totalThisMonth() {
        return dao.sumTotalThisMonth();
    }

    public float totalPreviousMonth() {
        return dao.sumTotalPreMonth();
    }

    public double percentTotal() {
        if (totalPreviousMonth() == 0 && totalThisMonth() == 0) return 0;
        if (totalPreviousMonth() == 0) return 100;
        if (totalThisMonth() == 0) return -100;
        float a = totalThisMonth() - totalPreviousMonth();
        return (double) Math.round(((a / totalPreviousMonth()) * 100) * 100) / 100;
    }

    public float totalThisWeek() {
        return dao.sumTotalThisWeek();
    }

    public float totalPreviousWeek() {
        return dao.sumTotalPreWeek();
    }

    public float totalToday() {
        return dao.sumTotalToday();
    }

    public List<Map<Product, Integer>> listTop5Products() {
        List<Map<Product, Integer>> result = new ArrayList<>();
        for (Map<String, Object> map : dao.top5Product()) {
            Product product = new ProductService().getById((Integer) map.get("id"));
            int quantity = ((BigDecimal) map.get("quantity")).intValue();
            Map<Product, Integer> m = new HashMap<>();
            m.put(product, quantity);
            result.add(m);
        }
        return result;
    }

    public List<Map<Category, Float>> totalCategory() {
        List<Map<Category, Float>> result = new ArrayList<>();
        for (Map<String, Object> map : dao.totalCategory()) {
            Category category = new CategoryService().getById((Integer) map.get("id"));
            float total = ((Double) map.get("total")).floatValue();
            Map<Category, Float> m = new HashMap<Category, Float>();
            m.remove(category);
            m.put(category, total);
            result.add(m);
        }
        return result;
    }

    public Map<Category, Double> listPercentCategory() {
        Map<Category, Double> result = new HashMap<>();
        Map<Integer,Double> r = new HashMap<>();
        float sum = 0;
        for (Map<String, Object> map : dao.totalCategory()) {
            sum += ((Double) map.get("total")).floatValue();
        }
        for (Map<String, Object> map : dao.totalCategory()) {
            float total = ((Double) map.get("total")).floatValue();
            double percent = total != 0 ? (total / sum) * 100 : 0;
            r.put((Integer) map.get("id"),(double) Math.round(percent * 100) / 100);
        }
        List<Category> categoryList = new CategoryService().getAll();
        for (Category c : categoryList) {
            if(!r.containsKey(c.getId())){
                r.put(c.getId(),0.0);
            }
        }
        for(int c: r.keySet()){
            result.put(new CategoryService().getById(c),r.get(c));
        }

        return result;
    }

    public List<Order> newOrderList() throws SQLException {
        return new CartOrderService().newOrderList();
    }

    public List<Float> totalPerDayThisWeek() {
        return dao.perDayThisWeek();
    }

    public List<Float> totalPerDayPreviousWeek() {
        return dao.perDayPreWeek();
    }


    public static void main(String[] args) {

        System.out.println(new RevenueService().totalPerDayThisWeek());
        System.out.println(new RevenueService().totalPerDayPreviousWeek());
    }
}
