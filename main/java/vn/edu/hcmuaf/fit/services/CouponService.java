package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Coupon;
import vn.edu.hcmuaf.fit.dao.CouponDao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CouponService {
    private final CouponDao dao = new CouponDao();

    public List<Coupon> getAll() {
        List<Coupon> result = new ArrayList<Coupon>();
        List<Map<String, Object>> couponList = dao.getAll();
        for (Map<String, Object> map : couponList) {
            Coupon coupon = new Coupon();
            coupon.setId((Integer) map.get("id"));
            coupon.setCode((String) map.get("code"));
            coupon.setPercent((Integer) map.get("percent"));
            coupon.setMax_price_sale((Integer) map.get("max_price_sale"));
            coupon.setQuantity((Integer) map.get("quantity"));
            coupon.setStart_date((Date) map.get("start_date"));
            coupon.setEnd_date((Date) map.get("end_date"));
            coupon.setMin_price_order((Float) map.get("min_price_order"));
            coupon.setDate_regis_acc((Date) map.get("date_regis_acc"));
            coupon.setMin_num_order((Integer) map.get("min_num_order"));
            coupon.setContent((String) map.get("content"));
            result.add(coupon);
        }
        return result;
    }

    public Coupon getById(int id) throws Exception {
        Map<String, Object> map = dao.getById(id);
        Coupon coupon = new Coupon();
        coupon.setId((Integer) map.get("id"));
        coupon.setCode((String) map.get("code"));
        coupon.setPercent((Integer) map.get("percent"));
        coupon.setMax_price_sale((Integer) map.get("max_price_sale"));
        coupon.setQuantity((Integer) map.get("quantity"));
        coupon.setStart_date((Date) map.get("start_date"));
        coupon.setEnd_date((Date) map.get("end_date"));
        coupon.setMin_price_order((Float) map.get("min_price_order"));
        coupon.setDate_regis_acc((Date) map.get("date_regis_acc"));
        coupon.setMin_num_order((Integer) map.get("min_num_order"));
        coupon.setContent((String) map.get("content"));
        return coupon;
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

    public List<Coupon> getPaging(int index) {
        List<Coupon> list = new ArrayList<>();
        List<Map<String, Object>> couponList = dao.paging(index);
        for (Map<String, Object> map : couponList) {
            Coupon coupon = new Coupon();
            coupon.setId((Integer) map.get("id"));
            coupon.setCode((String) map.get("code"));
            coupon.setPercent((Integer) map.get("percent"));
            coupon.setMax_price_sale((Integer) map.get("max_price_sale"));
            coupon.setQuantity((Integer) map.get("quantity"));
            coupon.setStart_date((Date) map.get("start_date"));
            coupon.setEnd_date((Date) map.get("end_date"));
            coupon.setMin_price_order((Float) map.get("min_price_order"));
            coupon.setDate_regis_acc((Date) map.get("date_regis_acc"));
            coupon.setMin_num_order((Integer) map.get("min_num_order"));
            coupon.setContent((String) map.get("content"));
            list.add(coupon);
        }
        return list;
    }

    public int getTotal() {
        return dao.getTotal();
    }

    public void delete(int id) throws Exception {
        dao.delete(id);
    }
}
