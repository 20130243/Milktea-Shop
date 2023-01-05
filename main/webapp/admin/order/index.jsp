<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>Đơn hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
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
                                    <li class="breadcrumb-item">Đơn hàng</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Đơn hàng</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <div class="col-lg-8">
                                        <form class="form-inline">
                                            <div class="form-group mb-2">
                                                <label for="inputPassword2" class="sr-only">Tìm kiếm theo mã đơn
                                                    hàng</label>
                                                <input type="search" class="form-control" id="inputPassword2"
                                                       placeholder="Tìm kiếm...">
                                            </div>
                                            <div class="form-group mx-sm-3 mb-2">
                                                <label for="status-select" class="mr-2">Tình trạng đơn hàng</label>
                                                <select class="custom-select" id="status-select">
                                                    <option selected>Chọn...</option>
                                                    <option value="1">Đang chờ</option>
                                                    <option value="2">Đã xác nhận</option>
                                                    <option value="3">Đang vận chuyển</option>
                                                    <option value="4">Thành công</option>
                                                    <option value="5">Đã hủy</option>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-centered mb-0">
                                        <thead class="thead-light">
                                        <tr>
                                            <th>Mã đơn hàng</th>
                                            <th>Thời gian</th>
                                            <th>Tên khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th style="width: 125px;">Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${requestScope['orderList']}">

                                            <tr>
                                                <td><a href="/admin/order/update?id=${item.id}"
                                                       class="text-body font-weight-bold">${item.id}</a>
                                                </td>
                                                <td>
                                                    <fmt:formatDate type="date"
                                                                    dateStyle="short"
                                                                    value="${item.time}"/>


                                                    <small class="text-muted">
                                                        <fmt:formatDate type="time" value="${item.time}"/>
                                                    </small>
                                                </td>
                                                <td>
                                                        ${item.name}
                                                </td>
                                                <td>
                                                        ${item.phone}
                                                </td>
                                                <td>
                                                            <fmt:formatNumber type="currency"
                                                                              value="${item.total}"
                                                                              currencySymbol="đ"/>
                                                </td>
                                                <td>
                                                    <h5>
                                                        <c:choose>
                                                            <c:when test="${item.status eq 0}">
                                                                <span class="badge badge-info">Đã nhận</span>
                                                            </c:when>
                                                            <c:when test="${item.status eq 1}">
                                                                <span class="badge badge-info-lighten">Đang vận chuyển</span>
                                                            </c:when>
                                                            <c:when test="${item.status eq 2}">
                                                                <span class="badge badge-success">Thành công</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge badge-dark">Đã hủy</span>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </h5>
                                                </td>
                                                <td>
                                                    <form action="/admin/order/delete" method="post"
                                                          id="delete-form-<c:out value="${item.id}"/>"><a
                                                            href="/admin/order/update?id=${item.id}"
                                                            class="action-icon"> <i
                                                            class="mdi mdi-square-edit-outline"></i></a>
                                                        <input type="text" name="id" id="id"
                                                               value="${item.id}" class="d-none">
                                                        <button type="submit" class="d-none"></button>
                                                        <a href="javascript:{0}"
                                                           class="action-icon"> <i class="mdi mdi-delete delete-btn"
                                                                                   data-name="${item.id}"
                                                                                   data-id="${item.id}"></i>
                                                        </a>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:set var="endPage" value='${requestScope["endPage"]}'/>
                                    <c:choose>
                                        <c:when test="${empty param['page']}">
                                            <c:set var="currentPage" value="1"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="currentPage" value="${param['page']}"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <nav>
                                        <ul class="pagination pagination-rounded mb-0">
                                            <li class="page-item  <c:if test="${currentPage eq 1 }"> d-none </c:if>">
                                                <a class="page-link" href="/admin/order?page=<c:out value='${i-1}'/>"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>


                                            <c:forEach var="i" begin="1" end="${endPage}">
                                                <li class="page-item  <c:if test="${currentPage eq i }"> active </c:if>">
                                                    <a class="page-link"
                                                       href="/admin/order?page=<c:out value='${i}'/>">
                                                        <c:out value="${i}"/>
                                                    </a>
                                                </li>

                                            </c:forEach>
                                            <li class="page-item <c:if test="${currentPage eq endPage }"> d-none </c:if>">
                                                <a class="page-link" href="/admin/order?page=<c:out value='${i+1}'/>"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div> <!-- end card-body-->
                        </div> <!-- end card-->
                    </div> <!-- end col -->
                </div>
                <!-- end row -->

            </div> <!-- container -->


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
<script src="../../js/alert_delete.js"></script>

</body>

</html>