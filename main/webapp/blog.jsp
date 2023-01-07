<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Blog" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/3/2022
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title> Tin tức</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet" />

    <!-- Css Styles -->
    <%@include file="css.jsp"%>
    <link rel="stylesheet" href="css/blog.css" />
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
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->
<div class="thumbCover">
    <img src="./img/banner-matcha.jpg" alt="" />
</div>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="breadcumb">
            <h1>Tin tức</h1>
            <h6>Tất cả tin tức</h6>
            <img src="assets/images/icon_tealeaves.png" width="500px" height="50px" style="object-fit: cover; scale: 0.5" />
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<!-- Shopping Cart Section Begin -->
<section class="blog">
    <div class="container">
        <div class="row">
            <%
                List<Blog> listAllBlog = (List<Blog>) request.getAttribute("listBlog");
                for (Blog b : listAllBlog) {
            %>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic set-bg" data-setbg="<%=b.getImage()%>"></div>
                    <div class="blog__item__text">
              <span><img src="img/icon/calendar.png" alt="" /> <%=b.getDate()%></span>
                        <h5><%=b.getName()%></h5>
                        <a href="blog-details?blogid=<%=b.getId()%>" target="_blank">Xem Thêm
                            <main></main></a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>

        <div class="row spad">
            <div class="col-lg-12">
                <div class="product__pagination">
                    <%
                        int count = (int) request.getAttribute("endPage");
                        for (int i = 1; i <= count; i++) {
                    %>
                    <a class="<%=(int) request.getAttribute("pageIndex") == i? "active" : ""%>"
                       href="blog?index=<%=i%>"><%=i%>
                    </a>
                    <%}%>
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
</body>

</html>
