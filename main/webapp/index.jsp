<%@ page import="vn.edu.hcmuaf.fit.bean.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <%@include file="css.jsp" %>
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/blog.css" type="text/css"/>
    <link rel="stylesheet" href="css/shop.css" type="text/css">
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
        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""/></a>
        <a href="#"><img src="img/icon/heart.png" alt=""/></a>
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

<!-- Hero Section Begin -->
<section class="hero">
    <div class="hero__slider owl-carousel">
        <div class="hero__items set-bg" data-setbg="img/hero/h1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <div class="hero__social">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero__items set-bg" data-setbg="img/hero/h2.png">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">

                            <a href="#" class="primary-btn" id="banner-arrow">Shop now <span class="arrow_right"></span></a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero__items set-bg" data-setbg="img/hero/h3.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Banner Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="breadcumb">
            <h1>Trang chủ</h1>
            <img src="assets/images/icon_tealeaves.png" width="500px" height="50px"
                 style="object-fit: cover;scale: 0.5;">
        </div>
        <div class="row ">
            <div class="col text-center mb-3">
                <h6 class="text_banner">Tin tức mới nhất</h6>
            </div>
            <div class="row">
                <%
                    List<Blog> listBlog = (List<Blog>) request.getAttribute("listBlog");
                    if (listBlog != null) {
                        for (Blog b : listBlog) {
                %>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="<%=b.getImage()%>"></div>
                        <div class="blog__item__text">
                            <span><img src="img/icon/calendar.png" alt=""/> <%=b.getDate()%></span>
                            <h5><%=b.getName()%>
                            </h5>
                            <a href="blog-details?blogid=<%=b.getId()%>" target="_blank">Xem Thêm
                                <main></main>
                            </a>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
</section>
<!-- Banner Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col text-center mb-3">
                <h6 class="text_banner">Sản phẩm mới nhất</h6>
            </div>
        </div>
        <div class="row d-flex">
            <%
                List<Product> list = (List<Product>) request.getAttribute("listProduct");
                if (list != null) {
                    for (Product p : list) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-4">
                <div class="product__item sale" data-toggle="modal"
                     data-target="#myModal<%=p.getId()%>" data-id="<%=p.getId()%>">
                    <div class="product__item__pic set-bg" data-setbg="<%=p.getImg()%>">
                        <%
                            if (p.getStatus() == 1) {
                        %>
                        <span class="label">Sale</span>
                        <%}%>
                    </div>
                    <div class="product__item__text">
                        <h5><%=p.getName()%>
                        </h5>
                        <%
                            int price = 0;
                            CurrencyFormat currency = new CurrencyFormat();
                            if (p.getPriceSize().size()
                                    > 0) {
                                price = (int) (p.getPriceSize().get(0).getPrice());
                            } else {
                                price = 0;
                            }
                        %>
                        <h6><%=currency.format(price)%>
                        </h6>
                    </div>
                </div>
                <jsp:include page='/modal.jsp'>
                    <jsp:param name="id" value="<%=p.getId()%>"/>
                </jsp:include>
            </div>
            <button type="button" class="btn btn-primary btn-lg d-none" id="btn-modal<%=p.getId()%>"
                    data-toggle="modal"
                    data-target="#myModal">
            </button>
            <% }
            }%>
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
            <input type="text" id="search-input" placeholder="Search here.....">
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
<script src="js/modal.js" defer></script>
<script>
    $(document).ready(function () {
        $(".product__item").click(function (e) {
            var val = this.getAttribute('data-id');
            var s = '#btn-modal' + val;
            $(s).click();
        });
    });

    setInterval(function () {
        $(".owl-next").click
    }, 5000);
</script>
</body>

</html>