package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Size implements Serializable {
    int id;
    int product_id;
    String name;
    float price;

    public Size() {
    }

    public Size(int id, int product_id, String name, float price) {
        this.id = id;
        this.product_id = product_id;
        this.name = name;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Size{" +
                "id=" + id +
                ", product_id=" + product_id +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
