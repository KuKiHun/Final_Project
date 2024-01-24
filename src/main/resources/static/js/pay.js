$(document).ready(function() {

    $(".pay").click(function() {
        // 클릭된 버튼
        var button = $(this);
        // 제품명과 가격을 변수에 저장
        var pdate  = parseInt(button.closest('.pricing-table-1').find('.pdate').text());
        var product  = button.closest('.pricing-table-1').find('.product').text();
        var price = button.closest('.pricing-table-1').find('.price').text();
        // 결제함수로 전달
        iamport(product,price,pdate);
    });

    function iamport(product,price,pdate){
        IMP.init("imp01028178");
        IMP.request_pay({
            pg: "kakaopay",
            pay_method: "card",
            merchant_uid: new Date().getTime(),
            name: product,
            amount: price,
        }, async function(rsp) {
            if(rsp.success) {
                // AJAX
                $.ajax({
                    url: "mypage-pay-confirm",
                    data: {
                        pdate: pdate,
                        price: price,
                        product: product
                    },
                    success: function() {
                        window.location.href = "mypage-pay-complete"
                    },
                    error: function(error) {
                        alert(error + "결제에 실패하였습니다.")
                    }
                });
            }else{
                alert("결제에 실패하였습니다.")
            }
        });
    }
});