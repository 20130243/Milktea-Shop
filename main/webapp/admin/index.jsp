<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>Doanh thu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- third party css -->
    <link href="../assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css"/>
    <!-- third party css end -->

    <!-- App css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style"/>
    <link href="../assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style"/>

</head>

<body class="loading"
      data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false }'>
<!-- data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}' -->
<!-- Begin page -->
<div class="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <%@include file="left-menu.jsp" %>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">
            <!-- Topbar Start -->
            <div class="navbar-custom">
                <ul class="list-unstyled topbar-right-menu float-right mb-0">
                    <li class="dropdown notification-list d-lg-none">
                        <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <i class="dripicons-search noti-icon"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                            <form class="p-3">
                                <input type="text" class="form-control" placeholder="Tìm kiếm ..." aria-label="">
                            </form>
                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <i class="dripicons-bell noti-icon"></i>
                            <span class="noti-icon-badge"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg">

                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="m-0">
                                        <span class="float-right">
                                            <a href="javascript: void(0);" class="text-dark">
                                                <small>Đánh dấu là đã xem</small>
                                            </a>
                                        </span>Thông báo
                                </h5>
                            </div>

                            <div style="max-height: 230px;" data-simplebar>
                                <!-- item-->
                                <a href="order/update.jsp" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-primary">
                                        <i class="mdi mdi-comment-account-outline"></i>
                                    </div>
                                    <p class="notify-details">Đơn hàng #1523
                                        <small class="text-muted">1 phút trước</small>
                                    </p>
                                </a>
                                <!-- item-->
                                <a href="order/update.jsp" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-primary">
                                        <i class="mdi mdi-comment-account-outline"></i>
                                    </div>
                                    <p class="notify-details">Đơn hàng #1523
                                        <small class="text-muted">1 phút trước</small>
                                    </p>
                                </a>
                                <!-- item-->
                                <a href="order/update.jsp" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-primary">
                                        <i class="mdi mdi-comment-account-outline"></i>
                                    </div>
                                    <p class="notify-details">Đơn hàng #1523
                                        <small class="text-muted">1 phút trước</small>
                                    </p>
                                </a>
                                <!-- item-->
                                <a href="order/update.jsp" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-primary">
                                        <i class="mdi mdi-comment-account-outline"></i>
                                    </div>
                                    <p class="notify-details">Đơn hàng #1523
                                        <small class="text-muted">1 phút trước</small>
                                    </p>
                                </a>


                            </div>

                            <!-- All-->
                            <a href="order/index.jsp"
                               class="dropdown-item text-center text-primary notify-item notify-all">
                                Xem tất cả
                            </a>

                        </div>
                    </li>


                    <li class="notification-list">
                        <a class="nav-link right-bar-toggle" href="javascript: void(0);">
                            <i class="dripicons-gear noti-icon"></i>
                        </a>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle nav-user arrow-none mr-0" data-toggle="dropdown" href="#"
                           role="button" aria-haspopup="false" aria-expanded="false">
                                <span class="account-user-avatar">
                                    <img src="../img/product/cappuchinovietnamo-min.png" alt="user-image"
                                         class="rounded-circle">
                                </span>
                            <span>
                                    <span class="account-user-name">Nguyễn Vũ Mạnh Hà</span>
                                    <span class="account-position">Admin</span>
                                </span>
                        </a>
                        <div
                                class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                            <!-- item-->
                            <div class=" dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Xin chào !</h6>
                            </div>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="mdi mdi-logout mr-1"></i>
                                <span>Đăng xuất</span>
                            </a>

                        </div>
                    </li>

                </ul>
                <button class="button-menu-mobile open-left disable-btn">
                    <i class="mdi mdi-menu"></i>
                </button>
                <div class="app-search dropdown d-none d-lg-block">
                    <form>
                        <div class="input-group">
                            <input type="text" class="form-control dropdown-toggle" placeholder="Tìm kiếm..."
                                   id="top-search">
                            <span class="mdi mdi-magnify search-icon"></span>
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                            </div>
                        </div>

                    </form>

                    <div class="dropdown-menu dropdown-menu-animated dropdown-lg" id="search-dropdown">
                        <!-- item-->
                        <div class="dropdown-header noti-title">
                            <h5 class="text-overflow mb-2">Tìm thấy <span class="text-danger">17</span> kết quả</h5>
                        </div>

                        <!-- item-->
                        <div class="dropdown-header noti-title">
                            <h6 class="text-overflow mb-2 text-uppercase">Sản phẩm</h6>
                        </div>

                        <div class="notification-list">
                            <!-- item-->
                            <a href="product/index.jsp" class="dropdown-item notify-item">
                                <div class="media">
                                    <img class="d-flex mr-2 rounded-circle"
                                         src="../img/product/cappuchinovietnamo-min.png"
                                         alt="Generic placeholder image" height="32">
                                    <div class="media-body">
                                        <h5 class="m-0 font-14">Trà sữa lài</h5>
                                        <span class="font-12 mb-0">Trà sữa</span>
                                    </div>
                                </div>
                            </a>

                            <!-- item-->
                            <a href="product/index.jsp" class="dropdown-item notify-item">
                                <div class="media">
                                    <img class="d-flex mr-2 rounded-circle"
                                         src="../img/product/cappuchinovietnamo-min.png"
                                         alt="Generic placeholder image" height="32">
                                    <div class="media-body">
                                        <h5 class="m-0 font-14">Cà phê đen</h5>
                                        <span class="font-12 mb-0">Cà phê</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end Topbar -->

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <!-- <div class="page-title-right">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control form-control-light"
                                                id="dash-daterange">
                                            <div class="input-group-append">
                                                <span class="input-group-text bg-primary border-primary text-white">
                                                    <i class="mdi mdi-calendar-range font-13"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="javascript: void(0);" class="btn btn-primary ml-2">
                                        <i class="mdi mdi-autorenew"></i>
                                    </a>
                                    <a href="javascript: void(0);" class="btn btn-primary ml-1">
                                        <i class="mdi mdi-filter-variant"></i>
                                    </a>
                                </form>
                            </div> -->
                            <h4 class="page-title">Thống kê doanh thu</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-xl-5 col-lg-6">

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body">
                                        <div class="float-right">
                                            <i class="mdi mdi-account-multiple widget-icon"></i>
                                        </div>
                                        <h5 class="text-muted font-weight-normal mt-0" title="Number of Customers">
                                            Số lượng khách hàng</h5>
                                        <h3 class="mt-3 mb-3">36,254</h3>
                                        <p class="mb-0 text-muted">
                                                <span class="text-success mr-2"><i class="mdi mdi-arrow-up-bold"></i>
                                                    5.27%</span>
                                            <span class="text-nowrap">So với tháng trước</span>
                                        </p>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->

                            <div class="col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body">
                                        <div class="float-right">
                                            <i class="mdi mdi-cart-plus widget-icon"></i>
                                        </div>
                                        <h5 class="text-muted font-weight-normal mt-0" title="Number of Orders">Đơn
                                            hàng</h5>
                                        <h3 class="mt-3 mb-3">5,543</h3>
                                        <p class="mb-0 text-muted">
                                                <span class="text-danger mr-2"><i class="mdi mdi-arrow-down-bold"></i>
                                                    1.08%</span>
                                            <span class="text-nowrap">So với tháng trước</span>
                                        </p>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->
                        </div> <!-- end row -->

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body">
                                        <div class="float-right">
                                            <i class="mdi mdi-currency-usd widget-icon"></i>
                                        </div>
                                        <h5 class="text-muted font-weight-normal mt-0" title="Average Revenue">Doanh
                                            thu</h5>
                                        <h3 class="mt-3 mb-3">32,000,000đ</h3>
                                        <p class="mb-0 text-muted">
                                                <span class="text-danger mr-2"><i class="mdi mdi-arrow-down-bold"></i>
                                                    7.00%</span>
                                            <span class="text-nowrap">So với tháng trước</span>
                                        </p>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->


                        </div> <!-- end row -->

                    </div> <!-- end col -->

                    <div class="col-xl-7  col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <!-- <div class="dropdown float-right">
                                    <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class="mdi mdi-dots-vertical"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a href="javascript:void(0);" class="dropdown-item">Bản báo cáo</a>
                                        <a href="javascript:void(0);" class="dropdown-item">Lợi nhuận</a>
                                    </div>
                                </div> -->
                                <h4 class="header-title mb-3">Doanh thu</h4>

                                <div class="chart-content-bg">
                                    <div class="row text-center">
                                        <div class="col-md-6">
                                            <p class="text-muted mb-0 mt-3">Tuần hiện tại</p>
                                            <h2 class="font-weight-normal mb-3">
                                                <small
                                                        class="mdi mdi-checkbox-blank-circle text-primary align-middle mr-1"></small>
                                                <span>8,000,000đ</span>
                                            </h2>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="text-muted mb-0 mt-3">Tuần trước</p>
                                            <h2 class="font-weight-normal mb-3">
                                                <small
                                                        class="mdi mdi-checkbox-blank-circle text-success align-middle mr-1"></small>
                                                <span>12,000,000đ</span>
                                            </h2>
                                        </div>
                                    </div>
                                </div>

                                <div class="dash-item-overlay d-none d-md-block" style="left: 10%;">
                                    <h5>Doanh thu hôm nay: 3,000,000đ</h5>

                                    <!-- <a href="javascript: void(0);" class="btn btn-outline-primary">Xem thống kê
                                        <i class="mdi mdi-arrow-right ml-2"></i>
                                    </a> -->
                                </div>

                                <div id="revenue-chart" class="apex-charts mt-3" data-colors="#727cf5,#0acf97">

                                </div>
                            </div> <!-- end card-body-->
                        </div> <!-- end card-->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->


                <div class="row">
                    <div class="col-xl-6 col-lg-12 order-lg-2 order-xl-1">
                        <div class="card">
                            <div class="card-body">
                                <!-- <a href="" class="btn btn-sm btn-link float-right mb-3">Xuất file
                                    <i class="mdi mdi-download ml-1"></i>
                                </a> -->
                                <h4 class="header-title mt-2">Top sản phẩm bán chạy</h4>

                                <div class="table-responsive">
                                    <table class="table table-centered table-nowrap table-hover mb-0">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">Trà Sữa Ô long</h5>
                                                <span class="text-muted font-13">Trà sữa</span>
                                            </td>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">82</h5>
                                                <span class="text-muted font-13">Số lượng</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">Bạc xỉu</h5>
                                                <span class="text-muted font-13">Cà phê</span>
                                            </td>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">37</h5>
                                                <span class="text-muted font-13">Số lượng</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">Dứa ép
                                                </h5>
                                                <span class="text-muted font-13">Nước ép</span>
                                            </td>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">64</h5>
                                                <span class="text-muted font-13">Số lượng</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">Hồng trà sữa
                                                </h5>
                                                <span class="text-muted font-13">Trà</span>
                                            </td>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">184</h5>
                                                <span class="text-muted font-13">Số lượng</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">Sữa chua phúc bồn tử
                                                </h5>
                                                <span class="text-muted font-13">Sữa chua</span>
                                            </td>
                                            <td>
                                                <h5 class="font-14 my-1 font-weight-normal">69</h5>
                                                <span class="text-muted font-13">Số lượng</span>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div> <!-- end table-responsive-->
                            </div> <!-- end card-body-->
                        </div> <!-- end card-->
                    </div> <!-- end col-->

                    <div class="col-xl-3 col-lg-6 order-lg-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Thống kê doanh thu trong tháng</h4>
                                <div id="average-sales" class="apex-charts mb-4 mt-4"
                                     data-colors="#727cf5,#0acf97,#fa5c7c,#ffbc00"></div>


                                <div class="chart-widget-list">
                                    <p>
                                        <i class="mdi mdi-square text-primary"></i> Trà sữa
                                        <span class="float-right">5,000,000đ</span>
                                    </p>
                                    <p>
                                        <i class="mdi mdi-square text-danger"></i> Cà phê
                                        <span class="float-right">2,500,000đ</span>
                                    </p>
                                    <p>
                                        <i class="mdi mdi-square text-success"></i> Sữa chua
                                        <span class="float-right">800,000đ</span>
                                    </p>
                                    <p class="mb-0">
                                        <i class="mdi mdi-square text-warning"></i> Đá xay
                                        <span class="float-right">2,500,000đ</span>
                                    </p>
                                </div>
                            </div> <!-- end card-body-->
                        </div> <!-- end card-->
                    </div> <!-- end col-->

                    <div class="col-xl-3 col-lg-6 order-lg-1">
                        <div class="card">
                            <div class="card-body">

                                <h4 class="header-title mb-2">Đơn hàng gần đây</h4>

                                <div data-simplebar style="max-height: 424px;">
                                    <div class="timeline-alt pb-0">
                                        <div class="timeline-item">
                                            <i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
                                            <div class="timeline-item-info">
                                                <a href="#" class="text-info font-weight-bold mb-1 d-block">Đơn hàng
                                                    #1254</a>
                                                <small>125,000đ</small>
                                                <p class="mb-0 pb-2">
                                                    <small class="text-muted">17:30 03/11/2022</small>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="timeline-item">
                                            <i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
                                            <div class="timeline-item-info">
                                                <a href="#" class="text-info font-weight-bold mb-1 d-block">Đơn hàng
                                                    #1254</a>
                                                <small>125,000đ</small>
                                                <p class="mb-0 pb-2">
                                                    <small class="text-muted">17:30 03/11/2022</small>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="timeline-item">
                                            <i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
                                            <div class="timeline-item-info">
                                                <a href="#" class="text-info font-weight-bold mb-1 d-block">Đơn hàng
                                                    #1254</a>
                                                <small>125,000đ</small>
                                                <p class="mb-0 pb-2">
                                                    <small class="text-muted">17:30 03/11/2022</small>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="timeline-item">
                                            <i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
                                            <div class="timeline-item-info">
                                                <a href="#" class="text-info font-weight-bold mb-1 d-block">Đơn hàng
                                                    #1254</a>
                                                <small>125,000đ</small>
                                                <p class="mb-0 pb-2">
                                                    <small class="text-muted">17:30 03/11/2022</small>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="timeline-item">
                                            <i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
                                            <div class="timeline-item-info">
                                                <a href="#" class="text-info font-weight-bold mb-1 d-block">Đơn hàng
                                                    #1254</a>
                                                <small>125,000đ</small>
                                                <p class="mb-0 pb-2">
                                                    <small class="text-muted">17:30 03/11/2022</small>
                                                </p>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- end timeline -->
                                </div> <!-- end slimscroll -->
                            </div>
                            <!-- end card-body -->
                        </div>
                        <!-- end card-->
                    </div>
                    <!-- end col -->

                </div>
                <!-- end row -->

            </div>
            <!-- container -->

        </div>
        <!-- content -->

        <!-- Footer Start -->
        <%@include file="footer.jsp" %>
        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<%@include file="right-sidebar.jsp" %>
<!-- /Right-bar -->

<!-- bundle -->
<script src="../assets/js/vendor.min.js"></script>
<script src="../assets/js/app.min.js"></script>

<!-- third party js -->
<script src="../assets/js/vendor/apexcharts.min.js"></script>
<script src="../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
<!-- third party js ends -->

<!-- demo app -->
<script src="../assets/js/pages/demo.dashboard.js"></script>
<!-- end demo js-->
</body>

</html>