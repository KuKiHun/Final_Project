<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제목을 입력하세요</title>
    <!-- 부트스트랩을 사용하기 위한 설정 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        // 쿠키 설정
        function setCookie(name, value, expiredays) {
        	
            var todayDate = new Date();
          	//alert('setCookie_쿠키설정');
          
            todayDate.setDate(todayDate.getDate() + expiredays);
            
            document.cookie = name + '=' + escape(value) + '; path=/; expires=' + todayDate.toGMTString() + ';';
        }

        // 쿠키 불러오기
        function getCookie(name) {
        	
        	//alert('getCookie_쿠키불러오기');
            var obj = name + "=";
            var x = 0;
            while (x <= document.cookie.length) {
            	
                var y = (x + obj.length);
                
                if (document.cookie.substring(x, y) == obj) {
                	
                    var endOfCookie = document.cookie.indexOf(";", y);
                    
                    if (endOfCookie == -1)
                        endOfCookie = document.cookie.length;
                    
                    return unescape(document.cookie.substring(y, endOfCookie));
                }
                x = document.cookie.indexOf(" ", x) + 1;
                
                if (x == 0) break;
            }
            return "";
        }

        // 창 닫기
        function closeWindow(isChecked) {
        	
            if (isChecked) {
            	
                setCookie('main_popup', 'Y', 1);
                
            }

            //window.close();
        }


        $(function () {
            $("#openBtn").click(function () {
            	var myWindow = window.open("", "MyWindow", "width=400,height=420");
            	myWindow.document.write("<div id='main_popup'>");
            	myWindow.document.write("<div id='popup_image'><img id='popupImage' src='/images/popups/popup2.jpg'></div>"); // 이미지 추가
            	myWindow.document.write("<div class='button_area'><input type='checkbox' name='chkbox' id='todaycloseyn'> 24시간 동안 다시 열람하지 않습니다");
            	myWindow.document.write("<button type='button' onclick='window.opener.closeWindow(document.getElementById(\"todaycloseyn\").checked)'>닫기</button></div>");
            	myWindow.document.write("</div>");
            	
            	 // 스타일 추가
                myWindow.document.write("<style type='text/css'>");
            	myWindow.document.write("#button_area { border-top: 1px solid #000; }")
                myWindow.document.write("#popupImage { width: 100%; height: auto; }");
            	myWindow.document.write(".button_area > button { margin-left: 33px; margin-top: 10px; }")
                myWindow.document.write("</style>");

            	
                // 부모 창에서 일정 간격마다 쿠키를 확인하고 창을 닫기
                var intervalId = setInterval(function () {
                    if (getCookie("main_popup") === "Y") {
                        clearInterval(intervalId); // 쿠키가 설정되면 감시 중단
                        myWindow.close();
                    }
                }, 1000); // 1초 간격으로 확인
            });

            if (getCookie("main_popup") != "Y") {
                $("#openBtn").trigger("click");
            }
        });
    </script>
</head>
<body>

<button id="openBtn" style="display:none;">Open Window</button>

</body>
</html>