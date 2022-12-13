package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Topping;
import vn.edu.hcmuaf.fit.dao.ToppingDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ToppingService {
    private final ToppingDAO dao = new ToppingDAO();
    public List<Topping> getAll(){
        List<Topping> result = new ArrayList<>();
        List<Map<String, Object>> toppingList = dao.getAll();
        for (Map<String, Object> map : toppingList) {
            Topping topping = new Topping();
            topping.setId((Integer) map.get("id"));
            topping.setName((String) map.get("name"));
            topping.setPrice((float) map.get("price"));
            topping.setCategory_id((Integer) map.get("category_id"));
            topping.setStatus((Integer) map.get("status"));
            result.add(topping);
        }
        return result;
    }
    public List<Topping> getByCategoryId(int category_id){
        List<Topping> result = new ArrayList<>();
        List<Map<String, Object>> toppingList = dao.getByCategoryId(category_id);
        for (Map<String, Object> map : toppingList) {
            Topping topping = new Topping();
            topping.setId((Integer) map.get("id"));
            topping.setName((String) map.get("name"));
            topping.setPrice((float) map.get("price"));
            topping.setCategory_id((Integer) map.get("category_id"));
            topping.setStatus((Integer) map.get("status"));
            result.add(topping);
        }
        return result;
    }
    public List<Topping> getPaging(int index) {
        List<Topping> list = new ArrayList<>();
        List<Map<String, Object>> toppingList = dao.paging(index);
        for (Map<String, Object> map : toppingList) {
            Topping topping = new Topping();
            topping.setId((Integer) map.get("id"));
            topping.setName((String) map.get("name"));
            topping.setPrice((Float) map.get("price"));
            topping.setStatus((Integer) map.get("status"));
            topping.setCategory_id((Integer) map.get("category_id"));


            list.add(topping);
        }
        return list;
    }  public int getTotal() {
        return dao.getTotal();
    }

}
