package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class AdminDAO extends RD {
    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM admin  ")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> adminList = getAll();
        for (Map<String, Object> admin : adminList) {
            if ((int) admin.get("id") == id) {
                return admin;
            }
        }
        return null;
    }

    public void insert(String username, String password, String name, String email, String phone, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO admin(username,password,name,email,phone,level ) VALUES(:username,:password,:name,email,:phone,:level )")
                        .bind("username", username)
                        .bind("password", password)
                        .bind("name", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("level", level)
                        .execute()
        );
    }

    public void update(int id, String username, String password, String name, String email, String phone, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE admin SET username=:username,password=:password,name=:name,email=:email,phone=:phone,level=:level  WHERE id=:id ")
                        .bind("username", username)
                        .bind("password", password)
                        .bind("name", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("level", level)
                        .bind("id", id)
                        .execute()
        );
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM admin WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }
}
