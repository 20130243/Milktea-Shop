package vn.edu.hcmuaf.fit.bean;

public class PriceSize {
    float price;
    String size;

    public PriceSize( String size,float price) {
        this.price = price;
        this.size = size;
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

    @Override
    public String toString() {
        return "PriceProduct{" +
                "price=" + price +
                ", size='" + size + '\'' +
                '}';
    }
}
