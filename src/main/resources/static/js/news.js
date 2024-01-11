jQuery(($)=>{
    const ip = "localhost";
    const url = "http://"+ip+":8080/follaw/news/data";

    // $.ajax({
    //     url:url,
    //     type:"get",
    //     success : result =>{
    //         const length = result.length;
    //         console.log('length : '+length);
    //
    //         if (length === 0){
    //             $('.case-list').append("<div>저장된 뉴스가 없습니다.</div>")
    //         } else {
    //             for (let i = 0; i < length; i++) {
    //                 container(result[i])
    //             }
    //         }
    //     }, error : err => console.log(err)
    // })
})