package vn.edu.hcmuaf.fit.controller.admin.sale;

import vn.edu.hcmuaf.fit.bean.Sale;
import vn.edu.hcmuaf.fit.services.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Sale", value = "/admin/sale")
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
        SaleService saleService = new SaleService();
        int count = saleService.getTotal();
        int endPage = count/5;
        if(count % 5 != 0) {
            endPage++;
        }

        try {
            List<Sale> saleList = saleService.getPaging(index);
            request.setAttribute("saleList", saleList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("sale/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
