package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ToppingOrderDAO extends RD {
    private static final String tableName = "topping_order";

    @Override
    public List<Map<String, Object>> getAll() throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName)
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

    public List<Map<String, Object>> getByOrderDetailId(int order_detail_id) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE order_detail_id = ?")
                        .bind(0, order_detail_id)
                        .mapToMap()
                        .list());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id =:id")
                        .bind("id", id).execute());
    }

    public void insert(int topping_id, int order_detail_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(topping_id,order_detail_id) VALUES(:topping_id,:order_detail_id)")
                        .bind("topping_id", topping_id)
                        .bind("order_detail_id", order_detail_id)
                        .execute()
        );
    }

    public Map<String, Object> findFirst() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM topping_order ORDER BY id DESC LIMIT 1")
                        .mapToMap().first());
    }

}
