<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="coupon" class="vn.edu.hcmuaf.fit.bean.Coupon"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Mã giảm giá</title>
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
                <%@include file="../topbar.jsp" %>
                <!-- end Topbar -->

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">Mã giảm giá </li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Mã giảm giá</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-sm-4">
                                            <a href="/admin/coupon/create" class="btn btn-danger mb-2"><i
                                                    class="mdi mdi-plus-circle mr-2"></i>Thêm mã giảm giá</a>
                                        </div>
                                        <div class="col-sm-8">
                                            <!-- <div class="text-sm-right">
                                                <button type="button" class="btn btn-success mb-2 mr-1"><i
                                                        class="mdi mdi-settings"></i></button>
                                                <button type="button" class="btn btn-light mb-2 mr-1">Nhập file</button>
                                                <button type="button" class="btn btn-light mb-2">Xuất file</button>
                                            </div> -->
                                        </div><!-- end col-->
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table table-centered w-100 dt-responsive nowrap"
                                            id="products-datatable">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="all">Mã giảm giá</th>
                                                    <th  class="text-center">% giảm</th>
                                                    <th class="text-center">Số tiền giảm tối đa</th>
                                                    <th  class="text-center">Số lượng còn lại</th>
                                                    <th class="text-center">Thời gian</th>
                                                    <th  class="text-center">Tình trạng</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${requestScope['categoryList']}">
                                                <tr>
                                                    <td>
                                                        <p class="m-0 d-inline-block align-middle font-16">
                                                        <a href="" style="pointer-events: none; cursor: default;"
                                                                class="text-body">${item.code}</a>
                                                            <br />
                                                        </p>
                                                    </td>
                                                    <td  class="text-center">
                                                            ${item.percent}%
                                                    </td>
                                                    <td class="text-center">
                                                        <fmt:formatNumber type="currency"
                                                                          value="${item.max_price_sale}"
                                                                          currencySymbol="VNĐ"/>
                                                    </td>
                                                    <td  class="text-center">
                                                        ${item.quantity}
                                                    </td>
                                                    <td class="text-center">
                                                            ${item.start_date} <hr>  ${item.end_date}
                                                    </td>

                                                    <td  class="text-center">
                                                            ${item.checkValid()}
                                                        <span class="badge badge-success">Có hiệu lực</span>
                                                    </td>

                                                    <td class="table-action">
                                                        <a href="create.jsp" class="action-icon"> <i
                                                                class="mdi mdi-square-edit-outline"></i></a>
                                                        <a href="javascript:void(0);" class="action-icon"> <i
                                                                class="mdi mdi-delete"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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