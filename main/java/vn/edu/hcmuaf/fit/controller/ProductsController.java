package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listProducts", value = "/shop")
public class ProductsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = ((HttpServletRequest) request).getRequestURI().toString();
        session.setAttribute("url", url);

        String indexPage = request.getParameter("index");
        String sortPage = request.getParameter("sort");
        int sort = 0;
        if (sortPage == null) {
            sort = 0;
        } else if (sortPage.equals("1")) {
            sort = 1;
        } else if(sortPage.equals("2")){
            sort = 2;
        }
        int index;
        if(indexPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(indexPage);
        }
        ProductService producService = null;
        try {
            producService = new ProductService();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        String sortString = "&sort=0";
        int indexCate = 0;
        CategoryService categoryService = new CategoryService();
        List<Product> listProduct;
        if(sort == 1) {
            sortString = "&sort=1";

            listProduct = producService.sortASC(index);
        } else if(sort ==2 ) {
            sortString = "&sort=2";

            listProduct = producService.sortDECS(index);
        } else {
            listProduct = producService.getPagingProduct(index);
        }

        int count = producService.getTotalProduct();
        int endPage = count/12;
        if(count % 12 != 0) {
            endPage++;
        }

        List<Category> listCategories = categoryService.getAll();
        listCategories.add(0, new Category(0,"Tất cả",0));


        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageIndex", index);
        request.setAttribute("tagCate", 0);
        request.setAttribute("pageSort", sortString);
        request.setAttribute("sort", sort);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
