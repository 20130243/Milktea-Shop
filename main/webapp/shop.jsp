<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Size" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/3/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thức uống</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/shop.css" type="text/css">
    <link rel="stylesheet" href="css/modal.css" type="text/css">
    <link rel="stylesheet" href="css/header-footer.css" type="text/css">
</head>

<body >
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
        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>

        <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
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
                        <li class="active"><a href="./shop.html">Thức uống</a></li>
                        <li>
                            <a href="#">Giới thiệu</a>
                            <ul class="dropdown">
                                <li><a href="./about.html">Về chúng tôi</a></li>
                                <li><a href="./contact.html">Liên hệ</a></li>
                            </ul>
                        </li>

                        <li><a href="./blog.html">Khuyến mãi</a></li>
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

<!-- Shop Section Begin -->
<section class="shop">
    <div class="container">
        <div class="breadcumb">
            <h1>Thức uống</h1>
            <h6>Tất cả sản phẩm</h6>
            <img src="assets/images/icon_tealeaves.png" width="500px" height="50px"
                 style="object-fit: cover;scale: 0.5;">
        </div>


        <div class="row">
            <div class=" col-lg-9">
                <!-- Button trigger modal -->
                <div class="row search_bar">
                    <div class="col-lg-4 col-md-4 col-sm-4 ">
                        <h6 class="search_bar_text">Tìm kiếm</h6>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <h6 class="search_bar_text">Nhóm sản phẩm</h6>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 ">
                        <h6 class="search_bar_text">Theo giá</h6>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 shop__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Tìm kiếm sản phẩm" style="padding-right:42px ;">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4" style="z-index: 99;">
                        <ul class="menu-drop">
                            <li class="menu-item active">
                                <a href="" class="">Chọn nhóm </a>
                            </li>
                            <li class="menu-item ">
                                <a href="">Cà phê </a>
                            </li>
                            <li class="menu-item ">
                                <a href="">Trà sữa </a>
                            </li>
                            <li class="menu-item ">
                                <a href="">Trà</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4" style="z-index: 99;">
                        <ul class="menu-drop">
                            <li class="menu-item active">
                                <a href="" class="">Không lựa chọn</a>
                            </li>
                            <li class="menu-item ">
                                <a href="">Giá thấp đến cao</a>
                            </li>
                            <li class="menu-item ">
                                <a href="">Giá cao đến thấp</a>
                            </li>
                        </ul>

                    </div>

                </div>

                <div class="row">
                    <%
                    List<Product> list = (List<Product>) request.getAttribute("listProduct");
                        for (Product p : list) {
                    %>
                    <div class="col-lg-3 col-md-4 col-sm-4" >

                        <div class="product__item sale" data-toggle="modal"
                             data-target="#myModal<%=p.getId()%>" data-id="<%=p.getId()%>">
                            <div class="product__item__pic set-bg" data-setbg="<%=p.getImg()%>">
                                <%
                                if(p.getStatus() == 1) {
                                %>
                                <span class="label">Sale</span>
                                <%}%>
                            </div>
                            <div class="product__item__text">
                                <h5><%=p.getName()%></h5>
                                <%
                                    CurrencyFormat currency = new CurrencyFormat();
                                    int price = (int) (p.getPriceSize().get(0).getPrice());
                                %>
                                <h6><%=currency.format(price)%></h6>
                            </div>
                        </div>
                        <jsp:include page='/modal.jsp'>
                            <jsp:param name="id" value="<%=p.getId()%>"/>
                        </jsp:include>
                    </div>
                    <button type="button" class="btn btn-primary btn-lg d-none" id="btn-modal<%=p.getId()%>" data-toggle="modal"
                            data-target="#myModal">
                    </button>
                    <%  }%>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="shop__sidebar__accordion">
                    <div class="">
                        <div class="cart-product">
                            <div class="cart-heading">
                                <h4 class="cart-product-heading"><i class="fa-solid fa-cart-shopping mr-2"></i>GIỎ
                                    HÀNG</h4>
                            </div>
                            <div class="cart-product-list">
                                <div class="cart-product-item">
                                    <div class="cart-product-name">
                                        <img src="img/icon/drink.png" width="32" height="32">
                                        <h5> Trà sữa ô long(L)</h5>
                                    </div>
                                    <div class="cart-product-detail justify-content-between">
                                        <div class="detail">Topping:</div>
                                        <div class="cart-product-quantity">
                                            <i class="fa-solid fa-minus item"></i>
                                            <div class="quantity">1</div>
                                            <i class="fa-solid fa-plus item"></i>
                                        </div>
                                    </div>
                                    <div class="cart-product-price">
                                        36.000đ x 1 = 36.0000đ
                                    </div>
                                </div>
                                <div class="cart-product-item">
                                    <div class="cart-product-name">
                                        <img src="img/icon/drink.png" width="32" height="32">
                                        <h5> Trà sữa ô long(L)</h5>
                                    </div>
                                    <div class="cart-product-detail justify-content-between">
                                        <div class="detail">Topping:</div>
                                        <div class="cart-product-quantity">
                                            <i class="fa-solid fa-minus item"></i>
                                            <div class="quantity">1</div>
                                            <i class="fa-solid fa-plus item"></i>
                                        </div>
                                    </div>
                                    <div class="cart-product-price">
                                        36.000đ x 1 = 36.0000đ
                                    </div>
                                </div>
                                <div class="cart-product-item">
                                    <div class="cart-product-name">
                                        <img src="img/icon/drink.png" width="32" height="32">
                                        <h5> Sữa tươi trân châu đường đen(L)</h5>
                                    </div>
                                    <div class="cart-product-detail justify-content-between">
                                        <div class="detail">Topping: Sương sáo x1; Thạch vải x1</div>
                                        <div class="cart-product-quantity">
                                            <i class="fa-solid fa-minus item"></i>
                                            <div class="quantity">1</div>
                                            <i class="fa-solid fa-plus item"></i>
                                        </div>
                                    </div>
                                    <div class="cart-product-price">
                                        48.000đ x 1 = 48.0000đ
                                    </div>
                                </div>
                            </div>
                            <div class="cart-product-total">
                                <div class="total">
                                    Tổng tiền: <span> class="price"> 120.000đ</span>
                                </div>
                                <button class=" btn-pay">Thanh toán</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row spad">
            <div class="col-lg-12">
                <div class="product__pagination">
                    <%
                    int count = (int) request.getAttribute("endPage");
                    for (int i = 1; i <= count; i++) {
                    %>
                        <a class="active" href="shop?index=<%=i%>"><%=i%></a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

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


<%--<a href="shop?proId=<%=p.getId()%>" type="button" class="btn btn-primary btn-lg d-none" id="btn-modal" data-toggle="modal"--%>
<%--   data-target="#myModal" ></a>--%>

<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

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
<script src="js/modal.js"></script>
<script src="js/main.js"></script>
<script src="js/cart.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"--%>
<%--        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">--%>
<%--</script>--%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script>


<script>
    $(document).ready(function () {
        $(".product__item").click(function (e) {
            var val = this.getAttribute('data-id');
            var s = '#btn-modal' + val;
            $(s).click();
        });
    });


</script>
</body>

</html>
