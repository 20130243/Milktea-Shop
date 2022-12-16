package vn.edu.hcmuaf.fit.controller.admin.product;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.PriceSize;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProductService;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Product update", value = "/admin/product/update")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Product product = (new ProductService()).getById(id);
            request.setAttribute("object", product);

            List<Category> categoryList = (new CategoryService()).getAll();
            request.setAttribute("categoryList", categoryList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Product product = new Product();
        int id = Integer.parseInt(request.getParameter("id").replaceAll("\\s+", ""));
        String name = request.getParameter("name");

        Part image = request.getPart("image");
        String img = request.getParameter("old_image");
        if (request.getParameter("check_input_file").equals("true")) {
            String realPath = request.getServletContext().getRealPath("/img/ProductImport");
            String fileName = Path.of(image.getSubmittedFileName()).getFileName().toString();
            String extension = ".";
            int i = fileName.lastIndexOf('.');
            if (i > 0) {
                extension = "." + fileName.substring(i + 1);
            }
            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            String path = realPath + "/" + name.replaceAll(" ", "-") + extension;
            image.write(path);
            img = "/img/ProductImport/" + name.replaceAll(" ", "-") + extension;
            System.out.println(image);
        }
        int category = Integer.parseInt(request.getParameter("category"));
        int status = Integer.parseInt(request.getParameter("status"));

        List<PriceSize> priceSizeList = new ArrayList<PriceSize>();
        float price_M = Float.parseFloat(request.getParameter("price_M"));
        PriceSize priceSizeM = new PriceSize(0, id, "M", price_M, price_M);
        priceSizeList.add(priceSizeM);
        if (request.getParameter("price_L") != null) {
            float price_L = Float.parseFloat(request.getParameter("price_L"));
            PriceSize priceSizeL = new PriceSize(0, id, "L", price_L, price_L);
            priceSizeList.add(priceSizeL);
        }
        product.setId(id);
        product.setName(name);
        product.setIdCategory(category);
        product.setPriceSize(priceSizeList);
        product.setStatus(status);
        product.setImg(img);

        try {
            (new ProductService()).update(product);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/product");
    }
}
