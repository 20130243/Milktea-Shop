package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class SaleDetailDAO {
    public List<Map<String, Object>> getProductListBySaleId(int sale_id )throws SQLException {

        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT product_id FROM sale_detail WHERE sale_id = :sale_id")
                        .bind("sale_id", sale_id)
                        .mapToMap()
                        .list());
    }

    public List<Map<String, Object>> getCategoryListBySaleId(int sale_id) throws SQLException {

        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT category_id FROM sale_detail WHERE sale_id = :sale_id")
                        .bind("sale_id", sale_id)
                        .mapToMap()
                        .list());
    }

    public void insert(int sale_id, int product_id, int category_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("insert into sale_detail (sale_id,product_id,category_id) " +
                                "values (:sale_id,:product_id,:category_id)")
                        .bind("sale_id", sale_id)
                        .bind("product_id", product_id ==0 ?null : product_id)
                        .bind("category_id", category_id==0 ?null : category_id)
                        .execute()
        );
    }

    public void update(int id, int sale_id, int product_id, int category_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE sale_detail SET sale_id=:sale_id, product_id=:product_id, category_id=:category_id  WHERE id=:id")
                        .bind("sale_id", sale_id)
                        .bind("product_id", product_id==0 ?null : product_id)
                        .bind("category_id", category_id==0 ?null : category_id)
                        .bind("id", id)
                        .execute()
        );
    }

    public boolean checkProduct(int sale_id, int product_id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM sale_detail WHERE sale_id =:sale_id AND product_id =:product_id")
                        .bind("sale_id", sale_id)
                        .bind("product_id", product_id)
                        .mapTo(Integer.class)
                        .first()
        ) > 0;
    }

    public boolean checkCategory(int sale_id, int category_id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM sale_detail WHERE sale_id =:sale_id AND category_id =:category_id")
                        .bind("sale_id", sale_id)
                        .bind("category_id", category_id)
                        .mapTo(Integer.class)
                        .first()
        ) > 0;
    }

    public void delete(int sale_id, int product_id, int category_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM sale_detail WHERE sale_id=:sale_id AND product_id=:product_id AND category_id=:category_id")
                        .bind("sale_id", sale_id)
                        .bind("product_id", product_id)
                        .bind("category_id", category_id)
                        .execute());
    }
    public void deleteBySaleId(int sale_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM sale_detail WHERE sale_id=:sale_id")
                        .bind("sale_id", sale_id)
                        .execute());
    }
    public static void main(String[] args) throws SQLException {
        System.out.println(new SaleDetailDAO().getCategoryListBySaleId(10));
    }
}
