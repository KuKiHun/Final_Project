function send(f){
		
	var user_id = f.user_id.value.trim();
	var user_pw = f.user_pw.value.trim();
	
	if(user_id==''){
		
		alert('아이디를 입력하세요');
		f.user_id.value='';
		f.user_id.focus();
		return;
	}
	
	if(user_pw==''){
		
		alert('비밀번호를 입력하세요');
		f.user_pw.value='';
		f.user_pw.focus();
		return;
	}
	
	f.action = "login";
	f.submit(); //전송
		
	
	
}