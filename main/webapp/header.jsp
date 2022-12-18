<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="index.jsp"><img class="logo-small" src="img/logo.png" alt=""/></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="./shop">Thức uống</a></li>
                        <li>
                            <a href="#">Giới thiệu</a>
                            <ul class="dropdown">
                                <li><a href="./about.jsp">Về chúng tôi</a></li>
                                <li><a href="./contact.jsp">Liên hệ</a></li>
                            </ul>
                        </li>

                        <li><a href="./blog">Khuyến mãi</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option"> 
                    <c:choose>
                        <c:when test="${ empty sessionScope.user}">
                            <a href="/login" class="primary-btn login-btn">Đăng nhập</a>
                        </c:when>
                        <c:otherwise>
                            <div class="">
                                <nav class="header__menu" style="padding: 0">
                                    <ul>
                                        <li style="display: flex ">
                                            <a href="#"><img src="img/icon/user.png" alt="" width="18px"/>
                                            </a>

                                            <ul class="dropdown">
                                                <li><a href="./account.jsp">Tài khoản</a></li>
                                                <li><a href="./logout">Đăng xuất</a></li>
                                            </ul>
                                            <a href="#" class="user">${sessionScope.user.name}</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>