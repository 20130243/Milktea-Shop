<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>Thêm khuyến mãi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="../../assets/images/favicon.ico">

    <!-- third party css -->
    <link href="../../assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css"/>
    <!-- third party css end -->

    <!-- App css -->
    <link href="../../assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style"/>
    <link href="../../assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style"/>

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
                                    <li class="breadcrumb-item"><a href="/admin/sale">Khuyến mãi</a></li>
                                    <li class="breadcrumb-item active"> Thêm khuyến mãi</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Khuyến mãi</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

                                <h4 class="header-title">Khuyến mãi mới</h4>
                                <form action="/admin/sale/create" method="post">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <label for="name">Tên khuyến mãi</label>
                                                <input type="text" id="name" name="name" required class="form-control">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="percent">% giảm</label>
                                                <input type="text" id="percent" name="percent" required class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label>Thời gian có hiệu lực</label>
                                                <input type="text" class="form-control date" name="date" id="singledaterange"
                                                       data-toggle="date-picker" data-cancel-class="btn-warning" required>
                                            </div>

                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <label for="category">Chọn loại sản phẩm áp dụng</label>
                                                <select id="category" multiple class="form-control" name="category">
                                                    <c:forEach var="item" items="${requestScope['categoryList']}">
                                                        <option value="<c:out value="${item.id}"/>"><c:out value="${item.name}"/></option>
                                                    </c:forEach>
                                                </select>
                                                <span class="help-block"><small>Giữ ctrl hoặc shift để chọn nhiều
                                                            loại.</small></span>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="product">Chọn sản phẩm áp dụng</label>
                                                <select class="select2 form-control select2-multiple"
                                                        data-toggle="select2" multiple="multiple"
                                                        data-placeholder="Chọn sản phẩm áp dụng ..." id="product" name="product">
                                                    <c:forEach var="item" items="${requestScope['categoryList']}">
                                                    <optgroup label="${item.name}">
                                                        <c:forEach var="product" items="${requestScope['productList']}">
                                                            <option value="${product.id}">${product.name}</option>
                                                        </c:forEach>
                                                    </optgroup>
                                                    </c:forEach>
                                                </select>
                                                <span class="help-block"><small>Giữ ctrl hoặc shift để chọn nhiều
                                                            sản phẩm.</small></span>
                                            </div>

                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Thêm khuyến mãi</button>
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
            <hr class="mt-1"/>

            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="color-scheme-mode" value="light"
                       id="light-mode-check" checked/>
                <label class="custom-control-label" for="light-mode-check">Tắt</label>
            </div>

            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="color-scheme-mode" value="dark"
                       id="dark-mode-check"/>
                <label class="custom-control-label" for="dark-mode-check">Bật</label>
            </div>


            <!-- Left Sidebar-->
            <h5 class="mt-4">Thanh điều hướng</h5>
            <hr class="mt-1"/>
            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="theme" value="default" id="default-check"
                       checked/>
                <label class="custom-control-label" for="default-check">Mặc định</label>
            </div>

            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="theme" value="light" id="light-check"/>
                <label class="custom-control-label" for="light-check">Chế độ sáng</label>
            </div>

            <div class="custom-control custom-switch mb-3">
                <input type="radio" class="custom-control-input" name="theme" value="dark" id="dark-check"/>
                <label class="custom-control-label" for="dark-check">Chế độ tối</label>
            </div>

            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="compact" value="fixed" id="fixed-check"
                       checked/>
                <label class="custom-control-label" for="fixed-check">Cố định</label>
            </div>

            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="compact" value="condensed"
                       id="condensed-check"/>
                <label class="custom-control-label" for="condensed-check">Thu gọn</label>
            </div>

            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="compact" value="scrollable"
                       id="scrollable-check"/>
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
<script src="../../assets/js/pages/revenue.jsp"></script>
<!-- end demo js-->
</body>

</html>