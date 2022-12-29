package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class Coupon implements Serializable {
    int id;
    String code;
    int percent;
    float max_price_sale;
    int quantity;
    Date start_date;
    Date end_date;
    float min_price_order;
    Date date_regis_acc;
    int min_num_order;
    String content;

    public Coupon(int id, String code, int percent, float max_price_sale, int quantity, Date start_date, Date end_date, float min_price_order, Date date_regis_acc, int min_num_order, String content) {
        this.id = id;
        this.code = code;
        this.percent = percent;
        this.max_price_sale = max_price_sale;
        this.quantity = quantity;
        this.start_date = start_date;
        this.end_date = end_date;
        this.min_price_order = min_price_order;
        this.date_regis_acc = date_regis_acc;
        this.min_num_order = min_num_order;
        this.content = content;
    }

    public Coupon() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public float getMax_price_sale() {
        return max_price_sale;
    }

    public void setMax_price_sale(float max_price_sale) {
        this.max_price_sale = max_price_sale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public float getMin_price_order() {
        return min_price_order;
    }

    public void setMin_price_order(float min_price_order) {
        this.min_price_order = min_price_order;
    }

    public Date getDate_regis_acc() {
        return date_regis_acc;
    }

    public void setDate_regis_acc(Date date_regis_acc) {
        this.date_regis_acc = date_regis_acc;
    }

    public int getMin_num_order() {
        return min_num_order;
    }

    public void setMin_num_order(int min_num_order) {
        this.min_num_order = min_num_order;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean checkValid() {
        long millis = System.currentTimeMillis();
        Date crdate = new java.sql.Date(millis);
        return quantity > 0 && !end_date.before(crdate) && !start_date.after(crdate);
    }

    public String getStringStartEnd() {
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        String start = format.format(start_date);
        String end = format.format(end_date);
        return start + " - " + end;
    }

    @Override
    public String toString() {
        return "Coupon{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", percent=" + percent +
                ", max_price_sale=" + max_price_sale +
                ", quantity=" + quantity +
                ", start_date=" + start_date +
                ", end_date=" + end_date +
                ", min_price_order=" + min_price_order +
                ", date_regis_acc=" + date_regis_acc +
                ", min_num_order=" + min_num_order +
                ", content='" + content + '\'' +
                '}';
    }
}
