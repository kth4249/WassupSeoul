<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">



<title>타임라인 글작성 영역</title>
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
					<div class="modal fade" id="mapModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="mapModalLabel"
										style="font-weight: bold; color:#5a5a5a;">지도 게시글 작성</h2>
									<button type="button" class="close" data-dismiss="modal" id="mapCloseBtn"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->

									<textarea class=" nanum" id="mapPostArea" rows="6" placeholder="게시글내용을 입력하세요."
											style="color: black; font-size: 17px; height: 150px; width:100%"></textarea>
 									
 										<div id="floating-panel" style="width:50%">
									      <input id="address" type="textbox" value="광화문" style="width:85%">
									      <input id="mapSubmit" type="button" class="btn btn-secondary" value="검색">
									    </div>
									    <div class="map_wrap">
											<div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
										</div>
										
										<button type="submit" id="mapSubmitBtn" name="default" class="btn btn-primary form-control"
										style="margin-top:20px">작성</button>
									
									<div class="modal_layer"></div>
								 	
									<!-- content end -->
								</div>
							</div>
						</div>
					</div>
					
					 <script>
				      function initMap() {
				    	  
			    	  var map;
			          var markers = [];	  
			    	  
				    	// 지도 게시글 업로드용 지도  
				    	var geocoder = new google.maps.Geocoder;
				        var map = new google.maps.Map(document.getElementById('map'), {
				          zoom: 15,
				          center: {lat: 37.5724723, lng: 126.9737442}
				        });
					          
				     	// 지도 게시글 업로드용 지도 생성       
				        document.getElementById('mapSubmit').addEventListener('click', function() {
				        	geocodeAddress(geocoder, map);
				        });
				     	
				      }
				
				      function geocodeAddress(geocoder, resultsMap) {
				        var address = document.getElementById('address').value;
				        geocoder.geocode({'address': address}, function(results, status) {
				          if (status === 'OK') {
				        	 var coords = results[0].geometry.location;
				            	resultsMap.setCenter(coords);
				            	
				            $("#mapSubmitBtn").attr("name", coords);	
				            
				           	 var marker = new google.maps.Marker({
				           		   map: resultsMap,
				             	   position: coords
				            });
				           	 markers.push(marker);
				           	 
			           		
			           	 /*  // Sets the map on all markers in the array.
				             function setMapOnAll(map) {
				               for (var i = 0; i < markers.length; i++) {
				                 markers[i].setMap(map);
				               }
				             }

				             // Removes the markers from the map, but keeps them in the array.
				             function clearMarkers() {
				               setMapOnAll(null);
				             }

				             // Shows any markers currently in the array.
				             function showMarkers() {
				               setMapOnAll(map);
				             }

				             // Deletes all markers in the array by removing references to them.
				             function deleteMarkers() {
				               clearMarkers();
				               markers = [];
				             }  */
				           	 
				           		
				          } else {
				            alert('Geocode was not successful for the following reason: ' + status);
				          }
				        });
				      }
				    </script>
				    
				 	<script>
				 	// 지도 게시글 업로드
				 	  document.getElementById('mapSubmitBtn').addEventListener('click', function() {
			 			    var address = $("#address").val(); 
			 			    var coords = $("#mapSubmitBtn").attr("name");
							var mapPostContent = $("#mapPostArea").val();
												
							//alert(address);
							//alert(coords);
							
							console.log("사용자가 입력한 장소:"+address);
							console.log("게시글 입력내용:"+mapPostContent);
															
							$.ajax({
								url : "mapPost",
								data : {"address" : address, "mapPostContent" : mapPostContent, "coords" : coords },
								type : "post",
								success : function(result) {
									
									if (result == "true") {
										//alert("지도 업로드 성공");
										$("#mapCloseBtn").trigger("click");
										
									} else {
										
										alert("지도 업로드 실패");
									}
								},
								error : function(e) {
									console.log("ajax 통신 실패");
									console.log(e);
								}
							});
							 refreshList()
			        });
				 	
					/* $(".mapSubmitBtn").click(function() {
					}); */
				 	</script>
			
</body>
</html>