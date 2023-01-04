package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class OrderDAO extends RD {
    private static final String tableName = "`order`";

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName)
                        .mapToMap()
                        .list());
    }

    @Override
    public Map<String, Object> getById(int id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id = ? " )
                        .bind(0,id)
                        .mapToMap()
                        .first());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public static void insert(int user_id, String name, String phone, String address, String note, int coupon_id, float total) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO `order`" + "(user_id,name,phone,address,note,coupon_id,total) VALUES(:user_id,:name,:phone,:address,:note,:coupon_id,:total)")
                        .bind("user_id", user_id)
                        .bind("name", name)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("note", note)
                        .bind("coupon_id", coupon_id == 0 ? null : coupon_id)
                        .bind("total", total)
                        .execute()
        );
    }

    public void update(int id, String name, String phone, String address, String note, int coupon_id, float total) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET id = :id, name = :name,phone=:phone,address=:address,note=:note,coupon_id=: coupon_id,total=:total WHERE id =:id")
                        .bind("id", id)
                        .bind("name", name)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("note", note)
                        .bind("coupon_id", coupon_id)
                        .bind("total", total)
                        .execute()

        );
    }

    public int getTotal() {
        int count = JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from " + tableName + "").mapTo(Integer.class).first()
        );
        return count;
    }


    public List<Map<String, Object>> paging(int index) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName + "order by id LIMIT ? , 10;")
                        .bind(0, (index - 1) * 10)
                        .mapToMap()
                        .list()
        );
    }


    public void updateStatus(int id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET status = :status WHERE id = :id")
                        .bind("status", status)
                        .bind("id", id)
                        .execute());
    }

    public void updateCoupon(int id, int couponID) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET coupon_id = :coupon_id WHERE id = :id")
                        .bind("coupon_id", couponID)
                        .bind("id", id)
                        .execute());
    }

    public Map<String, Object> findFirst() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM `order` ORDER BY id DESC LIMIT 1")
                        .mapToMap().first());
    }

    public List<Map<String, Object>> getOrderByUser(int userID) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * from `order` \n" +
                                "WHERE user_id = :user_id")
                        .bind("user_id", userID)
                        .mapToMap()
                        .list());
    }
    public Map<String, Object> getOrderByUserAndOrder(int userID,int orderID) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * from `order` \n" +
                                "WHERE user_id = :user_id AND id=:order_id")
                        .bind("user_id", userID)
                        .bind("order_id", orderID)
                        .mapToMap()
                        .first());
    }

    public Map<String, Object> getCouponIdByOrder(int orderId) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT coupon_id FROM `order` WHERE id = :id")
                        .bind("id", orderId)
                        .mapToMap().first());
    }


}
