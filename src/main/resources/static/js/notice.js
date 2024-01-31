/**
 * 
 */

$(document).ready(function(){
	
	if('${ not empty param.search }'=='true'){
		$("#search").val('${param.search}');
		
		//전체 보기면 검색어 지워라
		if("${param.search eq 'all'}"=="true"){
			$("#search_text").val("");
		}
	}
	
});


 function find(){
	 
	 const search      = $("#n_search").val();
	 const search_text = $("#search_text").val().trim();
	 
	 //전체 검색이면 검색창 내용 지워라
	 if(search=='all'){
		 
	 	 $("#search_text").val("");
	 }
	
	 if(search!='all' && search_text==''){
		 alert('검색어를 입력하세요');
		 $("#search_text").val("");//값지우기
		 $("#search_text").focus();
		 return;
	 }
	 
	//자바스크립트 이용 요청
	location.href = "notice?search=" + search + "&search_text=" + encodeURIComponent(search_text, "utf-8");
 
 }