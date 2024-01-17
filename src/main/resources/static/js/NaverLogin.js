const initializeNaverLogin = () => {
    const NAVER_CLIENT_ID = "bBV_Um5Yz2EDCd7w6sW0";
    const NAVER_CALLBACK_URL = "http://118.217.203.46:8080/follaw/index"; // 작성했던 Callback URL 입력
  
    const naverLogin = new naver.LoginWithNaverId({
      clientId: NAVER_CLIENT_ID,
      callbackUrl: NAVER_CALLBACK_URL,
      // 팝업창으로 로그인을 진행할 것인지?
      isPopup: false,
      // 버튼 타입 ( 색상, 타입, 크기 변경 가능 )
      loginButton: { color: 'green', type: 3, height: 58 },
      callbackHandle: true,
    });
    naverLogin.init();
  
    naverLogin.getLoginStatus(async function (status) {
      if (status) {
        const userid = naverLogin.user.getEmail();
        const username = naverLogin.user.getName();
      }
    });
  };
  
  const userAccessToken = () => {
    if (window.location.href.includes('access_token')) {
      getToken();
    }
  };
  
  const getToken = () => {
    const token = window.location.href.split('=')[1].split('&')[0];
    // console.log, alert 창을 통해 어스코드가 잘 추출 되는지 확인하자! 
  
    // 이후 로컬 스토리지 또는 state에 저장하여 사용하자!   
    // localStorage.setItem('access_token', token)
    // setGetToken(token)
  };
  
  initializeNaverLogin();
  userAccessToken();