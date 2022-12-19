package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class CouponDao extends RD {
    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM coupon  ")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> couponList = getAll();
        for (Map<String, Object> coupon : couponList) {
            if ((int) coupon.get("id") == id) {
                return coupon;
            }
        }
        return null;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h -> h.createUpdate("delete from coupon where id =?")
                .bind(0, id)
                .execute()
        );
    }

    public void insert(String code, int percent, float max_price_sale, int quantity, Date start_date, Date end_date, float min_price_order, Date date_regis_acc, int min_num_order, String content) throws Exception {
        JDBIConnector.get().withHandle(h -> h.createUpdate("insert into coupon (code, percent, max_price_size, quantity, start_date, end_date,min_price_order, date_regis_acc, min_num_order, content) " +
                        "values (code=:code,percent=:percent, max_price_size=:max_price_size, quantity=:quantity, start_date=:start_date, end_date=:end_date,  min_price_order=:min_price_order, date_regis_acc=:date_regis_acc, min_num_order=:min_num_order, content=:content)")
                .bind("code", code)
                .bind("percent", percent)
                .bind("max_price_sale", max_price_sale)
                .bind("quantity", quantity)
                .bind("start_date", start_date)
                .bind("end_date", end_date)
                .bind("min_price_order", min_price_order)
                .bind("date_regis_acc", date_regis_acc)
                .bind("min_num_order", min_num_order)
                .bind("content", content)
                .execute()
        );
    }

    public void update(int id, String code, int percent, float max_price_sale, int quantity, Date start_date, Date end_date, float min_price_order, Date date_regis_acc, int min_num_order, String content) throws Exception {

        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE coupon SET code=:code,percent=:percent, max_price_size=:max_price_size, quantity=:quantity, start_date=:start_date, end_date=:end_date,  min_price_order=:min_price_order, date_regis_acc=:date_regis_acc, min_num_order=:min_num_order, content=:content WHERE id=:id")
                        .bind("code", code)
                        .bind("percent", percent)
                        .bind("max_price_sale", max_price_sale)
                        .bind("quantity", quantity)
                        .bind("start_date", start_date)
                        .bind("end_date", end_date)
                        .bind("min_price_order", min_price_order)
                        .bind("date_regis_acc", date_regis_acc)
                        .bind("min_num_order", min_num_order)
                        .bind("content", content)
                        .execute());
    }
    public int getTotal() {
        int count = JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from coupon").mapTo(Integer.class).first()
        );
        return count;
    }
    public List<Map<String, Object>> paging(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from coupon order by id LIMIT ? , 10").bind(0, (index-1)*10).mapToMap().list()
        );
    }
}
