package vn.edu.hcmuaf.fit.bean;

public class OrderDetail {
    private int id;
    private int order_id;
    private int product_size_id;
    private int quantity_;


    public OrderDetail(int id, int order_id, int product_size_id, int quantity_) {
        this.id = id;
        this.order_id = order_id;
        this.product_size_id = product_size_id;
        this.quantity_ = quantity_;
    }

    public OrderDetail() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_size_id() {
        return product_size_id;
    }

    public void setProduct_size_id(int product_size_id) {
        this.product_size_id = product_size_id;
    }

    public int getQuantity_() {
        return quantity_;
    }

    public void setQuantity_(int quantity_) {
        this.quantity_ = quantity_;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", order_id=" + order_id +
                ", product_size_id=" + product_size_id +
                ", quantity_=" + quantity_ +
                '}';
    }
}
