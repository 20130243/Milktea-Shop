package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.services.ProductService;
import vn.edu.hcmuaf.fit.services.ToppingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "addToCart", value = "/addToCart")
public class AddToCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        float price = 0;
        HttpSession session = request.getSession();
        try {
            ProductService productService = new ProductService();
            String id = request.getParameter("product_id");
            int pro_id;
            String url = (String) session.getAttribute("url");
            if (id != null) {
                pro_id = Integer.parseInt(id);
                Product product = null;
                try {
                    product = productService.getById(pro_id);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
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
                        PriceSize sizeM = productService.getSizeM(pro_id);
                        priceSizes.add(new PriceSize(sizeM.getId(), sizeM.getId(), size, sizeM.getPrice(), sizeM.getOriginalPrice()));
                    } else if (size.equalsIgnoreCase("L")) {
                        PriceSize sizeL = productService.getSizeL(pro_id);
                        priceSizes.add(new PriceSize(sizeL.getId(), sizeL.getId(), size, sizeL.getPrice(), sizeL.getOriginalPrice()));
                    }
                    product.setPriceSize(priceSizes);
                    product.setTopping(toppings);
                    quantity = Integer.parseInt(request.getParameter("quantity" + id));
                    price = product.getPriceSize().get(0).getPrice() * quantity;
                    if (toppings.size() > 0) {
                        for (int i = 0; i < toppings.size(); i++) {
                            price = price + toppings.get(i).getPrice() * quantity;
                        }
                    }

                    User user = (User) session.getAttribute("user");
                    if (session.getAttribute("cart") == null) {
                        Cart cart = new Cart();
                        List<Item> listItems = new ArrayList<Item>();
                        Item item = new Item(listItems.size(),product,quantity,price,request.getParameter("note"));
                        cart.setItems(listItems);
                        cart.addItem(item);
                        cart.updateTotal();
                        session.setAttribute("cart", cart);
                        response.sendRedirect(request.getContextPath() + url);
                    } else {
                        Cart cart = (Cart) session.getAttribute("cart");
                        List<Item> listItems = cart.getItems();
                        boolean check = false;
                        for (Item item : listItems) {
                            if (item.getProduct().toString().equals(product.toString())) {
                                item.setQuantity(item.getQuantity() + quantity);
                                item.setPrice(item.getPrice() + price);
                                cart.updateTotal();
                                if (user != null) {
                                    cart.setCustomer(user);
                                }
                                check = true;
                            }
                        }
                        if (check == false) {
                            Item item = new Item(listItems.size(),product,quantity,price,request.getParameter("note"));
                            cart.addItem(item);
                            cart.updateTotal();
                        }
                        if (user != null) {
                            cart.setCustomer(user);
                        }
                        session.setAttribute("cart", cart);
                       response.sendRedirect(request.getContextPath() + url);
                    }
                }



            }
        } catch (Exception e) {
            e.printStackTrace();
        }
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
