jQuery(($) => {

    const caseList = $(".case-list");
    let category = "";
    let base_url ="http://localhost:8080/esResult";
    let url = "";

    search();

    $("#searchCategory").change(function (){
        category = $(this).val();
        console.log(category);
    })

    $("i.feather-search").click(function () {
        console.log($(this).parent().prev().val());
        search(category,$(this).parent().prev().val());
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
        const link = `http://localhost:8080/follaw/case/`+data['판례일련번호']
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