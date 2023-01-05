package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Item;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.Topping;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.dao.OrderDetailDAO;
import vn.edu.hcmuaf.fit.dao.ToppingOrderDAO;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderService {
    private static final OrderDAO dao = new OrderDAO();
    private static final OrderDetailDAO detail_dao = new OrderDetailDAO();
    private static final ToppingOrderDAO topping_order_dao = new ToppingOrderDAO();

    public List<Order> getAll() throws SQLException {
        List<Order> result = new ArrayList<Order>();
        List<Map<String, Object>> list = dao.getAll();
        if (list == null) return null;
        for (Map<String, Object> map : list) {
            result.add(convertMaptoOrder(map));
        }
        return result;
    }


    public List<Order> getPaging(int index) throws SQLException {
        List<Order> result = new ArrayList<>();
        List<Map<String, Object>> list = dao.paging(index);
        if (list == null) return null;
        for (Map<String, Object> map : list) {
            result.add(convertMaptoOrder(map));
        }
        return result;
    }

    public int getTotal() {
        return dao.getTotal();
    }

    public void insert(Order order) {
        dao.insert(order.getUser_id(), order.getName(), order.getPhone(),
                order.getAddress(), order.getNote(), order.getCart().getCoupon() == null ? 0:order.getCart().getCoupon().getId(), order.getTotal());
    }
    public void update(Order order) {
        dao.update(order.getId(), order.getName(), order.getPhone(), order.getAddress(), order.getNote(),order.getCart().getCoupon().getId(),order.getTotal());
    }


    public void addOrder(Order order){
        try {
            insert(order);
//            updateCoupon(order,order.getCart().getCoupon().getId());
            List<Order> listOrder = getAll();
            for (Order item : listOrder) {
                order.setId(item.getId());
            }
            List<Item> items = order.getCart().getItems();
            for (Item item : items) {
            detail_dao.insert(order.getId(), item.getProduct().getPriceSize().get(0).getProduct_id(),item.getQuantity());
            List<Topping> toppings = item.getProduct().getTopping();
            for (Topping topping : toppings) {
                topping_order_dao.insert(topping.getId(),order.getId());
            }
        }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void delete(int id) throws Exception {
        dao.delete(id);
    }

    public void updateStatus(Order order, int status) {
        dao.updateStatus(order.getId(), status);
    }
    public void updateStatus(int id, int status) {
        dao.updateStatus(id, status);
    }

    public void updateCoupon(Order order, int coupon_id) {
        dao.updateCoupon(order.getId(), coupon_id);
    }


    public Order convertMaptoOrder(Map<String, Object> map) throws SQLException {
        Order order = new Order();
        order.setId((Integer) map.get("id"));
        order.setUser_id((Integer) map.get("user_id"));
        order.setName((String) map.get("name"));
        order.setPhone((String) map.get("phone"));
        order.setTime(Timestamp.valueOf((LocalDateTime) map.get("time")) );
        order.setAddress((String) map.get("address"));
        order.setNote((String) map.get("note"));

        order.setTotal((float) map.get("total"));
        order.setStatus(Integer.parseInt((String) map.get("status")));
        return order;
    }

    public static void main(String[] args) {

    }
}
