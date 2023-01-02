package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class BlogDAO extends RD {
    private static final String tableName = "blog";

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName)
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> list = getAll();
        for (Map<String, Object> blog : list) {
            if ((int) blog.get("id") == id) {
                return blog;
            }
        }
        return null;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("delete from " + tableName + " where id =:id").bind("id", id)
                        .execute()
        );
    }

    public List<Map<String, Object>> getBlogIndex() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName +
                                " ORDER BY blog.id DESC LIMIT 3;")
                        .mapToMap()
                        .list()
        );
    }

    public void insert(String name, Date start_date, Date end_date) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("insert into " + tableName + "(name,start_date,end_date) values(:name,:start_date,:end_date)")
                        .bind("name", name)
                        .bind("start_date", start_date)
                        .bind("end_date", end_date).execute()
        );
    }

    public void update(int id, String name, String content, Date start_date, Date end_date, Date date) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("update " + tableName + " set name =:name,start_date =:start_date,end_date =:end_date where id =:id")
                        .bind("name", name)
                        .bind("start_date", start_date)
                        .bind("end_date", end_date)
                        .execute()
        );
    }

    public List<Map<String, Object>> pageBlog(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from blog LIMIT ?,9;")
                        .bind(0, (index - 1) * 9)
                        .mapToMap()
                        .list());
    }

    public int getTotal() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from " + tableName).mapTo(Integer.class).first()
        );
    }

    public List<Map<String, Object>> paging(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName +
                        " order by id DESC " +
                        " LIMIT ? , 10;").bind(0, (index - 1) * 10).mapToMap().list()
        );
    }

    public static void main(String[] args) {
        System.out.println(new BlogDAO().getAll().size());
    }
}
