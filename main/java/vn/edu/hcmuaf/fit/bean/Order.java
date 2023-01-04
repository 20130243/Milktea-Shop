package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Order implements Serializable {
    int id;
    int user_id;
    String name;
    String phone;
    String address;
    Timestamp time;
    String note;
    Cart cart;
    float total;
    int status;

    public Order(int id, int user_id, String name, String phone, String address, Timestamp time, String note, int coupon_id, Cart cart, float total, int status) {
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.time = time;
        this.note = note;
        this.cart = cart;
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

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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
        if(this.cart != null) {
            this.total = this.cart.getTotalMoney();
        }
        this.total = 0;

    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "Order{" + "id="+id+
                ", user_id=" + user_id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", time=" + time +
                ", note='" + note + '\'' +
                ", cart=" + cart +
                ", total=" + total +
                ", status=" + status +
                '}';
    }
}
