package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Topping implements Serializable {
    private int id;
    private String name;
    private float price;
    private int status;
    private int category_id;

    public Topping(int id, String name, float price, int category_id, int status) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.status = status;
        this.category_id = category_id;
    }

    public Topping() {

    }

    @Override
    public String toString() {
        return "Topping{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", status=" + status +
                ", category_id=" + category_id +
                '}';
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
