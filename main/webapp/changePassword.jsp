<%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/19/2022
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>HAHATI | Quên mật khẩu</title>

  <!-- Google Font -->
  <link
          href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet"
  />

  <!-- Css Styles -->
  <%@include file="css.jsp"%>
  <link rel="stylesheet" href="css/account.css" type="text/css" />
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
      <a href="#">Đăng nhập</a>
    </div>
  </div>
  <div class="offcanvas__nav__option">
    <a href="#" class="search-switch"
    ><img src="img/icon/search.png" alt=""
    /></a>
    <a href="#"><img src="img/icon/heart.png" alt="" /></a>
    <a href="#"><img src="img/icon/cart.png" alt="" /> <span>0</span></a>
  </div>
  <div id="mobile-menu-wrap"></div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->

<!-- Shopping Cart Section Begin -->
<section class="login-register">
  <div class="main-content-wrap section-ptb lagin-and-register-page">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 col-md-12 m-auto">
          <div class="login-register-wrapper">
            <!-- login-register-tab-list start -->
            <div class="login-register-tab-list nav">
              <a class="active" data-bs-toggle="tab" href="#lg1">
                <h4>Thay đổi mật khẩu</h4>
              </a>
            </div>
            <!-- login-register-tab-list end -->
            <div class="tab-content">
              <div id="lg1" class="tab-pane active">
                <div class="login-form-container">
                  <div class="login-register-form">
                    <form action="/changePassword" method="get">
                      <div class="login-input-box">
                        <input
                                type="password"
                                name="password-old"
                                placeholder="Mật nhẩu cũ "
                        />
                        <input
                                type="password"
                                name="password-new"
                                placeholder="Mật nhẩu mới"
                        />

                        <input
                                type="password"
                                name="password-new-confirm"
                                placeholder="Nhập lại mật nhẩu "
                        />
                      </div>
                      <span class="text-danger" id="register-username-error">${requestScope['erorr_changePassword']}</span>
                      <div class="button-box">
                        <button class="register-btn btn" type="submit">
                          <span>Đổi mật khẩu</span>
                        </button>
                      </div>
                    </form>
                  </div>
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
<script src="js/account/bootstrap.min.js"></script>
<script src="assets/js/vendor/jquery-3.5.1.min.js"></script>

<script src="assets/js/vendor/account/js/vendor/jquery-3.5.1.min.js"></script>
<script src="assets/js/vendor/account/js/vendor/modernizr-3.6.0.min.js"></script>
<script src="assets/js/vendor/account/js/vendor/popper.min.js"></script>
<script src="assets/js/vendor/account/js/vendor/jquery-migrate-3.3.0.min.js"></script>
<script src="assets/js/vendor/account/js/vendor/bootstrap.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/slick.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/jquery.nice-select.min.js"></script>

<script src="assets/js/vendor/account/js/plugins/countdown.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/image-zoom.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/fancybox.js"></script>
<script src="assets/js/vendor/account/js/plugins/scrollup.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/jqueryui.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/ajax-contact.js"></script>
<script src="assets/js/vendor/account/js/main.js"></script>
</body>
</html>
