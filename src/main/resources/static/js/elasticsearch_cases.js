jQuery(($) => {
    // url이 http://localhost:8080/follaw/knowledge/cases/name/사기 인 경우 name , 사기 확인 하여 출력

    const caseList = $(".case-list");
    let category = "";
    let ip = 'localhost';
    let port = 8080;
    let base =`http://${ip}:${port}`;
    let base_url =`${base}/esResult`;
    let url = "";

    // let path = window.location.pathname.split("/");

    sessionValue = sessionStorage.getItem("searchKeyword");
    console.log(sessionValue);
    if(sessionValue != null){
        $("#searchCategory").val("name");
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

    // 키워드 부분 버튼 클릭 시 동작(검색)
    $("button#search_btn").click(function () {
        let input = $(this).prev().val();
        if (input !== ""){
            window.location.href = `${window.location.pathname}/${category}/${input}`;
            // search(category,input);
        }
    })

    function search(category, keyword, page){
        let currentPage = page == null? 1 : page;
        let path = window.location.pathname.split("/");
        // if (path.length === 4 || path.length === 6){
        //     currentPage = 1;
        // } else if(path.length === 5 || path.length === 7){
        //     currentPage = path[path.length-1];
        // }
        console.log(`path.length : ${path.length} / current page : ${currentPage}`);
        // console.log(path)
        // console.log(path[4])
        // console.log(decodeURIComponent(path[5]))

        if (path.length === 4){
            if(page == null){
                url = base_url+'/1'
            } else {
                url = base_url+`/${page}`
            }
        } else if (path.length === 6){
            if(page == null){
                url = `${base_url}/${path[4]}/${decodeURIComponent(path[5])}/1`;
            } else {
                url = `${base_url}/${path[4]}/${decodeURIComponent(path[5])}/${page}`;
            }
        }
        // console.log(url);

        $.ajax({
            url: url,
            success : result => {
                ajaxResult(result, currentPage);
            },
            error : error => console.log(error)
        })
    }

    function ajaxResult(result, currentPage){
        $("ul.case-list").empty();
        let hits = result['esCount'].split(' ')[0];
        $('#esCount').text(hits);
        let searchResult = result['esResult'];
        if (hits === '10000+') hits = 10000;
        if (hits === 0){
            $('.case-list').append("<div>검색결과가 없습니다.</div>")
        }
        else {
            for (let i = 0; i < 10; i++) {
                container(searchResult[i]);
            }
        }
        resultPaging(hits, currentPage);
    }

    function container(data){
        // console.log(data);
        const listItem = $('<li>');
        const title = `[${data['사건번호']}]${data['사건명']}(${data['선고일자']})`;
        const yoji = data['판결요지'].length>100 ? data['판결요지'].substring(0,100)+' ...' : data['판결요지'];
        const link = `${base}/follaw/knowledge/case/`+data['판례일련번호']
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
            '                <a href='+`${base}/follaw/search/partner-lawyer?searchname=&searchoffice=&searchfield=${data['사건종류명']}`+
            '                   class="twm-view-prifile site-text-primary">전문 변호사 보기</a>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>\n' +
            '</div>')
        $('.case-list').append(listItem);
    }

    // 24.01.20 17:10 개발중
    function resultPaging(totalHits, currentPage){
        let path = window.location.pathname.split("/");
        let url = `${base}/follaw/knowledge/cases`
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
        let currentMin = currentPage - currentPage%10 + 1;
        let currentMax = totalMax > currentMin+9? currentMin+9 : totalMax;
        let contents = "";
        const pagingList = $('<div class="pagination-style1">');
        $('.pagination-outer').empty();

        if (totalHits > 10) {
            for (let pageNo = currentMin; pageNo < currentMax + 1; pageNo++) {
                contents += `<li><a class="esPaging" href="javascript:;">${pageNo}</a></li>`;
            }
        } else if (totalHits < 11) {
            contents = `<li><a class="esPaging" href="javascript:;">1</a></li>`;
        }
        //li 요소 내용 설정
        /*pagingList.html(
            `<ul><li class="prev"><a class="esPaging" href="${url}/${currentMin}"><span> <i class="fa fa-angle-left"></i> </span></a>`
            +contents+
            `<li class="next"><a class="esPaging" href="${url}/${currentMax<totalMax?currentMax+1 : currentMax}"><span> <i class="fa fa-angle-right"></i></span></a></ul>`
        )*/
        pagingList.html(
            `<ul><li class="prev"><a class="esPaging" href="javascript:;"><span> <i class="fa fa-angle-left"></i> </span></a>`
            +contents+
            `<li class="next"><a class="esPaging" href="javascript:;"><span> <i class="fa fa-angle-right"></i></span></a></ul>`
        )
        $('.pagination-outer').append(pagingList);
    }

    $(document).on('click', '.esPaging', function (event){
        // event.preventDefault();
        let newURL = "http://localhost:8080/esResult/";
        var pageNumber = $(this).text();
        let path = window.location.pathname.split("/");
        let currentPage;
        // console.log(path);
        if (path.length === 4){
            // search(null, null, 1);
            currentPage = 1;
            newURL += pageNumber;
        } else if(path.length === 5){
            currentPage = path[path.length-1];
            newURL += pageNumber;
        } else if(path.length === 6){
            currentPage = 1;
            // newURL += `${path[4]}/${path[5]}/1`;
            newURL += `${path[4]}/${path[5]}/${pageNumber}`;
        }
        $.ajax({
            url:newURL,
            success: R => {
                // var result = R['esResult'];
                ajaxResult(R, currentPage);
            }
        })
    })

    // 사건 종류별 출력
    function caseSort(){
        let url = "http://localhost:8080/getSortAndValue";
        $.ajax({
            url:url,
            success: result => {
                console.log(result);
                for (const res of result) {
                    var myContent =
                        `<li>
                            <div class="form-check">
                                <label class="form-check-label" for="exampleCheck1">${res['caseSort']}</label>
                            </div>
                            <span class="twm-job-type-count">${res['caseCount']}</span>
                        </li>`
                    $('#sortList').append(myContent);
                }
            }
        })
    }
    caseSort();
})