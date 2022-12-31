package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Item;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.PriceSize;
import vn.edu.hcmuaf.fit.bean.Topping;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.dao.OrderDetailDAO;
import vn.edu.hcmuaf.fit.dao.ToppingOrderDAO;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
        dao.insert(order.getUser_id(), order.getName(), order.getPhone(), order.getTime(),
                order.getAddress(), order.getNote(), order.getCoupon_id(), order.getTotal());
    }
    public void update(Order order) {
        dao.update(order.getId(), order.getName(), order.getPhone(), order.getAddress(), order.getNote(),order.getCoupon_id(),order.getTotal());
    }

    public void addOrder(Order order){
        try {
            insert(order);
            List<Order> listOrder = getAll();
            System.out.println(listOrder.size());
            for (Order item : listOrder) {
                order.setId(item.getId());
            }
            List<Item> items = order.getCart().getItems();
            for (Item item : items) {
            detail_dao.insert(order.getId(), item.getProduct().getPriceSize().get(0).getProduct_id(),item.getQuantity());
            List<Topping> toppings = item.getProduct().getTopping();
            for (Topping topping : toppings) {
                topping_order_dao.insert(topping.getId(),item.getProduct().getPriceSize().get(0).getProduct_id(),order.getId());
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


    public Order convertMaptoOrder(Map<String, Object> map) throws SQLException {
        Order order = new Order();
        order.setId((Integer) map.get("id"));
        order.setUser_id((Integer) map.get("user_id"));
        order.setName((String) map.get("name"));
        order.setPhone((String) map.get("phone"));
        order.setAddress((String) map.get("address"));
        order.setNote((String) map.get("note"));
        order.setTime((Date) map.get("time"));
        order.setCoupon_id(map.get("coupon_id") != null ? (int) map.get("coupon_id") : 0);

//        List<Map<PriceSize, Map<Integer, Topping>>> product_price_quantity_topping = new ArrayList<Map<PriceSize, Map<Integer, Topping>>>();
//        List<Map<String, Object>> order_detail = detail_dao.getByOrderId(order.getId());
//        for (Map<String, Object> detail_map : order_detail) {
//
//            Map<PriceSize, Map<Integer, Topping>> price_quantity = new HashMap<PriceSize, Map<Integer, Topping>>();
//            //lay du lieu tu bang product_size chuyen thanh PriceSize
//            PriceSize priceSize = new PriceSizeService().getById((Integer) detail_map.get("product_size_id"));
//
//            Map<Integer, Topping> quantity_topping = new HashMap<Integer, Topping>();
//            // lay du lieu tu bang topping_order va chuyen thanh topping sau do them vao map
//            List<Map<String, Object>> topping_order = topping_order_dao.getByOrderDetailId((Integer) detail_map.get("id"));
//            for (Map<String, Object> topping_order_map : topping_order) {
//                Topping topping = new ToppingService().getById((Integer) topping_order_map.get("topping_id"));
//                quantity_topping.put((Integer) detail_map.get("quantity"), topping);
//            }
//            price_quantity.put(priceSize, quantity_topping);
//            product_price_quantity_topping.add(price_quantity);
//        }
//        order.setProduct_price_quantity_topping(product_price_quantity_topping);

        order.setTotal((float) map.get("total"));
        order.setStatus(Integer.parseInt((String) map.get("status")));
        return order;
    }

    public static void main(String[] args) {
        OrderService orderService = new OrderService();
        Order order = new Order();
        order.setUser_id(1);
        order.setName("Le Trong Tinh");
        order.setPhone("098652942");
        order.setTime(new Date(System.currentTimeMillis()));
        order.setAddress("1234565 adssada");
        order.setNote("");
        order.setTotal(10000);

        orderService.addOrder(order);
    }
}
