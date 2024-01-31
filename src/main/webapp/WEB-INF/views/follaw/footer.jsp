<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <style>

#chatbotbutton {
      position: fixed;
      left: 30px;
      bottom: 30px;
      width: 100px;
      height: 100px;
      cursor: pointer;

      transition: filter 0.3s; /* 부드러운 효과를 위한 transition 설정 */
      z-index: 9999;
    }

    #chatbotbutton:hover {
      filter: brightness(65%);
      cursor: pointer;
    }

    </style>
</head>
<body>
             <!-- 챗봇실행 -->
             <div style="margin: 100px auto 50px; width: 1000px;">                                   
                    <img src="${pageContext.request.contextPath}/images/chatbot.png" href="javascript:;" id="chatbotbutton" style="position: fixed; left: 30px; bottom: 30px; width: 100px; height: 100px;">
                    <label style="position: fixed; left: 30px; bottom: 130px;">챗봇</label>
            </div>
<!--  footer  -->

<!-- FOOTER START zz-->
<footer class="footer-dark" style="padding-top:0px;">
    <div class="container">

        <!-- FOOTER BLOCKES START -->
        <div class="footer-top">
            <div class="row">

                <div class="col-lg-3 col-md-12">

                    <div class="widget widget_about">
                        <div class="logo-footer clearfix">
                            <a href="index"><img src="${pageContext.request.contextPath}/images/logo-light.png" alt=""></a>
                        </div>
                        <ul class="ftr-list">
                            <li><p><span>주소 :</span>서울특별시 마포구 백범로 23</p></li>
                            <li><p><span>이메일 :</span>admin@FolLaw.com</p></li>
                            <li><p><span>문의 :</span>010-2538-1830</p></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-12">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="widget widget_services ftr-list-center">
                                <h3 class="widget-title">검색</h3>
                                <ul>
                                    <li><a href="">변호사</a></li>
                                    <li><a href="">법원</a></li>
                                    <li><a href="">법률사무소</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="widget widget_services ftr-list-center">
                                <h3 class="widget-title">법률상담</h3>
                                <ul>
                                    <li><a href="">화상상담</a></li>
                                    <li><a href="">채팅상담</a></li>
                                    <li><a href="">지식인상담</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="widget widget_services ftr-list-center">
                                <h3 class="widget-title">법률지식</h3>
                                <ul>
                                    <li><a href="">주요5법</a></li>
                                    <li><a href="">판례</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="widget widget_services ftr-list-center">
                                <h3 class="widget-title">커뮤니티</h3>
                                <ul>
                                    <li><a href="">공지사항</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
        <!-- FOOTER COPYRIGHT -->
        <div class="footer-bottom">

            <div class="footer-bottom-info">

                <div class="footer-copy-right">
                    <span class="copyrights-text">Copyright © 2023 by FolLaw All Rights Reserved.</span>
                </div>

            </div>

        </div>

    </div>

</footer>
<!-- FOOTER END -->



</body>
</html>
<script>
    $("#chatbotbutton").click(function(e){
        e.preventDefault();
        window.open("http://175.114.130.7:5000/home", "챗봇", "width=650, height=850");
    })
</script>