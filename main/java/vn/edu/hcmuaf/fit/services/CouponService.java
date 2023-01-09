package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Coupon;
import vn.edu.hcmuaf.fit.dao.CouponDAO;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CouponService {
    private final CouponDAO dao = new CouponDAO();

    public List<Coupon> getAll() throws SQLException {
        List<Coupon> result = new ArrayList<Coupon>();
        List<Map<String, Object>> couponList = dao.getAll();
        for (Map<String, Object> map : couponList) {

            result.add(convertMapToCoupon(map));
        }
        return result;
    }

    public Coupon getById(int id) throws Exception {
        Map<String, Object> map = dao.getById(id);
        return  convertMapToCoupon(map);
    }

    public void insert(Coupon coupon) throws Exception {
        dao.insert(coupon.getCode(),
                coupon.getPercent(),
                coupon.getMax_price_sale(),
                coupon.getQuantity(),
                coupon.getStart_date(),
                coupon.getEnd_date(),
                coupon.getMin_price_order(),
                coupon.getDate_regis_acc(),
                coupon.getMin_num_order(),
                coupon.getContent());
    }

    public void update(Coupon coupon) throws Exception {
        dao.update(coupon.getId(),
                coupon.getCode(),
                coupon.getPercent(),
                coupon.getMax_price_sale(),
                coupon.getQuantity(),
                coupon.getStart_date(),
                coupon.getEnd_date(),
                coupon.getMin_price_order(),
                coupon.getDate_regis_acc(),
                coupon.getMin_num_order(),
                coupon.getContent());
    }

    public void useCoupon(Coupon coupon) throws Exception {
        int getQuantity = coupon.getQuantity();
        if(getQuantity > 0) {
            coupon.setQuantity(coupon.getQuantity()-1);
        }
        dao.update(coupon.getId(),
                coupon.getCode(),
                coupon.getPercent(),
                coupon.getMax_price_sale(),
                coupon.getQuantity(),
                coupon.getStart_date(),
                coupon.getEnd_date(),
                coupon.getMin_price_order(),
                coupon.getDate_regis_acc(),
                coupon.getMin_num_order(),
                coupon.getContent());
    }

    public List<Coupon> getPaging(int index) throws SQLException {
        List<Coupon> list = new ArrayList<>();
        List<Map<String, Object>> couponList = dao.paging(index);
        if (couponList == null) return null;
        for (Map<String, Object> map : couponList) {
            list.add(convertMapToCoupon(map));
        }
        return list;
    }

    public int getTotal() {
        return dao.getTotal();
    }

    public void delete(int id) throws Exception {
        dao.updateEndDate(id,new Date(System.currentTimeMillis()-24*60*60*1000));
    }

    public Date convertStart_Date(String text) throws ParseException {
        String start_date_string = text.substring(0, 10);
        java.sql.Date start_date;
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        java.util.Date parsed = format.parse(start_date_string);
        start_date = new java.sql.Date(parsed.getTime());
        return start_date;
    }

    public Date convertEnd_Date(String text) throws ParseException {
        String end_date_string = text.substring(13, 23);
        java.sql.Date end_date;
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        java.util.Date parsed = format.parse(end_date_string);
        end_date = new java.sql.Date(parsed.getTime());
        return end_date;
    }

    public Coupon convertMapToCoupon(Map<String, Object> map) {
        Coupon coupon = new Coupon();
        coupon.setId((Integer) map.get("id"));
        coupon.setCode((String) map.get("code"));
        coupon.setPercent((Integer) map.get("percent"));
        coupon.setMax_price_sale((Float) map.get("max_price_sale"));
        coupon.setQuantity((Integer) map.get("quantity"));
        coupon.setStart_date((Date) map.get("start_date"));
        coupon.setEnd_date((Date) map.get("end_date"));
        coupon.setMin_price_order((Float) map.get("min_price_order"));
        coupon.setDate_regis_acc((Date) map.get("date_regis_acc"));
        coupon.setMin_num_order(map.get("min_num_order") != null ? (Integer) map.get("min_num_order") : 0);
        coupon.setContent((String) map.get("content"));
        return coupon;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new CouponService().getPaging(1));
    }

}
