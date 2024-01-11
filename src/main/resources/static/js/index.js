jQuery(($) => {

    let category = "";
    const base_url = "http://localhost:8080/follaw/";
    let url = "";

    // 검색 분류
    $("select#j-All_Category").change(function (){
        category = $(this).val();
    })

    $("button.site-button").click(function (){
        if (category === "case"){
            url = base_url+"knowledge/"
        } else if (category === "law"){
            url = base_url+"knowledge/"
        } else if (category === "lawyer"){

        } else if (category === "lawfirm"){

        } else if (category === "court"){

        }
        url +=category
        sessionStorage.setItem("searchKeyword", $("input.searchKeyword").val());
        // console.log("input val : "+$("input.searchKeyword").val());
        $(location).attr('href', url);
    })

    setInterval(function (){
        $("button.owl-next").click();
    }, 3000)
})