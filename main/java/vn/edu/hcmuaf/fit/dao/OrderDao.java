package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class OrderDao extends RD {
    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM order")
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
                h.createUpdate("DELETE FROM order WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public static void insert(int user_id, String name, String phone, String address, String note, String coupon_id, String total) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO order(user_id,name,phone,address,note,coupon_id,total) VALUES(:user_id,:name,:phone,:address,:note,:coupon_id,:total)")
                        .bind("user_id", user_id)
                        .bind("name", name)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("note", note)
                        .bind("coupon_id", coupon_id)
                        .bind("total", total)
                        .execute()
        );
    }

    public void update(int id, String name, String phone, String address, String note, String coupon_id, String total) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE order SET name = :name,phone=:phone,address=:address,note=:note,coupon_id=: coupon_id,total=:total WHERE id =:id")
                        .bind("name", name)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("note", note)
                        .bind("coupon_id", coupon_id)
                        .bind("total", total)
                        .execute()

        );
    }

    public void updateStatus(int id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE order SET status = :status WHERE id = :id")
                        .bind("status", status)
                        .bind("id", id)
                        .execute());
    }
}
