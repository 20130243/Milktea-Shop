package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.PriceSize;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.dao.PriceSizeDAO;
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

            List<PriceSize> priceSizeList = new ArrayList<PriceSize>();
            List<Map<String, Object>> priceSize = new PriceSizeDAO().getByProductId((Integer) map.get("id"));
            for (Map<String, Object> mapsize : priceSize) {
                PriceSize priceSizeObj = new PriceSize();
                priceSizeObj.setPrice((Float) mapsize.get("price"));
                priceSizeObj.setSize((String) mapsize.get("size"));
                priceSizeList.add(priceSizeObj);
            }
            product.setPriceSize(priceSizeList);
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
        List<PriceSize> priceSizeList = new ArrayList<PriceSize>();
        List<Map<String, Object>> priceSize = new PriceSizeDAO().getByProductId((Integer) product.get("id"));
        for (Map<String, Object> map: priceSize) {
            PriceSize priceSizeObj = new PriceSize();
            priceSizeObj.setPrice((Float) map.get("price"));
            priceSizeObj.setSize((String) map.get("size"));
            priceSizeList.add(priceSizeObj);
        }
        return new Product((Integer) product.get("id"),(String) product.get("name"),(Integer) product.get("category_id"),
                priceSizeList,(String) product.get("image"),(Integer) product.get("status") );
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
