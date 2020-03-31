<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

<title>타임라인 지도 게시글 지도 보기</title>
</head>
<style>
	 #map {
        height: 100%;
     }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 180px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      
      
 </style>
<body>
				 	<!-- 지도 모달 -->
					<div class="modal fade" id="mapShowModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="mapShowModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="mapShowModalLabel"
										style="">지도 상세보기</h2>
									<button type="button" class="close" data-dismiss="modal" id="mapShowModalCloseBtn"
										aria-label="Close" name="">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
					                  <!-- 카카오 지도 -->
					                  <!-- 	<div id="kakaoMap" style="width:500px;height:300px;"></div> -->
					                  
									<!-- 카카오 지도 -->
					                    <div class="form-group row">
					                    	<!-- 검색창끝  -->
							                <div class="col-sm-12">
							                	<div id="map22" style="width:100%;height:400px;"></div>
							                </div>
					                    </div>
					                    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77161504cfbcd21ef34a3ed0de04dad4&libraries=services"></script> -->
				                    <!-- 카카오 지도 -->
								
								
								<div class="modal_layer"></div>
								<!-- 	content end -->
								</div>
							</div>
						</div>
					</div>
					

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840"></script> 
  <script>

  // 카카오 지도 초기 화면(modal에 띄우기 위해서 기본 설정)
  $("#mapShowModal").on('shown.bs.modal', function (e) { 
		// 검색할 장소 키워드
		var searchVal = $("#mapShowModalCloseBtn").attr("name");

		alert(searchVal);
/* 	  
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
  	  var container = document.getElementById('map22');
      var options = {
        center: new kakao.maps.LatLng(37.57593689999999, 126.9768157),
        level: 4
      };
		
      
      var map = new kakao.maps.Map(container, options); */
			
     /*  var markerPosition  = new kakao.maps.LatLng(37.57593689999999, 126.9768157); 

	   // 마커를 생성합니다
	   var marker = new kakao.maps.Marker({
	       position: markerPosition
	   });

	   // 마커가 지도 위에 표시되도록 설정합니다
	   marker.setMap(map);
	   
	   var iwContent = '<div style="padding:5px;">+ Hello World! <br>'
	   				 + '<a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">'
	 				 + ' 큰지도보기</a>' 
	 				 
	    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);  */
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var mapContainer = document.getElementById('map22'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 검색할 장소 키워드
		//var searchVal = $("#updateSearchLocation").val();
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(searchVal, placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });
		    
		    var $insertLocation = $("#updateCalendarLocation");
		
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		        console.log(place.place_name);
		        $insertLocation.val(place.place_name);
		    });
		}
		
  }); 
   </script>
    
				 
</body>
</html>