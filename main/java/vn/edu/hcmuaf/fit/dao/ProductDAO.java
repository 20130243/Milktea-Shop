package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class ProductDAO extends RD {
    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM product  ")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> productList = getAll();
        for (Map<String, Object> product : productList) {
            if ((int) product.get("id") == id) {
                return product;
            }
        }
        return null;
    }

    public static void insert(String name, int categoryID, String image, int status) throws Exception {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO product(name,category_id,image,status) VALUES(:name,:category_id,:image,:status)")
                        .bind("name", name)
                        .bind("category_id", categoryID)
                        .bind("image", image)
                        .bind("status", status)
                        .execute()
        );
    }

    public static void update(int id, String name, int categoryID, String image, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE product SET name=:name,category_id=:category_id,image=:image,status=:status WHERE id=:id")
                        .bind("name", name)
                        .bind("category_id", categoryID)
                        .bind("image", image)
                        .bind("status", status)
                        .bind("id", id)
                        .execute()
        );
    }


    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM product WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public int getTotalProduct() {
        int count = JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from product").mapTo(Integer.class).first()
        );
        return count;
    }

    /*
     * Tạo bởi: Lê Trọng Tình 20130440
     * Cập nhật: Lê Trọng Tình 20130440
     * */
    public List<Map<String, Object>> pagingProduct(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from product\n" +
                        "order by id\n" +
                        "LIMIT ? , 12;").bind(0, (index - 1) * 12).mapToMap().list()
        );
    }

    public Map<String, Object> findFirst() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM product ORDER BY id DESC LIMIT 1")
                        .mapToMap().first());
    }

}
