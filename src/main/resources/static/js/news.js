// jQuery(($)=>{
    let path = window.location.pathname.split("/");
    if(path.length === 3){
        $('li.page-1').addClass('active');
    } else if (path.length === 4){
        $('li.page-'+path[3]).addClass('active');
    }
// })