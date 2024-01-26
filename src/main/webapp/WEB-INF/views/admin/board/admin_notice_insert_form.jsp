<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 공지사항</title>
<!-- bootstrap 사용하기 위한 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CKEditor -->
<!-- <script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<!-- <script src="//cdn.ckeditor.com/4.16.1/basic/ckeditor.js"></script> -->

<!-- notice.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_notice.js"></script>

<!-- notice.css -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/admin_notice_insert.css">

</head>
<body>

	<form>
		<div id="box">
			<div class="panel panel-primary">
		      <div class="panel-heading">공지사항</div>
		      <div class="panel-body">
		      	<table class="table">
		      		<tr>
			    		<th>게시물종류</th>
			    		<td><input name="board_sort" size="100" value="공지사항" readonly="readonly"></td>
		    		</tr>
		      		<tr>
			    		<th>제목</th>
			    		<td><input name="board_title" size="100"></td>
		    		</tr>
		    		
		    		<tr>
			    		<th>내용</th>
			    		<td>
			    			<textarea id="board_content" name="board_content" rows="13" cols=""></textarea>
			    			<script>
							   CKEDITOR.replace('board_content', {
								   filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditorImageUpload',
								   uiColor: '#CCEAEE',
								   enterMode: CKEDITOR.ENTER_DIV,
							       shiftEnterMode: CKEDITOR.ENTER_P,
							       extraPlugins: 'editorplaceholder',
							        editorplaceholder: '입력하세요...'
								});
							   
							   CKEDITOR.on('dialogDefinition', function( ev ){
						            var dialogName = ev.data.name;
						            var dialogDefinition = ev.data.definition;
						          
						            switch (dialogName) {
						                case 'image': //Image Properties dialog
						                    //dialogDefinition.removeContents('info');
						                    dialogDefinition.removeContents('Link');
						                    dialogDefinition.removeContents('advanced');
						                    break;
						            }
						        });
							</script>
			    		</td>
		    		</tr>
		    		
		    		<tr>
		    			<td colspan="2" align="right">
		    				<input class="b_writing_btn" type="button" value="글쓰기" onclick="send(this.form);">
		    				<input class="b_insert_btn" type="button" value="목록" onclick="location.href='notice'">		
		    			</td>
		    		</tr>		      	
		      	</table>
		      </div>
		    </div>
		</div>
	</form>


</body>
</html>