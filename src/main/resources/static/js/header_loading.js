document.getElementById('successBtn').addEventListener('click', function(event) {
    event.preventDefault(); // 기본 제출 동작 막기
  
    if (validateForm()) {
      document.getElementById('normal').submit(); // 유효성 검사 통과 시 폼 제출
    }
  });
  
  function validateForm() {
    // 유효성 검사 로직을 구현합니다.
    // 필요에 따라 사용자가 입력한 값들을 체크하고 유효성 여부를 반환합니다.
    // 유효성 검사가 완료되면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
  
    var user_name = document.getElementById('user_name').value;
    var user_id = document.getElementById('user_id').value;
    var user_pw = document.getElementById('user_pw').value;
    var user_pwck = document.getElementById('user_pwck').value;

    // 이름 유효성 검사
    if (user_name.trim() === '') {
    alert('이름을 입력해주세요.');
    return false;
  }
  
    return true; // 유효성 검사 통과 시 true 반환
  }