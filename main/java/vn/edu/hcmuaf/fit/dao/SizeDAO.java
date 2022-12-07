package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;


public class SizeDAO extends  RD{
    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from product_size")
                        .mapToMap()
                       .list()
                );
    }

    @Override
    public Map<String, Object> getById(int id) {
        return null;
    }

    @Override
    public void delete(int id) {

    }
}
