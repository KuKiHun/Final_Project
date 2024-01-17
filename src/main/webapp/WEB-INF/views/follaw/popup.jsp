<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap 사용하기 위한 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	#main_popup{
		width: 400px;
		position: absolute;
		border: 1px solid #000;
		left: 400px;
		top: 100px;
		background: white;
		z-index: 1000;
		display: none;
		
		
	}
	
	.button_area{
		border-top: 1px solid #000;
		
	}
	
	input[type=checkbox]{
		margin-left: 10px;
	}
	
	.button_area > a{
		margin-left: 100px;
		text-decoration: none;
		color: #000;
		
		
	}
	
	#popup_image{
		width: 100%;
		height: auto;
	}



</style>

<script type="text/javascript">
	
	
	//쿠키설정    
    function setCookie( name, value, expiredays ) {
		 
	    var todayDate = new Date();
	    alert('setCookie_쿠키설정');
	    todayDate.setDate( todayDate.getDate() + expiredays );
	    
	    document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
	}
	 
	 
    //쿠키 불러오기
    function getCookie(name) 
    {
    	alert('getCookie_쿠키불러오기');
        var obj = name + "="; 
        var x = 0; 
        while ( x <= document.cookie.length ) 
        { 
            var y = (x+obj.length); 
            if ( document.cookie.substring( x, y ) == obj ) 
            { 
                if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                    endOfCookie = document.cookie.length;
                return unescape( document.cookie.substring( y, endOfCookie ) ); 
            } 
            x = document.cookie.indexOf( " ", x ) + 1; 
            
            if ( x == 0 ) break; 
        } 
        return ""; 
    }
    
  	//닫기 버튼 클릭시
    function closeWin(key)
    {
        if($("#todaycloseyn").prop("checked"))
        {
        	
            setCookie('main_popup', 'Y' , 1 );
        }
        
        $("#main_popup").hide();
    }
  
    $(function(){    
    	//alert("[" + getCookie("main_popup") + "]" );
        if(getCookie("main_popup") !="Y"){
        	
            $("#main_popup").show();
        }
    });
	 
	 
	 
	

</script>

</head>
<body>

	<div id="main_popup">
		<div id="popup_image">
			<img src="/images/popups/popup1.jpg">
		</div>
		<div class="button_area">
			<input src="" type='checkbox' name='chkbox' id='todaycloseyn' value='Y'>
			24시간 동안 다시 열람하지 않습니다   
			<a href='#' onclick="javascript:closeWin(1);">닫기</a>
		</div>
	</div>


</body>
</html>