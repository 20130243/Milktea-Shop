package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class CategoryDAO extends RD {
    private static final String tableName = "category";

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + "  ")
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
        JDBIConnector.get().withHandle(h -> h.createUpdate("delete from " + tableName + " where id =?")
                .bind(0, id)
                .execute()
        );
    }

    public void deleteStatus(int id) {
        JDBIConnector.get().withHandle(h -> h.createUpdate("UPDATE " + tableName + " SET status = 2 where id =?")
                .bind(0, id)
                .execute()
        );
    }

    public void insert(String name, int status) throws Exception {
        JDBIConnector.get().withHandle(h -> h.createUpdate("insert into  " + tableName + "  (name, status ) values (?, ?)")
                .bind(0, name)
                .bind(1, status)
                .execute()
        );
    }

    public void update(int id, String name, int status) throws Exception {
        JDBIConnector.get().withHandle(h -> h.createUpdate("update  " + tableName + "  set name =?, status =? where id =?")
                .bind(0, name)
                .bind(1, status)
                .bind(2, id)
                .execute()
        );
    }

    public int getTotal() {
        int count = JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from " + tableName).mapTo(Integer.class).first()
        );
        return count;
    }

    public List<Map<String, Object>> paging(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName +
                        " order by id DESC \n" +
                        "LIMIT ? , 10;").bind(0, (index - 1) * 10).mapToMap().list()
        );
    }
}
