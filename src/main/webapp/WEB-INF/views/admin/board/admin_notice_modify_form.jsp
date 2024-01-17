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

<!-- CKEditor -->
<!-- <script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<!-- <script src="//cdn.ckeditor.com/4.16.1/basic/ckeditor.js"></script> -->

<!-- notice.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_notice.js"></script>


<style type="text/css">

	#box{
		width: 900px;
		margin: auto;
		margin-top: 50px;
		
	}
	
	textarea {
		width: 100%;
		resize: none;
			
	}

</style>

</head>
<body>
	<form>
		<input type="hidden" name="board_idx" value="${ vo.board_idx }">
		<input type="hidden" name="page"  value="${ param.page }">
		<div id="box">
			<div class="panel panel-primary">
		      <div class="panel-heading">공지사항<a href=""></a></div>
		      <div class="panel-body">
		      	<table class="table">
		      		<tr>
			    		<th>제목</th>
			    		<td><input name="board_title" size="100" value="${ vo.board_title }"></td>
		    		</tr>
		    		
		    		<tr>
			    		<th>내용</th>
			    		<td>
			    			<textarea id="board_content" name="board_content" rows="13" cols="">${ vo.board_content }</textarea>
			    			<script>
							   CKEDITOR.replace('board_content', {
								   uiColor: '#CCEAEE',
								   enterMode: CKEDITOR.ENTER_DIV,
							       shiftEnterMode: CKEDITOR.ENTER_P,
							       extraPlugins: 'editorplaceholder',
							        editorplaceholder: '입력하세요...'
								});
							</script>
			    		</td>
		    		</tr>
		    		
		    		<tr>
		    			<td colspan="2" align="right">
		    				<input type="button" value="수정" onclick="sendModify(this.form);">
		    				<input type="button" value="목록" onclick="location.href='notice'">		
		    			</td>
		    		</tr>		      	
		      	</table>
		      </div>
		    </div>
		</div>
	
	</form>
</body>
</html>