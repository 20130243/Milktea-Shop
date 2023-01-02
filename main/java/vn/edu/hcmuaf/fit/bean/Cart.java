package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private int id;
    private User customer;
    private List<Item> items;
    private int status;
    private float totalMoney;

    private float priceSale;

    private Coupon coupon;

    public Cart() {
        this.status = 0;
        this.totalMoney = 0;
        this.priceSale = 0;
        this.coupon = null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        if(this !=null) {
            if(this.totalMoney < 0) {
                this.totalMoney = 0;
            }
        }
        this.totalMoney = totalMoney;
    }

    public float getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(float priceSale) {
        if(this.priceSale < 0) {
            this.priceSale = 0;
        }
        this.priceSale = priceSale;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public void addItem(Item item) {
        if(this.items!=null){
            this.items.add(item);
        } else {
            this.items = new ArrayList<>();
            this.items.add(item);
        }
    }

    public void removeItem(Item item) {
        this.items.remove(item);
    }

    public void updateTotal() {
        float total = 0;
        if(items.size() == 0) {
            this.setTotalMoney(0);
        } else {
            for (int i = 0; i < items.size(); i++) {
                total += items.get(i).getPrice();
                this.setTotalMoney(total);
            }
        }
    }
//
//    public void add(Product product, List<Topping> topping, int quantity) {
//        for (Map<Product,Integer>  key: productMap.keySet()) {
//            if (key.containsKey(product)){
//                key.put(product, key.get(product)+quantity);
//
//            }else{
//                Map<Product, Integer> productIn = new HashMap<Product, Integer>();
//                productIn.put(product, quantity);
//                productMap.put(productIn, topping);
//            }
//        }
//
//        updateTotal();
//    }
//    public void remove(Product product){
//        for (Map<Product,Integer>  key: productMap.keySet()) {
//            if (key.containsKey(product)){
//                int quantity = key.get(product);
//                if(quantity>1){
//                    key.put(product, quantity-1);
//                }else{
//                    productMap.remove(key);
//                }
//            }
//        }
//
//        updateTotal();
//    }
//
//    public Map<Map<Product, Integer>, List<Topping>> getProductMap() {
//        return productMap;
//    }
//
//    public void setProductMap(Map<Map<Product, Integer>, List<Topping>> productMap) {
//        this.productMap = productMap;
//    }
//
//    public float getTotal() {
//        return total;
//    }
//
//    public void setTotal(float total) {
//        this.total = total;
//    }
//
//    public static void main(String[] args) {
////        Map<Product, List<Topping>> a1 = new HashMap<>(0);
////        List<PriceSize> priceSizeList = new ArrayList<PriceSize>();
////        priceSizeList.add(new PriceSize("L", 3000));
////        Product a2 = new Product(2, "String name", 1, priceSizeList, "String img", 0);
////        Product a3 = new Product(2, "Stasacasc", 1, priceSizeList, "String img", 0);
////        Topping t1 = new Topping(1, "String name", 5000, 0);
////        List<Topping> toppinglist = new ArrayList<>();
////        toppinglist.add(t1);
////        a1.put(a2, toppinglist);
////        a1.put(a3, null);
//////        System.out.println(a1);
//////        System.out.println(a1.keySet().toArray()[0]);
////        Product a = (Product) a1.keySet().toArray()[0];
////        System.out.println(a.getName());
//
//
//    }


    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", customer=" + customer +
                ", items=" + items +
                ", status=" + status +
                ", totalMoney=" + totalMoney +
                ", priceSale=" + priceSale +
                ", coupon=" + coupon +
                '}';
    }

}
