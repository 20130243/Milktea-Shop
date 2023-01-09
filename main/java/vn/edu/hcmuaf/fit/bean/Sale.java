package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

public class Sale implements Serializable {
    int id ;
    String name ;
    int percent;
    Date start_date;
    Date end_date;
    List<Product> productList;
    List<Category> categoryList;

    public Sale() {
    }

    public Sale(int id, String name, int percent, Date start_date, Date end_date, List<Product> productList, List<Category> categoryList) {
        this.id = id;
        this.name = name;
        this.percent = percent;
        this.start_date = start_date;
        this.end_date = end_date;
        this.productList = productList;
        this.categoryList = categoryList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
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

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }
    public boolean checkValid() {
        long millis = System.currentTimeMillis();
        Date crdate = new java.sql.Date(millis);
        return start_date.before(crdate) && end_date.after(crdate);
    }
    public String getStringStartEnd() {
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        String start = format.format(start_date);
        String end = format.format(end_date);
        return start + " - " + end;
    }
    @Override
    public String toString() {
        return "Sale{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", percent=" + percent +
                ", start_date=" + start_date +
                ", end_date=" + end_date +
                ", productList=" + productList +
                ", categoryList=" + categoryList +
                '}';
    }
}
