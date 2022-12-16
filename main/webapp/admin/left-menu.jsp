<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="left-side-menu">

    <!-- LOGO -->
    <a href="<c:out value="${pageContext.request.contextPath}"/>/admin" class="logo text-center logo-light">
                <span class="logo-lg">
                    <img src="<c:out value="${pageContext.request.contextPath}"/>/assets/images/logo.png" alt="" height="16">
                </span>
        <span class="logo-sm">
                    <img src="<c:out value="${pageContext.request.contextPath}"/>/assets/images/logo_sm.png" alt="" height="16">
                </span>
    </a>

    <!-- LOGO -->
    <a href="<c:out value="${pageContext.request.contextPath}"/>/admin" class="logo text-center logo-dark">
                <span class="logo-lg">
                    <img src="<c:out value="${pageContext.request.contextPath}"/>/assets/images/logo-dark.png" alt="" height="16">
                </span>
        <span class="logo-sm">
                    <img src="<c:out value="${pageContext.request.contextPath}"/>/assets/images/logo_sm_dark.png" alt="" height="16">
                </span>
    </a>

    <div class="h-100" id="left-side-menu-container" data-simplebar>

        <!--- Sidemenu -->
        <ul class="metismenu side-nav">
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin" class="side-nav-link">
                    <i class="uil-home-alt"></i>
                    <!-- <span class="badge badge-success float-right">4</span> -->
                    <span> Thống kê doanh thu</span>
                </a>
            </li>
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin/order" class="side-nav-link">
                    <i class="uil-calender"></i>
                    <span> Quản lý đơn hàng </span>
                </a>
            </li>
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin/sale" class="side-nav-link">
                    <i class="uil-calender"></i>
                    <span> Quản lý khuyến mãi</span>
                </a>
            </li>
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin/coupon" class="side-nav-link">
                    <i class="uil-calender"></i>
                    <span> Quản lý mã giảm giá </span>
                </a>
            </li>
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin/blog" class="side-nav-link">
                    <i class="uil-calender"></i>
                    <span> Quản lí tin tức </span>
                </a>
            </li>
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin/product" class="side-nav-link">
                    <i class="uil-calender"></i>
                    <span> Quản lí sản phẩm </span>
                </a>
            </li>
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin/category" class="side-nav-link">
                    <i class="uil-calender"></i>
                    <span> Quản lí loại </span>
                </a>
            </li>
            <li class="side-nav-item">
                <a href="<c:out value="${pageContext.request.contextPath}"/>/admin/topping" class="side-nav-link">
                    <i class="uil-calender"></i>
                    <span> Quản lí topping </span>
                </a>
            </li>
        </ul>
        <!-- End Sidebar -->

        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->

</div>