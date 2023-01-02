package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Product implements Serializable {
    int id;
    String name;
    int idCategory;
    List<PriceSize> priceSize;
    String img;
    int status;
    List<Topping> topping;

    public List<Topping> getTopping() {
        return topping;
    }

    public void setTopping(List<Topping> topping) {
        this.topping = topping;
    }

    public Product(int id, String name, int idCategory, List<PriceSize> priceSize, String img, int status, List<Topping> topping) {
        this.id = id;
        this.name = name;
        this.idCategory = idCategory;
        this.priceSize = priceSize;
        this.img = img;
        this.status = status;
        this.topping = topping;
    }

    public Product() {
    }

    public List<PriceSize> getPriceSize() {
        return priceSize;
    }

    public void setPriceSize(List<PriceSize> priceSize) {
        this.priceSize = priceSize;
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

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void updateSale(int percent) {
        for (PriceSize pz : priceSize) {
            pz.setPrice((pz.getOriginalPrice() * percent) / 100);
        }
        setStatus(1);
    }

    public void resetPrice() {
        for (PriceSize pz : priceSize) {
            pz.setPrice((pz.getOriginalPrice()));
        }
        setStatus(0);
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name='" + name + '\'' + ", idCategory=" + idCategory + ", priceSize=" + priceSize + ", img='" + img + '\'' + ", status=" + status + ", topping=" + topping + '}';
    }

    public void addPriceSize(PriceSize size) {
        if(this.priceSize!=null) {
            this.priceSize.add(size);
        } else {
            this.priceSize = new ArrayList<>();
            this.priceSize.add(size);
        }
    }

    public void addTopping(Topping topping) {
        if(this.topping!=null) {
         this.topping.add(topping);
        } else {
            this.topping = new ArrayList<>();
            this.topping.add(topping);
        }
    }
}
