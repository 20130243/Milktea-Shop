package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;

/*
* Người tạo: Lê Trọng Tình 20130440
* Cập nhật: Lê Trọng Tình 20130440
*
* */
public class Blog implements Serializable {
    int id;
    String name;
    Date date;
    String content;
    String image;
    Date start_date;
    Date end_date;

    public Blog() {
    }

    public Blog(int id, String name, Date date, String content, String image, Date start_date, Date end_date) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.content = content;
        this.image = image;
        this.start_date = start_date;
        this.end_date = end_date;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }
    public String getStringStartEnd() {
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        String start = format.format(start_date);
        String end = format.format(end_date);
        return start + " - " + end;
    }
    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", date=" + date +
                ", content='" + content + '\'' +
                ", image='" + image + '\'' +
                ", start_date=" + start_date +
                ", end_date=" + end_date +
                '}';
    }
}
