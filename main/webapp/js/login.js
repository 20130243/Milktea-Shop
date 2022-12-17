function check_sign_up() {
    //Tên
    let check_name_error = false;
    let name = document.getElementById('name').value;
    if (name.length == 0) {
        check_name_error = true;
        document.getElementById('name_error').innerHTML = 'Không được để trống.';
    } else {
        let regex_name = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s]{2,}$/;
        if (!regex_name.test(name)) {
            document.getElementById('name_error').innerHTML = 'Tên không chứa kí tự đặc biệt.';
            check_name_error = true;
        } else {
            document.getElementById('name_error').innerHTML = '';
            check_name_error = false;
        }

    }
    //Email
    let check_email_error = false;
    let email = document.getElementById('email').value;
    if (email.length == 0) {
        document.getElementById('email_error').innerHTML = 'Không được để trống.';
        check_email_error = true;
    } else {
        let regex_email = /^[\w\-]+@(?:[\w-]+)+(?:\.[\w-]{2,8}){1,5}$/;
        if (!regex_email.test(email)) {
            document.getElementById('email_error').innerHTML = 'Email không hợp lệ.';
            check_email_error = true;
        } else {
            document.getElementById('email_error').innerHTML = '';
            check_email_error = false;
        }
    }
    //Phone
    let check_phone_error = false;
    let phone = document.getElementById('phone').value;
    if (phone.length == 0) {
        document.getElementById('phone_error').innerHTML = 'Không được để trống.';
        check_phone_error = true;
    } else {
        let regex_phone = /^(84|0[3|5|7|8|9])+([0-9]{8})$/;
        if (!regex_phone.test(phone)) {
            document.getElementById('phone_error').innerHTML = 'Số điện thoại không hợp lệ.';
            check_phone_error = true;
        } else {
            document.getElementById('phone_error').innerHTML = '';
            check_phone_error = false;
        }
    }
    //Mật khẩu
    let check_password_error = false;
    let password = document.getElementById('password').value;
    if (password.length == 0) {
        document.getElementById('password_error').innerHTML = 'Không được để trống.';
        check_password_error = true;
    } else {
        let regex_password = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        if (!regex_password.test(password)) {
            document.getElementById('password_error').innerHTML = `Mật khẩu phải có ít nhất 6 kí tự, phải bao gồm chữ và số  `;
            check_password_error = true;
        }
        else {
            document.getElementById('password_error').innerHTML = '';
            check_password_error = false;
        }
    }
    //Nhập lại mật khẩu
    let check_repassword_error = false;
    let repassword = document.getElementById('repassword').value;
    if (repassword.length == 0) {
        document.getElementById('repassword_error').innerHTML = 'Không được để trống.';
        check_repassword_error = true;
    } else {
        if (repassword != password) {
            document.getElementById('repassword_error').innerHTML = `Mật khẩu không khớp `;
            check_repassword_error = true;
        } else {
            document.getElementById('repassword_error').innerHTML = '';
            check_repassword_error = false;
        }
    }
    if (check_name_error || check_email_error || check_phone_error || check_password_error || check_repassword_error) {
        return false;
    }
}