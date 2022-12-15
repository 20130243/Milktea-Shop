package vn.edu.hcmuaf.fit.bean;

public class Item {
    private String id;
    private Product product;
    private int quantity;
    private float price;

    private String note;

    public Item(){

    }

    public Item(String id, Product product, int quantity, float price, String note) {
        this.id = id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.note = note;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
