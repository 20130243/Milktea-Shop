package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.UserService;

import java.util.List;
import java.util.Map;

public class UserDAO extends RD {

    @Override
    public List<Map<String, Object>> getAll() {

        return JDBIConnector.get().withHandle(
                h -> h.createQuery("SELECT * FROM user")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> list = getAll();
        for (Map<String, Object> user : list) {
            if ((Integer) user.get("id") == id) {
                return user;
            }
        }
        return null;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM user WHERE id=:id").bind("id", id).execute());
    }

    public void insert(String username, String password, String name, String address, String phone, String email, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO user(username,password,name,address,phone,email,level) VALUES (:username, :password, :name,:address,:phone, :email,  :level)")
                        .bind("username", username)
                        .bind("password", password)
                        .bind("name", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("level", level)
                        .bind("address", address)
                        .execute());
    }

    public boolean checkUsername(String username) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM user WHERE username=:username")
                        .bind("username", username)
                        .mapTo(Integer.class).first());
        return a <= 1;
    }

    public void update(int id, String username, String password, String name, String address, String phone, String email, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE user SET username=:username,password=:password,name=:name,address=:address,phone=:phone,email=:email,level=:level WHERE id=:id")
                        .bind("username", username)
                        .bind("password", password)
                        .bind("name", name)
                        .bind("address", address)
                        .bind("phone", phone)
                        .bind("email", email)
                        .bind("level", level)
                        .bind("id", id)
                        .execute());

    }

    public int updatev1(int id, String username, String password, String name, String address, String phone, String email, int level) {

        return  JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE user SET username=:username,password=:password,name=:name,address=:address,phone=:phone,email=:email,level=:level WHERE id=:id")
                        .bind("username", username)
                        .bind("password", password)
                        .bind("name", name)
                        .bind("address", address)
                        .bind("phone", phone)
                        .bind("email", email)
                        .bind("level", level)
                        .bind("id", id)
                        .execute());

    }

    public Map<String,Object> login(String username, String password){
        if(!checkValid(username,password)){
            return null;
        }
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE username =:username and password=:password")
                        .bind("username", username)
                        .bind("password", password)
                        .mapToMap()
                        .first());

    }
public boolean checkValid(String username, String password){
        int result = JDBIConnector.get().withHandle(h->
                h.createQuery("SELECT COUNT(*) FROM user WHERE username =:username and password =:password")
                        .bind("username", username)
                        .bind("password", password)
                        .mapTo(Integer.class).first());
        if(result==1){
            return true;
        }else{
            return false;
        }
}
    public static void main(String[] args) {
//        System.out.println(new UserDAO().getAll());
//        System.out.println((new UserDAO()).checkUsername("manhha5842"));
//        System.out.println((new UserDAO()).login("abc","a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3"));
    }


}
