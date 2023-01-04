package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.dao.BlogDAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BlogService {
    private final BlogDAO dao = new BlogDAO();

    public Blog getById(int id) {
        return convertMapToBlog(dao.getById(id));
    }

    public List<Blog> getAll() {
        List<Blog> list = new ArrayList<>();
        for (Map<String, Object> map : dao.getAll()) {
            list.add(convertMapToBlog(map));
        }
        return list;
    }


    public List<Blog> getBlogIndex() {
        List<Blog> list = new ArrayList<>();
        for (Map<String, Object> map : dao.getBlogIndex()) {
            list.add(convertMapToBlog(map));
        }
        return list;
    }

    public List<Blog> pageBlogs(int index) {
        List<Blog> list = new ArrayList<>();
        List<Map<String, Object>> listBlog = dao.pageBlog(index);
        for (Map<String, Object> map : listBlog) {
            list.add(convertMapToBlog(map));
        }
        return list;
    }
    public void update(Blog blog) {
        dao.update(blog.getId(), blog.getName(),blog.getContent(),blog.getImage(),blog.getStart_date(),blog.getEnd_date());
    }
    public void insert(Blog blog){
        dao.insert(blog.getName(),blog.getContent(),blog.getImage(),blog.getStart_date(),blog.getEnd_date());
    }

    public int getTotal() {
        return dao.getTotal();
    }

    public List<Blog> getPaging(int index) {
        List<Blog> list = new ArrayList<>();
        for (Map<String, Object> map : dao.paging(index)) {
             list.add(convertMapToBlog(map));
        }
        return list;
    }

    public Blog convertMapToBlog(Map<String, Object> map) {
        Blog blog = new Blog();
        blog.setId((Integer) map.get("id"));
        blog.setName((String) map.get("name"));
        blog.setDate((Date) map.get("date"));
        blog.setContent((String) map.get("content"));
        blog.setImage((String) map.get("image"));
        blog.setStart_date((Date) map.get("start_date"));
        blog.setEnd_date((Date) map.get("end_date"));
        return blog;
    }

    public void delete(int id){dao.delete(id);}
    public static void main(String[] args) {
        System.out.println(new BlogService().getAll());
    }
}
