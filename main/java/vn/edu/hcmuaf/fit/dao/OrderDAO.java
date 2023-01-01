package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.OrderService;

import java.sql.Date;
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
        List<Map<String, Object>> orderList = getAll();
        for (Map<String, Object> order : orderList) {
            if ((int) order.get("id") == id) {
                return order;
            }
        }
        return null;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public static void insert(int user_id, String name, String phone, Date time, String address, String note, int coupon_id, float total) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO `order`" + "(user_id,name,phone,time,address,note,coupon_id,total) VALUES(:user_id,:name,:phone,:time,:address,:note,:coupon_id,:total)")
                        .bind("user_id", user_id)
                        .bind("name", name)
                        .bind("phone", phone)
                        .bind("time", time)
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
                h.createQuery("select * from " + tableName + "\n" +
                        "" + tableName + " by id\n" +
                        "LIMIT ? , 10;").bind(0, (index - 1) * 10).mapToMap().list()
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
                h.createQuery("SELECT * FROM " + tableName +"WHERE user_id = :user_id")
                        .bind("user_id", userID)
                        .mapToMap()
                        .list());
    }

}
