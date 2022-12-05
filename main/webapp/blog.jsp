<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Blog" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/3/2022
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zxx">

<head>
    <meta charset="UTF-8" />
    <meta name="description" content="Male_Fashion Template" />
    <meta name="keywords" content="Male_Fashion, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title> Tin tức</title>

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
    <link rel="stylesheet" href="css/blog.css" />
    <link rel="stylesheet" href="css/header-footer.css" type="text/css" />
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
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="index.jsp"><img class="logo-small" src="img/logo.png" alt="" /></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="./shop.html">Thức uống</a></li>
                        <li>
                            <a href="#">Giới thiệu</a>
                            <ul class="dropdown">
                                <li><a href="./about.html">Về chúng tôi</a></li>
                                <li><a href="./contact.html">Liên hệ</a></li>
                            </ul>
                        </li>

                        <li class="active"><a href="./blog.html">Khuyến mãi</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="./login-register.html" class="primary-btn login-btn">Đăng nhập</a>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>
<!-- Header Section End -->
<div class="thumbCover">
    <img src="./img/banner-matcha.jpg" alt="" />
</div>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="breadcumb">
            <h1>Khuyến mãi</h1>
            <h6>Tất cả khuyến mãi</h6>
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
                    <a class="active" href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <span>...</span>
                    <a href="#">21</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="img/footer-logo.png" alt="" /></a>
                    </div>
                    <p>TỪ NHỮNG MẦM TRÀ, CHÚNG TÔI TẠO RA NIỀM ĐAM MÊ</p>
                    <a href="#"><img src="img/payment.png" alt="" /></a>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Khuyến mãi</h6>
                    <ul>
                        <li><a href="./blog.html">Tin tức</a></li>
                        <li><a href="./shop.html">Shop</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Liên hệ</h6>
                    <ul>
                        <li><a href="./about.html">Về chúng tôi</a></li>
                        <li><a href="./contact.html">Địa chỉ</a></li>
                        <li>
                            <a href="https://manhhawebapp.web.app/" target="_blank">20130243@st.hcmuaf.edu.vn</a>
                        </li>
                        <li>
                            <a href="https://ltrtinh27.web.app/" target="_blank">20130440@st.hcmuaf.edu.vn</a>
                        </li>
                        <li>
                            <a href="#">20130245@st.hcmuaf.edu.vn</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>Nhận khuyến mãi</h6>
                    <div class="footer__newslatter">
                        <p>Nhập email để không bõ lỡ những khuyến mãi hấp dẫn!</p>
                        <form action="#">
                            <input type="text" placeholder="Email của bạn" />
                            <button type="submit">
                                <span class="icon_mail_alt"></span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
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
