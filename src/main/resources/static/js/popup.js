	
	//쿠키설정    
    function setCookie( name, value, expiredays ) {
		 
	    var todayDate = new Date();
	    //alert('setCookie_쿠키설정');
	    
	    todayDate.setDate( todayDate.getDate() + expiredays );
	    
	    document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
	}
	 
	 
    //쿠키 불러오기
    function getCookie(name) 
    {
    	//alert('getCookie_쿠키불러오기');
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
    
    
    
   /*
    // 창 닫기
	function closeWindow(isChecked) {
		
	    if (isChecked) {
	    	
	        setCookie('main_popup_window', 'Y', 1);
	        
	    }
	
	    window.close();
	}
	
	
	$(function () {
	    $("#openBtn").click(function () {
	    	var myWindow = window.open("", "MyWindow", "width=400,height=420");
	    	myWindow.document.write("<div id='main_popup'>");
	    	myWindow.document.write("<div id='popup_image_win'><img id='popupImageWin' src='/images/popups/popup2.jpg'></div>"); // 이미지 추가
	    	myWindow.document.write("<div class='button_area_win'><input type='checkbox' name='chkbox' id='todaycloseyn'> 24시간 동안 다시 열람하지 않습니다");
	    	myWindow.document.write("<button type='button' onclick='window.opener.closeWindow(document.getElementById(\"todaycloseyn\").checked)'>닫기</button></div>");
	    	myWindow.document.write("</div>");
	    	
	    	 // 스타일 추가
	        myWindow.document.write("<style type='text/css'>");
	    	myWindow.document.write("#button_area_win { border-top: 1px solid #000; }")
	        myWindow.document.write("#popupImageWin { width: 100%; height: auto; }");
	    	myWindow.document.write(".button_area_win > button { margin-left: 33px; margin-top: 10px; }")
	        myWindow.document.write("</style>");
	
	    	
	        // 부모 창에서 일정 간격마다 쿠키를 확인하고 창을 닫기
	        var intervalId = setInterval(function () {
	            if (getCookie("main_popup_window") === "Y") {
	                clearInterval(intervalId); // 쿠키가 설정되면 감시 중단
	                myWindow.close();
	            }
	        }, 1000); // 1초 간격으로 확인
	    });
	
	    if (getCookie("main_popup_window") != "Y") {
	        $("#openBtn").trigger("click");
	    }
	});
*/
