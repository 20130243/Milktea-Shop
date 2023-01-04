package vn.edu.hcmuaf.fit.controller.admin.blog;

import vn.edu.hcmuaf.fit.services.BlogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Blog delete", value = "/admin/blog/delete")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        BlogService blog = new BlogService();
        try {
            blog.delete(id);
            System.out.println("true");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/blog");
    }
}
