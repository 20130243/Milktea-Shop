package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PriceSizeDAO extends RD {

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM product_size  ")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> priceSizeList = getAll();
        for (Map<String, Object> product_size : priceSizeList) {
            if ((int) product_size.get("id") == id) {
                return product_size;
            }
        }
        return null;
    }
    public List<Map<String, Object>> getByProductId(int id) {
        List<Map<String, Object>> priceSizeList = getAll();
        List<Map<String, Object>> result = new ArrayList<>();
        for (Map<String, Object> product_size : priceSizeList) {
            if ((int) product_size.get("product_id") == id) {
                result.add(product_size);
            }
        }
        return result;
    }

    public void insert(int product_id, String name, float price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO product_size(product_id,name,price) VALUES(:product_id,:name,:price)")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("product_id", product_id)
                        .execute()
        );
    }

    public void update(int product_id, String name, float price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE product_size SET name=:name,price=:price WHERE id=:product_id")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("id", product_id)
                        .execute());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM product_size WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(new PriceSizeDAO().getByProductId(5));
    }
}
