jQuery(($) => {
  let name;
  let id;
  let auth = sessionStorage.getItem("auth_idx");
  let auth_level = ["님", "변호사님"];

  const pathname = window.location.pathname; // '/chat/:roomId'
  const ws = new WebSocket(`ws://localhost:3001${pathname}`);

  console.log("chat.js >> auth : " + auth);

  if (auth == 0) {
    name = sessionStorage.getItem("user_name");
    id = sessionStorage.getItem("user_id");
    $("#title_username").text(`의뢰인 : ${name}`);
    $("input#userId").val(`${id}`);
  } else if (auth == 1) {
    name = sessionStorage.getItem("lawyer_name");
    id = sessionStorage.getItem("lawyer_id");
    $("#title_lawyername").text(`변호사 : ${name}`);
    $("input#userId").val(`${id}`);
  }

  // console.log(`${name}(${id}) ${auth_level[auth]}이 입장하셨습니다.`)

  const chatBox = document.getElementById("chats");
  const addChat = (message, didIsend) => {
    const row = document.createElement("div");
    row.classList.add("chat");
    row.classList.add(didIsend ? "mychat" : "yourchat");

    const text = document.createElement("div");
    text.classList.add("name");
    text.classList.add("text");
    // text.innerHTML = lawyerName;
    text.innerText = message;

    const today = new Date();
    const hours = ("0" + today.getHours()).slice(-2);
    const minutes = ("0" + today.getMinutes()).slice(-2);
    const timeString = `${hours}:${minutes}`;
    const time = document.createElement("div");
    time.classList.add("time");
    time.classList.add(didIsend ? "mychat" : "yourchat");
    time.innerText = timeString;

    row.append(text);
    chatBox.append(row);
    chatBox.append(time);
    chatBox.scrollTop = chatBox.scrollHeight;
  };

  // let name = 'mose';
  ws.onopen = function () {
    console.log("chat connect!");
    if (auth == 1) {
      $.ajax({
        url: `http://localhost:8080/videoIndex/lawyerConnect/${id}`,
        success: (result) => {
          const data = {
            type: "enter",
            welcome: `[enter]${result["lawyer_name"]} 님이 입장했습니다`,
          };
          ws.send(JSON.stringify(data));
        },
      });
    }
  };

  // ws.onmessage = function (event) {
  //   const data = JSON.parse(event.data);
  //   console.log("data");
  //   console.log(data);

  //   if (data.type === "enter") {
  //     const { message, enter } = data;
  //     console.log("message");
  //     console.log(message);
  //     if (message.substr(0, 7) === "[enter]") {
  //       // 의뢰인 페이지의 변호사 이름 지정
  //       $("h3#title_lawyername").text(
  //         `변호사 : ${message.split(" ")[0].substr(7)}`
  //       );
  //       const lawyerName = message.substr(7);
  //       console.log("lawyerName");
  //       console.log(lawyerName);
  //       ws.send(
  //         JSON.stringify({ type: "name", clientName: `[client] ${name}` })
  //       );
  //     }
  //   } else if (data.type === "name") {
  //     const { message, name } = data;
  //     if (message.substr(0, 8) === "[client]") {
  //       // 변호사 페이지 의뢰인 이름 지정
  //       $("h3#title_username").text(`의뢰인 : ${message.substr(8)}`);
  //       return;
  //     }
  //   }

  //   console.log("chat connection message: " + data);
  //   if (auth == 0) {
  //     console.log(`유저 아이디 : ${id}`);
  //   } else if (auth == 1) {
  //     console.log(`변호사 아이디 : ${id}`);
  //   }
  //   addChat(message, false);
  // };

  const type = document.getElementById("type");
  const input = type.childNodes[0];
  type.addEventListener("submit", (e) => {
    e.preventDefault();
    const message = input.value;
    console.log("message");
    console.log(message);
    ws.send(JSON.stringify({ type: "chat", message }));
    input.value = "";
    addChat(message, true);
  });

  const deleteBtn = document.getElementById("deleteBtn");
  deleteBtn.addEventListener("click", () => {
    const roomTitleInput = document.querySelector('input[name="title"]');
    const title = roomTitleInput.value;

    fetch("/videoIndex/leave-room", {
      method: "POST",
      body: JSON.stringify({ title: title, auth: auth }),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        if (response.ok) {
          alert("메인화면으로 이동합니다.");
        }
      })
      .catch((error) => {
        console.error("방 삭제 실패:", error);
      });
  });

  //call Form

  //home.pug에서 해당 id 가져오기
  const myFace = document.getElementById("myFace");
  const muteBtn = document.getElementById("mute");
  const cameraBtn = document.getElementById("camera");
  const camerasSelect = document.getElementById("cameras");

  //변수로 지정 -> 모든 곳에서 사용하기 위해
  //stream -> 유저로부터 비디오와 오디오의 결합
  let myStream;
  //false -> 처음에는 소리와 영상이 출력되는 상태로 시작하기 위해
  let muted = false;
  let cameraOff = false;
  let roomName;
  let myPeerConnection;

  //유저의 디바이스를 가져오는 함수
  async function getCamera() {
    try {
      //유저의 모든 디바이스 출력
      const devices = await navigator.mediaDevices.enumerateDevices();
      //유저의 카메라만 filter를 이용하여 추출
      const cameras = devices.filter((device) => device.kind === "videoinput");
      console.log("cameras");
      console.log(cameras);
      //stream의 현재 카메라(label로 어떤 카메라가 선택됐는지 확인 가능)
      const currentCamera = myStream.getVideoTracks()[0];
      console.log("currentCamera");
      console.log(currentCamera);
      //카메라에서 deviceId(stream에 선택된 id를 사용하라고 지정하기 위해 저장)를 option의 value, label을 text로 지정
      cameras.forEach((camera) => {
        const option = document.createElement("option");
        option.value = camera.deviceId;
        option.innerText = camera.label;
        //stream의 현재 카메라와 print할 때의 카메라의 option을 가져오기
        //만약 카메라 option이 현재 선택된 카메라와 같은 label을 가진다면 이것이 우리가 사용하고 있는 카메라라는 의미
        if (currentCamera.label == camera.label) {
          option.selected = true;
        }
        camerasSelect.appendChild(option);
      });
    } catch (e) {
      console.log(e);
    }
  }

  //유저의 미디어를 가져오는 함수
  async function getMedia(deviceId) {
    //초기constraints -> deviceId가 없을 때 실행(cameras를 만들기 전)
    const initialConstrains = {
      audio: true,
      //모바일일때 자동으로 셀카모드
      video: { facingMode: "user" },
    };
    //deviceId가 있을 때 실행
    const cameraConstraints = {
      audio: true,
      //특정카메라를 지정할 경우 exact 사용(단, deviceid가 없을 경우 카메라를 찾지 못한다)
      video: { deviceId: { exact: deviceId } },
    };

    try {
      //유저미디어 string 출력
      //새로운 stram을 생성 -> 다른 deviceId로
      myStream = await navigator.mediaDevices.getUserMedia(
        deviceId ? cameraConstraints : initialConstrains
      );
      //myStream을 myFace에 넣기
      myFace.srcObject = myStream;
      //deviceId가 없을때만(처음에만) getCamera 함수 실행
      //-> 그렇지 않으면 카메라를 바꿀때마다 기존의 카메라 리스트가 계속 추가 됨
      if (!deviceId) {
        //getCamera 함수 호출
        await getCamera();
      }
    } catch (e) {
      console.error(e);
    }
  }

  //getMedia 함수 호출
  // getMedia();

  //Mute버튼 클릭했을 때
  function handleMuteClick() {
    //track.enabled에 새로운 value를 설정하고 !track.enabled를 통해 현재 value의 반대를 반환(disabled 반환)
    myStream.getAudioTracks().forEach((track) => {
      track.enabled = !track.enabled;
    });
    //음소거 되지 않았다면
    if (!muted) {
      //버튼의 텍스트 변경
      //음소거가 되지 않았기 때문에 클릭을 하면 음소거할 예정
      muteBtn.innerText = "Unmute";
      //음소거가 됐으니 true
      muted = true;
    } else {
      muteBtn.innerText = "Mute";
      muted = false;
    }
  }

  //camera버튼 클릭했을 때
  function handleCameraClick() {
    myStream.getVideoTracks().forEach((track) => {
      track.enabled = !track.enabled;
    });
    //카메라가 꺼져 있다면
    if (cameraOff) {
      //버튼의 텍스트 변경
      //클릭을 하면 카메라가 켜질 예정
      cameraBtn.innerText = "Turn Camera Off";
      //카메라가 켜졌으니 false
      cameraOff = false;
    } else {
      cameraBtn.innerText = "Turn Camera On";
      cameraOff = true;
    }
  }

  async function handleCameraChange() {
    //deviceId 확인 -> id를 이용하여 카메라를 강제로 다시 시작
    // console.log(camerasSelect.value);

    //사용하려는 특정 카메라 id전송 -> video device의 새로운 id로 또 다른 stream을 생성
    await getMedia(camerasSelect.value);

    if (myPeerConnection) {
      //peerA를 위한 myStream
      //내가 선택한 새 장치로 업데이트 된 video track을 받음
      const videoTrack = myStream.getVideoTracks()[0];
      // console.log(myPeerConnection.getSenders());

      //sender -> 다른 브라우저로 보내진 비디오와 오디오 데이터를 컨트롤하는 방법
      const videoSender = myPeerConnection
        .getSenders()
        .find((sender) => sender.track.kind === "video");
      // console.log(videoSender);
      videoSender.replaceTrack(videoTrack);
    }
  }

  muteBtn.addEventListener("click", handleMuteClick);
  cameraBtn.addEventListener("click", handleCameraClick);
  camerasSelect.addEventListener("input", handleCameraChange);

  //Welcome Form (join a room)

  //양쪽 브라우저에서 동일하게 실행되는 코드
  async function initCall() {
    console.log("userConnected 이벤트를 기다리는 중...");

    await getMedia();
    makeConnection();
  }

  initCall();

  //Socket Code

  //Peer A 에서 실행(주최자=누군가 방에 입장했1을 때 알림을 받는 사람)-CreateOffer
  ws.onmessage = async function (event) {
    //Data Channel을 생성하는 주체
    console.log("event");
    console.log(event.data);
    const data = JSON.parse(event.data);
    console.log("data");
    console.log(data);
    if (data.type === "enter") {
      const { enter, welcome } = data;
      console.log("welcome");
      console.log(welcome);
      if (welcome.substr(0, 7) === "[enter]") {
        // 의뢰인 페이지의 변호사 이름 지정
        $("h3#title_lawyername").text(
          `변호사 : ${welcome.split(" ")[0].substr(7)}`
        );
        const lawyerName = welcome.substr(7);
        console.log("lawyerName");
        console.log(lawyerName);
        addChat(lawyerName, false);
        ws.send(
          JSON.stringify({ type: "name", clientName: `[client] ${name}` })
        );
      }
    } else if (data.type === "name") {
      const { clientName, name } = data;
      if (clientName.substr(0, 8) === "[client]") {
        // 변호사 페이지 의뢰인 이름 지정
        $("h3#title_username").text(`의뢰인 : ${clientName.substr(8)}`);
        return;
      }
    } else if (data.type === "chat") {
      const { message, chat } = data;
      console.log("message");
      console.log(message);
      addChat(message, false);
    } else if (message.type === "welcome") {
      console.log("welcome >>>>>>>");
      console.log("somebody joined");
      //offer의 sdp는 다른 브라우저가 참가할 수 있도록 하는 초대장과 유사
      const offer = await myPeerConnection.createOffer();
      //offer로 연결을 구성하기 위한 코드
      myPeerConnection.setLocalDescription(offer);
      console.log("sent the offer");
      console.log(offer);
      //offer를 PeerB로 전송
      // socket.emit("offer", offer, roomName, userB);
      ws.send(JSON.stringify({ type: "offer", offer, roomName }));
    } else if (message.type === "offer") {
      //Peer B 에서 실행(참여자)-CreateAnswer
      console.log("offer >>>>>>> ");
      console.log("received the offer");
      //RemoteDescription은 멀리 떨어진 Peer의 description을 세팅한다는 것을 뜻함
      myPeerConnection.setRemoteDescription(offer);
      const answer = await myPeerConnection.createAnswer();
      myPeerConnection.setLocalDescription(answer);
      //answer를 PeerA로 전송
      // socket.emit("answer", answer, roomName);
      ws.send(JSON.stringify({ type: "answer", answer, roomName }));
      console.log("sent the answer");
      //Peer A 에서 실행
    } else if (message.type === "answer") {
      console.log("received the answer");
      myPeerConnection.setRemoteDescription(message.answer);
      //(peerA<->peerB)
    } else if (message.type === "ice") {
      console.log("received candidate");
      myPeerConnection.addIceCandidate(message.ice);
    }
  };

  // RTC Code

  //실제로 연결을 만드는 함수
  //카메라를 바꿀때마다 이 코드에서 새로운 Stream을 만든다
  function makeConnection() {
    //myPeerConnection 이라는 연결을 모든 곳에 공유할 예정이기 때문에 위에 변수를 잡아서 사용
    //PeerA 와 PeerB에 PeerConnection을 만드는 작업 필요 -> addTrack 시용
    myPeerConnection = new RTCPeerConnection({
      iceServers: [
        {
          urls: "stun:stun.l.google.com:19302",
        },
      ],
    });

    //offer와 answer를 주고 받는게 끝난 후 icecandidate 실행(peerA<->peerB)
    myPeerConnection.addEventListener("icecandidate", handleIce);
    myPeerConnection.addEventListener("addstream", handleAddStream);

    console.log("myStream.getTracks()");
    console.log(myStream.getTracks());

    //카메라의 Stream 데이터를 이용하여 Connection 생성
    //카메라와 오디오 Stream(데이터)을 PeerConnection에 넣는 작업
    myStream
      .getTracks()
      .forEach((track) => myPeerConnection.addTrack(track, myStream));
  }

  //icecadidate를 추적하는 코드
  function handleIce(data) {
    //peerA와 peerB가 candidate들을 서로 주고받는 코드
    console.log("sent candidate");
    // socket.emit("ice", data.candidate, roomName);
    const candidate = data.candidate;
    ws.send(JSON.stringify({ type: "ice", candidate, roomName }));
    console.log("got ice candidate");
    console.log(data);
  }

  //다른 브라우저(peerB)로 부터 stream을 받고 해당 비디오를 화면(peerA)에 출력
  function handleAddStream(data) {
    console.log("got an stream from my peer");
    const peerFace = document.getElementById("peerFace");
    console.log("Peer's Stream", data.stream);
    console.log("My stream", myStream);
    // remote Stream -> peerA가 받은 stream
    peerFace.srcObject = data.stream;
  }
});
