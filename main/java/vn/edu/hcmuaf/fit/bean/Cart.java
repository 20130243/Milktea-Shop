package vn.edu.hcmuaf.fit.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    Map<Map<Product, Integer>, List<Topping>> productMap = new HashMap<>();
    float total = 0;

    public Cart() {

    }

    public Cart(Map<Map<Product, Integer>, List<Topping>> productList) {
        this.productMap = productList;
        updateTotal();
    }

    public void updateTotal() {
        for (Map<Product, Integer> product : productMap.keySet()) {
            Product tmp = (Product) product.keySet().toArray()[0];
            total += tmp.getPriceSize().get(0).getPrice();
            if (productMap.get(product) != null) {
                for (Topping topping : productMap.get(product)) {
                    total += topping.getPrice();
                }
            }
        }
    }

    public void add(Product product, List<Topping> topping, int quantity) {
        for (Map<Product,Integer>  key: productMap.keySet()) {
            if (key.containsKey(product)){
                key.put(product, key.get(product)+quantity);

            }else{
                Map<Product, Integer> productIn = new HashMap<Product, Integer>();
                productIn.put(product, quantity);
                productMap.put(productIn, topping);
            }
        }

        updateTotal();
    }
    public void remove(Product product){
        for (Map<Product,Integer>  key: productMap.keySet()) {
            if (key.containsKey(product)){
                int quantity = key.get(product);
                if(quantity>1){
                    key.put(product, quantity-1);
                }else{
                    productMap.remove(key);
                }
            }
        }

        updateTotal();
    }

    public Map<Map<Product, Integer>, List<Topping>> getProductMap() {
        return productMap;
    }

    public void setProductMap(Map<Map<Product, Integer>, List<Topping>> productMap) {
        this.productMap = productMap;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public static void main(String[] args) {
        Map<Product, List<Topping>> a1 = new HashMap<>(0);
        List<PriceSize> priceSizeList = new ArrayList<PriceSize>();
        priceSizeList.add(new PriceSize("L", 3000));
        Product a2 = new Product(2, "String name", 1, priceSizeList, "String img", 0);
        Product a3 = new Product(2, "Stasacasc", 1, priceSizeList, "String img", 0);
        Topping t1 = new Topping(1, "String name", 5000, 0);
        List<Topping> toppinglist = new ArrayList<>();
        toppinglist.add(t1);
        a1.put(a2, toppinglist);
        a1.put(a3, null);
//        System.out.println(a1);
//        System.out.println(a1.keySet().toArray()[0]);
        Product a = (Product) a1.keySet().toArray()[0];
        System.out.println(a.getName());


    }
}
