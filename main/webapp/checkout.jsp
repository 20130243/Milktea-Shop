<%@ page import="vn.edu.hcmuaf.fit.bean.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Topping" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %><%--
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
  <meta name="description" content="Male_Fashion Template" />
  <meta name="keywords" content="Male_Fashion, unica, creative, html" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Thanh toán</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet" />

  <!-- Css Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
  <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
  <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
  <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
  <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
  <link rel="stylesheet" href="css/style.css" type="text/css" />
  <link rel="stylesheet" href="css/header-footer.css" type="text/css" />
  <link rel="stylesheet" href="css/cart.css" type="text/css">
</head>

<body>
<%
  Cart cart = (Cart) session.getAttribute("cart");
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
<%--<header class="header">--%>
<%--  <div class="container">--%>
<%--    <div class="row">--%>
<%--      <div class="col-lg-3 col-md-3">--%>
<%--        <div class="header__logo">--%>
<%--          <a href="index.jsp"><img class="logo-small" src="img/logo.png" alt="" /></a>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="col-lg-6 col-md-6">--%>
<%--        <nav class="header__menu mobile-menu">--%>
<%--          <ul>--%>
<%--            <li><a href="index.jsp">Trang chủ</a></li>--%>
<%--            <li><a href="./shop.html">Thức uống</a></li>--%>
<%--            <li>--%>
<%--              <a href="#">Giới thiệu</a>--%>
<%--              <ul class="dropdown">--%>
<%--                <li><a href="./about.html">Về chúng tôi</a></li>--%>
<%--                <li><a href="./contact.html">Liên hệ</a></li>--%>
<%--              </ul>--%>
<%--            </li>--%>

<%--            <li class="active"><a href="./blog.html">Khuyến mãi</a></li>--%>
<%--          </ul>--%>
<%--        </nav>--%>
<%--      </div>--%>
<%--      <div class="col-lg-3 col-md-3">--%>
<%--        <div class="header__nav__option">--%>
<%--          <a href="./login-register.html" class="primary-btn login-btn">Đăng nhập</a>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="canvas__open"><i class="fa fa-bars"></i></div>--%>
<%--  </div>--%>
<%--</header>--%>


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
                  }
                %>
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
        <div class="cart__discount checkout__form shadow p-4">
          <div class="row">
            <div class="col-lg-12 col-md-12">
              <h6 class="">Thông tin nhận hàng</h6>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Tên người nhận<span>*</span></p>
                    <input type="text">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Số điện thoại người nhận<span>*</span></p>
                    <input type="phone">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Địa chỉ nhận hàng<span>*</span></p>
                    <textarea name="" cols="" rows="2" style="width: 100%;"></textarea>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div class="checkout__input">
                    <p>Ghi chú<span>*</span></p>
                    <textarea name="" cols="" rows="2" style="width: 100%;"></textarea>
                  </div>
                </div>
              </div>
              <form action="#">
                <input type="text" placeholder="Nhập mã giảm giá ">
                <button type="submit">Áp dụng</button>
              </form>
              <div class="row">
                <div class="col-lg-12">
                  <h6 class="mt-4  mb-3">Tổng giỏ hàng</h6>
                  <div>
                    <%
                    if(cart!=null) {

                    %>
                    <p>Tổng tiền: <span><%=new CurrencyFormat().format((int) cart.getTotalMoney())%></span></p>
                    <p>Giảm giá: <span>0đ</span></p>
                    <%
                      } else {
                    %>
                    <p>Tổng tiền: <span><%=new CurrencyFormat().format((int) 0)%></span></p>
                    <p>Giảm giá: <span>0đ</span></p>
                    <%
                      }
                    %>
                  </div>
                  <a href="#" class="primary-btn w-100 text-center">Đặt hàng</a>
                </div>
              </div>
            </div>
          </div>
        </div>
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
</body>

</html>