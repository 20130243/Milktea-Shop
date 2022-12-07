package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.Size;
import vn.edu.hcmuaf.fit.services.ProducService;
import vn.edu.hcmuaf.fit.services.SizeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listProducts", value = "/shop")
public class listProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        int index;
        if(indexPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(indexPage);
        }
        ProducService producService = new ProducService();
        SizeService sizeService = new SizeService();
        int count = producService.getTotalProduct();
        int endPage = count/12;
        if(count % 12 != 0) {
            endPage++;
        }

        List<Product> listProduct = producService.getPagingProduct(index);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
