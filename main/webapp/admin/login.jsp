<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- App css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style"/>
    <link href="../assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style"/>

</head>

<body class="loading authentication-bg"
      data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
<div class="account-pages mt-5 mb-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="card">

                    <!-- Logo -->
                    <div class="card-header pt-4 pb-4 text-center bg-primary">
                        <a href="#">
                            <span><img src="../assets/images/logo.png" alt="" height="18"></span>
                        </a>
                    </div>

                    <div class="card-body p-4">

                        <div class="text-center w-75 m-auto">
                            <h4 class="text-dark-50 text-center mt-0 font-weight-bold">Đăng nhập</h4>

                        </div>

                        <form action="/admin-login" method="post" id="login">
                            <span class="text-danger" id="login-username-error">${messages['error_login']}</span>
                            <div class="form-group">
                                <label for="username">Tài khoản</label>
                                <input class="form-control" type="text" id="username" name="username" required
                                       placeholder=" Nhập tài khoản của bạn" value="${messages['username']}">
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="password" name="password" class="form-control" required
                                           placeholder="Nhập mật khẩu của bạn">
                                    <div class="input-group-append" data-password="false">
                                        <div class="input-group-text">
                                            <span class="password-eye"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="checkbox-signin" name="save">
                                    <label class="custom-control-label" for="checkbox-signin">Lưu đăng nhập</label>
                                </div>
                            </div>

                            <div class="form-group mb-0 text-center">
                                <button class="btn btn-primary" type="submit">Đăng nhập</button>
                            </div>

                        </form>
                    </div> <!-- end card-body -->
                </div>
                <!-- end card -->

                <!-- end row -->

            </div> <!-- end col -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</div>
<!-- end page -->

<%@include file="footer.jsp" %>

<!-- bundle -->
<script src="../assets/js/vendor.min.js"></script>
<script src="../assets/js/app.min.js"></script>
<script>
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
                    window.location.href = "/admin";
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
