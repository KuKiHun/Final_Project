jQuery(($)=>{
    $(".active").removeClass("active");
    $("li#admin_board").addClass("active");

    let path = window.location.pathname.split("/");
    if(path.length === 4){
        $('li.page-1').addClass('active');
    } else if (path.length === 5){
        $('li.page-'+path[4]).addClass('active');
    }
    // $('button.editBtn').each('click',()=>{
    //     console.log($(this).parent())
    // })

    $('.editBtn').each(function(i){
        $(this).click(function(e){
            e.preventDefault();
            // alert(i+'번 버튼 '+this.style.background);
            alert($(this).parent().parent().find('idx').text())
        });
    });
})


