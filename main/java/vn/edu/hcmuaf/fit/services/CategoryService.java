package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.dao.CategoryDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CategoryService {
    private final CategoryDAO dao = new CategoryDAO();

    public List<Category> getAll() {
        List<Category> result = new ArrayList<Category>();
        List<Map<String, Object>> categoryList = dao.getAll();
        for (Map<String, Object> map : categoryList) {
            Category category = new Category();
            category.setId((Integer) map.get("id"));
            category.setName((String) map.get("name"));
            category.setStatus((Integer) map.get("status"));
            result.add(category);
        }
        return result;
    }

    public Category getById(int id) throws Exception {
        Map<String, Object> category = dao.getById(id);
        return new Category((Integer) category.get("id"),(String) category.get("name"),(Integer) category.get("status"));
    }
    public void insert(Category category) throws Exception {
        dao.insert(category.getName(),category.getStatus());
    }
    public void update(Category category) throws Exception {
        dao.update(category.getId(), category.getName(),category.getStatus());
    }

    public static void main(String[] args) throws Exception {
        System.out.println(new CategoryService().getAll());
    }
}
