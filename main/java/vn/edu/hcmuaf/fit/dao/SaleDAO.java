package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class SaleDAO extends RD {
    @Override
    public List<Map<String, Object>> getAll() throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM sale  ORDER BY id DESC ")
                        .mapToMap()
                        .list());
    }

    @Override
    public Map<String, Object> getById(int id) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM sale WHERE id =?  ORDER BY id DESC")
                        .bind(0, id)
                        .mapToMap()
                        .first());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h -> h.createUpdate("delete from sale where id =?")
                .bind(0, id)
                .execute()
        );
    }
    public void updateEndDate(int id,Date date){
        JDBIConnector.get().withHandle(h -> h.createUpdate("update sale SET end_date = ?" )
                .bind(0,date)
                .execute());
    }
    public void insert(String name, int percent, Date start_date, Date end_date) throws Exception {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("insert into sale (name, percent,start_date, end_date) " +
                                "values (:name,:percent, :start_date,:end_date)")
                        .bind("name", name)
                        .bind("percent", percent)
                        .bind("start_date", start_date)
                        .bind("end_date", end_date)
                        .execute()
        );
    }

    public void update(int id, String name, int percent, Date start_date, Date end_date) throws Exception {

        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE sale SET name=:name,percent=:percent,start_date=:start_date, end_date=:end_date WHERE id=:id")
                        .bind("name", name)
                        .bind("percent", percent)
                        .bind("start_date", start_date)
                        .bind("end_date", end_date)
                        .bind("id", id)
                        .execute());
    }

    public int getTotal() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from sale").mapTo(Integer.class).first()
        );

    }


    public List<Map<String, Object>> paging(int index) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from sale\n" +
                        "order by id DESC \n" +
                        "LIMIT ? , 5;").bind(0, (index - 1) * 5).mapToMap().list()
        );
    }

    public List<Map<String, Object>> getSaleNotYet() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from sale where end_date > CURRENT_DATE").mapToMap().list()
        );
    }

    public Map<String, Object> findFirst() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM sale ORDER BY id DESC LIMIT 1")
                        .mapToMap().first());
    }

    public static void main(String[] args) throws Exception {
        System.out.println(new SaleDAO().getSaleNotYet().size() + "");
    }


}
