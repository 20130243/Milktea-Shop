package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class BlogDAO extends RD {
    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from blog")
                        .mapToMap()
                        .list()
                );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> list = getAll();
        for (Map<String, Object> blog : list) {
            if((int) blog.get("id") == id) {
                return blog;
            }
        }
        return null;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("delete from blog where id =:id").bind("id",id)
                        .execute()
                );
    }

    public static void main(String[] args) {
        System.out.println(new BlogDAO().getAll().size());
    }
}
