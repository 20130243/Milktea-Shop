package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.PriceSize;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.Topping;
import vn.edu.hcmuaf.fit.dao.PriceSizeDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductService {
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

            List<Map<String, Object>> priceSize = new PriceSizeDAO().getByProductId((Integer) map.get("id"));
            List<PriceSize> priceSizeList = priceSizeList(priceSize);
            product.setPriceSize(priceSizeList);

            List<Topping> toppingList = (new ToppingService()).getByCategoryId((Integer) map.get("category_id"));
            product.setTopping(toppingList);

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

            List<Map<String, Object>> priceSize = new PriceSizeDAO().getByProductId((Integer) map.get("id"));
            List<PriceSize> priceSizeList = priceSizeList(priceSize);
            product.setPriceSize(priceSizeList);

            List<Topping> toppingList = (new ToppingService()).getByCategoryId((Integer) map.get("category_id"));
            product.setTopping(toppingList);

            list.add(product);
        }
        return list;
    }

    private List<PriceSize> priceSizeList(List<Map<String, Object>> priceSize) {
        List<PriceSize> priceSizeList = new ArrayList<PriceSize>();
        for (Map<String, Object> map : priceSize) {
            PriceSize priceSizeObj = new PriceSize();
            priceSizeObj.setId((Integer) map.get("id"));
            priceSizeObj.setProduct_id((Integer) map.get("product_id"));
            priceSizeObj.setPrice((Float) map.get("price"));
            priceSizeObj.setSize((String) map.get("name"));
            priceSizeObj.setOriginalPrice((Float) map.get("original_price"));
            priceSizeList.add(priceSizeObj);
        }
        return priceSizeList;
    }

    public Product getById(int id) {
        Map<String, Object> product = dao.getById(id);
        List<Map<String, Object>> priceSize = new PriceSizeDAO().getByProductId((Integer) product.get("id"));
        List<PriceSize> priceSizeList = priceSizeList(priceSize);

        List<Topping> toppingList = (new ToppingService()).getByCategoryId((Integer) product.get("category_id"));

        return new Product((Integer) product.get("id"), (String) product.get("name"), (Integer) product.get("category_id"),
                priceSizeList, (String) product.get("image"), (Integer) product.get("status"), toppingList);
    }

    public int getTotalProduct() {
        return dao.getTotalProduct();
    }

    public int getPriceSizeM(int id) {
        return (int) getById(id).getPriceSize().get(0).getPrice();
    }

    public int getPriceSizeL(int id) {
        try {
            return (int) getById(id).getPriceSize().get(1).getPrice();

        } catch (Exception e) {
            return getPriceSizeM(id);
        }
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public void insert(Product product) throws Exception {
        dao.insert(product.getName(), product.getIdCategory(), product.getImg(), product.getStatus());
        for (PriceSize priceSize : product.getPriceSize()) {
            (new PriceSizeDAO()).insert(product.getIdCategory(), priceSize.getSize(), priceSize.getOriginalPrice());
        }
    }

    public static void main(String[] args) {
        ProductService dao = new ProductService();
        System.out.println(dao.getPriceSizeL(1));
    }
}