<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>Doanh thu </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <%@include file="topbar.jsp" %>
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
                                            Khách hàng tháng này</h5>
                                        <h3 class="mt-3 mb-3">${requestScope['customerThisMonth']}</h3>
                                        <p class="mb-0 text-muted">
                                                <span class=" ${requestScope['percentCustomer'] >0 ?"text-success" : "text-danger" }  mr-2"><i
                                                        class="mdi  ${requestScope['percentCustomer'] >0 ?"mdi-arrow-up-bold" : "mdi-arrow-down-bold" } "></i>
                                                     ${requestScope['percentCustomer']}%</span>
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
                                            hàng tháng này</h5>
                                        <h3 class="mt-3 mb-3">${requestScope['orderThisMonth']}</h3>
                                        <p class="mb-0 text-muted">
                                                <span class="${requestScope['percentOrder'] >0 ?"text-success" : "text-danger" } mr-2"><i
                                                        class="mdi ${requestScope['percentOrder'] >0 ?"mdi-arrow-up-bold" : "mdi-arrow-down-bold" } "></i>
                                                    ${requestScope['percentOrder']}%</span>
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
                                            thu tháng này</h5>
                                        <h3 class="mt-3 mb-3"><fmt:formatNumber type="currency"
                                                                                value="${requestScope['totalThisMonth']}"
                                                                                currencySymbol="đ"/></h3>
                                        <p class="mb-0 text-muted">
                                                <span class="${requestScope['percentTotal'] >0 ?"text-success" : "text-danger" } mr-2"><i
                                                        class="mdi ${requestScope['percentTotal'] >0 ?"mdi-arrow-up-bold" : "mdi-arrow-down-bold" }"></i>
                                                    ${requestScope['percentTotal']}%</span>
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
                                                <span><fmt:formatNumber type="currency"
                                                                        value="${requestScope['totalThisWeek']}"
                                                                        currencySymbol="đ"/></span>
                                            </h2>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="text-muted mb-0 mt-3">Tuần trước</p>
                                            <h2 class="font-weight-normal mb-3">
                                                <small
                                                        class="mdi mdi-checkbox-blank-circle text-success align-middle mr-1"></small>
                                                <span><fmt:formatNumber type="currency"
                                                                        value="${requestScope['totalPreviousWeek']}"
                                                                        currencySymbol="đ"/></span>
                                            </h2>
                                        </div>
                                    </div>
                                </div>

                                <div class="dash-item-overlay d-none d-md-block" style="left: 10%;">
                                    <h5>Doanh thu hôm nay: <fmt:formatNumber type="currency"
                                                                             value="${requestScope['totalToday']}"
                                                                             currencySymbol="đ"/></h5>

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
                                        <c:forEach var="item" items="${requestScope['top5Product']}">
                                            <c:forEach var="entry" items="${item}">
                                                <tr>
                                                    <td>
                                                        <h5 class="font-14 my-1 font-weight-normal">${entry.key.name}</h5>
                                                            <%--<span class="text-muted font-13">Trà sữa</span>--%>
                                                    </td>
                                                    <td>
                                                        <h5 class="font-14 my-1 font-weight-normal">${entry.value}</h5>
                                                        <span class="text-muted font-13">Số lượng</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </c:forEach>


                                        </tbody>
                                    </table>
                                </div> <!-- end table-responsive-->
                            </div> <!-- end card-body-->
                        </div> <!-- end card-->
                    </div> <!-- end col-->

                    <div class="col-xl-3 col-lg-6 order-lg-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Doanh thu theo loại sản phẩm</h4>
                                <div id="average-sales" class="apex-charts mb-4 mt-4"
                                     data-colors="#727cf5,#0acf97,#fa5c7c,#ffbc00"></div>
                                <div class="chart-widget-list">
                                    <c:forEach var="item" items="${requestScope['totalCategory']}">
                                        <p>
                                            <c:forEach var="entry" items="${item}">
                                                <i class="mdi mdi-square text-primary"></i> ${entry.key.name}
                                                <span class="float-right">
                                                    <fmt:formatNumber type="currency"
                                                                      value="${entry.value}"
                                                                      currencySymbol="đ"/>
                                                </span>
                                            </c:forEach>
                                        </p>
                                    </c:forEach>

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
                                        <c:forEach var="item" items="${requestScope['newOrderList']}">
                                            <div class="timeline-item">
                                                <i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
                                                <div class="timeline-item-info">
                                                    <a href="#" class="text-info font-weight-bold mb-1 d-block">Đơn hàng
                                                        #${item.id}</a>
                                                    <small> <fmt:formatNumber type="currency"
                                                                              value="${item.total}"
                                                                              currencySymbol="đ"/></small>
                                                    <p class="mb-0 pb-2">
                                                        <small class="text-muted">
                                                            <fmt:formatDate type="time"
                                                                            value="${item.time}"/>
                                                            <fmt:formatDate type="date"
                                                                            dateStyle="short"
                                                                            value="${item.time}"/>
                                                        </small>
                                                    </p>
                                                </div>
                                            </div>
                                        </c:forEach>
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
<%@include file="../assets/js/pages/revenue.jsp"%>
<!-- end demo js-->
</body>

</html>