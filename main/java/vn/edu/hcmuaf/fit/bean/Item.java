package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.util.List;

public class Item implements Serializable {
    private int id;
    private Product product;
    private int quantity;
    private float price;

    private String note;

    public Item(){
        this.price = 0;
    }

    public Item(int id, Product product, int quantity, float price, String note) {
        this.id = id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public void updatePrice(){
        Product product = this.getProduct();
        List<Topping> toppings = product.getTopping();
        float price = product.getPriceSize().get(0).getPrice();
        if(toppings.size() > 0){
            for(Topping topping : toppings){
                price += topping.getPrice();
            }
        }
        float priceTotal = price * quantity;
        this.setPrice(priceTotal);

    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", product=" + product +
                ", quantity=" + quantity +
                ", price=" + price +
                ", note='" + note + '\'' +
                '}';
    }
}
