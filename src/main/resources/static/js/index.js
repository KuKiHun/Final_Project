$(document).ready(function() {

    let category = "";
    const base_url = "http://localhost:8080/follaw/";
    let url = "";
    let law_act_selected = '';

    // 검색 분류
    $("select#j-All_Category").change(function (){
        category = $(this).val();
        if (category === "law"){
            $.ajax({
                url:base_url+'knowledge/lawList',
                success:result => {
                    let options = "";
                    for (const idx in result) {
                        options+=`<option value="${result[idx]}">${result[idx]}</option>`
                    }
                    $('div.twm-inputicon-box').empty();
                    $('div.twm-inputicon-box').append(
                        "<select class='wt-search-bar-select law_act_select'><option value='no' selected>법의 이름을 선택하세요</option>"+options+"</select>"
                    );
                }
            })
        } else {
            $('div.twm-inputicon-box').empty();
            $('div.twm-inputicon-box').append(
                '<input name="username" type="text" required class="form-control searchKeyword" id="main-search" placeholder="검색어를 입력하세요.">'
            );
        }
    })

    // 검색분류 - 법조항 에서 법 명을 선택하면 반응하는 부분
    $('div.twm-inputicon-box').on('change', 'select.law_act_select', function() {
        law_act_selected = $(this).val();
    });

    $("button.site-button").click(function (){
        // 판례를 선택했을때
        if (category === "case"){
            url = base_url+"knowledge/cases";
        // 법을 선택했을때
        } else if (category === "law"){
            if (law_act_selected.charAt(law_act_selected.length - 1) === "법"){
                url = base_url+"knowledge/law/"+law_act_selected;
            } else {
                alert("법 조항을 선택해 주세요");
                return;
            }
        // 변호사를 선택했을때
        } else if (category === "lawyer"){

        // 법률사무소를 선택했을때
        } else if (category === "lawfirm"){
            var searchvalue = $('#main-search').val();
            url = base_url + 'lawoffice?option=전국&name=' + searchvalue
        // 법원을 선택했을때
        } else if (category === "court"){
            var searchvalue = $('#main-search').val();
            url = base_url + 'court?option=전국&name=' + searchvalue
        }
        sessionStorage.setItem("searchKeyword", $("input.searchKeyword").val());
        $(location).attr('href', url);
    })


    // 3초마다 뉴스 클릭으로 회전
    setInterval(function (){
        $("button.owl-next").click();
    }, 3000)

})