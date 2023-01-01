package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.dao.OrderDetailDAO;
import vn.edu.hcmuaf.fit.dao.ToppingOrderDAO;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CartOrderService {
    private static final OrderDAO dao = new OrderDAO();
    private static final OrderDetailDAO detail_dao = new OrderDetailDAO();
    private static final ToppingOrderDAO topping_order_dao = new ToppingOrderDAO();

    public void delete(int id) throws Exception {
        dao.delete(id);
    }

    public void insert(Order order) {
        dao.insert(order.getUser_id(), order.getName(), order.getPhone(), order.getTime(),
                order.getAddress(), order.getNote(), order.getCart().getCoupon() == null ? 0:order.getCart().getCoupon().getId(), order.getTotal());
    }
    public void update(Order order) {
        dao.update(order.getId(), order.getName(), order.getPhone(), order.getAddress(), order.getNote(),order.getCart().getCoupon().getId(),order.getTotal());
    }

    public Order convertMaptoOrder(Map<String, Object> map) throws SQLException {
        Order order = new Order();
        order.setId((Integer) map.get("id"));
        order.setUser_id((Integer) map.get("user_id"));
        order.setName((String) map.get("name"));
        order.setPhone((String) map.get("phone"));
        order.setTime((Date) map.get("time"));
        order.setAddress((String) map.get("address"));
        order.setNote((String) map.get("note"));
        order.setTotal((float) map.get("total"));
//        String coupon_id = (String) map.get("coupon_id");
//        if (coupon_id != null) {
//
//        }

        order.setStatus(Integer.parseInt((String) map.get("status")));
        return order;
    }

    public void addOrder(Order order) throws SQLException {
        insert(order);
        Cart cart = order.getCart();
        Order orderNew = getOrderFirst();
        List<Item> items = cart.getItems();
        if(items.size() > 0) {
            for (Item item : items) {
                detail_dao.insert(orderNew.getId(),item.getProduct().getPriceSize().get(0).getProduct_id(),item.getQuantity());
                OrderDetail orderDetailNew = getOrderDetailFirst();
                List<Topping> toppings = item.getProduct().getTopping();
                if(toppings.size() > 0) {
                    for (Topping topping : toppings) {
                        topping_order_dao.insert(topping.getId(),orderDetailNew.getId());
                    }
                }
            }
        }
    }

    public Order getOrderFirst() throws SQLException {
        Map<String, Object> map = dao.findFirst();
        return convertMaptoOrder(map);
    }

    public OrderDetail getOrderDetailFirst() throws SQLException {
        Map<String, Object> map = detail_dao.findFirst();
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setId((Integer) map.get("id"));
        orderDetail.setOrder_id((Integer) map.get("order_id"));
        orderDetail.setProduct_size_id((Integer) map.get("product_size_id"));
        orderDetail.setQuantity_((Integer) map.get("quantity"));
        return orderDetail;
    }

    public List<Order> getOrderByUser(int userId) throws SQLException {
        List<Order> result = new ArrayList<Order>();
        List<Map<String, Object>> list = dao.getOrderByUser(userId);
        if (list == null) return null;
        for (Map<String, Object> map : list) {
            result.add(convertMaptoOrder(map));
        }
        return result;
    }

    public Cart getCartByOrder(int orderId) throws SQLException {
        Cart cart = new Cart();
        List<Map<String, Object>> listMap = detail_dao.getByOrderId(orderId);
        if(listMap.size() > 0) {
            Product product = new Product();
            Item item = new Item();
            for(int i = 0; i < listMap.size(); i++) {
                int productId = (int) listMap.get(i).get("product_size_id");
                PriceSize priceSize = new PriceSizeService().getById(productId);
                List<PriceSize> priceSizeList = new ArrayList<>();
                priceSizeList.add(priceSize);
                product.setId(priceSize.getProduct_id());
                Product productInDtb = new ProductService().getById(product.getId());
                product.setName(productInDtb.getName());
                product.setPriceSize(priceSizeList);
                product.setImg(productInDtb.getImg());
                product.setStatus(productInDtb.getStatus());
                List<Topping> listTopping = new ArrayList<>();
                List<Map<String, Object>> listToppingMap = topping_order_dao.getByOrderDetailId(orderId);
                int order_detail_id = (int) listMap.get(i).get("id");
                if(listToppingMap.size() > 0) {
                    for(int j = 0; j < listToppingMap.size(); j++){
                        int topping_order_dt_id = (int) listToppingMap.get(i).get("order_detail_id");
                        if(order_detail_id==topping_order_dt_id){
                            int toppingId = (int) listToppingMap.get(i).get("topping_id");
                            Topping topping = new ToppingService().getById(toppingId);
                            listTopping.add(topping);
                        }
                    }
                }
                int quantity = (int) listMap.get(i).get("quantity");
                product.setTopping(listTopping);
                item.setId(product.getId());
                item.setProduct(product);
                item.setQuantity(quantity);
                item.updatePrice();
                cart.setItems(new ArrayList<Item>());
                cart.addItem(item);
            }
        }

        return cart;
    }

    public List<Order> orderByUser(int userId) throws SQLException {
        List<Order> list = getOrderByUser(userId);
        List<Order> rs = new ArrayList<Order>();
        for (Order order : list) {
                Cart cart = getCartByOrder(order.getId());
                order.setCart(cart);
        }

        return list;
    }

    public static void main(String[] args) throws SQLException {
       CartOrderService test = new CartOrderService();
        System.out.println(test.orderByUser(3));
    }
}
