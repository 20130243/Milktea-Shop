<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        </li>


        <li class="notification-list">
            <a class="nav-link right-bar-toggle" href="javascript: void(0);">
                <i class="dripicons-gear noti-icon"></i>
            </a>
        </li>

        <li class="dropdown notification-list">
            <a class="nav-link dropdown-toggle nav-user arrow-none mr-0" data-toggle="dropdown" href="#"
               role="button" aria-haspopup="false" aria-expanded="false">

                <span>
                <span class="account-user-name">${sessionScope.admin.name}</span>
                <span class="account-position">Admin</span>
                </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                <!-- item-->
                <div class=" dropdown-header noti-title">
                    <h6 class="text-overflow m-0">Xin chào !</h6>
                </div>

                <form action="/logout" method="post">
                    <!-- item-->
                    <a href="/admin/logout" class="dropdown-item notify-item">
                        <i class="mdi mdi-logout mr-1"></i>
                        <span>Đăng xuất</span>
                    </a>
                </form>
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