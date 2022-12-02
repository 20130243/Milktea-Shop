package vn.edu.hcmuaf.fit.bean;

public class Product {
    int id;
    String name;
    int idCategory;
    String img;
    int status;

    public Product() {
    }

    public Product(int id, String name, int idCategory, String img, int status) {
        this.id = id;
        this.name = name;
        this.idCategory = idCategory;
        this.img = img;
        this.status = status;
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

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", idCategory=" + idCategory +
                ", img='" + img + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
