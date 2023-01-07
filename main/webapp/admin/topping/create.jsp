<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <%@include file="../topbar.jsp"%>
                <!-- end Topbar -->

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="/admin/topping">Topping</a></li>
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
                                    <form action="/admin/topping/create" method="post">
                                            <div class="form-group mb-3">
                                                <label for="name">Tên topping</label>
                                                <input type="text" id="name" name="name" class="form-control">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="price">Giá</label>
                                                <input type="text" id="price" name="price" class="form-control">
                                            </div>
                                        <div class="form-group mb-3">
                                            <label for="topping">Chọn loại sản phẩm áp dụng</label>
                                            <select id="topping" multiple class="form-control" name="category">
                                                <c:forEach var="item" items="${requestScope['categoryList']}">
                                                    <option value="<c:out value="${item.id}"/>"><c:out value="${item.name}"/></option>
                                                </c:forEach>
                                            </select>
                                            <span class="help-block"><small>Giữ ctrl hoặc shift để chọn nhiều
                                                            loại.</small></span>
                                        </div>
                                            <div class="form-group mb-3">
                                                <label for="status_id">Trạng thái</label>
                                                <select class="custom-select mb-3" id="status_id" name="status">
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
    <%@include file="../right-sidebar.jsp"%>>
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