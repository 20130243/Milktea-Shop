package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

public class CategoryDAO {
    public List<Category> getAllCategories() {
        List<String> categoryList = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM category  ")
                        .mapTo(String.class)
                        .stream()
        );
        System.out.println(categoryList);
        return null;
    }

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        List<Category> categories = dao.getAllCategories();

    }
}
