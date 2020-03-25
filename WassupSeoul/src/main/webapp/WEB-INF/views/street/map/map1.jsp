<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3B2jMzpJSy5YG5-T11FaB4SCKPkjQ3Sc&callback=initMap"></script>


<script type="text/javascript">

var map;				// 지도 객체
var mMarker = null;		// 마커 객체
var rMarker = null;		// 로드뷰 마커 객체
var rvContainer;		
var rv;					//로드뷰 객체
var rvClient;
function go(lat, lng){
	var position = new daum.maps.LatLng(lat, lng);
	map.panTo(position);
	toggleRoadview(position);
	
	if (mMarker == null) {
		mMarker = new daum.maps.Marker({
		    map: map,
		    position: position			// 지도에 마커를 생성합니다 
		});
		rMarker = new daum.maps.Marker({
	        position: position,
	        map: rv 					//map 대신 rv(로드뷰 객체)로 설정하면 로드뷰에 올라갑니다.
	    });
	} else {
		mMarker.setPosition(position);		// 마커 위치를 옮깁니다
		rMarker.setPosition(position);		// 마커 위치를 옮깁니다
	}
    // 로드뷰 마커가 중앙에 오도록 로드뷰의 viewpoint 조정합니다.
    var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
    // 마커의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
    var viewpoint = projection.viewpointFromCoords(rMarker.getPosition(), rMarker.getAltitude());
    rv.setViewpoint(viewpoint); //로드뷰에 뷰포인트를 설정합니다.
}
//로드뷰 toggle함수
function toggleRoadview(position){
    //전달받은 좌표(position)에 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄웁니다
    rvClient.getNearestPanoId(position, 50, function(panoId) {
        if (panoId === null) {
            rvContainer.style.display = 'none'; 	//로드뷰를 넣은 컨테이너를 숨깁니다
        } else {
            rvContainer.style.display = 'block';	 //로드뷰를 넣은 컨테이너를 보이게합니다
            rv.setPanoId(panoId, position);			 //panoId를 통한 로드뷰 실행
            rv.relayout(); 		//로드뷰를 감싸고 있는 영역이 변경됨에 따라, 로드뷰를 재배열합니다
        }
    });
}
$(function() {
	var container = document.getElementById('map');		//지도를 담을 영역의 DOM 레퍼런스
	var mapCenter = new daum.maps.LatLng(37.569357, 126.986047);
	var options = { 	//지도를 생성할 때 필요한 기본 옵션
		center: mapCenter,	//지도의 중심좌표.
		level: 3		//지도의 레벨(확대, 축소 정도)
	};
	map = new daum.maps.Map(container, options);		 //지도 생성 및 객체 리턴
	
	rvContainer = document.getElementById('roadview');   //로드뷰를 표시할 div
	rv = new daum.maps.Roadview(rvContainer); 		 	 //로드뷰 객체
	rvClient = new daum.maps.RoadviewClient(); 			 //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
	toggleRoadview(mapCenter);
	
	// 검색창 나왔다 사라지는 기능
	var summon = false;
	$("#summonSearchArea").click(function() {
		if (summon) {
			$("#siteSM").css("top","380px");
			$("#resultArea").css("padding-top", "300px");
		} else {
			$("#siteSM").css("top","430px");
			$("#resultArea").css("padding-top", "355px");
		}
		summon = !summon;
	});
	
	$("#what").keyup(function(e){
		var what = $(this).val();
		//if(e.keyCode == 13){
			var lat = map.getCenter().getLat();
			var lng = map.getCenter().getLng();
			
			$.ajax({
				url : "https://dapi.kakao.com/v2/local/search/keyword.json",
				data : {query : what, x : lng, y : lat, radius : 1000, sort : "accuracy", size : 8},
				beforeSend : function(req){
					req.setRequestHeader("Authorization", "KakaoAK adbfc124b4b8faba06f34df8ae1a2187");
				},
				jsonpCallback : "?",
				success : function(data){
					$("#resultArea2").empty();
					$.each(data.documents, function(i, l){
						var s = $("<span></span>").attr("class","locName").text(l.place_name);
						var td1 = $("<td></td>").append(s, " - " + l.distance + "m");
						var tr1 = $("<tr></tr>").append(td1);
						var td2 = $("<td></td>").text(l.road_address_name);
						var tr2 = $("<tr></tr>").append(td2);
						var td3 = $("<td></td>").attr("align","right").text(l.phone);
						var tr3 = $("<tr></tr>").append(td3);
						var table = $("<table></table>").attr("onclick", "go("+l.y+","+l.x+");").attr("class","loc").append(tr1,tr2,tr3);
						$("#resultArea2").append(table);
					});
				}
			});
		//}
	});
			
	$("#loc").keyup(function(e) {
		//if (e.keyCode == 13) {
			// 지명 => 위도/경도 : geocoding
			var locName = $(this).val();	
			$.ajax({
				url : "https://dapi.kakao.com/v2/local/search/address.json",
				data : {query : locName},
				beforeSend : function(req){
					req.setRequestHeader("Authorization", "KakaoAK bbfb29eee434ba8b0233f8af2b3d8b65");
				},
				jsonpCallback : "?",
				success : function(data){
					// 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
					var position = new daum.maps.LatLng(data.documents[0].y, data.documents[0].x);
				    map.panTo(position);
					// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
					rvClient.getNearestPanoId(position, 50, function(panoId) {
					    rv.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
					});
				}
			});
		//}
	});
	
});
</script>
<link rel="stylesheet" href="resources/css/map.css">
</head>
<body>
<div class="search">

</div>
<div class="mapWrapper">
	<table id="siteTitle">
		<tr>
			<td class="roadviewTd" align="right">
				<div id="map"></div>
			</td>
			<td class="roadviewTd" align="left">
				<div id="roadview"></div>
			</td>
		</tr>
	</table>
	<table id="siteSM">
		<tr>
			<td align="center" id="searchArea">
			<input id="loc" placeholder="어디">&nbsp;&nbsp;<input id="what" placeholder="뭐"></td>
		</tr>
		<tr>
			<td align="center">
				<img src="resources/img/search.png" id="summonSearchArea">
			</td>
		</tr>
	</table>
	<table id="resultArea">
		<tr>
			<td align="center" id="resultArea2">
				
			</td>
		</tr>
	</table>
</div>
</body>
</html>

