package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
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

    public void insert(String name, Date start_date, Date end_date){
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("insert into blog(name,start_date,end_date) values(:name,:start_date,:end_date)")
                       .bind("name",name)
                        .bind("start_date",start_date)
                        .bind("end_date",end_date).execute()
        );
    }

    public void update(int id, String name, Date start_date, Date end_date ) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("update blog set name =:name,start_date =:start_date,end_date =:end_date where id =:id")
                        .bind("name",name)
                        .bind("start_date",start_date)
                        .bind("end_date",end_date)
                        .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(new BlogDAO().getAll().size());
    }
}
