<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Thêm sản phẩm</title>
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
    data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false }'
    >
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
                <jsp:include page="../topbar.jsp"/>
                <!-- end Topbar -->

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="index.jsp">Sản phẩm</a></li>
                                        <li class="breadcrumb-item active"> Thêm sản phẩm</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Sản phẩm</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">

                                    <h4 class="header-title">Sản phẩm mới</h4>
                                    <form>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group mb-3">
                                                    <label for="name">Tên sản phẩm</label>
                                                    <input type="text" id="name" class="form-control">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label for="image">Ảnh sản phẩm</label>
                                                    <input type="file" id="image" class="form-control-file">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label for="category">Phân loại</label>
                                                    <select class="custom-select " id="category" name="category">
                                                        <option selected>Chọn phân loại</option>
                                                        <option value="1">Cà phê</option>
                                                        <option value="2">Trà sữa</option>
                                                        <option value="3">Trà</option>
                                                        <option value="4">Nước ép</option>
                                                        <option value="5">Đá xay</option>
                                                    </select>
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="topping">Chọn loại topping áp dụng</label>
                                                    <select id="topping" multiple class="form-control">
                                                        <option value="1">Trân châu đen</option>
                                                        <option value="2">Thạch cà phê</option>
                                                        <option value="3">Whipping cream</option>
                                                        <option value="4">Thạch dừa</option>
                                                        <option value="5">Kem cheese</option>
                                                    </select>
                                                    <span class="help-block"><small>Giữ ctrl hoặc shift để chọn nhiều
                                                            loại.</small></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group mb-3">
                                                    <div class="custom-control custom-switch">
                                                        <input type="checkbox" class="custom-control-input"
                                                            id="customSwitch1">
                                                        <label class="custom-control-label" for="customSwitch1">Có 2
                                                            size</label>
                                                    </div>
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="price-M">Giá size M</label>
                                                    <input type="text" id="price-M" class="form-control">
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="price-L">Giá size L</label>
                                                    <input type="text" id="price-L" disabled class="form-control">
                                                </div>
                                                
                                                <div class="form-group mb-3">
                                                    <label for="status_id">Trạng thái</label>
                                                    <select class="custom-select mb-3" name="status" id="status_id">
                                                        <option value="1" selected>Đang bán</option>
                                                        <option value="2">Hết hàng</option>
                                                        <option value="3">Ngưng bán</option>
                                                    </select>
                                                </div>

                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
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
    <jsp:include page="../right-sidebar.jsp"/>
    <!-- /Right-bar -->

    <!-- bundle -->
    <script src="../../assets/js/vendor.min.js"></script>
    <script src="../../assets/js/app.min.js"></script>

    <!-- third party js -->
    <script src="../../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
    <!-- third party js ends -->

</body>

</html>