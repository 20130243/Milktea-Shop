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

@WebServlet(name = "Topping", value = "/admin/topping")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        int index;
        if(page == null) {
            index = 1;
        } else {
            index = Integer.parseInt(page);
        }
        ToppingService toppingService = new ToppingService();
        int count = toppingService.getTotal();
        int endPage = count/10;
        if(count % 10 != 0) {
            endPage++;
        }

        List<Topping> toppingList = toppingService.getPaging(index);
        request.setAttribute("toppingList", toppingList);

        try {
            List<Category>  categoryList = (new CategoryService()).getAll();
            request.setAttribute("categoryList", categoryList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("topping/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
