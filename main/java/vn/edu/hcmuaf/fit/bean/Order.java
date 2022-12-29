package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import java.util.Map;

public class Order implements Serializable {
    int id;
    int user_id;
    String name;
    String phone;
    String address;
    Date time;
    String note;
    int coupon_id;
    /*
    ProductList(PriceSize,(quantity,topping))
    Vi du
            tra sua("size L gia 15k",(2,"tran chau den"))
            tra sua("size XL gia 25k",(1,""))
            da xay("size L gia 35k",(1,""))
    */
    List<Map<PriceSize, Map<Integer, Topping>>> product_price_quantity_topping;
    float total;
    int status;

    public Order(int id, int user_id, String name, String phone, String address, Date time, String note, int coupon_id, List<Map<PriceSize, Map<Integer, Topping>>> product_price_quantity_topping, float total, int status) {
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.time = time;
        this.note = note;
        this.coupon_id = coupon_id;
        this.product_price_quantity_topping = product_price_quantity_topping;
        this.total = total;
        this.status = status;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getCoupon_id() {
        return coupon_id;
    }

    public void setCoupon_id(int coupon_id) {
        this.coupon_id = coupon_id;
    }

    public List<Map<PriceSize, Map<Integer, Topping>>> getProduct_price_quantity_topping() {
        return product_price_quantity_topping;
    }

    public void setProduct_price_quantity_topping(List<Map<PriceSize, Map<Integer, Topping>>> product_price_quantity_topping) {
        this.product_price_quantity_topping = product_price_quantity_topping;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setTotal() {
        Float total = Float.valueOf(0);
        // lay ra tung san pham, size, gia
        for (Map<PriceSize, Map<Integer, Topping>> product : this.product_price_quantity_topping) {
            PriceSize priceSize = (PriceSize) product.keySet().toArray()[0];
            Float product_price = Float.valueOf(0);
            // lay ra so luong va topping cua tung sp
            Map<Integer, Topping> quantity_topping = product.get(priceSize);
            for (Integer quantity : quantity_topping.keySet()) {
                product_price += priceSize.getPrice() * quantity;
                Topping topping = quantity_topping.get(quantity);
                if (topping != null) {
                    total += topping.getPrice() * quantity;
                }
            }
            total += product_price;

        }
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", time=" + time +
                ", note='" + note + '\'' +
                ", coupon_id=" + coupon_id +
                ", product_price_quantity_topping=" + product_price_quantity_topping +
                ", total=" + total +
                ", status=" + status +
                '}';
    }
}
