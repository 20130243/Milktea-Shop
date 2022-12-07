package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.dao.UserDAO;

import java.util.Map;

public class UserService {
    public User getById(int id) {
        Map<String, Object> user = new UserDAO().getById(id);
        if (user != null) {
            User result = new User();
            result.setId(id);
            result.setName((String) user.get("name"));
            result.setEmail((String) user.get("email"));
            result.setAddress((String) user.get("address"));
            result.setPhone((String) user.get("phone"));
            result.setLevel((String) user.get("level"));
            return result;
        }
        return null;
    }
}
