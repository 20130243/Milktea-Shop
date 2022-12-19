package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class PriceSize implements Serializable {
    int id;
    int product_id;
    String size;
    float price;
   float originalPrice;


    public PriceSize(int id, int product_id, String size, float price, float originalPrice) {
        this.id = id;
        this.product_id = product_id;
        this.size = size;
        this.price = price;
        this.originalPrice = originalPrice;
    }

    public PriceSize() {

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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public float getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(float originalPrice) {
        this.originalPrice = originalPrice;
    }

    @Override
    public String toString() {
        return "PriceSize{" +
                "id=" + id +
                ", product_id=" + product_id +
                ", size='" + size + '\'' +
                ", price=" + price +
                ", originalPrice=" + originalPrice +
                '}';
    }
}
