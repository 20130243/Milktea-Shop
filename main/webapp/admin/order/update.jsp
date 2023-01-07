<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<c:set var="object" value="${requestScope['object']}" scope="request"/>
<head>
    <meta charset="utf-8"/>
    <title>Đơn hàng #${object.id}</title>
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
                                    <li class="breadcrumb-item"><a
                                            href="${pageContext.request.contextPath}/admin/product/create">Đơn hàng</a>
                                    </li>
                                    <li class="breadcrumb-item active">#${object.id}</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Chi tiết đơn hàng</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row justify-content-center">
                    <div class="col-lg-7 col-md-10 col-sm-11">
                        <div class="horizontal-steps mt-4 mb-4 pb-5">
                            <div class="horizontal-steps-content" id="step">
                                <div class="step-item ${object.status eq 0 ?"current" : ""}">
                                        <span data-toggle="tooltip" data-placement="bottom" title=""
                                        >Đã nhận</span>
                                </div>
                                <c:if test="${object.status eq 3}">
                                    <div id="step-0" class="step-item ${object.status eq 4 ?"current" : ""}">
                                        <span>Đã hủy</span>
                                    </div>
                                </c:if>
                                <c:if test="${object.status ne 3}">
                                    <div id="step-1" class="step-item ${object.status eq 1 ?"current" : ""}">
                                        <span>Đang vận chuyển</span>
                                    </div>
                                    <div id="step-2" class="step-item ${object.status eq 2 ?"current" : ""}">
                                        <span>Thành công</span>
                                    </div>
                                </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${object.status eq 0}">
                                    <c:set var="line" value="0"/>
                                </c:when><c:when test="${object.status eq 1}">
                                <c:set var="line" value="50"/>
                            </c:when><c:when test="${object.status eq 2}">
                                <c:set var="line" value="100"/>
                            </c:when>
                                <c:otherwise>
                                    <c:set var="line" value="100"/>
                                </c:otherwise>
                            </c:choose>
                            <div id="process-line" class="process-line" style="width: ${line}%;"></div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-4">
                    <!-- <button type="button" class="btn btn-primary">Xác nhận đơn hàng</button> -->
                    <form method="post" id="update_status" action="UpdateStatusController">
                        <input type="text" name="id" id="id" value="${object.id}" class="d-none">
                        <input type="text" name="status" id="status" value="${object.status +1}" class="d-none">

                        <button type="submit" id="status-1" class="btn btn-info ${object.status eq 0 ? "" :"d-none"}">
                            Bàn giao cho bên vận chuyển
                        </button>
                        <button type="submit" id="status-2"
                                class="btn btn-success ${object.status eq 1 ? "" :"d-none"}">Hoàn tất
                        </button>

                    </form>
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-3">Các sản phẩm của #${item.id}</h4>

                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead class="thead-light">
                                        <tr>
                                            <th>Tên</th>
                                            <th>Size</th>
                                            <th>Số lượng</th>
                                            <th>Giá</th>
                                            <th>Topping</th>
                                            <th>Tổng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${object.cart.items}" var="item">
                                            <tr>
                                                <td>${item.product.name}</td>
                                                <td>${item.product.priceSize[0].size}</td>
                                                <td>${item.quantity}</td>
                                                <td>
                                                    <fmt:formatNumber type="currency"
                                                                      value="${item.product.priceSize[0].price}"
                                                                      currencySymbol="đ"/>
                                                </td>
                                                <td>

                                                    <c:forEach var="topping" items="${item.product.topping}">
                                                        ${topping.name} | <fmt:formatNumber type="currency"
                                                                                            value="${topping.price}"
                                                                                            currencySymbol="đ"/> <br>
                                                    </c:forEach>

                                                </td>
                                                <td><fmt:formatNumber type="currency"
                                                                      value="${item.price}"
                                                                      currencySymbol="đ"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->

                            </div>
                            <div class="card-body">
                                <h4 class="header-title mb-3">Ghi chú</h4>

                                <p class="text-primary">
                                    ${object.note}
                                </p>
                                <!-- end table-responsive -->

                            </div>
                        </div>
                    </div> <!-- end col -->

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-3">Tổng đơn hàng</h4>
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead class="thead-light">
                                        <tr>
                                            <th>Mục</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Tổng giá sản phẩm</td>
                                            <td><fmt:formatNumber type="currency"
                                                                  value="${object.total}"
                                                                  currencySymbol="đ"/></td>
                                        </tr>
                                        <tr>
                                            <td>Phí vận chuyển</td>
                                            <td>0đ</td>
                                        </tr>
                                        <tr>
                                            <th>Tổng:</th>
                                            <th><fmt:formatNumber type="currency"
                                                                  value="${object.total}"
                                                                  currencySymbol="đ"/></th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->

                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-3">Thông tin vận chuyển</h4>

                                <h5>${object.name}</h5>

                                <address class="mb-0 font-14 address-lg">
                                    ${object.address} <br>
                                    <abbr title="Phone">Số điện thoại: </abbr>${object.phone}
                                </address>

                            </div>
                        </div>
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
<script type="text/javascript">

    $("#update_status").submit(function (e) {
        e.preventDefault(); ;
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function (data) {
                $("#step").children().removeClass("current");
                if (1 == data) {
                    $("#process-line").css("width", "50%");
                    $("#step-1").addClass("current");
                    $("#status-1").remove();
                    $("#status-2").removeClass("d-none");
                    $("#status").val("2");
                } else if (2 == data) {
                    $("#process-line").css("width", "100%");
                    $("#step-2").addClass("current");

                    $("#status-2").remove();
                }
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data);
            },
        });
    });

</script>
</body>

</html>