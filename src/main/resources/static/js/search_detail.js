jQuery(($)=>{
    const caseSerialNumber = $("#caseSerialNumber").text();
    // console.log(caseSerialNumber);
    let url ="http://localhost:8080/esResult/number/"+caseSerialNumber;
    $.ajax({
        url:url,
        type:"get",
        success: R => {
            let result = R['esResult'];
            $(".wt-title").text(`[${result[0]['사건번호']}]${result[0]['사건명']}(${result[0]['선고일자']})`)
            $("#caseName").text(result[0]['사건명'])
            $("#caseNumber").text(result[0]['사건번호'])
            $("#caseDate").text(result[0]['선고일자'])
            $("#caseCourt").text(result[0]['법원명'])
            $("#caseSort").text(result[0]['사건종류명'])
            $("#sa").text(result[0]['판시사항'] ===""?"내용 없음" : result[0]['판시사항'])
            $("#yo").text(result[0]['판결요지'] ===""?"내용 없음" : result[0]['판결요지'])
            $("#jo").text(result[0]['참조조문'] ===""?"내용 없음" : result[0]['참조조문'])
            $("#pan").text(result[0]['참조판례'] ===""?"내용 없음" : result[0]['참조판례'])
        }, error:err => {
            console.log(err)
        }
    })
    // const data =
})