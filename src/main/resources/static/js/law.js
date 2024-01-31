jQuery(($)=>{
    let law_article;
    let law_paragraph;
    let law_anchor;
    const constant = 2;
    let law_act = $('span#law_act').val();

    // DB 출력 양식에 따라 law_anchor에서 정수로 검색할지, 소수로 검색할지가 달라짐.
    $('input#law_article').change(function (){
        law_article = $(this).val();
        law_anchor = `#${law_article-constant}-${law_paragraph}`
        $('a#anchorButton').attr('href', law_anchor)
        console.log('law_article : '+law_article+'/ law_paragraph : '+law_paragraph);
    })

    // DB 출력 양식에 따라 law_anchor에서 정수로 검색할지, 소수로 검색할지가 달라짐.
    $('input#law_paragraph').change(function (){
        law_paragraph = $(this).val();
        law_anchor = `#${law_article-constant}-${law_paragraph}`
        $('a#anchorButton').attr('href', law_anchor)
        console.log('law_article : '+law_article+'/ law_paragraph : '+law_paragraph);
    })

    $('#law_paragraph').on('keydown', function(event) {
        if (event.keyCode === 13) { // Enter 키를 눌렀을 때
            event.preventDefault(); // 기본 엔터 동작을 막음

            // var law_anchor = '#law_anchor';
            console.log(law_anchor);

            // 원하는 동작 수행: law_anchor로 이동
            $('html, body').animate({
                scrollTop: $(law_anchor).offset().top - ($(window).height()/2)
            }, 500);
        }
    });
});