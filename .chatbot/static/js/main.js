// variables
let userName = null;
let state = 'SUCCESS';

// functions
function Message(arg) {
    this.text = arg.text;
    this.message_side = arg.message_side;

    this.draw = function (_this) {
        return function () {
            let $message;
            $message = $($('.message_template').clone().html());
            $message.addClass(_this.message_side).find('.text').html(_this.text);
            $('.messages').append($message);

            return setTimeout(function () {
                return $message.addClass('appeared');
            }, 0);
        };
    }(this);
    return this;
}

function getMessageText() {
    let $message_input;
    $message_input = $('.message_input');
    return $message_input.val();
}

function sendMessage(text, message_side) {
    let $messages = $('.messages');
    let message = new Message({
        text: text,
        message_side: message_side
    });
    message.draw();
    $messages.animate({scrollTop: $messages.prop('scrollHeight')}, 300);
}



function greet() {
    setTimeout(function () {
        return sendMessage("저는 법법이예요. 반갑습니다.", 'left');
    }, 1000),
    setTimeout(function () {
        return sendMessage("무엇을 도와드릴까요", 'left');
    }, 2000);
}
$(document).ready(function () {
            greet();  // 문서가 로딩된 후에 greet 함수 호출
        });



function setUserName() {
    // user_question 변수를 제거

    let $message_input = $('.message_input');
    let user_question = $message_input.val();

    if (user_question != null && user_question.trim() !== "") {
       // sendMessage(user_question, 'right');

        $.ajax({
            url: `http://127.0.0.1:5000/qa_request/${userName}/${user_question}`,
            type: "GET",
            dataType: "json",
            success: function (data) {
                sendMessage(data['answer'], 'left');
            },
            error: function (request, status, error) {
                console.log(error);
                sendMessage('죄송합니다. 서버 연결에 실패했습니다.', 'left');
            }
        });
    }
    // 올바른 질문이 아닌 경우에는 아무런 처리를 하지 않음
}

function clearMessageInput() {
    let $message_input = $('.message_input');
    $message_input.val('');
}



function onSendButtonClicked() {
    let messageText = getMessageText();

    if (messageText.trim() !== '') {
        if (userName == null) {
            sendMessage(messageText, 'right');
            setUserName();
            clearMessageInput();
        } else {
            // 메시지를 초기화하고 새로운 메시지만을 추가
            $('.messages').empty();

            // '판례' 키워드를 입력받은 경우에만 검색 수행
            if (messageText.includes('판레') || messageText.includes('결과') || messageText.includes('판결')) {
                // 서버에 검색 요청
                $.ajax({
                    url: `http://127.0.0.1:5000/search_document/${encodeURIComponent(messageText)}/5`,
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        // 결과 출력
                        if (data['result_document'].length > 0) {
                            sendMessage("검색된 문서 내용:", 'left');
                            data['result_document'].forEach(doc => {
                                sendMessage(doc, 'left');
                            });
                        } else {
                            sendMessage("검색된 문서가 없습니다.", 'left');
                        }
                    },
                    error: function (request, status, error) {
                        console.log(error);
                        sendMessage('죄송합니다. 서버 연결에 실패했습니다.', 'left');
                    }
                });
            }else if (messageText.toLowerCase().includes('법법')) {
                // '법법아'를 부르는 경우의 동작 추가
                sendMessage('왜 부르세요?', 'left');
            }
        }
    }
}



