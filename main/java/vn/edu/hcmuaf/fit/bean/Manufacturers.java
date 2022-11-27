package vn.edu.hcmuaf.fit.bean;

public class Manufacturers {
    private int id;
    private String name;

    public Manufacturers(int id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Manufacturers{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
