<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<c:set var="object" value="${requestScope['object']}" scope="request"/>

<head>
    <meta charset="utf-8"/>
    <title>${object.name}</title>
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

                                <h4 class="header-title">Cập nhật khuyến mãi</h4>
                                <form action="/admin/sale/update" method="post">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <label for="name">Tên khuyến mãi</label>
                                                <input type="text" id="name" name="name" value="${object.name}" required
                                                       class="form-control">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="percent">% giảm</label>
                                                <input type="text" id="percent" name="percent" value="${object.percent}"  required
                                                       class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label>Thời gian có hiệu lực</label>
                                                <input type="text" class="form-control date" name="date"
                                                id="singledaterange"
                                                data-toggle="date-picker" value="${object.getStringStartEnd()}" data-cancel-class="btn-warning"
                                                required>
                                            </div>

                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <label for="category">Chọn loại sản phẩm áp dụng</label>
                                                <select id="category" multiple class="form-control" name="category">
                                                    <c:forEach var="item" items="${requestScope['categoryList']}">
                                                        <option value="${item.id}">${item.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <span class="help-block"><small>Giữ ctrl hoặc shift để chọn nhiều
                                                            loại.</small></span>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="product">Chọn sản phẩm áp dụng</label>
                                                <select class="select2 form-control select2-multiple"
                                                        data-toggle="select2" multiple="multiple"
                                                        data-placeholder="Chọn sản phẩm áp dụng ..." id="product"
                                                        name="product">
                                                    <c:forEach var="item" items="${requestScope['categoryList']}">
                                                        <optgroup label="${item.name}">
                                                            <c:forEach var="product"
                                                                       items="${requestScope['productList']}">
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
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
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
<%@include file="../right-sidebar.jsp" %>
<!-- /Right-bar -->

<!-- bundle -->
<script src="../../assets/js/vendor.min.js"></script>
<script src="../../assets/js/app.min.js"></script>

<!-- third party js -->
<script src="../../assets/js/vendor/apexcharts.min.js"></script>
<script src="../../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
<!-- third party js ends -->

</body>

</html>