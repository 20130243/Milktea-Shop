package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Category implements Serializable {
    int id;
    String name;
    int status;

    public Category(int id, String name, int status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public Category() {

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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", status=" + status +
                '}';
    }
}
