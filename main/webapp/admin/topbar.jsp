<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="navbar-custom">
    <ul class="list-unstyled topbar-right-menu float-right mb-0">
        <li class="dropdown notification-list d-lg-none">
            <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"
               aria-haspopup="false" aria-expanded="false">
                <i class="dripicons-search noti-icon"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                <form class="p-3">
                    <input type="text" class="form-control" placeholder="Tìm kiếm ..." aria-label="">
                </form>
            </div>
        </li>

        <li class="dropdown notification-list">
            <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"
               aria-haspopup="false" aria-expanded="false">
                <i class="dripicons-bell noti-icon"></i>
                <span class="noti-icon-badge"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg">

                <!-- item-->
                <div class="dropdown-item noti-title">
                    <h5 class="m-0">
                                        <span class="float-right">
                                            <a href="javascript: void(0);" class="text-dark">
                                                <small>Đánh dấu là đã xem</small>
                                            </a>
                                        </span>Thông báo
                    </h5>
                </div>

                <div style="max-height: 230px;" data-simplebar>
                    <!-- item-->
                    <a href="order/create.jsp" class="dropdown-item notify-item">
                        <div class="notify-icon bg-primary">
                            <i class="mdi mdi-comment-account-outline"></i>
                        </div>
                        <p class="notify-details">Đơn hàng #1523
                            <small class="text-muted">1 phút trước</small>
                        </p>
                    </a>
                    <!-- item-->
                    <a href="order/create.jsp" class="dropdown-item notify-item">
                        <div class="notify-icon bg-primary">
                            <i class="mdi mdi-comment-account-outline"></i>
                        </div>
                        <p class="notify-details">Đơn hàng #1523
                            <small class="text-muted">1 phút trước</small>
                        </p>
                    </a>
                    <!-- item-->
                    <a href="order/create.jsp" class="dropdown-item notify-item">
                        <div class="notify-icon bg-primary">
                            <i class="mdi mdi-comment-account-outline"></i>
                        </div>
                        <p class="notify-details">Đơn hàng #1523
                            <small class="text-muted">1 phút trước</small>
                        </p>
                    </a>
                    <!-- item-->
                    <a href="order/create.jsp" class="dropdown-item notify-item">
                        <div class="notify-icon bg-primary">
                            <i class="mdi mdi-comment-account-outline"></i>
                        </div>
                        <p class="notify-details">Đơn hàng #1523
                            <small class="text-muted">1 phút trước</small>
                        </p>
                    </a>


                </div>

                <!-- All-->
                <a href="order/index.jsp"
                   class="dropdown-item text-center text-primary notify-item notify-all">
                    Xem tất cả
                </a>

            </div>
        </li>


        <li class="notification-list">
            <a class="nav-link right-bar-toggle" href="javascript: void(0);">
                <i class="dripicons-gear noti-icon"></i>
            </a>
        </li>

        <li class="dropdown notification-list">
            <a class="nav-link dropdown-toggle nav-user arrow-none mr-0" data-toggle="dropdown" href="#"
               role="button" aria-haspopup="false" aria-expanded="false">
                                <span class="account-user-avatar">
                                    <img src="<c:out value="${pageContext.request.contextPath}"/>/img/product/products/CaPheCappuccinoDaXay.png" alt="user-image"
                                         class="rounded-circle">
                                </span>
                <span>
                                    <span class="account-user-name">Nguyễn Vũ Mạnh Hà</span>
                                    <span class="account-position">Admin</span>
                                </span>
            </a>
            <div
                    class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                <!-- item-->
                <div class=" dropdown-header noti-title">
                    <h6 class="text-overflow m-0">Xin chào !</h6>
                </div>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item">
                    <i class="mdi mdi-logout mr-1"></i>
                    <span>Đăng xuất</span>
                </a>

            </div>
        </li>

    </ul>
    <button class="button-menu-mobile open-left disable-btn">
        <i class="mdi mdi-menu"></i>
    </button>
    <div class="app-search dropdown d-none d-lg-block">
        <form>
            <div class="input-group">
                <input type="text" class="form-control dropdown-toggle" placeholder="Tìm kiếm..."
                       id="top-search">
                <span class="mdi mdi-magnify search-icon"></span>
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                </div>
            </div>

        </form>

        <div class="dropdown-menu dropdown-menu-animated dropdown-lg" id="search-dropdown">
            <!-- item-->
            <div class="dropdown-header noti-title">
                <h5 class="text-overflow mb-2">Tìm thấy <span class="text-danger">17</span> kết quả</h5>
            </div>

            <!-- item-->
            <div class="dropdown-header noti-title">
                <h6 class="text-overflow mb-2 text-uppercase">Sản phẩm</h6>
            </div>

            <div class="notification-list">
                <!-- item-->
                <a href="product/index.jsp" class="dropdown-item notify-item">
                    <div class="media">
                        <img class="d-flex mr-2 rounded-circle"
                             src="<c:out value="${pageContext.request.contextPath}"/>/img/product/products/CaPheCappuccinoDaXay.png"
                             alt="Generic placeholder image" height="32">
                        <div class="media-body">
                            <h5 class="m-0 font-14">Trà sữa lài</h5>
                            <span class="font-12 mb-0">Trà sữa</span>
                        </div>
                    </div>
                </a>

                <!-- item-->
                <a href="product/index.jsp" class="dropdown-item notify-item">
                    <div class="media">
                        <img class="d-flex mr-2 rounded-circle"
                             src="<c:out value="${pageContext.request.contextPath}"/>/img/product/products/CaPheCappuccinoDaXay.png"
                             alt="Generic placeholder image" height="32">
                        <div class="media-body">
                            <h5 class="m-0 font-14">Cà phê đen</h5>
                            <span class="font-12 mb-0">Cà phê</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>