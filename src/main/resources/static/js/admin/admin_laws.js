jQuery(($)=>{
    $(".active").removeClass("active");
    $("li#admin_information").addClass("active");

    $('#addLaw').click(function (){
        let form = $(this).parent().find("form");
        // $(this).parent().find("form").toggle();
        if (form.is(":hidden")) {
            form.show();
        } else {
            form.hide();
        }
    })

})