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
                                        <form action="${pageContext.request.contextPath}/login" method="post"
                                              id="login">
                                            <div class="login-input-box">
                                                <span class="text-danger"
                                                      id="login-username-error"></span>
                                                <input type="text" id="login_username" name="username"
                                                       placeholder="Tài khoản"
                                                       value="" required/>
                                                <span class="text-danger" id="login-password-error"></span>
                                                <input type="password" id="login_password" name="password"
                                                       placeholder="Mật khẩu"
                                                       value="" required/>
                                            </div>
                                            <div class="button-box">
                                                <div class="login-toggle-btn">
                                                    <input id="checkSave" type="checkbox" name="save"
                                                           value="checked"/>
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
                                                    <fb:login-button scope="public_profile,email"
                                                                     onlogin="checkLoginState();">
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
                                        <form action="/register" method="post" id="register">
                                            <div class="login-input-box">
                                                <span class="text-danger" id="register-name-error"></span>
                                                <small id="nameHelpInline" class="text-muted mb-3">
                                                    Tên người dùng. Vd: Nguyễn Văn A.
                                                </small>
                                                <input type="text" id="name" name="name" placeholder="Tên"
                                                       aria-describedby="nameHelpInline" required/>
                                                <span class="text-danger" id="register-username-error"></span>
                                                <small id="usernameHelpInline" class="text-muted mb-3">
                                                    Tên đang nhập. Vd: adeptrai.
                                                </small>
                                                <input type="text" id="username" name="username"
                                                       placeholder="Tên đăng nhập" aria-describedby="usernameHelpInline"
                                                       required/>

                                                <span class="text-danger"
                                                      id="register-email-error"></span>
                                                <small id="emailHelpInline" class="text-muted mb-3">
                                                    Email. Vd: nguyenvana@gmail.com.
                                                </small>

                                                <input name="email" id="email" placeholder="Email" type="email"
                                                       aria-describedby="emailHelpInline" required/>
                                                <span class="text-danger"
                                                      id="register-phone-error"></span>
                                                <small id="phoneHelpInline" class="text-muted mb-3">
                                                    Số điện thoại. Vd: 0987654321.
                                                </small>
                                                <input name="phone" id="phone" placeholder="Số điện thoại" type="tel"
                                                       pattern="[0]{1}[0-9]{9}" aria-describedby="phoneHelpInline"
                                                       required/>
                                                <span class="text-danger"
                                                      id="register-password-error"></span>
                                                <small id="passwordHelpInline" class="text-muted mb-3">
                                                    Mật khẩu ít nhất 8 ký tự.
                                                </small>
                                                <input type="password" id="password" name="password"
                                                       placeholder="Mật nhẩu" aria-describedby="passwordHelpInline"
                                                       minlength="6"
                                                       required/>
                                                <span class="text-danger"
                                                      id="register-repassword-error"></span>
                                                <small id="passcomfirmHelpInline" class="text-muted mb-3">
                                                    Mật khẩu phải trùng với mật khẩu ở trên
                                                </small>
                                                <input type="password" id="repassword" placeholder="Nhập lại mật nhẩu "
                                                       minlength="6" aria-describedby="passcomfirmHelpInline" required/>
                                            </div>
                                            <div class="button-box">
                                                <button class="register-btn btn" type="submit"
                                                        onclick="return check_register()">
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
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v15.0&appId=2143582525828112&autoLogAppEvents=1"
        nonce="jhCmVurm"></script>

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
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
        FB.api('/me', {fields: ' name, email'}, function (response) {
            console.log(response);
            window.location.href = 'Login?action=Face&name=' + response.name + '&email=' + response.email + '&id=' + response.id;
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '2143582525828112',
            cookie: true,
            xfbml: true,
            version: 'v15.0'
        });

        FB.AppEvents.logPageView();

    };


    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
<script>
    function handleCredentialResponse(response) {
        const resp = jwt_decode(response.credential);

        window.location.href = 'Login?action=Google&name=' + resp.name + '&email=' + resp.email + '&id=' + resp.sub;
    }

    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "862913517251-8g2qrfue12q6gojci1tulp9qtfi4hmqv.apps.googleusercontent.com",
            callback: handleCredentialResponse
        });
        google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            {theme: "outline", size: "large"}  // customization attributes
        );
        google.accounts.id.prompt(); // also display the One Tap dialog
    }
</script>

<script src="js/validate.js"></script>
<script type="text/javascript">

    $("#login").submit(function (e) {
        e.preventDefault();
        console.log($(this).serialize());
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function (data) {
                if (1 == data) {
                    $("#login-username-error").text("Tài khoản hoặc mật khẩu không đúng");
                    console.log(123);
                } else if (2 == data) {
                    window.location.href = "/";
                }
                console.log('Submission was successful.');
                console.log(data);
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data);
            },
        });
    });
    $("#register").submit(function (e) {
        e.preventDefault();
        console.log($(this).serialize());
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function (data) {
                if (1 == data) {
                    $("#register-username-error").text("Tên đăng nhập đã được sử dụng");
                    console.log(123);
                } else if (2 == data) {
                    window.location.href = "/";
                }
                console.log('Submission was successful.');
                console.log(data);
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