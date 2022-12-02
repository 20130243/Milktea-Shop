package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class ToppingDAO extends RD {


    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM topping  ")
                        .mapToMap()
                        .list()
        );
    }

    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> toppingList = getAll();
        for (Map<String, Object> topping : toppingList) {
            if ((Integer) topping.get("id") == id) {
                return topping;
            }
        }
        return null;
    }

    public void insert(String name, float price, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO topping(name,price, status) VALUES(:name,:price, :status)")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("status", status)
                        .execute()
        );
    }

    public void update(int id, String name, float price, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE topping SET name=:name,price=:price, status=:status WHERE id=:id")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("status", status)
                        .bind("id", id)
                        .execute()
        );
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM topping WHERE id=:id")
                       .bind("id", id)
                       .execute()
        );
    }
}
