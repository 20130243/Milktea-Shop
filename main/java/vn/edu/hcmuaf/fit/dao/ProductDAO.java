package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class ProductDAO extends RD {
    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM product   ORDER BY id DESC")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE id=? ORDER BY id")
                        .bind(0, id)
                        .mapToMap()
                        .first());
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
    public void updateStatus(int id,int status){
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE product SET status=:status WHERE id=:id")
                        .bind("id", id)
                        .bind("status", status)
                        .execute()
        );
    }
    public int getTotalProduct() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from product").mapTo(Integer.class).first()
        );
    }

    /*
     * Tạo bởi: Lê Trọng Tình 20130440
     * Cập nhật: Lê Trọng Tình 20130440
     * */
    public List<Map<String, Object>> pagingProduct(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from product where status != 3\n" +
                        "order by id DESC \n" +
                        "LIMIT ? , 12;").bind(0, (index - 1) * 12).mapToMap().list()
        );
    }
    public List<Map<String, Object>> pagingProductAdmin(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from product \n" +
                        "order by id DESC \n" +
                        "LIMIT ? , 12;").bind(0, (index - 1) * 12).mapToMap().list()
        );
    }
    public List<Map<String, Object>> searchProduct(String search) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from product\n" +
                                "where name like ?").bind(0, "%" + search + "%")
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> getProductByCategory(int id_category) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from product\n" +
                                "where product.category_id = ?;").bind(0, id_category)
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> getProductNew() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from product\n" +
                                "ORDER BY product.id DESC LIMIT 8;")
                        .mapToMap()
                        .list()
        );
    }

    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        System.out.println(dao.pagingProduct(0));
    }

    public Map<String, Object> findFirst() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM product ORDER BY id DESC LIMIT 1")
                        .mapToMap().first());
    }

    public List<Map<String, Object>> getProductSale() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE status = 1  ")
                        .mapToMap()
                        .list()
        );
    }

}
