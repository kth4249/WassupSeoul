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
 	  #canvas {
        border: 1px solid black;
      }

      .jb_table {
        display: table;
      }

      .drawing {
        border-radius: 10px;
        display: table-row;
      }

      #draw {
        display: table-cell;
        vertical-align: top;
      }

      .drawColor{
          width:32px;
          height: 32px;
          margin-left: 10px;
      }

      .drawColor:hover{
         cursor: pointer;
      }
      #title{
        width: 200px;
      } 

 </style>
<body>
					<!-- 스케치 모달 -->
					<div class="modal fade" id="sketchModal" data-backdrop="static"
						tabindex="-5" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 500px">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="sketchModalLabel"
										style="font-weight: bold;">스케치 게시글 작성</h2>
									<button type="button" id="sketchCloseBtn" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								
									<!-- content start -->
										<textarea class=" nanum" id="sketchPostArea" rows="6" placeholder="게시글내용을 입력하세요." 
													style="border: 1px solid black; color: black; font-size: 17px; height: 100px; width:100%;"></textarea>
										<div class="jb_table">
											<div class="row drawing">
												<span class="cell">
													<div>
							                              <canvas id="canvas" width="420" height="485" 
							                              	style="background-color:white; cursor:crosshair;"></canvas>
							                        </div>
							                     </span>
							                     
										 <span class="cell" id="draw">
											<div>
												<div class="jb_table">
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/red.png"
															class="drawColor" onclick="selectColor('red')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/orange.png"
															class="drawColor" onclick="selectColor('orange')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/yellow.png"
															class="drawColor" onclick="selectColor('yellow')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/green.png"
															class="drawColor" onclick="selectColor('green')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/blue.png"
															class="drawColor" onclick="selectColor('blue')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/lightblue.png"
															class="drawColor" onclick="selectColor('lightblue')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/brown.png"
															class="drawColor" onclick="selectColor('brown')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/lightgreen.png"
															class="drawColor" onclick="selectColor('lightgreen')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/pink.png"
															class="drawColor" onclick="selectColor('pink')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/purple.png"
															class="drawColor" onclick="selectColor('purple')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/gray.png"
															class="drawColor" onclick="selectColor('gray')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/lightgray.png"
															class="drawColor" onclick="selectColor('lightgray')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/white.png"
															class="drawColor" onclick="selectColor('white')" />
														</span>
													</div>
													<div class="row drawing">
														<span class="cell" id="draw"> <img src="${contextPath}/resources/img/pencil.png"
															class="drawColor" onclick="selectTool('pencil')"
															style="margin-bottom: 5px;" />
														</span>
													</div>
												</div>
											</div>
											<div>
												<div>
													<textarea id="history" cols="40" rows="37"style="display: none;"></textarea>
												</div>
											</div>
										</span>
									</div>
								</div>
							<div> Title<input id="title" size="15" style="display: inline-block;" /> 
								<a id="saveImage" download="image.png" style="display: inline-block;">
								<INPUT type="button" id="imgTitle" value="Save" onClick="saveImage()" />
								</a> 
								<INPUT type="button" value="Clear" onClick="initPage()" />
								<button type="button" id="sketchSubmitBtn" style="width: 80px; height: 25px; font-size: 17px; float: right; margin-top: 10px">작성</button>
							</div>	 
							<!-- content end -->
							
						</div>
					</div>
				</div>
			</div>
			<!-- end -->
			
			<script>
		 	  // 스케치 게시글 업로드
		 	  document.getElementById('sketchSubmitBtn').addEventListener('click', function() {
		 		  var canvas = document.getElementById('canvas'); 
		 		  var canvasImgStr = canvas.toDataURL("image/png", 1.0);
	    	 	  var sketchPostContent = $("#sketchPostArea").val();
		 		 
		 		 console.log("스케치 그린 그림  :" + canvasImgStr);
		 		 console.log("사용자가 입력한 게시글  :" + sketchPostContent); 
		 	 	 
		 	  // Sending the image data to Server
			 	  $.ajax({
					        type : 'post',
					        url : 'sketchPost',
					        data : { "canvasImgStr" : canvasImgStr, "sketchPostContent" : sketchPostContent },
					        success : function (result) {
					        	if (result == "true") {
									alert("스케치 업로드 성공");
									$("#sketchCloseBtn").trigger("click");
								} else {
									alert("스케치 업로드 실패");
								}
					        },	
					        	error : function(e) {
								console.log("ajax 통신 실패");
								console.log(e);
					        }
					    });
					 refreshList()
		 	 });
		 	</script>
			
			
 	<script language="JavaScript">
      // Date: 2019.04.24

      var textareaList = ["history"];

      function clearText(idOfTextArea) {
        document.getElementById(idOfTextArea).value = "";
      }

      function SaveAsTxt() {
        var fileName = document.getElementById("title").value;
        if (fileName.length == 0) {
          fileName = "image";
        }
        fileName += ".txt";

        var preData = 'version: V0.617a1\n';
        var postData =  preData + document.getElementById("history").value;

        var link = document.createElement("a");
        link.setAttribute("download", fileName);
        link.setAttribute(
          "href",
          "data:" +
            "application/[txt]" +
            ";charset=utf-8," +
            encodeURIComponent(postData)
        );
        link.click();
      }

      function SaveAsJson() {
        console.log("SaveAsJson");
        var fileName = document.getElementById("title").value;
        if (fileName.length == 0) {
          fileName = "imsge";
        }

        fileName += ".json";

        var preData = {'version':'V0.617a1'};
        textareaList.forEach(function(e) {
          preData[e] = document.getElementById(e).value;
        });

        var jsonData = JSON.stringify(preData);

        var link = document.createElement("a");
        var file = new Blob([jsonData], { type: "text/plain" });
        link.href = URL.createObjectURL(file);
        link.download = fileName;
        link.click();
      }

      function isJsonFile(filename) {
        var ridx = filename.lastIndexOf(".");
        var extension = filename.substring(ridx + 1);

        console.log(extension);

        if (extension.length != 4 || extension.toLowerCase() != "json") {
          return false;
        }
        return true;
      }

      function isTextFile(filename) {
        var ridx = filename.lastIndexOf(".");
        var extension = filename.substring(ridx + 1);

        console.log(extension);

        if (extension.length != 3 || extension.toLowerCase() != "txt") {
          return false;
        }
        return true;
      }
     
      function LoadJson(file, fileName) {
        document.getElementById("title").value = fileName;

        var reader = new FileReader();
        reader.onload = function(e) {
          var contents = e.target.result;
          displayLoadJsonData(contents);
        };
        reader.readAsText(file);
      }

      function displayLoadJsonData(contents) {
        var noteData = JSON.parse(contents);

        var version = noteData['version'];
        console.log(version);
        document.getElementById('history').value = noteData['history'];
        reDrawCanvas();
      }

      function LoadText(file, fileName) {
        document.getElementById("title").value = fileName;

        var reader = new FileReader();
        reader.onload = function(e) {
          var contents = e.target.result;
          displayLoadTextData(contents);
        };
        reader.readAsText(file);
      }

      function displayLoadTextData(contents) {
        var noteData = contents.split('\n');
        var history = "";
         
        noteData.forEach(function (e){
          if (e[0] != 'v') {
            history += e + "\n";
          }
        }); 
        document.getElementById('history').value = history;
        reDrawCanvas();
      }
    </script> 
			
			
			
</body>
</html>