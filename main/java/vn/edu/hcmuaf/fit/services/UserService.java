package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.dao.UserDAO;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

public class UserService {
    UserDAO dao = new UserDAO();

    public User getById(int id) {
        Map<String, Object> user = dao.getById(id);
        if (user != null) {
            User result = new User();
            result.setId(id);
            result.setName((String) user.get("name"));
            result.setEmail((String) user.get("email"));
            result.setAddress((String) user.get("address"));
            result.setPhone((String) user.get("phone"));
            result.setLevel((Integer) user.get("level"));
            return result;
        }
        return null;
    }

    public void insert(User user) {
        dao.insert(user.getUsername(), user.getPassword(), user.getName(), user.getAddress(), user.getPhone(), user.getEmail(), user.getLevel());
    }

    public String hashPassword(String password) {
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public User login(User user) {
        Map<String, Object> map = dao.login(user.getUsername(), user.getPassword());
        if (map != null) {
            return null;
        } else {
            user.setId((int) map.get("id"));
            user.setUsername((String) map.get("username"));
            user.setPassword((String) map.get("password"));
            user.setName((String) map.get("name"));
            user.setEmail((String) map.get("email"));
            user.setPhone((String) map.get("phone"));
            user.setAddress((String) map.get("address"));
            user.setLevel((Integer) map.get("level"));
            user.setToken((String) map.get("token"));
            return user;
        }
    }

    public User login(String username, String password) {
        Map<String, Object> map = dao.login(username, password);
        if (map == null) {
            return null;
        } else {
            User user = new User();
            user.setId((int) map.get("id"));
            user.setUsername((String) map.get("username"));
            user.setPassword((String) map.get("password"));
            user.setName((String) map.get("name"));
            user.setEmail((String) map.get("email"));
            user.setPhone((String) map.get("phone"));
            user.setAddress((String) map.get("address"));
            user.setLevel((Integer) map.get("level"));
            user.setToken((String) map.get("token"));
            return user;
        }
    }

    public void update(User user){
        dao.update(user.getId(),user.getUsername(),user.getPassword(), user.getName(), user.getAddress(), user.getPhone(), user.getEmail(), user.getLevel());

    }

    public boolean checkUsername(User user) {
        return dao.checkUsername(user.getUsername());
    }

    public static void main(String[] args) {
//        User user = new UserService().login("tinh","435006d9f697e80c9b41332131b1c751523df0f1c900eb6a660294c8f52110dd");
//        user.setAddress("11111111");
//        user.setId(1);


    }
}
