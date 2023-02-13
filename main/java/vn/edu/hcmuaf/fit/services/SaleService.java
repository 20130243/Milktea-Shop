package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.Sale;
import vn.edu.hcmuaf.fit.dao.SaleDAO;
import vn.edu.hcmuaf.fit.dao.SaleDetailDAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SaleService {

    private final SaleDAO dao = new SaleDAO();
    private final SaleDetailDAO detailDao = new SaleDetailDAO();

    public List<Sale> getAll() throws Exception {
        List<Sale> result = new ArrayList<Sale>();
        List<Map<String, Object>> saleList = dao.getAll();
        for (Map<String, Object> map : saleList) {
            result.add(convertMapToSale(map));
        }
        return result;
    }

    public List<Product> getProducts(Sale sale) throws Exception {
        List<Map<String, Object>> list = detailDao.getProductListBySaleId(sale.getId());
        List<Product> result = new ArrayList<>();
        for (Map<String, Object> map : list) {
            if (map.get("product_id") != null) {
                Product product = new ProductService().getById((Integer) map.get("product_id"));
                result.add(product);
            }

        }
        return result;
    }

    public List<Category> getCategories(Sale sale) throws Exception {
        List<Map<String, Object>> list = detailDao.getCategoryListBySaleId(sale.getId());
        List<Category> result = new ArrayList<Category>();
        for (Map<String, Object> map : list) {
            if(map.get("category_id")!=null) {
                Category category = new CategoryService().getById((Integer)map.get("category_id") );
                result.add(category);
            }

        }
        return result;
    }

    public Sale getById(int id) throws Exception {
        Sale sale = new Sale();
        Map<String, Object> map = dao.getById(id);
        return convertMapToSale(map);
    }

    public List<Sale> getSaleNotYet() throws Exception {
        List<Sale> result = new ArrayList<Sale>();
        List<Map<String, Object>> saleList = dao.getSaleNotYet();
        for (Map<String, Object> map : saleList) {
            result.add(convertMapToSale(map));
        }
        return result;
    }

    public void updatePrice() throws Exception {
        List<Sale> saleList = getSaleNotYet();
        List<Product> productSaleList = new ProductService().getProductSale();
        for (Product product : productSaleList) {
            product.resetPrice();
            new ProductService().update(product);
        }
        for (Sale sale : saleList) {
            if (sale.checkValid()) {
                List<Product> productList = getProducts(sale);

                for (Product product : productList) {
                    product.updateSale(sale.getPercent());
                    new ProductService().update(product);
                }
                List<Category> categoryList = getCategories(sale);
                for (Category category : categoryList) {
                    List<Product> products = new ProductService().getProductByCategory(category.getId());
                    for (Product product : products) {
                        product.updateSale(sale.getPercent());
                        new ProductService().update(product);
                    }
                }
            }
        }

    }

    public void insert(Sale sale) throws Exception {
        dao.insert(sale.getName(), sale.getPercent(), sale.getStart_date(), sale.getEnd_date());
        for (Product product : sale.getProductList()) {
            detailDao.insert(findFirst().getId(), product.getId(), 0);
        }
        for (Category category : sale.getCategoryList()) {
            detailDao.insert(findFirst().getId(), 0, category.getId());
        }
        updatePrice();
    }

    public Sale findFirst() throws Exception {
        Map<String, Object> sale = dao.findFirst();
        return convertMapToSale(sale);
    }

    public void update(Sale sale) throws Exception {

        dao.update(sale.getId(), sale.getName(), sale.getPercent(), sale.getStart_date(), sale.getEnd_date());
        detailDao.deleteBySaleId(sale.getId());
        for (Product product : sale.getProductList()) {
            detailDao.insert(sale.getId(), product.getId(), 0);
        }
        for (Category category : sale.getCategoryList()) {
            detailDao.insert(sale.getId(), 0, category.getId());
        }
        updatePrice();
    }

    public void delete(int id) {
        dao.updateEndDate(id,new Date(System.currentTimeMillis()-24*60*60*1000));
//        detailDao.deleteBySaleId(id);
    }

    public int getTotal() {
        return dao.getTotal();
    }

    public List<Sale> getPaging(int index) throws Exception {
        List<Sale> result = new ArrayList<Sale>();
        List<Map<String, Object>> saleList = dao.paging(index);
        for (Map<String, Object> map : saleList) {
            result.add(convertMapToSale(map));
        }
        return result;
    }

    public Sale convertMapToSale(Map<String, Object> map) throws Exception {
        Sale sale = new Sale();
        sale.setId((Integer) map.get("id"));
        sale.setName((String) map.get("name"));
        sale.setPercent((Integer) map.get("percent"));
        sale.setStart_date((Date) map.get("start_date"));
        sale.setEnd_date((Date) map.get("end_date"));
        sale.setProductList(getProducts(sale));
        sale.setCategoryList(getCategories(sale));
        return sale;
    }

    public static void main(String[] args) throws Exception {
        new SaleService().updatePrice();

//        System.out.println(new  SaleService().getSaleNotYet());
    }
}
