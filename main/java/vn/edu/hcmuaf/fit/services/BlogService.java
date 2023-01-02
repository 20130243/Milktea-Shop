package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.dao.BlogDAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BlogService {
    private final BlogDAO dao = new BlogDAO();

    public Blog getById(int id){
        Map<String, Object> blog = dao.getById(id);
        return new Blog((Integer)blog.get("id"),
                        (String) blog.get("name"),
                        (Date) blog.get("date"),
                        (String) blog.get("content"),
                        (String) blog.get("image"),
                        (Date) blog.get("start_date"),
                        (Date) blog.get("end_date"));
    }

    public List<Blog> getAll() {
        List<Blog> list = new ArrayList<>();
        List<Map<String, Object>> listBlog = dao.getAll();
        for (Map<String, Object> map : listBlog) {
            Blog blog = new Blog();
            blog.setId((Integer) map.get("id"));
            blog.setName((String) map.get("name"));
            blog.setDate( (Date) map.get("date"));
            blog.setContent((String) map.get("content"));
            blog.setImage((String) map.get("image"));
            blog.setStart_date((Date) map.get("start_date"));
            blog.setEnd_date( (Date) map.get("end_date"));
            list.add(blog);
        }
        return list;
    }


    public List<Blog> getBlogIndex() {
        List<Blog> list = new ArrayList<>();
        List<Map<String, Object>> listBlog = dao.getBlogIndex();
        for (Map<String, Object> map : listBlog) {
            Blog blog = new Blog();
            blog.setId((Integer) map.get("id"));
            blog.setName((String) map.get("name"));
            blog.setDate( (Date) map.get("date"));
            blog.setContent((String) map.get("content"));
            blog.setImage((String) map.get("image"));
            blog.setStart_date((Date) map.get("start_date"));
            blog.setEnd_date( (Date) map.get("end_date"));
            list.add(blog);
        }
        return list;
    }

    public List<Blog> pageBlogs(int index) {
        List<Blog> list = new ArrayList<>();
        List<Map<String, Object>> listBlog = dao.pageBlog(index);
        for (Map<String, Object> map : listBlog) {
            Blog blog = new Blog();
            blog.setId((Integer) map.get("id"));
            blog.setName((String) map.get("name"));
            blog.setDate( (Date) map.get("date"));
            blog.setContent((String) map.get("content"));
            blog.setImage((String) map.get("image"));
            blog.setStart_date((Date) map.get("start_date"));
            blog.setEnd_date( (Date) map.get("end_date"));
            list.add(blog);
        }
        return list;
    }


    public static void main(String[] args) {
        System.out.println(new BlogService().getAll());
    }
}
