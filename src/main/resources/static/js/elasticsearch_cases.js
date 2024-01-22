jQuery(($) => {
    const caseList = $(".case-list");
    let category = "";
    let base_url ="http://localhost:8080/esResult";
    let url = "";

    // let path = window.location.pathname.split("/");

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
        let currentPage;
        let path = window.location.pathname.split("/");
        if (path.length === 4 || path.length === 6){
            currentPage = 1;
        } else if(path.length === 5 || path.length === 7){
            currentPage = path[path.length-1];
        }
        console.log(`path.length : ${path.length} / current page : ${currentPage}`);

        if (category != null && keyword.trim() !== ""){
            url = base_url+`/${category}/${keyword}/${currentPage}`
        } else {
            url = `${base_url}/${currentPage}`;
        }
        $("ul.case-list").empty();
        $.ajax({
            type:"get",
            url: url,
            data:1,
            success : result => {
                console.log(result);
                let hits = result['esCount'].split(' ')[0];
                $('#esCount').text(hits);
                let searchResult = result['esResult'];
                console.log('length : ')
                console.log(hits);
                if (hits === '10000+') hits = 10000;
                console.log("검색결과 수 : "+hits);
                if (hits === 0){
                    console.log("검색결과가 없습니다.")
                    $('.case-list').append("<div>검색결과가 없습니다.</div>")
                }
                else {
                    for (let i = 0; i < 10; i++) {
                        container(searchResult[i]);
                    }
                }
                resultPaging(hits, currentPage);
            },
            error : error => console.log(error)
        })
    }

    function container(data){
        // console.log(data);
        const listItem = $('<li>');
        const title = `[${data['사건번호']}]${data['사건명']}(${data['선고일자']})`;
        const yoji = data['판결요지'].length>100 ? data['판결요지'].substring(0,100)+' ...' : data['판결요지'];
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
        $('.case-list').append(listItem);
    }

    // 24.01.20 17:10 개발중
    function resultPaging(totalHits, currentPage){
        let path = window.location.pathname.split("/");
        const ip = "localhost";
        const port = "8080";
        let url = `http://${ip}:${port}/follaw/knowledge/cases`
        // 검색키워드가 있는 경우와 없는 경우 구분 -> 테스트 필요
        if (path.length == 4){
        } else if(path.length == 5){
            // url += `/${currentPage}`
        } else if(path.length == 6){
            url += `/${path[4]}/${path[5]}`;
            // url += `/${path[4]}/${path[5]}/${currentPage}`;
        } else if(path.length == 7){
            url += `/${path[4]}/${path[5]}`;
            // currentPage = path[path.length-1];
        }

        if (totalHits === '10000+') totalHits = 10000;
        let totalMax = totalHits%10 === 0? totalHits/10 : totalHits/10+1
        console.log(`totalMax : ${totalMax}`);
        let currentMin = currentPage - currentPage%10 + 1;
        let currentMax = totalMax > currentMin+9? currentMin+9 : totalMax;
        let contents = "";
        const pagingList = $('<div class="pagination-style1">');
        $('.pagination-outer').empty();

        if (totalHits > 10) {
            for (let pageNo = currentMin; pageNo < currentMax + 1; pageNo++) {
                contents += `<li><a href="${url}/${pageNo}">${pageNo}</a></li>`;
                console.log(`pageNo : ${pageNo}`);
            }
        } else if (totalHits < 11) {
            contents = `<li><a href="${url}/1">1</a></li>`;
        }
        //li 요소 내용 설정
        pagingList.html(
            `<ul><li class="prev"><a href="${url}/${currentMin}"><span> <i class="fa fa-angle-left"></i> </span></a>`
            +contents+
            `<li class="next"><a href="${url}/${currentMax<totalMax?currentMax+1 : currentMax}"><span> <i class="fa fa-angle-right"></i></span></a></ul>`
        )
        $('.pagination-outer').append(pagingList);
    }
})