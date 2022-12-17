package vn.edu.hcmuaf.fit.controller.admin.topping;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Topping;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ToppingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Topping update", value = "/admin/topping/update")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Topping topping = (new ToppingService()).getById(id);
            request.setAttribute("object", topping);

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
        try {
            (new ToppingService()).update(new Topping(Integer.parseInt(request.getParameter("id").replaceAll("\\s+", "")),
                    request.getParameter("name").substring(0, 1).toUpperCase() + request.getParameter("name").substring(1).toLowerCase(),
                    Float.parseFloat(request.getParameter("price").replaceAll("\\s+", "")),
                    Integer.parseInt(request.getParameter("category").replaceAll("\\s+", "")),
                    Integer.parseInt(request.getParameter("status").replaceAll("\\s+", ""))));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/topping");
    }
}
