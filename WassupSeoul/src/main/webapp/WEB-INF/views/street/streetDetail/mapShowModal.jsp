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
		var searchCoords = $("#mapShowModal").attr("name");
		//var searchCoords = "37.5511694, 126.9882266";
		
		var searchCoords2 = searchCoords.slice(1,-1);
		
		//alert(searchVal);
		//alert(searchCoords);
		
		var array = searchCoords2.split(",");
		
		var x =   array[0];
		var y =   array[1];
  
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
  	  var container = document.getElementById('map22');
      var options = {
        center: new kakao.maps.LatLng(x, y),
        level: 4
      };
      
      var map = new kakao.maps.Map(container, options); 
			
       var markerPosition  = new kakao.maps.LatLng(x, y); 

	   // 마커를 생성합니다
	   var marker = new kakao.maps.Marker({
	       position: markerPosition
	   });

	   // 마커가 지도 위에 표시되도록 설정합니다
	   marker.setMap(map);
	   
	   var iwContent = '<div style="padding:5px;">'+ searchVal +'<br>'
	   				 + '<a href="https://map.kakao.com/link/map/'+searchVal+','+x+','+y+'" style="color:blue" target="_blank">'
	 				 + ' 큰지도보기</a>' 
	 				 
	    iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);  
		
  }); 
   </script>
    
				 
</body>
</html>