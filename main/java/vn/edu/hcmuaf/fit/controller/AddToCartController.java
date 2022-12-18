package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.services.ProductService;
import vn.edu.hcmuaf.fit.services.ToppingService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "addToCart", value = "/addToCart")
public class AddToCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        float price = 0;
        String id = request.getParameter("product_id");
        int pro_id;
        String url = null;
        if (id != null) {
            pro_id = Integer.parseInt(id);
            Product product = new ProductService().getById(pro_id);
            if (product != null) {
                List<Topping> toppingList = new ToppingService().getAll();
                List<Topping> toppings = new ArrayList<>();
                for (Topping topping : toppingList) {
                    String nameTopping = request.getParameter(topping.getId() + "");
                    if (nameTopping != null) {
                        if (nameTopping.equals(topping.getName())) {
                            toppings.add(topping);
                        }
                    }
                }
                String size = request.getParameter("size" + pro_id);
                List<PriceSize> priceSizes = new ArrayList<>();
                if (size.equalsIgnoreCase("M")) {
                    priceSizes.add(new PriceSize(0,0,size, new ProductService().getPriceSizeM(pro_id), new ProductService().getPriceSizeM(pro_id)));
                } else if (size.equalsIgnoreCase("L")) {
                    priceSizes.add(new PriceSize(0,0,size, new ProductService().getPriceSizeL(pro_id),new ProductService().getPriceSizeL(pro_id)));
                }

                product.setPriceSize(priceSizes);
                product.setTopping(toppings);
                quantity = Integer.parseInt(request.getParameter("quantity" + id));
                price = product.getPriceSize().get(0).getPrice() * quantity;
                if (toppings.size() > 0) {
                    for (int i = 0; i < toppings.size(); i++) {
                        price = price +  toppings.get(i).getPrice() * quantity;
                    }
                }
            HttpSession session = request.getSession();
                url =(String) session.getAttribute("url");
                User user = (User) session.getAttribute("user");
            if (session.getAttribute("cart") == null) {
                Cart cart = new Cart();
                List<Item> listItems = new ArrayList<Item>();
                Item item = new Item();
                item.setId(listItems.size());
                item.setQuantity(quantity);
                item.setProduct(product);
                item.setNote(request.getParameter("note"));
                item.setPrice(price);
                listItems.add(item);
                cart.setItems(listItems);
                cart.updateTotal();


                session.setAttribute("cart", cart);
            } else {
                Cart cart = (Cart) session.getAttribute("cart");
                List<Item> listItems = cart.getItems();
                boolean check = false;
                for (Item item : listItems) {
                    if (item.getProduct().toString().equals(product.toString())) {
                        item.setQuantity(item.getQuantity() + quantity);
                        item.setPrice(item.getPrice() + price);
                        cart.updateTotal();
                        if(user!=null) {
                            cart.setCustomer(user);
                        }
                        check = true;
                    }
                }
                if (check==false) {
                    Item item = new Item();
                    item.setId(listItems.size());
                    item.setQuantity(quantity);
                    item.setProduct(product);
                    item.setNote(request.getParameter("note"));
                    item.setPrice(price);
                    listItems.add(item);
                    cart.updateTotal();
                }
                if(user!=null) {
                    cart.setCustomer(user);
                }
                System.out.println(cart.getCustomer().toString());
                session.setAttribute("cart", cart);
            }

        }

            response.sendRedirect(request.getContextPath() + url);

    }
        else {

            response.sendRedirect(request.getContextPath() + url);
    }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
