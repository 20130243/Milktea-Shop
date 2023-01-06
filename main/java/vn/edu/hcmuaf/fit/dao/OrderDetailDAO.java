package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class OrderDetailDAO extends RD {
    private static final String tableName = "order_detail";

    @Override
    public List<Map<String, Object>> getAll() throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName +" ORDER BY id DESC")
                        .mapToMap()
                        .list());
    }

    @Override
    public Map<String, Object> getById(int id) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id = ?")
                        .bind(0, id)
                        .mapToMap()
                        .first());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id =:id")
                        .bind("id", id).execute());
    }

    public void insert(int order_id, int product_size_id, int quantity) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(order_id,product_size_id,quantity) VALUES(:order_id,:product_size_id,:quantity)")
                        .bind("order_id", order_id)
                        .bind("product_size_id", product_size_id)
                        .bind("quantity", quantity)
                        .execute()
        );
    }

    public List<Map<String, Object>> getByOrderId(int order_id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE order_id = ?  ORDER BY id DESC")
                        .bind(0, order_id)
                        .mapToMap()
                        .list());
    }

    public Map<String, Object> findFirst() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " ORDER BY id DESC LIMIT 1")
                        .mapToMap().first());
    }

    public Map<String, Object> getCountOrderDetail(int order_id) {
         return   JDBIConnector.get().withHandle(h ->
                h.createQuery("Select COUNT(*) AS soluong from order_detail\n" +
                                "WHERE order_detail.order_id = ?")
                        .bind(0, order_id)
                        .mapToMap()
                        .first());
    }


}
