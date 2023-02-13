package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
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

    public List<Map<String, Object>> getByCategoryId(int id) {
        List<Map<String, Object>> toppingList = getAll();
        List<Map<String, Object>> result = new ArrayList<>();
        for (Map<String, Object> topping : toppingList) {
            if ((Integer) topping.get("category_id") == id) {
                result.add(topping);
            }
        }
        return result;
    }

    public void insert(String name, float price, int category_id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO topping(name,price,category_id, status) VALUES(:name,:price,:category_id, :status)")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("category_id", category_id)
                        .bind("status", status)
                        .execute()
        );
    }

    public void update(int id, String name, float price, int category_id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE topping SET name=:name,price=:price,category_id=:category_id, status=:status WHERE id=:id")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("category_id", category_id)
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

    public void updateStatus(int id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE topping SET status=:status WHERE id=:id")
                        .bind("status", status)
                        .bind("id", id)
                        .execute());
    }

    public List<Map<String, Object>> paging(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from topping\n" +
                        "order by id\n" +
                        "LIMIT ? , 10;").bind(0, (index - 1) * 10).mapToMap().list()
        );
    }

    public int getTotal() {
        int count = JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from topping").mapTo(Integer.class).first()
        );
        return count;
    }
}
