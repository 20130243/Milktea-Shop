package vn.edu.hcmuaf.fit.controller.admin.blog;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.CouponService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Date;

@WebServlet(name = "Blog create", value = "/admin/blog/create")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String name = request.getParameter("name");
            String content = request.getParameter("content").isEmpty() ? "" : request.getParameter("content");

            String date = request.getParameter("date");
            Date start_date = new CouponService().convertStart_Date(date);
            Date end_date = new CouponService().convertEnd_Date(date);

            Part image = request.getPart("image");
            String realPath = request.getServletContext().getRealPath("/img/BlogImport");
            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            String fileName = Path.of(image.getSubmittedFileName()).getFileName().toString();
            //get extenstion
            int i = fileName.lastIndexOf('.');
            String extension = i > 0?"."+ fileName.substring(i + 1):"";
            String path = realPath + "/" + fileName.replaceAll(" ", "-") + extension;
            image.write(path);
            String img = "/img/BlogImport/" + fileName.replaceAll(" ", "-") + extension;

            Blog blog = new Blog();
            blog.setName(name);
            blog.setContent(content);
            blog.setDate(new Date(System.currentTimeMillis()));
            blog.setImage(img);
            blog.setStart_date(start_date);
            blog.setEnd_date(end_date);

            new BlogService().insert(blog);

            response.sendRedirect("/admin/blog");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
