$(document).ready(function () {

    $('#user_newpass_form').submit(function(e) {
        e.preventDefault();

        var userPass = $('#new_user_pw').val()
        var userPassconfirm = $('#new_user_pw_confirm').val()

        if(userPass === userPassconfirm){
            alert('성공적으로 비밀번호가 변경되었습니다.')
            this.submit();
        }
        else{
            alert('비밀번호 확인과 일치하지 않습니다')
        }
    });

});