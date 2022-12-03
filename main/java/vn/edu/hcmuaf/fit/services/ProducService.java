package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProducService {
    private final ProductDAO dao = new ProductDAO();

    public List<Product> getAll() {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getAll();
        for (Map<String, Object> map : productList) {
            Product product = new Product();
            product.setId((Integer) map.get("id"));
            product.setName((String) map.get("name"));
            product.setIdCategory((Integer) map.get("category_id"));
            product.setImg((String) map.get("image"));
            product.setStatus((Integer) map.get("status"));
            rs.add(product);
        }
        return rs;
    }

    public List<Product> getPagingProduct(int index) {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.pagingProduct(index);
        for (Map<String, Object> map : productList) {
            Product product = new Product();
            product.setId((Integer) map.get("id"));
            product.setName((String) map.get("name"));
            product.setIdCategory((Integer) map.get("category_id"));
            product.setImg((String) map.get("image"));
            product.setStatus((Integer) map.get("status"));
            list.add(product);
        }
        return list;
    }

    public Product getById(int id) {
        Map<String, Object> product = dao.getById(id);
        return  new Product((Integer)product.get("id"), (String) product.get("name"),(Integer) product.get("idCategory"), (String) product.get("img"), (Integer) product.get("status"));
    }

    public int getTotalProduct() {
        return dao.getTotalProduct();
    }
    public static void main(String[] args) {
       ProducService dao = new ProducService();
       List<Product> list = dao.getPagingProduct(2);
        for (Product p : list
             ) {
            System.out.println(p);
        }
    }
}
