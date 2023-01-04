<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<c:set var="object" value="${requestScope['object']}" scope="request"/>
<head>
    <meta charset="utf-8" />
    <title>Đơn hàng #${object.id}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Đơn hàng</a></li>
                                        <li class="breadcrumb-item active">#51522</li>
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
                                <div class="horizontal-steps-content">
                                    <div class="step-item">
                                        <span data-toggle="tooltip" data-placement="bottom" title=""
                                            data-original-title="20/08/2018 07:24 PM">Đã nhận</span>
                                    </div>
                                    <div class="step-item current">
                                        <span data-toggle="tooltip" data-placement="bottom" title=""
                                            data-original-title="21/08/2018 11:32 AM">Đang chuẩn bị </span>
                                    </div>
                                    <div class="step-item">
                                        <span>Đang vận chuyển</span>
                                    </div>
                                    <div class="step-item">
                                        <span>Thành công</span>
                                    </div>
                                </div>

                                <div class="process-line" style="width: 33%;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center mb-4">
                            <!-- <button type="button" class="btn btn-primary">Xác nhận đơn hàng</button> -->
                            <button type="button" class="btn btn-info">Bàn giao cho bên vận chuyển</button>
                            <!-- <button type="button" class="btn btn-success">Hoàn tất</button> -->
                    </div>
                    <!-- end row -->


                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title mb-3">Các sản phẩm của #12537</h4>

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
                                                <tr>
                                                    <td>Trà ô long dâu</td>
                                                    <td>L</td>
                                                    <td>1</td>
                                                    <td>30,000đ</td>
                                                    <td>Trân châu đen | 5,000đ <br> Trân châu trắng | 10,000đ <br> Sương
                                                        sáo | 5,000đ</td>
                                                    <td>50,000đ</td>
                                                </tr>
                                                <tr>
                                                    <td>Trà ô long sen</td>
                                                    <td>M</td>
                                                    <td>1</td>
                                                    <td>25,000đ</td>
                                                    <td>Không</td>
                                                    <td>25,000đ</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end table-responsive -->

                                </div>
                                <div class="card-body">
                                    <h4 class="header-title mb-3">Ghi chú</h4>

                                    <p class="text-primary">
                                        Bỏ đá riêng, ít ngọt
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
                                                    <td>75,000đ</td>
                                                </tr>
                                                <tr>
                                                    <td>Phí vận chuyển</td>
                                                    <td>0đ</td>
                                                </tr>
                                                <tr>
                                                    <th>Tổng:</th>
                                                    <th>75,000đ</th>
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

                                    <h5>Nguyễn Vũ Mạnh Hà</h5>

                                    <address class="mb-0 font-14 address-lg">
                                        Trường Đại học Nông Lâm Thành phố Hồ Chí Minh, Khu phố 6, phường Linh Trung,
                                        thành phố Thủ Đức, Thành phố Hồ Chí Minh <br>
                                        <abbr title="Phone">Số điện thoại:</abbr> 034 4558 306
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

</body>

</html>