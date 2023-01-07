<%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/18/2022
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title> Liên hệ</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet" />

  <!-- Css Styles -->
  <%@include file="css.jsp"%>
  <link rel="stylesheet" href="css/contact.css" type="text/css" />
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
  <div class="offcanvas__option">
    <div class="offcanvas__links">
      <a href="login-register.jsp">Đăng nhập</a>
    </div>
  </div>
  <div class="offcanvas__nav__option">
    <a href="#" class="search-switch"><img src="img/icon/search.png" alt="" /></a>
    <a href="#"><img src="img/icon/heart.png" alt="" /></a>
    <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
    <div class="price">0 vnđ</div>
  </div>
  <div id="mobile-menu-wrap"></div>
  <div class="offcanvas__text">
    <p> Miễn phí vận chuyển, hoàn trả trong 30 ngày hoặc đảm bảo hoàn lại tiền.</p>
  </div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->
<section class="hero">
  <div class="container">
    <div class="breadcumb">
      <h1>Liên hệ</h1>
      <h6>Thông tin liên hệ</h6>
      <img src="assets/images/icon_tealeaves.png" width="500px" height="50px" style="object-fit: cover; scale: 0.5" />
    </div>

    <div class="hero__slider owl-carousel">
      <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.264114216549!2d106.78577111468452!3d10.867505260477905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752723ea2654c5%3A0x4f23b763376a799d!2zQuG6o25nIHTDqm4gVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLkhDTQ!5e0!3m2!1svi!2s!4v1667450035309!5m2!1svi!2s"
              width="100%" height="450" style="border: 0" allowfullscreen="" loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
  </div>
</section>

<!-- Contact Section Begin -->
<section class="contact spad">
  <div class="container">
    <div class="rows">
      <div class="col-lg-66 col-md-66">
        <div class="contact__text">
          <ul>
            <p>Tên chính thức: <b>CÔNG TY CỔ PHẦN HAHATI</b></p>
            <p>
              Trụ sở chính: 42/24-42/26 Đường 643 Tạ Quang Bửu, Phường 4,
              Quận 8, Tp. HCM
            </p>
            <p>Mã số thuế/GPKD: 0316 871719</p>
            <p>Người đại diện theo pháp luật: Nguyễn Vũ Mạnh Hà</p>
            <p>Điện thoại: (+84) 345 825 875</p>
            <p>Email: hainguyen456@gmail.com</p>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Contact Section End -->

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
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>
