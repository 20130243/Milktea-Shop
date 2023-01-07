<%@ page import="vn.edu.hcmuaf.fit.bean.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Topping" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/15/2022
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Thanh toán</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet" />

  <!-- Css Styles -->
  <%@include file="css.jsp"%>
  <link rel="stylesheet" href="css/cart.css" type="text/css">
</head>

<body>
<%
  Cart cart = (Cart) session.getAttribute("cart");
  User user = (User) session.getAttribute("user");
%>
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
  <div class="offcanvas__option">
    <div class="offcanvas__links">
      <a href="login-register.html">Đăng nhập</a>
    </div>
  </div>
  <div class="offcanvas__nav__option">
    <a href="#" class="search-switch"><img src="img/icon/search.png" alt="" /></a>
    <a href="#"><img src="img/icon/heart.png" alt="" /></a>
    <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
    <div class="price">0 vnđ</div>
  </div>
  <div id="mobile-menu-wrap"></div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<div class="container">
  <div class="breadcumb">
    <h1>Thanh toán</h1>
    <img src="assets/images/icon_tealeaves.png" width="500px" height="50px" style="object-fit: cover; scale: 0.5" />
  </div>
</div>
<!-- Breadcrumb Section End -->
<!-- Shopping Cart Section Begin -->
<section class="cart">
  <div class="container">
    <div class="row mb-3">
      <div class="col-lg-8  ">
        <div class="shopping__cart__table p-3 shadow ">
          <table>
            <thead>
            <tr>
              <th>Sản phẩm</th>
              <th>Topping</th>
              <th>Số lượng</th>
              <th>Giá tiền</th>
              <th></th>
            </tr>
            </thead>
            <tbody>
            <form action="/editcart" method="get" id="myForm">
            <%
              if (cart!= null) {
                List<Item> listItems = cart.getItems();
              for (Item item : listItems) {
            %>
            <tr>
              <td class="product__cart__item">
                <div class="product__cart__item__pic">
                  <img src="<%=item.getProduct().getImg()%>" alt="" width="150">
                </div>
                <div class="product__cart__item__text">
                  <h5><%=item.getProduct().getName()%></h5>
                  <input style="display: none" class="product-modal-id" type="text" name="<%=item.getId()%>" value="<%=item.getId()%>" checked="checked">
                  <h6><%=new CurrencyFormat().format((int)item.getProduct().getPriceSize().get(0).getPrice())%></h6>
                </div>
              </td>
              <td>
                <%
                List<Topping> toppingList = item.getProduct().getTopping();
                if(toppingList.size() > 0) {
                  for (Topping topping : toppingList) {
                %>
                <p class="w-150"><%=topping.getName()%></p>
                <%
                    }
                  } else {
                %>
                <p class="w-150"></p>
                <%}%>
              </td>
              <td class="quantity__item">
                <div class="quantity">
                  <div class="pro-qty-2">
                    <input name="quantityChange<%=item.getId()%>" class="quantity" type="number" value="<%=item.getQuantity()%>">
                  </div>
                </div>
              </td>
              <td class="cart__price"><%= new CurrencyFormat().format((int)item.getPrice())%></td>
              <td class="cart__close"><a href="editcart?rpID=<%=item.getId()%>" style="border: none"><i class="fa fa-close"></i></a></td>
            </tr>
            <%
                }
              }
            %>
              </form>
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-lg-4">
        <form action="order" method="get" >
        <div class="cart__discount checkout__form shadow p-4">
          <div class="row">
            <div class="col-lg-12 col-md-12">
              <h6 class="">Thông tin nhận hàng</h6>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Tên người nhận<span>*</span></p>
                    <input name="nameUser" type="text" value="<%=user != null ? user.getName() : ""%>">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Số điện thoại người nhận<span>*</span></p>
                    <input name="phoneUser" type="tel" pattern="[0]{1}[0-9]{9}" required value="<%=user != null ? user.getPhone() : ""%>">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Địa chỉ nhận hàng<span>*</span></p>
                    <textarea name="addressUser" cols="" rows="2" style="width: 100%;"><%= request.getAttribute("addressUser") != null? request.getAttribute("addressUser"): user!=null?user.getAddress():"" %></textarea>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Ghi chú<span>*</span></p>
                    <textarea name="noteUser" cols="" rows="2" style="width: 100%;"><%=request.getAttribute("noteUser")!=null?request.getAttribute("noteUser"):""%></textarea>
                  </div>
                </div>
              </div>
              <div class="coupon_form">
                <input name="coupon" type="text" placeholder="Nhập mã giảm giá " value="<%=cart != null && cart.getCoupon()!=null? cart.getCoupon().getCode():""%>">
                <button type="submit" formaction="/coupon" >Áp dụng</button>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <h6 class="mt-4  mb-3">Tổng giỏ hàng</h6>
                  <div>
                    <%
                    if(cart!=null) {
                    %>
                    <p>Tổng tiền: <span><%=new CurrencyFormat().format((int) cart.getTotalMoney())%></span></p>
                    <p>Đã giảm: <span><%=cart.getCoupon()!=null? cart.getCoupon().getPercent()+"%" : "0%"%></span>
                    </p>
                    <%
                      } else {
                    %>
                    <p>Tổng tiền: <span><%=new CurrencyFormat().format((int) 0)%></span></p>
                    <p>Đã giảm: <span>0%</span></p>
                    <%
                      }
                    %>
                  </div>
                  <button type="submit" class="primary-btn w-100 text-center">Đặt hàng</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        </form>
      </div>
    </div>
  </div>

</section>
<!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
<!-- Footer Section End -->
<!-- Search Begin -->
<div class="search-model">
  <div class="h-100 d-flex align-items-center justify-content-center">
    <div class="search-close-switch">+</div>
    <form class="search-model-form">
      <input type="text" id="search-input" placeholder="Search here....." />
    </form>
  </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/cart.js"></script>
<script src="js/account/bootstrap.min.js"></script>
<script src="assets/js/vendor/jquery-3.5.1.min.js"></script>
<script>
  <% String error = (String) session.getAttribute("errorCheckout");
    if(error !=null){
      if(error.equals("202")) {
  %>
  alert('Vui lòng điền đủ thông tin');
  <%} else if(error.equals("204")) {%>
  alert('Vui lòng đăng nhập');
  <%} else if(error.equals("101")) {%>
  alert('Mỗi giỏ hàng sử dụng được 1 lần');
  <%} else if(error.equals("102")) {%>
  alert('Mã giảm hết số lượng hoặc hết hạn');
   <%} session.setAttribute("errorCheckout",null);}%>


</script>
</body>

</html>