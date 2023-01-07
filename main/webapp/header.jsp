<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<link rel="stylesheet" href="css/header-footer.css">
<%
String url = request.getRequestURI();
%>

<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="/"><img class="logo-small" src="img/logo.png" alt=""/></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu">
                    <ul>
                        <li class="<%=url.equals("/index.jsp")?"active" : ""%>"><a href="/">Trang chủ</a></li>
                        <li class="<%=url.equals("/shop.jsp")?"active" : ""%>"><a href="./shop" >Thức uống</a></li>
                        <li class="<%=url.equals("/about.jsp") || url.equals("/contact.jsp")?"active" : ""%>">
                            <a href="#">Giới thiệu</a>
                            <ul class="dropdown">
                                <li class="<%=url.equals("/about.jsp")?"active" : ""%>"><a href="./about.jsp" >Về chúng tôi</a></li>
                                <li class="<%=url.equals("/contact.jsp")?"active" : ""%>"><a href="./contact.jsp">Liên hệ</a></li>
                            </ul>
                        </li>
                        <li class="<%=url.equals("/blog.jsp")?"active" : ""%>"><a href="./blog">Tin tức</a></li>
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
                                        <li class="<%=url.equals("/account.jsp") || url.equals("/changePassword.jsp")?"active" : ""%> mr-0">
                                            <a href="./account" class="user">${sessionScope.user.name}
                                                <img src="img/icon/user.png" alt="" width="18px"/>
                                            </a>
                                            <ul class="dropdown">
                                                <li><a href="./account">Tài khoản</a></li>
                                                <li><a href="./checkout">Giỏ hàng</a></li>
                                                <li><a href="./logout">Đăng xuất</a></li>

                                            </ul>
                                        </li>
                                        <li class="<%=url.equals("/checkout.jsp")?"active" : ""%> mr-2"><a href="./checkout"><img src="img/icon/cart.png" alt="" width="18px"/><span>${sessionScope.cart==null?0:sessionScope.cart.items.size()}</span></a></li>
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