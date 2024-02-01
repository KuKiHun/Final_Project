$(document).ready(function(){
	
    function userIdCheck() {
        let submit = false;
        const user_id = $("input[name=user_id]").val().replaceAll(" ", "");
        if(!user_id) {
            return false;
        }
        
        $.ajax({ 
            url: "/overlapCheck",
            type: "GET",
            async: false,
            data: {
                value : user_id,
                valueType : "user_id"
            }
        })
        .done(function(result){
            if(result == 1) {
                submit = true;
            } 
        })
        .fail(function(){
            alert("에러");
        })
        return submit;
    }
     
     
     
     
    $(".next_page").click(function(){
        if(!usernameCheck()) {
            swal("아이디를 정확히 입력해주세요");
            return;
        }
        const data = {
            username : $(".username").val(),	
        }
        
        $.ajax({
            url: "/find/password/auth",
            type: "POST",
            data: data
        })
        .then(function(result){
            location.href= "/find/password/auth?username=" + result;
        })
        .fail(function(){
            alert('에러');
        })
    })
     
     
     
        
     
        
    })
    