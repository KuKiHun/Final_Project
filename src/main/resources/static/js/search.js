jQuery(($) => {
    const caseList = $(".case-list");
    $.ajax({
        type:"get",
        url:"http://localhost:8080/esResult",
        data:1,
        success : result => {
            console.log(result)
            const length = result.length
            if (length === 0){
                console.log("검색결과가 없습니다.")
            }
            else {
                for (let i = 0; i < length; i++) {

                    console.log(result[i]['사건번호'])
                }
            }
        },
        error : error => console.log(error)
    })
    function container(data){
        //
        const listItem = $('<li>');
    }

})