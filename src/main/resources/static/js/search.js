jQuery(($) => {
    const caseList = $(".case-list");
    $.ajax({
        type:"get",
        url:"http://localhost:8080/esResult",
        data:1,
        success : result => {
            console.log(result)
            // console.log(result)
            // for (const resultKey in result) {
            //
            // }
            const length = result.length
            // for
            console.log(result[0]['사건번호'])
        },
        error : error => console.log(error)
    })

})