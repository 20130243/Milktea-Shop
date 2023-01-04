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

@WebServlet(name = "Topping create", value = "/admin/topping/create")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
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
            ToppingService toppingService = new ToppingService();
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price").replaceAll("\\s+", ""));
            String[] category = request.getParameterValues("category");
            int status = Integer.parseInt(request.getParameter("status").replaceAll("\\s+", ""));
            for (String cate : category) {
                Topping topping = new Topping();
                topping.setName(name);
                topping.setPrice(price);
                topping.setStatus(status);
                topping.setCategory_id(Integer.parseInt(cate));
                toppingService.insert(topping);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/topping");
    }
}
