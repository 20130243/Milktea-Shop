<%@ page import="vn.edu.hcmuaf.fit.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/18/2022
  Time: 9:37 AM
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
    <title> Tài khoản</title>

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
    <link rel="stylesheet" href="css/account.css" type="text/css" />
    <link rel="stylesheet" href="css/header-footer.css" type="text/css" />
</head>

<body>

<%
    User user = (User) session.getAttribute("user");
    if(user!=null) {

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

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="breadcumb">
            <h1>Tài khoản</h1>
            <h6>Quản lý tài khoản</h6>
            <img src="assets/images/icon_tealeaves.png" width="500px" height="50px" style="object-fit: cover;scale: 0.5;">
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shopping Cart Section Begin -->
<section class="account">
    <div class="main-wrapper">
        <div class="main-content-wrap section-ptb my-account-page" style="padding: 30px 0">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="account-dashboard">
                            <div class="dashboard-upper-info">
                                <div class="row align-items-center no-gutters">
                                    <div class="col-lg-3 col-md-12">
                                        <div class="d-single-info" style="height: 60px; padding: 20px 0 20px">
                                            <p class="user-name">
                                                Xin chào <span><%=user.getName()%></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-2">
                                    <ul role="tablist" class="nav flex-column dashboard-list">
                                        <li>
                                            <a href="#dashboard" data-bs-toggle="tab" class="nav-link active">Quản lý tài khoản</a>
                                        </li>
                                        <li>
                                            <a href="#account-details" data-bs-toggle="tab" class="nav-link">Thông tin cá nhân</a>
                                        </li>
                                        <li>
                                            <a href="#orders" data-bs-toggle="tab" class="nav-link">Đơn hàng</a>
                                        </li>
                                        <li>
                                            <a href="#address" data-bs-toggle="tab" class="nav-link">Sổ địa chỉ</a>
                                        </li>
                                        <li>
                                            <a href="/forgotPass.jsp" class="nav-link">Đổi mật khẩu</a>
                                        </li>
                                        <li>
                                            <a href="/logout" class="nav-link">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-12 col-lg-10">
                                    <!-- Tab panes -->
                                    <div class="tab-content dashboard-content">
                                        <!-- quản lí tài khoản -->
                                        <div class="tab-pane active" id="dashboard">
                                            <h3>Quản lý tài khoản</h3>
                                            <div class="row">
                                                <div class="d111 col-md-4">
                                                    <h6>
                                                        Thông tin cá nhân
                                                        <span class="sp111"><a class="btn__edit" href="#">Chỉnh sửa</a></span>
                                                    </h6>
                                                    <p><%=user.getName()%></p>
                                                    <p><%=user.getEmail()%></p>
                                                    <p>(+84) <%=user.getPhone()%></p>
                                                </div>
                                                <div class="d111 col-md-8" style="border-left: rgb(255, 255, 255) 10px solid">
                                                    <h6>
                                                        Sổ địa chỉ
                                                        <span class="sp111"><a class="btn__edit" href="#">Chỉnh sửa</a></span>
                                                    </h6>
                                                    <p><%=user.getName()%></p>
                                                    <p><%=user.getEmail()%></p>
                                                    <p>
                                                        <%=user.getAddress()%>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="table-responsive d222">
                                                <h5>Đơn hàng gần đây</h5>
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <th>Đơn hàng số #</th>
                                                        <th>Sản phẩm</th>
                                                        <th>Ngày đặt hàng</th>
                                                        <th>Trạng thái</th>
                                                        <th>Tổng cộng</th>
                                                        <th>Chi tiết</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- thông tin cá nhân -->
                                        <div class="tab-pane fade" id="account-details">
                                            <h3>Thông tin cá nhân</h3>
                                            <div class="login" id="edit_111" style="display: none">
                                                <div class="login-form-container">
                                                    <div class="account-login-form">
                                                        <form action="editUser" method="post">
                                                            <div class="account-input-box">
                                                                <label>Họ và tên</label>
                                                                <input type="text" name="first-name" value="<%=user.getName()%>" />
                                                                <label>Email</label>
                                                                <input type="text" name="email-name" value="<%=user.getEmail()%>" />
                                                                <label>Số điện thoại</label>
                                                                <input type="text" name="user-number" value="<%=user.getPhone()%>" />
                                                            </div>
                                                            <div class="example">(Vd: 31/05/1970)</div>
                                                            <div class="button-box">
                                                                <button class="btn default-btn" type="submit" id="submit_111">
                                                                    lưu thông tin
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="save_111">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <p class="p441">Họ và tên</p>
                                                        <p><%=user.getName()%></p>
                                                    </div>
                                                    <div class="col-3">
                                                        <p class="p441">Email</p>
                                                        <p><%=user.getEmail()%></p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="p441">Số điện thoại</p>
                                                        <p>(+84) <%=user.getPhone()%></p>
                                                    </div>
                                                </div>
                                                <div class="button-box" style="padding-top: 20px">
                                                    <button class="btn default-btn" id="btn_edit_111">
                                                        Chỉnh sửa
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- đơn hàng -->
                                        <div class="tab-pane fade" id="orders">
                                            <h3>Đơn hàng</h3>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <th>Đơn hàng số #</th>
                                                        <th>Sản phẩm</th>
                                                        <th>Ngày đặt hàng</th>
                                                        <th>Trạng thái</th>
                                                        <th>Tổng cộng</th>
                                                        <th>Chi tiết</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>15416852</td>
                                                        <td>
                                                            <img class="img111" src="img/product/product/product1.png" alt="" />
                                                            <img class="img111" src="img/product/product/product5.png" alt="" />
                                                        </td>
                                                        <td>11 thg 11 2021</td>
                                                        <td>Đã giao hàng</td>
                                                        <td>60.000đ</td>
                                                        <td>
                                                            <a href="#" class="view">Xem</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>2543543</td>
                                                        <td>
                                                            <img class="img111" src="img/product/product/product3.png" alt="" />
                                                        </td>
                                                        <td>09 thg 01 2021</td>
                                                        <td>Đã huỷ</td>
                                                        <td>2.552.082đ</td>
                                                        <td>
                                                            <a href="#" class="view">Xem</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>2357521</td>
                                                        <td>
                                                            <img class="img111" src="img/product/product/product5.png" alt="" />
                                                        </td>
                                                        <td>01 thg 01 2021</td>
                                                        <td>Đã giao hàng</td>
                                                        <td>60.000đ</td>
                                                        <td>
                                                            <a href="#" class="view">Xem</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>1358277</td>
                                                        <td>
                                                            <img class="img111" src="img/product/product/product2.png" alt="" />
                                                            <img class="img111" src="img/product/product/product3.png" alt="" />
                                                        </td>
                                                        <td>10 thg 12 2020</td>
                                                        <td>Đã huỷ</td>
                                                        <td>70.000đ</td>
                                                        <td>
                                                            <a href="#" class="view">Xem</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>1541682</td>
                                                        <td>
                                                            <img class="img111" src="img/product/product/product1.png" alt="" />
                                                            <img class="img111" src="img/product/product/product2.png" alt="" />
                                                        </td>
                                                        <td>31 thg 08 2019</td>
                                                        <td>Đã giao hàng</td>
                                                        <td>90.000đ</td>
                                                        <td>
                                                            <a href="#" class="view">Xem</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- địa chỉ -->
                                        <div class="tab-pane" id="address">
                                            <h3>Sổ địa chỉ</h3>
                                            <div class="login" id="edit_address" style="display: block">
                                                <div class="login-form-container" id="edit_address__form" style="display: none">
                                                    <div class="account-login-form">
                                                        <form action="editUser" method="post">
                                                            <div class="account-input-box">
                                                                <label>Họ và tên</label>
                                                                <input type="text" name="first-name" value="<%=user.getName()%>" />
                                                                <label>Số điện thoại</label>
                                                                <input type="text" name="user-number" value="<%=user.getPhone()%>" />
                                                                <label>Địa chỉ</label>
                                                                <input type="text" name="address"
                                                                       value="<%=user.getAddress()%>" />
                                                                <div class="button-box">
                                                                    <button class="btn default-btn" type="submit" id="submit_save__adress">
                                                                        lưu địa chỉ
                                                                    </button>
                                                                </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="address-save">
                                                <div class="d331">
                                                    <div class="row">
                                                        <div class="col-2">
                                                            <div class="row d332 text-end">
                                                                <p>Họ và tên</p>
                                                            </div>
                                                            <div class="row d332 text-end">
                                                                <p>Số điện thoại</p>
                                                            </div>
                                                            <div class="row d332 text-end">
                                                                <p>Địa chỉ</p>
                                                            </div>
                                                        </div>
                                                        <div class="col-8">
                                                            <div class="row d333">
                                                                <p>
                                                                    <%=user.getName()%>
                                                                    <span class="sp333">Mặc định</span>
                                                                </p>
                                                            </div>
                                                            <div class="row d333">
                                                                <p>(+84) <%=user.getPhone()%></p>
                                                            </div>
                                                            <div class="row d333">
                                                                <p>
                                                                    <%=user.getAddress()%>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="row">
                                                                <div class="container address">
                                                                    <button class="view b333" style="border: none" id="save-address">
                                                                        Chỉnh sửa
                                                                    </button>
                                                                    <a href="#" class="view b333">Xoá</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
<%
    }
%>
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
</body>

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

<script src="assets/js/vendor/account/js/plugins/slick.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/jquery.nice-select.min.js"></script>

<script src="assets/js/vendor/account/js/plugins/image-zoom.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/fancybox.js"></script>
<script src="assets/js/vendor/account/js/plugins/scrollup.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/jqueryui.min.js"></script>
<script src="assets/js/vendor/account/js/main.js"></script>

</html>