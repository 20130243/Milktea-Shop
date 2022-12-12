package vn.edu.hcmuaf.fit.bean;

public class PriceSize {
    String size;
    float price;
   float originalPrice;


    public PriceSize(String size, float price, float originalPrice) {
        this.price = price;
        this.size = size;
        this.originalPrice = originalPrice;
    }

    public PriceSize() {

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
                "size='" + size + '\'' +
                ", price=" + price +
                ", originalPrice=" + originalPrice +
                '}';
    }
}
