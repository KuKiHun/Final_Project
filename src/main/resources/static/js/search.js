jQuery(($) => {
    const caseList = $(".case-list");
    let category = "";
    let base_url ="http://localhost:8080/esResult";
    let url = "";
    sessionValue = sessionStorage.getItem("searchKeyword");
    console.log(sessionValue);
    if(sessionValue != null){
        $("#searchCategory").val("name")
        $("input.form-control").val(sessionValue);
        search(name, sessionValue);
    } else {
        search();
    }

    $("#searchCategory").change(function (){
        category = $(this).val();
        console.log(category);
    })

    // $('#sizeInput').keyup(function (key){
    //     let input = $(this).parent().prev().val();
    //     //enter event
    //     if (input !== "" && key.keyCode===13){
    //
    //         $.ajax({
    //             type : "get",
    //             data: {search_keyword : input},
    //             url : ,
    //             success : result => {
    //                 search(category,input);
    //             }, error : err => {
    //             }
    //         })
    //     }
    // })

    $("i.feather-search").click(function () {
        // console.log($(this).parent().prev().val());
        let input = $(this).parent().prev().val();
        if (input !== ""){
            search(category,input);
        }
    })

    function search(category, keyword){
        if (category != null && keyword.trim() !== ""){
            url = base_url+`/${category}/${keyword}`
        } else {
            url = base_url;
        }
        $("ul.case-list").empty();
            $.ajax({
                type:"get",
                url: url,
                data:1,
                success : result => {
                    // console.log(result)
                    const length = result.length
                    console.log('length : '+length)
                    if (length === 0){
                        console.log("검색결과가 없습니다.")
                        $('.case-list').append("<div>검색결과가 없습니다.</div>")
                    }
                    else {
                        for (let i = 0; i < length; i++) {
                            // console.log("case : "+result[i]['사건번호'])
                            container(result[i])
                            // console.log()
                        }
                    }
                },
                error : error => console.log(error)
            })
    }

    function container(data){

        const listItem = $('<li>');
        const title = `[${data['사건번호']}]${data['사건명']}(${data['선고일자']})`;
        const yoji = data['판결요지'].length>100 ? data['판결요지'].substring(0,100)+' ...' : data['판결요지']
        const link = `http://localhost:8080/follaw/knowledge/case/`+data['판례일련번호']
        //li 요소 내용 설정
        listItem.html('' +
            '<div class="twm-candidates-list-style1 mb-5">\n' +
            '    <div class="twm-media">\n' +
            '        <div class="twm-candidates-tag">'+data['사건종류명']+'</div>\n' +
            '    </div>\n' +
            '    <div class="twm-mid-content">\n' +
            '        <a href='+link+' class="twm-job-title">\n' +
            '            <h4 class="law-title">'+title+'</h4>\n' +
            '        </a>\n' +
            '    <p class="law-yo">'+yoji+'</p>\n' +
            '        <div class="twm-fot-content">\n' +
            '            <div class="twm-right-btn">\n' +
            '                <a href="candidate-detail.html" class="twm-view-prifile site-text-primary">전문 변호사 보기</a>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>\n' +
            '</div>')
        $('.case-list').append(listItem)
    }
})