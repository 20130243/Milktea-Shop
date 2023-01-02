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
            for (int i = 0; i < listMap.size(); i++) {
                Item item = new Item();
                Product product = new Product();
                int priceSizeId =(int) listMap.get(i).get("product_size_id");
                PriceSize priceSize = new PriceSizeService().getById(priceSizeId);
                product.setId(priceSize.getProduct_id());
                Product productInDatabase = new ProductService().getById(product.getId());
                product.setName(productInDatabase.getName());
                product.setIdCategory(productInDatabase.getIdCategory());
                product.setImg(productInDatabase.getImg());
                product.setStatus(productInDatabase.getStatus());
                product.addPriceSize(priceSize);
                int oroderDetailsId = (int) listMap.get(i).get("id");
                List<Map<String, Object>> mapToppings = topping_order_dao.getByOrderDetailId(oroderDetailsId);
                if(mapToppings.size() > 0){
                    for (int j = 0; j < mapToppings.size(); j++) {
                        int toppingId = (int) mapToppings.get(j).get("topping_id");
                        Topping topping = new ToppingService().getById(toppingId);
                        System.out.println(topping.toString());
                        product.addTopping(topping);
                    }
                } else {
                    product.setTopping(new ArrayList<>());
                }
                System.out.println(product.getPriceSize().toString());
                System.out.println(product.getTopping().toString());
                item.setId(product.getId());
                item.setProduct(product);
                int quantity = (int) listMap.get(i).get("quantity");
                item.setQuantity(quantity);
                item.updatePrice();
                item.setNote("");
                cart.setId(i);
                cart.addItem(item);

            }
        }
        return cart;
    }

    public List<Order> orderByUser(int userId) throws SQLException {
        List<Order> list = getOrderByUser(userId);
        System.out.println(list.size());
        for (Order order : list) {
                Cart cart = getCartByOrder(order.getId());
                User user = new UserService().getById(userId);
                cart.setCustomer(user);
                cart.setTotalMoney(order.getTotal());
                String idCoupon = (String) dao.getCouponIdByOrder(order.getId()).get("coupon_id");
                Coupon coupon = null;
                try {
                    if(idCoupon != null) {
                        int couponId = Integer.parseInt(idCoupon);
                        coupon = new CouponService().getById(couponId);
                    }
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                if(coupon != null) {
                    cart.setCoupon(coupon);
                }
                order.setCart(cart);
        }

        return list;
    }

    public static void main(String[] args) throws SQLException {
       CartOrderService test = new CartOrderService();
        System.out.println(test.orderByUser(4));
//        System.out.println(test.getCountOrderDetails(1));
//        System.out.println(test.getCartByOrder(2));
    }
}
