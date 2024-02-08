jQuery(($)=>{
    $("upload_button").click(function (){
        var message = "${message}";
        alert(message);
    })

    $(".active").removeClass("active");
    $("li#admin_information").addClass("active");

    // 법 추가 버튼 토글
    let hidden_state = true;
    $('#addLaw').click(function (event){
        event.preventDefault();
        let form = $(this).parent();
        if (hidden_state) {
            $(".hidden_input").removeAttr('hidden');
        } else {
            $(".hidden_input").attr("hidden", "hidden");
        }
        hidden_state = !hidden_state;
    })
    let laws_list = ['part', 'chapter', 'section', 'article', 'paragraph', 'subparagraph', 'content'];
    let laws_data = [];
    let laws_newData = [];

    // 수정 버튼
    $('.editBtn').each(function(i){
        $(this).click(function(e){
            e.preventDefault();
            if ($(this).text() === '수정'){
                let tr = $(this).parent().parent();
                for (let j = 0; j < laws_list.length; j++) {
                    laws_data.push(tr.find(`.laws_${laws_list[j]}`).text());
                    tr.find($(`.laws_${laws_list[j]}`)).empty();

                    var input = document.createElement('input');
                    // console.log(`laws_${laws_list[j]} / ${laws_data[j]}`);
                    input.setAttribute('value', laws_data[j]);
                    tr.find($(`.laws_${laws_list[j]}`)).append(input);
                }
                $(this).text('수정중');

            } else if ($(this).text() === '수정중'){
                let tr = $(this).parent().parent();
                data = {laws_idx:tr.attr('id')}
                for (let j = 0; j < laws_list.length; j++) {
                    laws_newData.push(tr.find($(`.laws_${laws_list[j]} > input`)).val());
                    data[`laws_${laws_list[j]}`] = laws_newData[j];
                }
                console.log(data);
                console.log();
                $.ajax({
                    url:`${window.location.href}/modify`,
                    data: data,
                    success:result =>{
                        for (let j = 0; j < laws_list.length; j++) {
                            tr.find($(`.laws_${laws_list[j]}`)).empty();
                            tr.find($(`.laws_${laws_list[j]}`)).text(laws_newData[j])
                        }
                        laws_data = [];
                        laws_newData = [];

                        $(this).text('수정');
                        alert('수정 되었습니다.');
                    }, error: err => {
                        console.log(err);
                    }
                })
            }
        });
    });

    // 삭제 버튼
    $('.delBtn').each(function(i){
        let tr = $(this).parent().parent();
        $(this).click(function(e){
            e.preventDefault();
            $.ajax({
                url:`${window.location.href}/delete/${tr.attr('id')}`,
                success:result => {
                    window.location.reload();
                }, error:err => {
                    alert(err);
                }
            })
        });
    });
})