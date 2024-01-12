jQuery(($) => {

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
                '<input name="username" type="text" required class="form-control searchKeyword" placeholder="검색어를 입력하세요.">'
            );
        }
    })

    // 검색분류 - 법조항 에서 법 명을 선택하면 반응하는 부분
    $('div.twm-inputicon-box').on('change', 'select.law_act_select', function() {
        law_act_selected = $(this).val();
    });

    $("button.site-button").click(function (){
        if (category === "case"){
            url = base_url+"knowledge/case";
        } else if (category === "law"){
            if (law_act_selected.charAt(law_act_selected.length - 1) === "법"){
                url = base_url+"knowledge/law/"+law_act_selected;
            } else {
                alert("법 조항을 선택해 주세요");
                return;
            }
        } else if (category === "lawyer"){

        } else if (category === "lawfirm"){

        } else if (category === "court"){

        }
        sessionStorage.setItem("searchKeyword", $("input.searchKeyword").val());
        $(location).attr('href', url);
    })



    setInterval(function (){
        $("button.owl-next").click();
    }, 3000)
})