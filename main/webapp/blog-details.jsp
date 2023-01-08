<%@ page import="vn.edu.hcmuaf.fit.bean.Blog" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/3/2022
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zxx">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Chi tiết khuyến mãi</title>

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
            rel="stylesheet"
    />

    <!-- Css Styles -->
    <%@include file="css.jsp"%>
    <link rel="stylesheet" href="css/blog-details.css" type="text/css"/>
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
        <a href="#" class="search-switch"
        ><img src="img/icon/search.png" alt=""
        /></a>
        <a href="#"><img src="img/icon/heart.png" alt=""/></a>
        <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
        <div class="price">0.00 vnđ</div>
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
                    <a href="index.jsp"
                    ><img class="logo-small" src="img/logo.png" alt=""
                    /></a>
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
                    <a href="login-register.jsp" class="primary-btn login-btn"
                    >Đăng nhập</a
                    >
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>
<!-- Header Section End -->

<!-- Blog Details Hero Begin -->

<%
    Blog blog = (Blog) request.getAttribute("detail");
%>
<section class="blog-hero spad">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-9 text-center">
                <div class="blog__hero__text">
                    <h2><%=blog.getName()%>
                    </h2>
                    <ul>
                        <li><%=blog.getDate()%>
                        </li>
                        <li><i class="fa-solid fa-eye"></i> 888</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Details Hero End -->

<!-- Blog Details Section Begin -->
<section class="blog-details spad">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-12">
                <div class="blog__details__pic">
                    <img src="<%=blog.getImage()%>" alt=""/>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="blog__details__content">
                    <div class="blog__details__share">
                        <span>chia sẻ</span>
                        <ul>
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#" class="twitter"
                                ><i class="fa fa-twitter"></i
                                ></a>
                            </li>
                            <li>
                                <a href="#" class="youtube"
                                ><i class="fa fa-youtube-play"></i
                                ></a>
                            </li>
                            <li>
                                <a href="#" class="linkedin"
                                ><i class="fa fa-linkedin"></i
                                ></a>
                            </li>
                        </ul>
                    </div>
                    <div class="blog__details__text">
                        <p>
                                <%=blog.getContent()%>
                            <br/>
                    </div>
                </div>
            </div>
        </div>
</section>
<!-- Blog Details Section End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="img/footer-logo.png" alt=""/></a>
                    </div>
                    <p>TỪ NHỮNG MẦM TRÀ, CHÚNG TÔI TẠO RA NIỀM ĐAM MÊ</p>
                    <a href="#"><img src="img/payment.png" alt=""/></a>
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
                            <input type="text" placeholder="Email của bạn"/>
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
            <input type="text" id="search-input" placeholder="Search here....."/>
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
