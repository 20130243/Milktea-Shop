<%@ page import="vn.edu.hcmuaf.fit.bean.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Topping" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/13/2022
  Time: 1:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if(cart != null) {

        List<Item> listItems = cart.getItems();
        for (Item item : listItems) {


%>
<form action="/checkout.jsp" method="post">

<div class="cart-product-list">
    <div class="cart-product-item">
    <div class="cart-product-name">
        <img src="<%=item.getProduct().getImg()%>" width="32" height="32">
        <h5 class="name-product"> <%=item.getProduct().getName()%>( <%=item.getProduct().getPriceSize().get(0).getSize()%> )</h5>
    </div>
    <div style="display: none">
        <div>Giá: <p class="cart-product-detail-price"><%=item.getProduct().getPriceSize().get(0).getPrice()%></p></div>
    </div>
    <div class="cart-product-detail justify-content-between">
        <div class="detail">Topping:
        <%
            List<Topping> toppingList = item.getProduct().getTopping();
            if(toppingList.size() > 0) {
                for (Topping topping : toppingList) {
        %>
        <p> <%=topping.getName()%> </p>
        <%
                }
            }
        %>
        </div>
        <div class="cart-product-quantity">
            <input class="cart-quantity-input quantity" type="number" value="<%=item.getQuantity()%>>">
            <i class="fa-solid fa-xmark remove"></i>
        </div>
    </div>
    <div class="cart-product-price">
    </div>
</div>
    <%
        }
    %>
<div class="cart-product-total">

    <div class="total">
        Tổng tiền: <span class="price"> <%=cart.getTotalMoney()%> đ</span>
    </div>
    <button class=" btn-pay">Thanh toán</button>
</div>


</form>
<%
    }
%>
</body>
</html>
