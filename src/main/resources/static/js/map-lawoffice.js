// ------------ 버튼 클릭 시 내 위치에 마커찍고 이동 ----------------

// 마커 변수 선언
let marker = null;

// #mylocation 버튼 클릭 시 내 위치로 이동하는 함수
function goToMyLocation() {
    if (navigator.geolocation) {
        // 위치 정보를 가져옴
        navigator.geolocation.getCurrentPosition(
            function (position) {
                const latitude = position.coords.latitude; // 위도
                const longitude = position.coords.longitude; // 경도

                // 이전에 생성된 마커가 있는지 확인
                if (marker) {
                    // 이미 마커가 생성된 경우 마커가 있는 위치로만 지도 이동
                    map.panTo(marker.position);
                    map.setZoom(15);
                    return;
                }

                // 마커 생성
                marker = new google.maps.Marker({
                    position: { lat: latitude, lng: longitude },
                    map: map,
                    animation: google.maps.Animation.BOUNCE, // 애니메이션 추가 (튕기는 효과)
                });

                // 마커가 표시될 위치로 지도 이동
                map.panTo(marker.position);
                map.setZoom(15);
            },
            function (error) {
                // 위치 정보를 가져오는 데 실패한 경우 에러 처리
                console.error(error);
                alert('위치 정보를 가져오는 데 실패했습니다.');
            }
        );
    } else {
        // 브라우저가 위치 정보를 지원하지 않는 경우 에러 처리
        alert('위치 정보를 지원하지 않는 브라우저입니다.');
    }
}

// #mylocation 버튼 클릭 이벤트 리스너 등록
const myLocationButton = document.getElementById('mylocation');
myLocationButton.addEventListener('click', goToMyLocation);


//  ----------------버튼 클릭 시 내 위치에 마커찍고 이동 END----------------------

let map; // 전역 변수로 map 선언
const markers = []; // 전역 변수로 markers 배열 선언

// 먼저 정한 callback 함수 이름으로
window.initMap = function () {
	// 어느 부분에 띄울건지
	map = new google.maps.Map(document.getElementById("map"), {});
	
	/*----------------------------------------------------------------*/

	// DB에서 가져온 마커 정보를 markers 배열에 추가
	fetch('/follaw/lawoffices') // '/follaw/lawoffices' http 요청
		.then(response => response.json()) // json형식 변환
		.then(data => { // 변환 데이터 처리
			data.forEach(markerInfo => { // 데이터에 대해서 반복문
				markers.push({ // markers 배열에 추가
					name: markerInfo.lawfirms_name,
					lat: markerInfo.lat,
					lng: markerInfo.lng
				});

				const marker = new google.maps.Marker({ // 구글 맵 API 사용해서 마커생성
					position: { lat: markerInfo.lat, lng: markerInfo.lng }, // 마커위치
					map: map, // 마커 표시할 지도 객체
					title: markerInfo.lawfirms_name // 마커에 표시될 내용
				});

				marker.addListener("click", () => { //클릭 리스너 추가
					map.panTo(marker.position); // 클릭한 마커위치로 이동
					map.setZoom(18.5); // 클릭 했을때 지도 줌 설정
					const infoWindow = new google.maps.InfoWindow({ // 클릭시 정보창 생성
						content: markerInfo.lawfirms_name // 정보창 내용 설정
					});
					infoWindow.open(map, marker); // 정보창과 마커를 지도에 표시
				});
			});

			const bounds = new google.maps.LatLngBounds(); // 경계 객체 생성
			markers.forEach(markerInfo => { // markers 배열 각 항목 반복문
				bounds.extend(new google.maps.LatLng(markerInfo.lat, markerInfo.lng)); // 경계 객체에 좌표 추가
			});
			map.fitBounds(bounds); // 지도 영역을 경계 객체에 맞게 조정
		})
		.catch(error => {
			console.error('법원 마커 정보를 가져오는 중 오류가 발생했습니다:', error);
		});
};

// ---------------------------------------------------------------------------

window.addEventListener('DOMContentLoaded', function() {
    const elements = document.querySelectorAll('.site-text-primary');

    elements.forEach(element => {
        element.addEventListener('click', (e) => {
			e.preventDefault(); // 기존 동작 막기
            // 이동될 경로값 (임시값)
            const latitude = 37.49258355;
            const longitude = 127.00515708995646;

            // 클릭시 지도 이동
            map.panTo({ lat: latitude, lng: longitude });
            // 줌 레벨
            map.setZoom(18.5);
        });
    });
});