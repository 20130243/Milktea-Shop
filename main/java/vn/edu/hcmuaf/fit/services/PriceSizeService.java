package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.PriceSize;
import vn.edu.hcmuaf.fit.dao.PriceSizeDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PriceSizeService {
    private PriceSizeDAO dao = new PriceSizeDAO();

    public List<PriceSize> getAll() throws Exception {
        List<PriceSize> result = new ArrayList<PriceSize>();
        List<Map<String, Object>> priceSizeList = dao.getAll();
        for (Map<String, Object> map : priceSizeList) {
            PriceSize priceSize = new PriceSize();
            priceSize.setId((Integer) map.get("id"));
            priceSize.setProduct_id((Integer) map.get("product_id"));
            priceSize.setSize((String) map.get("size"));
            priceSize.setPrice((Float) map.get("price"));
            priceSize.setOriginalPrice((Float) map.get("original_price"));
            result.add(priceSize);
        }
        return result;
    }

    public List<PriceSize> getByProductId(int id) throws Exception {
        List<Map<String, Object>> priceSizeList = dao.getByProductId(id);
        List<PriceSize> result = new ArrayList<PriceSize>();
        for (Map<String, Object> map : priceSizeList) {
            PriceSize priceSize = new PriceSize();
            priceSize.setId((Integer) map.get("id"));
            priceSize.setProduct_id((Integer) map.get("product_id"));
            priceSize.setSize((String) map.get("size"));
            priceSize.setPrice((Float) map.get("price"));
            priceSize.setOriginalPrice((Float) map.get("original_price"));
            result.add(priceSize);
        }
        return result;
    }

    public void insert(PriceSize priceSize) throws Exception {
        dao.insert(priceSize.getProduct_id(), priceSize.getSize(), priceSize.getOriginalPrice());
    }

    public void update(PriceSize priceSize) throws Exception {
        dao.update(priceSize.getId(), priceSize.getSize(), priceSize.getPrice(), priceSize.getOriginalPrice());
    }

    public void updateByProductId(PriceSize priceSize) throws Exception {
        int product_id = priceSize.getProduct_id();
        dao.updateByProductId(priceSize.getId(), priceSize.getSize(), priceSize.getPrice(), priceSize.getOriginalPrice());
    }


    public void delete(int id) throws Exception {
        dao.delete(id);
    }

    public void deleteByProductId(int product_id) {
        dao.deleteByProductId(product_id);
    }
}
