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
            rs.add(convertMapToProduct(map));
        }
        return rs;
    }

    public List<Product> getPagingProduct(int index) {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.pagingProduct(index);
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
        }
        return list;
    }public List<Product> getPagingProductAdmin(int index) {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.pagingProductAdmin(index);
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
        }
        return list;
    }

    public List<Product> sortASC(int index) {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.pagingProduct(index);
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
            list.sort((o1, o2) -> (int) (o1.getPriceSize().get(0).getPrice() - o2.getPriceSize().get(0).getPrice()));
        }
        return list;
    }

    public List<Product> sortDECS(int index) {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.pagingProduct(index);
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
            list.sort((o1, o2) -> (int) (o2.getPriceSize().get(0).getPrice() - o1.getPriceSize().get(0).getPrice()));
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

    public PriceSize getSizeM(int id) {
        return getById(id).getPriceSize().get(0);
    }

    public PriceSize getSizeL(int id) {
        try {
            return getById(id).getPriceSize().get(1);
        } catch (Exception e) {
            return getSizeM(id);
        }
    }

    public List<Product> searchProduct(String search) {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.searchProduct(search);
        for (Map<String, Object> map : productList) {
            rs.add(convertMapToProduct(map));
        }
        return rs;
    }

    public List<Product> getProductByCategory(int id_category) {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getProductByCategory(id_category);
        for (Map<String, Object> map : productList) {
            rs.add(convertMapToProduct(map));
        }
        return rs;
    }

    public List<Product> getProductSale() {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getProductSale();
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
        }
        return list;
    }


    public List<Product> getProductNew() {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getProductNew();
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


    public void delete(int id) {
//        (new PriceSizeService()).deleteByProductId(id);
        dao.updateStatus(id,3);
    }

    public void insert(Product product) throws Exception {
        dao.insert(product.getName(), product.getIdCategory(), product.getImg(), product.getStatus());
        for (PriceSize priceSize : product.getPriceSize()) {
            priceSize.setProduct_id(findFirst().getId());
            (new PriceSizeService()).insert(priceSize);
        }
    }

    public Product findFirst() throws Exception {
        Map<String, Object> product = dao.findFirst();
        List<PriceSize> priceSizeList = new PriceSizeService().getByProductId((Integer) product.get("id"));
        List<Topping> toppingList = (new ToppingService()).getByCategoryId((Integer) product.get("category_id"));
        return new Product((Integer) product.get("id"), (String) product.get("name"), (Integer) product.get("category_id"),
                priceSizeList, (String) product.get("image"), (Integer) product.get("status"), toppingList);

    }

    public void update(Product product) throws Exception {
        dao.update(product.getId(), product.getName(), product.getIdCategory(), product.getImg(), product.getStatus());

        for (PriceSize priceSize : product.getPriceSize()) {
            (new PriceSizeService()).updateByProductId(priceSize);
        }
    }

    public Product convertMapToProduct(Map<String, Object> map) {
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

        return product;
    }

    public static void main(String[] args) throws Exception {
        ProductService dao = new ProductService();
        System.out.println(dao.getPriceSizeL(1));
    }
}
