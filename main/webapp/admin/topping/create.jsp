<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Thêm topping</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="../../assets/images/favicon.ico">

    <!-- third party css -->
    <link href="../../assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->

    <!-- App css -->
    <link href="../../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
    <link href="../../assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />

</head>


<body class="loading"
      data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false }'>

    <!-- data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}' -->
    <!-- Begin page -->
    <div class="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <%@include file="../left-menu.jsp" %>
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
                                       <a href="../order/create.jsp" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-primary">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                        <p class="notify-details">Đơn hàng #1523
                                            <small class="text-muted">1 phút trước</small>
                                        </p>
                                    </a>
                                    <!-- item-->
                                       <a href="../order/create.jsp" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-primary">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                        <p class="notify-details">Đơn hàng #1523
                                            <small class="text-muted">1 phút trước</small>
                                        </p>
                                    </a>
                                    <!-- item-->
                                       <a href="../order/create.jsp" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-primary">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                        <p class="notify-details">Đơn hàng #1523
                                            <small class="text-muted">1 phút trước</small>
                                        </p>
                                    </a>
                                    <!-- item-->
                                       <a href="../order/create.jsp" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-primary">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                        <p class="notify-details">Đơn hàng #1523
                                            <small class="text-muted">1 phút trước</small>
                                        </p>
                                    </a>


                                </div>

                                <!-- All-->
                               <a href="../order/index.jsp"
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
                                    <img src="../img/product/cappuchinovietnamo-min.png" alt="user-image" class="rounded-circle">
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
                                <a href="../product/index.jsp" class="dropdown-item notify-item">
                                    <div class="media">
                                        <img class="d-flex mr-2 rounded-circle" src="../img/product/cappuchinovietnamo-min.png"
                                            alt="Generic placeholder image" height="32">
                                        <div class="media-body">
                                            <h5 class="m-0 font-14">Trà sữa lài</h5>
                                            <span class="font-12 mb-0">Trà sữa</span>
                                        </div>
                                    </div>
                                </a>

                                <!-- item-->
                                <a href="../product/index.jsp" class="dropdown-item notify-item">
                                    <div class="media">
                                        <img class="d-flex mr-2 rounded-circle" src="../img/product/cappuchinovietnamo-min.png"
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
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="index.jsp">Topping</a></li>
                                        <li class="breadcrumb-item active"> Thêm topping</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Topping</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">

                                    <h4 class="header-title">Topping mới</h4>
                                    <form>
                                            <div class="form-group mb-3">
                                                <label for="name">Tên topping</label>
                                                <input type="text" id="name" class="form-control">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="percent">Giá</label>
                                                <input type="text" id="percent" class="form-control">
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="">Trạng thái</label>
                                                <select class="custom-select mb-3" id="category">
                                                    <option value="1" selected>Đang bán</option>
                                                    <option value="2">Hết hàng</option>
                                                    <option value="3">Ngưng bán</option>
                                                </select>
                                            </div>

                                        <button type="submit" class="btn btn-primary">Thêm topping</button>
                                    </form>
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- container -->

            </div> <!-- content -->


        </div>
        <!-- content -->

        <!-- Footer Start -->
    <%@include file="../footer.jsp" %>
        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


    </div>
    <!-- END wrapper -->

    <!-- Right Sidebar -->
    <div class="right-bar">

        <div class="rightbar-title">
            <a href="javascript:void(0);" class="right-bar-toggle float-right">
                <i class="dripicons-cross noti-icon"></i>
            </a>
            <h5 class="m-0">Cấu hình</h5>
        </div>

        <div class="rightbar-content h-100" data-simplebar>

            <div class="p-3">


                <!-- Settings -->
                <h5 class="mt-3">Chế độ tối</h5>
                <hr class="mt-1" />

                <div class="custom-control custom-switch mb-1">
                    <input type="radio" class="custom-control-input" name="color-scheme-mode" value="light"
                        id="light-mode-check" checked />
                    <label class="custom-control-label" for="light-mode-check">Tắt</label>
                </div>

                <div class="custom-control custom-switch mb-1">
                    <input type="radio" class="custom-control-input" name="color-scheme-mode" value="dark"
                        id="dark-mode-check" />
                    <label class="custom-control-label" for="dark-mode-check">Bật</label>
                </div>


                <!-- Left Sidebar-->
                <h5 class="mt-4">Thanh điều hướng</h5>
                <hr class="mt-1" />
                <div class="custom-control custom-switch mb-1">
                    <input type="radio" class="custom-control-input" name="theme" value="default" id="default-check"
                        checked />
                    <label class="custom-control-label" for="default-check">Mặc định</label>
                </div>

                <div class="custom-control custom-switch mb-1">
                    <input type="radio" class="custom-control-input" name="theme" value="light" id="light-check" />
                    <label class="custom-control-label" for="light-check">Chế độ sáng</label>
                </div>

                <div class="custom-control custom-switch mb-3">
                    <input type="radio" class="custom-control-input" name="theme" value="dark" id="dark-check" />
                    <label class="custom-control-label" for="dark-check">Chế độ tối</label>
                </div>

                <div class="custom-control custom-switch mb-1">
                    <input type="radio" class="custom-control-input" name="compact" value="fixed" id="fixed-check"
                        checked />
                    <label class="custom-control-label" for="fixed-check">Cố định</label>
                </div>

                <div class="custom-control custom-switch mb-1">
                    <input type="radio" class="custom-control-input" name="compact" value="condensed"
                        id="condensed-check" />
                    <label class="custom-control-label" for="condensed-check">Thu gọn</label>
                </div>

                <div class="custom-control custom-switch mb-1">
                    <input type="radio" class="custom-control-input" name="compact" value="scrollable"
                        id="scrollable-check" />
                    <label class="custom-control-label" for="scrollable-check">Di chuyển</label>
                </div>

                <button class="btn btn-primary btn-block mt-4" id="resetBtn">Đặt lại cấu hình</button>

            </div> <!-- end padding-->

        </div>
    </div>

    <div class="rightbar-overlay"></div>
    <!-- /Right-bar -->

    <!-- bundle -->
    <script src="../../assets/js/vendor.min.js"></script>
    <script src="../../assets/js/app.min.js"></script>

    <!-- third party js -->
    <script src="../../assets/js/vendor/apexcharts.min.js"></script>
    <script src="../../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
    <!-- third party js ends -->

    <!-- demo app -->
    <script src="../../assets/js/pages/demo.dashboard.js"></script>
    <!-- end demo js-->
</body>

</html>