jQuery(($)=>{
    $(".active").removeClass("active");
    $("li#admin_board").addClass("active");

    let path = window.location.pathname.split("/");
    if(path.length === 4){
        $('li.page-1').addClass('active');
    } else if (path.length === 5){
        $('li.page-'+path[4]).addClass('active');
    }

    // 수정 버튼
    $('.editBtn').each(function(i){
        $(this).click(function(e){
            e.preventDefault();
            let ul = $(this).parent().parent();
            let title = ul.find('span').text()
            let link = ul.find('a').text()
            let idx = ul.find('.idx').text();
            let url = `modifyNews/${idx}`;
            // console.log(`title : ${title} / link : ${link}`);
            console.log(ul.find(`#hidden${idx}`));
            if ($(this).text() === '수정'){
                ul.find('.target').empty();
                var input = document.createElement('input');
                input.setAttribute('class', 'news_title');
                input.setAttribute('value', title);
                ul.find('.target').append(input);

                ul.find('.target').append(document.createElement('br'));

                var input = document.createElement('input');
                input.setAttribute('class', 'news_url');
                input.setAttribute('value', link);
                ul.find('.target').append(input);

                $(this).text('수정중');

            } else if ($(this).text() === '수정중'){
                let news_title = ul.find('.news_title').val();
                let news_url = ul.find('.news_url').val();
                console.log(`news_title : ${news_title} / news_url : ${news_url}`);
                $.ajax({
                    url:url,
                    data: {news_title: news_title, news_url:news_url},
                    success:result =>{
                        $(this).text('수정');
                        ul.find('.target').empty();
                        var span = document.createElement('span');
                        span.textContent = news_title;
                        ul.find('.target').append(span);

                        ul.find('.target').append(document.createElement('br'));

                        var a = document.createElement('a');
                        a.setAttribute('href', news_url);
                        a.textContent = news_url;
                        ul.find('.target').append(a);
                    }
                })



                // <span>[판결] '장애인 착취 사찰노예 의혹' 사건…대법, '무죄 취지' 파기환송</span>
                // <br>
                // <a href="https://www.lawtimes.co.kr/news/195267">https://www.lawtimes.co.kr/news/195267</a>
            }
        });
    });

    // 삭제 버튼
    $('.delBtn').each(function(i){
        $(this).click(function(e){
            e.preventDefault();
            console.log();
            let url = `deleteNews/${$(this).parent().parent().find('.idx').text()}`;
            $.ajax({
                url:url,
                success:result => {
                    window.location.reload();
                }, error:err => {
                    alert(err);
                }
            })
        });
    });
})

