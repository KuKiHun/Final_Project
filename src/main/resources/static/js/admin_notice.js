/**
 * 
 */

//글쓰기폼으로 이동
function insert_form(){
	
	location.href = 'insert_form';
	
}

//글쓰기
function send(f){
		
	var board_title   = f.board_title.value.trim();
	var board_content = CKEDITOR.instances.board_content.getData();
	
	//제목 비어있으면
	if(board_title==''){
		//알림 메시지 뛰우기
		alert('제목을 입력하세요') 
		f.board_title.value=''; //값 비우기
		f.board_title.focus();  //해당 필드에 포커스 지정
		return;
	}
	
	if(board_content==''){
		
		alert('내용을 입력하세요')
		f.board_content.value='';
		f.board_content.focus();
		return;
	}
	
	f.action = "insert";
	f.submit();
}

	