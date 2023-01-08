package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class AdminDAO extends RD {
    private static final String tableName = "admin";

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName)
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        return checkId(id) ? JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .mapToMap()
                        .first()
        ) : null;
    }

    public boolean checkId(int id) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .mapTo(Integer.class).first());
        return a == 1;
    }

    public void insert(String username, String password, String name, String email, String phone, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(username,password,name,email,phone,level ) VALUES(:username,:password,:name,email,:phone,:level )")
                        .bind("username", username)
                        .bind("password", password)
                        .bind("name", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("level", level)
                        .execute()
        );
    }

    public void update(int id, String username, String name, String email, String phone, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET username=:username,name=:name,email=:email,phone=:phone,level=:level  WHERE id=:id ")
                        .bind("username", username)
                        .bind("name", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("level", level)
                        .bind("id", id)
                        .execute()
        );
    }

    public Map<String, Object> getByUserName(String username) {
        return checkUsername(username) ? JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE username=:username")
                        .bind("username", username)
                        .mapToMap()
                        .first()
        ) : null;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public boolean checkUsername(String username) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE username=:username")
                        .bind("username", username)
                        .mapTo(Integer.class).first());
        return a <= 1;
    }

    public Map<String, Object> login(String username, String password) {
        return checkValid(username, password) ?
                JDBIConnector.get().withHandle(h ->
                        h.createQuery("SELECT * FROM " + tableName + " WHERE username =:username and password=:password")
                                .bind("username", username)
                                .bind("password", password)
                                .mapToMap()
                                .first()) : null;

    }
    public Map<String, Object> login(String token) {
        return checkValid(token) ?
                JDBIConnector.get().withHandle(h ->
                        h.createQuery("SELECT * FROM " + tableName + " WHERE token =:token")
                                .bind("token", token)
                                .mapToMap()
                                .first()) : null;

    }
    public boolean checkValid(String username, String password) {
        int result = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE username =:username and password =:password")
                        .bind("username", username)
                        .bind("password", password)
                        .mapTo(Integer.class).first());
        return result == 1;
    }
    public boolean checkValid(String token) {
        int result = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE token =:token")
                        .bind("token", token)
                        .mapTo(Integer.class).first());
        return result == 1;
    }
    public void updateToken(int id,String token){
        JDBIConnector.get().withHandle(h->
                h.createUpdate("UPDATE  " + tableName + " SET token =:token WHERE id =:id")
                        .bind("token", token)
                        .bind("id", id)
                        .execute());
    }

}
