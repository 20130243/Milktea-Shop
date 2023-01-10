package vn.edu.hcmuaf.fit.dao;


import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class CouponDAO extends RD {
    private static final String tableName = "coupon";

    @Override
    public List<Map<String, Object>> getAll() throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName+"  ORDER BY id DESC ")
                        .mapToMap()
                        .list());
    }

    @Override
    public Map<String, Object> getById(int id) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id=:id ")
                        .bind("id", id)
                        .mapToMap()
                        .first());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h -> h.createUpdate("delete from " + tableName + " where id =?")
                .bind(0, id)
                .execute()
        );
    }
    public void updateEndDate(int id,Date date){
        JDBIConnector.get().withHandle(h -> h.createUpdate("update " + tableName +" SET end_date =:date where id=:id" )
                .bind("date",date)
                .bind("id",id)
                .execute());
    }

    public void insert(String code, int percent, float max_price_sale, int quantity, Date start_date, Date end_date, float min_price_order, Date date_regis_acc, int min_num_order, String content) throws Exception {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("insert into " + tableName + " (code, percent, max_price_sale, quantity, start_date, end_date,min_price_order, date_regis_acc, min_num_order, content) " +
                                "values (:code,:percent,:max_price_sale,:quantity,:start_date,:end_date,:min_price_order,:date_regis_acc,:min_num_order,:content)")
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
                h.createUpdate("UPDATE " + tableName + " SET code=:code,percent=:percent, max_price_sale=:max_price_sale, quantity=:quantity, start_date=:start_date, end_date=:end_date,  min_price_order=:min_price_order, date_regis_acc=:date_regis_acc, min_num_order=:min_num_order, content=:content WHERE id=:id")
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
                        .bind("id", id)
                        .execute());
    }

    public int getTotal() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from " + tableName ).mapTo(Integer.class).first()
        );
    }


    public List<Map<String, Object>> paging(int index) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName + "\n" +
                        "order by id DESC \n" +
                        "LIMIT ? , 5;").bind(0, (index - 1) * 5).mapToMap().list()
        );
    }

    public static void main(String[] args) throws SQLException {

        System.out.println(new CouponDAO().getTotal());
        ;
    }


}

