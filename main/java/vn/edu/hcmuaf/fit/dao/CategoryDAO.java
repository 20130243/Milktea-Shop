package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class CategoryDAO extends RD {

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM category  ")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> categoryList = getAll();
        for (Map<String, Object> category : categoryList) {
            if ((int) category.get("id") == id) {
                return category;
            }
        }
        return null;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h -> h.createUpdate("delete from category where id =?")
                .bind(0, id)
                .execute()
        );
    }

    public void insert(String name, int status) throws Exception {
        JDBIConnector.get().withHandle(h -> h.createUpdate("insert into category (name, status ) values (?, ?)")
                .bind(0, name)
                .bind(1, status)
                .execute()
        );
    }

    public void update(int id, String name, int status) throws Exception {
        JDBIConnector.get().withHandle(h -> h.createUpdate("update category set name =?, status =? where id =?")
                .bind(0, name)
                .bind(1, status)
                .bind(2, id)
                .execute()
        );
    }


}
