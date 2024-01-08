let map; // 전역 변수로 map 선언
const markers = []; // 전역 변수로 markers 배열 선언

// 먼저 정한 callback 함수 이름으로
window.initMap = function () {
	// 어느 부분에 띄울건지
	map = new google.maps.Map(document.getElementById("map"), {
		// 두번째 인자는 어떻게 보여줄건지에 관해
		center: {lat: 37.5639635, lng: 126.8916867}, // 위도경도
		zoom: 10 // 처음 로딩때 줌값
	});
	
	/*----------------------------------------------------------------*/
	
	const markers = [
		{name:'대법원', lat:37.49255, lng:127.005157089},
		{name:'양형위원회', lat:37.49258, lng:127.00515708},
		{name:'법원행정처', lat:37.49260, lng:127.00515708},
		{name:'서울고등법원', lat:37.4858131, lng:127.0157906},
		{name:'서울중앙지방법원', lat:37.4858131, lng:127.0157906},
		{name:'서울가정법원', lat:37.4966787, lng:127.0280676},
		{name:'서울행정법원', lat:37.4966787, lng:127.0280676},
		{name:'서울회생법원', lat:37.4858131, lng:127.0157906},
		{name:'서울동부지방법원', lat:37.4839621, lng:127.1200991},
		{name:'서울남부지방법원', lat:37.5169758, lng:126.8391531},
		{name:'서울북부지방법원', lat:37.6773852, lng:127.0469787},
		{name:'서울서부지방법원', lat:37.5493339, lng:126.9554382},
		{name:'사법연수원', lat:37.6367806, lng:126.7935293},
		{name:'사법정책연구원', lat:37.6367806, lng:126.7935293},
		{name:'법원공무원교육원', lat:37.6631467, lng:126.7630019},
		{name:'법원도서관', lat:37.6367806, lng:126.7935293},
		{name:'수원고등법원', lat:37.2908175, lng:127.0695551},
		{name:'수원지방법원', lat:37.2908175, lng:127.0695551},
		{name:'수원지방법원 성남지원', lat:37.4426565, lng:127.1520716},
		{name:'수원지방법원 여주지원', lat:37.309222, lng:127.6400836},
		{name:'수원지방법원 평택지원', lat:37.0102671, lng:127.09573737554312},
		{name:'수원지방법원 안산지원', lat:37.31190565, lng:126.82634465},
		{name:'수원지방법원 안양지원', lat:37.3964087, lng:126.9627111},
		{name:'수원회생법원', lat:37.2908175, lng:127.0695551},
		{name:'수원지방법원 오산시법원', lat:37.1590332, lng:127.05848238598414},
		{name:'수원지방법원 용인시법원', lat:37.2639694, lng:127.1919662},
		{name:'수원지방법원 성남지원 광주시법원', lat:37.4289754, lng:127.2476504},
		{name:'수원지방법원 여주지원 양평군법원', lat:37.4921401, lng:127.4871923920904},
		{name:'수원지방법원 여주지원 이천시법원', lat:37.2779606, lng:127.4616047},
		{name:'수원지방법원 평택지원 안성시법원', lat:37.0734978, lng:127.2578127},
		{name:'수원지방법원 안산지원 광명시법원', lat:37.4767709, lng:126.8701577},
		{name:'의정부지방법원', lat:37.754202, lng:127.0347065},
		{name:'의정부지방법원 고양지원', lat:37.640275, lng:126.7898223},
		{name:'의정부지방법원 남양주지원', lat:37.6199292, lng:127.1643775},
		{name:'의정부지방법원 포천시법원', lat:37.8903809, lng:127.1968081},
		{name:'의정부지방법원 남양주지원 가평군법원', lat:37.8879651, lng:127.5497961},
		{name:'의정부지방법원 연천군법원', lat:38.0876582, lng:127.0721133},
		{name:'의정부지방법원 동두천시법원', lat:37.8924645, lng:127.0593373},
		{name:'의정부지방법원 고양지원 파주시법원', lat:37.7315422, lng:126.7570621},
		{name:'인천지방법원 부천지원 김포시법원', lat:37.61871335, lng:126.71628420520346},
		{name:'인천지방법원', lat:37.4430178, lng:126.6675493},
		{name:'인천지방법원 부천지원', lat:37.4916374, lng:126.7459201},
		{name:'인천가정법원', lat:37.4644614, lng:126.6898759},
		{name:'인천지방법원 강화군법원', lat:37.7369844, lng:126.5163299},
		{name:'춘천지방법원', lat:37.8587262, lng:127.7452564},
		{name:'춘천지방법원 강릉지원', lat:37.6302566, lng:129.025632},
		{name:'춘천지방법원 원주지원', lat:37.3331558, lng:127.93460371716844},
		{name:'춘천지방법원 속초지원', lat:38.2137689, lng:128.593391},
		{name:'춘천지방법원 영월지원', lat:37.1850034, lng:128.4732807},
		{name:'춘천지방법원 인제군법원', lat:38.0692545, lng:128.1699754},
		{name:'춘천지방법원 홍천군법원', lat:37.6893018, lng:127.8837566},
		{name:'춘천지방법원 양구군법원', lat:38.1094319, lng:127.98893},
		{name:'춘천지방법원 화천군법원', lat:38.1032906, lng:127.7039187},
		{name:'춘천지방법원 강릉지원 삼척시법원', lat:37.4489849, lng:129.1770191},
		{name:'춘천지방법원 강릉지원 동해시법원', lat:37.5501458, lng:129.1065401},
		{name:'춘천지방법원 원주지원 횡성군법원', lat:37.4899532, lng:127.9888112},
		{name:'춘천지방법원 속초지원 고성군법원', lat:38.3845553, lng:128.4621082},
		{name:'춘천지방법원 속초지원 양양군법원', lat:38.0785357, lng:128.6267498},
		{name:'춘천지방법원 영월지원 정선군법원', lat:37.3790061, lng:128.6661545},
		{name:'춘천지방법원 영월지원 태백시법원', lat:37.1680726, lng:128.990296},
		{name:'춘천지방법원 영월지원 평창군법원', lat:37.3677099, lng:128.3955423},
		{name:'의정부지방법원 철원군법원', lat:38.1399312, lng:127.3265865},
		{name:'특허법원[대전]', lat:36.3533275, lng:127.3859637297402},
		{name:'대전고등법원', lat:36.354342, lng:127.3892469},
		{name:'대전지방법원', lat:36.354342, lng:127.3892469},
		{name:'대전가정법원', lat:36.3530559, lng:127.3856962},
		{name:'대전지방법원 세종특별자치시법원', lat:36.6043999, lng:127.2990378},
		{name:'청주지방법원', lat:36.6118946, lng:127.4672154},
		{name:'청주지방법원 충주지원', lat:36.9823771, lng:127.9345745},
		{name:'청주지방법원 제천지원', lat:37.1437333, lng:128.2115814},
		{name:'청주지방법원 영동지원', lat:36.171005, lng:127.7741422},
		{name:'청주지방법원 보은군법원', lat:36.4853355, lng:127.718379},
		{name:'청주지방법원 괴산군법원', lat:36.8085856, lng:127.7918925},
		{name:'청주지방법원 진천군법원', lat:36.8540053, lng:127.4400066},
		{name:'청주지방법원 충주지원 음성군법원', lat:36.9459232, lng:127.6854197},
		{name:'청주지방법원 제천지원 단양군법원', lat:36.9858963, lng:128.36567294690855},
		{name:'청주지방법원 영동지원 옥천군법원', lat:36.3078219, lng:127.5736635},
		{name:'대전고등법원 원외재판부(청주)', lat:36.6118946, lng:127.4672154},
		{name:'대전지방법원 금산군법원', lat:36.1024388, lng:127.5056278},
		{name:'대전지방법원 홍성지원', lat:36.5997335, lng:126.6511076},
		{name:'대전지방법원 공주지원', lat:36.4797681, lng:127.142066},
		{name:'대전지방법원 논산지원', lat:36.1481513, lng:127.0067868},
		{name:'대전지방법원 서산지원', lat:36.772977, lng:126.4335086},
		{name:'대전지방법원 천안지원', lat:36.7857847, lng:127.1549153242186},
		{name:'대전지방법원 홍성지원 서천군법원', lat:36.0083921, lng:126.70380394677456},
		{name:'대전지방법원 홍성지원 보령시법원', lat:36.3531792, lng:126.5893685},
		{name:'대전지방법원 홍성지원 예산군법원', lat:36.7047973, lng:126.8390631},
		{name:'대전지방법원 공주지원 청양군법원', lat:36.4531165, lng:126.8026717},
		{name:'대전지방법원 논산지원 부여군법원', lat:36.2740908, lng:126.910467},
		{name:'대전지방법원 서산지원 태안군법원', lat:36.75537665, lng:126.29056228988496},
		{name:'대전지방법원 서산지원 당진시법원', lat:36.8871715, lng:126.6333286},
		{name:'대전지방법원 천안지원 아산시법원', lat:36.77799835, lng:127.00937558366012},
		{name:'광주고등법원', lat:35.1501328, lng:126.9353927},
		{name:'광주지방법원', lat:35.1501328, lng:126.9353927},
		{name:'광주가정법원', lat:35.15787855, lng:126.85233313887784},
		{name:'전주지방법원', lat:35.8423499, lng:127.0733451},
		{name:'전주지방법원 군산지원', lat:35.9673084, lng:126.7403504},
		{name:'전주지방법원 정읍지원', lat:35.5874114, lng:126.8600504},
		{name:'전주지방법원 남원지원', lat:35.4116237, lng:127.3903478},
		{name:'전주지방법원 김제시법원', lat:35.8010831, lng:126.8926051},
		{name:'전주지방법원 진안군법원', lat:35.790702, lng:127.4264513},
		{name:'전주지방법원 무주군법원', lat:36.0129777, lng:127.6647803},
		{name:'전주지방법원 임실군법원', lat:35.6131637, lng:127.2847477},
		{name:'전주지방법원 군산지원 익산시법원', lat:35.9352256, lng:126.9568839},
		{name:'전주지방법원 정읍지원 고창군법원', lat:35.43556, lng:126.7081},
		{name:'전주지방법원 정읍지원 부안군법원', lat:35.7288237, lng:126.7401942},
		{name:'전주지방법원 남원지원 장수군법원', lat:35.6596355, lng:127.5323645},
		{name:'전주지방법원 남원지원 순창군법원', lat:35.37408, lng:127.1388},
		{name:'광주고등법원 원외재판부(전주)', lat:35.8423499, lng:127.0733451},
		{name:'광주지방법원 목포지원', lat:34.8123806, lng:126.4449372},
		{name:'광주지방법원 장흥지원', lat:34.6790452, lng:126.9001149},
		{name:'광주지방법원 순천지원', lat:34.97104, lng:127.5251},
		{name:'광주지방법원 해남지원', lat:34.5746101, lng:126.5910415},
		{name:'광주가정법원 목포지원', lat:34.8123806, lng:126.4449372},
		{name:'광주가정법원 장흥지원', lat:34.6790452, lng:126.9001149},
		{name:'광주가정법원 해남지원', lat:34.5746101, lng:126.5910415},
		{name:'광주지방법원 담양군법원', lat:35.319651050000004, lng:126.98622625},
		{name:'광주지방법원 곡성군법원', lat:35.2756882, lng:127.2878445},
		{name:'광주지방법원 화순군법원', lat:35.06584, lng:126.9865},
		{name:'광주지방법원 나주시법원', lat:35.0231748, lng:126.7141209},
		{name:'광주지방법원 영광군법원', lat:35.2773356, lng:126.5132217},
		{name:'광주지방법원 장성군법원', lat:35.30359, lng:126.7857},
		{name:'광주지방법원 목포지원 함평군법원', lat:35.061861, lng:126.5233358},
		{name:'광주지방법원 목포지원 영암군법원', lat:34.8002931, lng:126.6948862},
		{name:'광주지방법원 목포지원 무안군법원', lat:34.9870281, lng:126.4772407},
		{name:'광주지방법원 장흥지원 강진군법원', lat:34.6388762, lng:126.7655522},
		{name:'광주지방법원 순천지원 고흥군법원', lat:34.6080829, lng:127.281395},
		{name:'광주지방법원 순천지원 광양시법원', lat:34.9412342, lng:127.6952427},
		{name:'광주지방법원 순천지원 구례군법원', lat:35.1993759, lng:127.4609372},
		{name:'광주지방법원 순천지원 보성군법원', lat:34.77465705, lng:127.08411922890224},
		{name:'광주지방법원 순천지원 여수시법원', lat:34.75716155, lng:127.67008870985497},
		{name:'광주지방법원 해남지원 완도군법원', lat:34.31139, lng:126.7612},
		{name:'광주지방법원 해남지원 진도군법원', lat:34.4796177, lng:126.2653817},
		{name:'대구지방법원 안동지원', lat:36.5496635, lng:128.7105329},
		{name:'대구지방법원 경주지원', lat:35.8445903, lng:129.2108799},
		{name:'대구지방법원 포항지원', lat:36.0919619, lng:129.38883296005503},
		{name:'대구지방법원 김천지원', lat:36.14426, lng:128.0964},
		{name:'대구지방법원 상주지원', lat:36.4286039, lng:128.1596511},
		{name:'대구지방법원 의성지원', lat:36.3533472, lng:128.6951227},
		{name:'대구지방법원 영덕지원', lat:36.4147641, lng:129.3734158},
		{name:'대구가정법원 안동지원', lat:36.5496635, lng:128.7105329},
		{name:'대구가정법원 경주지원', lat:35.8445903, lng:129.2108799},
		{name:'대구가정법원 포항지원', lat:36.0919619, lng:129.38883296005503},
		{name:'대구가정법원 상주지원', lat:36.4286039, lng:128.1596511},
		{name:'대구가정법원 영덕지원', lat:36.4147641, lng:129.3734158},
		{name:'대구지방법원 청도군법원', lat:35.64786, lng:128.73587},
		{name:'대구지방법원 영천시법원', lat:35.9779872, lng:128.9246953},
		{name:'대구지방법원 칠곡군법원', lat:35.9806172, lng:128.3991159},
		{name:'대구지방법원 경산시법원', lat:35.8167657, lng:128.7618177},
		{name:'대구지방법원 서부지원 성주군법원', lat:35.9257762, lng:128.281104},
		{name:'대구지방법원 서부지원 고령군법원', lat:35.7219041, lng:128.2601458},
		{name:'대구지방법원 안동지원 영주시법원', lat:36.8247408, lng:128.633821},
		{name:'대구지방법원 안동지원 봉화군법원', lat:36.8784787, lng:128.6854756},
		{name:'대구지방법원 김천지원 구미시법원', lat:36.1467402, lng:128.3108664},
		{name:'대구지방법원 상주지원 문경시법원', lat:36.5881168, lng:128.1838143},
		{name:'대구지방법원 상주지원 예천군법원', lat:36.6509408, lng:128.4522},
		{name:'대구지방법원 의성지원 청송군법원', lat:36.436174, lng:129.0524336},
		{name:'대구지방법원 영덕지원 영양군법원', lat:36.6623575, lng:129.1179413},
		{name:'대구지방법원 영덕지원 울진군법원', lat:36.9893179, lng:129.3971794},
		{name:'창원지방법원', lat:35.2043315, lng:128.7064536},
		{name:'창원지방법원 김해시법원', lat:35.3193609, lng:128.7416627},
		{name:'창원지방법원 마산지원 함안군법원', lat:35.27876, lng:128.4116},
		{name:'창원지방법원 마산지원 의령군법원', lat:35.3210168, lng:128.2767086},
		{name:'창원지방법원 진주지원 하동군법원', lat:35.064869, lng:127.7535465},
		{name:'창원지방법원 진주지원 사천시법원', lat:35.0023, lng:128.0609},
		{name:'창원지방법원 진주지원 남해군법원', lat:34.8473512, lng:127.8944616},
		{name:'창원지방법원 진주지원 산청군법원', lat:35.4144038, lng:127.8818351},
		{name:'창원지방법원 통영지원 거제시법원', lat:34.889937849999995, lng:128.61874957211955},
		{name:'창원지방법원 통영지원 고성군법원', lat:34.9653436, lng:128.3306418653185},
		{name:'창원지방법원 밀양지원 창녕군법원', lat:35.534158, lng:128.5023317},
		{name:'창원지방법원 거창지원 합천군법원', lat:35.5663, lng:128.1637},
		{name:'창원지방법원 거창지원 함양군법원', lat:35.51959, lng:127.7258},
		{name:'창원지방법원 창원남부시법원', lat:35.107613, lng:128.7500549},
		{name:'창원지방법원 마산지원', lat:35.19794, lng:128.5663},
		{name:'창원지방법원 진주지원', lat:35.167641, lng:128.0416323},
		{name:'창원지방법원 통영지원', lat:34.86499, lng:128.4459},
		{name:'창원지방법원 밀양지원', lat:35.5137463, lng:128.7693545},
		{name:'창원지방법원 거창지원', lat:35.69147395, lng:127.90800109602526},
		{name:'부산고등법원 원외재판부(창원)', lat:35.2043315, lng:128.7064536},
		{name:'울산지방법원 양산시법원', lat:35.3456338, lng:129.0399241},
		{name:'대구고등법원', lat:35.8665072, lng:128.6267548},
		{name:'대구지방법원', lat:35.8665072, lng:128.6267548},
		{name:'대구지방법원 서부지원', lat:35.8521196, lng:128.5284485},
		{name:'대구가정법원', lat:35.8521196, lng:128.5284485},
		{name:'대구지방법원 의성지원 군위군법원', lat:36.2422, lng:128.56567},
		{name:'울산지방법원', lat:35.5360867, lng:129.2878408},
		{name:'울산가정법원', lat:35.5360867, lng:129.2878408},
		{name:'부산고등법원 원외재판부(울산)', lat:35.5360867, lng:129.2878408},
		{name:'부산고등법원', lat:35.1924518, lng:129.07313558948522},
		{name:'부산가정법원', lat:35.1924518, lng:129.07313558948522},
		{name:'부산회생법원', lat:35.1924518, lng:129.07313558948522},
		{name:'부산지방법원', lat:35.1924518, lng:129.07313558948522},
		{name:'부산지방법원 동부지원', lat:35.18923, lng:129.1298},
		{name:'부산지방법원 서부지원', lat:35.097334700000005, lng:128.90984574477028},
		{name:'제주지방법원 서귀포시법원', lat:33.3069472, lng:126.8061315},
		{name:'제주지방법원', lat:33.49389, lng:126.5358},
		{name:'광주고등법원 원외재판부(제주)', lat:33.49347, lng:126.5356}
	];
	
	const bounds = new google.maps.LatLngBounds();
	const infoWindow = new google.maps.InfoWindow();
	
	// 마커 생성하기 (구글 api 마커클래스)
	markers.forEach(({name, lat, lng}) => {
		const marker = new google.maps.Marker({
			position: {lat, lng},
			map
		});
		bounds.extend(marker.position)
		// 클릭했을때 이름 띄우기
		marker.addListener("click", () => {
			// 클릭시 마커위치로 이동
			map.panTo(marker.position);
			map.setZoom(18.5);
			infoWindow.setContent(name);
			infoWindow.open({
				anchor: marker,
				map
			});
		});
	});
	map.fitBounds(bounds);
};

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