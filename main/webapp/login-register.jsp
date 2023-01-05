<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Male_Fashion Template"/>
    <meta name="keywords" content="Male_Fashion, unica, creative, html"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Đăng nhập - Đăng kí</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet"/>

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css"/>
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css"/>
    <link rel="stylesheet" href="css/nice-select.css" type="text/css"/>
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <link rel="stylesheet" href="css/account.css" type="text/css"/>
    <link rel="stylesheet" href="css/header-footer.css" type="text/css"/>

    <script src="https://accounts.google.com/gsi/client" async defer></script>


</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
            <a href="login-register.jsp">Đăng nhập</a>
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""/></a>
        <a href="#"><img src="img/icon/heart.png" alt=""/></a>
        <a href="#"><img src="img/icon/cart.png" alt=""/> <span>0</span></a>
        <div class="price">0 vnđ</div>
    </div>
    <div id="mobile-menu-wrap"></div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->

<!-- Shopping Cart Section Begin -->
<section class="login-register">
    <div class="main-content-wrap section-ptb lagin-and-register-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12 m-auto">
                    <div class="login-register-wrapper">
                        <!-- login-register-tab-list start -->
                        <div class="login-register-tab-list nav">
                            <a class="active" data-bs-toggle="tab" href="#lg1">
                                <h4>Đăng nhập</h4>
                            </a>
                            <a data-bs-toggle="tab" href="#lg2">
                                <h4>Đăng kí</h4>
                            </a>
                        </div>
                        <!-- login-register-tab-list end -->
                        <div class="tab-content">
                            <div id="lg1" class="tab-pane active">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="/login" method="post">
                                            <div class="login-input-box">
                                                <span class="text-danger"
                                                      id="login-username-error">${requestScope['error_login']}</span>
                                                <input type="text" name="username" placeholder="Tài khoản" value="${requestScope['user']}"/>
                                                <span class="text-danger" id="login-password-error"></span>
                                                <input type="password" name="password" placeholder="Mật khẩu" value="${requestScope['pass']}"/>
                                            </div>
                                            <div class="button-box">
                                                <div class="login-toggle-btn">
                                                    <input id="checkSave" type="checkbox" name="save" value="checked" ${requestScope['save']}/>
                                                    <label for="checkSave">Lưu thông tin</label>
                                                    <a href="forgotPass.jsp">Quên mật khẩu?</a>
                                                </div>
                                                <div class="button-box">
                                                    <button class="login-btn btn" type="submit">
                                                        <span>Đăng nhập</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <hr class="mb-4 mt-1">

                                            <div class="d-flex justify-content-center text-center pt-1">
                                                <div class="col">
                                                    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                                                    </fb:login-button>
                                                </div>
                                                <div class="col">
                                                    <div id="buttonDiv"></div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="lg2" class="tab-pane">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="/register" method="post">
                                            <div class="login-input-box">
                                                <span class="text-danger" id="register-name-error"></span>
                                                <input type="text" name="name" placeholder="Tên" required/>
                                                <span class="text-danger"
                                                      id="register-username-error">${requestScope['error_username_register']}</span>
                                                <input type="text" name="username" placeholder="Tên đăng nhập"
                                                       required/>
                                                <span class="text-danger"
                                                      id="register-email-error">${requestScope['error_email_register']}</span>
                                                <input name="email" placeholder="Email" type="email" required/>
                                                <span class="text-danger"
                                                      id="register-phone-error">${requestScope['error_phone_register']}</span>
                                                <input name="phone" placeholder="Số điện thoại" type="tel"
                                                       pattern="[0]{1}[0-9]{9}" required/>
                                                <span class="text-danger"
                                                      id="register-password-error"></span>
                                                <input type="password" name="password" placeholder="Mật nhẩu "
                                                       required/>
                                                <span class="text-danger"
                                                      id="register-repassword-error"></span>
                                                <input type="password" placeholder="Nhập lại mật nhẩu " required/>
                                            </div>
                                            <div class="button-box">
                                                <button class="register-btn btn" type="submit">
                                                    <span>Đăng kí</span>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here....."/>
        </form>
    </div>
</div>
<!-- Search End -->
<!-- Js Plugins -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v15.0&appId=2143582525828112&autoLogAppEvents=1" nonce="jhCmVurm"></script>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/account/bootstrap.min.js"></script>
<script src="assets/js/vendor/jquery-3.5.1.min.js"></script>

<script src="assets/js/vendor/account/js/plugins/slick.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/jquery.nice-select.min.js"></script>

<script src="assets/js/vendor/account/js/plugins/image-zoom.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/fancybox.js"></script>
<script src="assets/js/vendor/account/js/plugins/scrollup.min.js"></script>
<script src="assets/js/vendor/account/js/plugins/jqueryui.min.js"></script>
<script src="assets/js/vendor/account/js/main.js"></script>


<script>

    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
        FB.api('/me',{fields: ' name, email'}, function(response) {
            console.log(response);
            window.location.href = 'Login?action=Face&name='+response.name+'&email='+response.email+'&id='+response.id;
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '2143582525828112',
            cookie     : true,
            xfbml      : true,
            version    : 'v15.0'
        });

        FB.AppEvents.logPageView();

    };


    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
<script>
    function handleCredentialResponse(response) {
         const resp = jwt_decode(response.credential);

        window.location.href = 'Login?action=Google&name='+resp.name+'&email='+resp.email+'&id='+resp.sub;
    }
    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "862913517251-8g2qrfue12q6gojci1tulp9qtfi4hmqv.apps.googleusercontent.com",
            callback: handleCredentialResponse
        });
        google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large" }  // customization attributes
        );
        google.accounts.id.prompt(); // also display the One Tap dialog
    }
</script>
</body>

</html>