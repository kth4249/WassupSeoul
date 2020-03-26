<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>온스터디</title>
<style>

</style>
</head>

<body>

	<!-- content 시작 -->
	<div id="container"
		style="margin: 350px auto; text-align: center; font-size: 40px; color: #333333;">
		<form
			action="<%=request.getContextPath()%>/StudyNoteController/createStudyNote"
			method="post" role="form">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-3">

					<b style="font-size: 20px;">학습노트 작성</b>
				</div>
			</div>

			<hr>

			<div class="container" style="font-size: 15px;">

				<div class="row">
					<div class="col-3" style="font-size: 30px;">제목</div>
					<div class="col-6" style="margin: auto;">

						<input type="text" class="col-12" id="input" name="title"
							placeholder="제목 입력 칸" style="text-align: center;">
					</div>
					<div class="col-3">
						<button class="col-5 pointer " id="search-input" type="submit"
							style="font-size: 20px; border: none; background-color: #002d4c; color: white;">작성</button>
					</div>
				</div>

			</div>

			<div class="container" style="margin-top: 2%;">
				<div class="row">
					<div class="col-3" style="text-align: right;"></div>
					<div class="col-9">
						<div class="row" style="font-size: 15px;">

						<button type="button" id="영어1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >영어</button>&nbsp;
                        <button type="button" id="중국어1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >중국어</button>&nbsp;
                        <button type="button" id="일본어1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >일본어</button>&nbsp;
                        <button type="button" id="스페인어1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >불어</button>&nbsp;
                        <button type="button" id="불어1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >한자</button>&nbsp;
                        <button type="button" id="한자1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >JAVA</button>&nbsp;
                        <button type="button" id="JAVA1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >C언어</button>&nbsp;
                        <button type="button" id="C언어1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >PYTHON</button>&nbsp;
						<button type="button" id="PYTHON1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >수학</button>&nbsp;
                        <button type="button" id="자바스크립트1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >한국사</button>&nbsp;
                        <button type="button" id="정보처리기사1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >과학</button>&nbsp;
                        <button type="button" id="수학1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >사회</button>&nbsp;
                        <button type="button" id="한국사1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >공무원</button>&nbsp;
                        <button type="button" id="과학1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 13%; margin: auto; font-size: 15px; float: left;" value="false" >수능</button>&nbsp;
                        <button type="button" id="사회1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 15%; margin: auto; font-size: 15px; float: left;" value="false" >임용고시</button>&nbsp;
                        <button type="button" id="공무원1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 15%; margin: auto; font-size: 15px; float: left;" value="false" >스페인어</button>&nbsp;
                        <button type="button" id="임용고시1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 15%; margin: auto; font-size: 15px; float: left;" value="false" >전산세무</button>&nbsp;
                        <button type="button" id="수능1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 15%; margin: auto; font-size: 15px; float: left;" value="false" >기타 등등</button>&nbsp;
                        <button type="button" id="전산세무1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 15%; margin: auto; font-size: 15px; float: left;" value="false" >정보처리기사</button>&nbsp;
                        <button type="button" id="기타 등등1" class="bt-category-list rounded orange-hover-btn form-control" style="width: 15%; margin: auto; font-size: 15px; float: left;" value="false" >자바스크립트</button>&nbsp;
						</div>

						<div class="row" style="font-size: 20px; display: none">

							<input type="radio" name="category" id="영어"
								class="category-answer form-control orange-hover-btn" value="1"
								style="margin: auto; width: 10%">영어 &nbsp; <input
								type="radio" name="category" id="중국어"
								class="category-answer form-control orange-hover-btn" value="2"
								style="margin: auto; width: 10%">중국어 &nbsp; <input
								type="radio" name="category" id="일본어"
								class="category-answer form-control orange-hover-btn" value="3"
								style="margin: auto; width: 10%">일본어 &nbsp; <input
								type="radio" name="category" id="스페인어"
								class="category-answer form-control orange-hover-btn" value="4"
								style="margin: auto; width: 10%">스페인어 &nbsp; <input
								type="radio" name="category" id="불어"
								class="category-answer form-control orange-hover-btn" value="5"
								style="margin: auto; width: 10%">불어 &nbsp; <input
								type="radio" name="category" id="한자"
								class="category-answer form-control orange-hover-btn" value="6"
								style="margin: auto; width: 10%">한자 &nbsp; <input
								type="radio" name="category" id="JAVA"
								class="category-answer form-control orange-hover-btn" value="7"
								style="margin: auto; width: 10%">JAVA &nbsp; <input
								type="radio" name="category" id="C언어"
								class="category-answer form-control orange-hover-btn" value="8"
								style="margin: auto; width: 10%">C언어 &nbsp; <input
								type="radio" name="category" id="PYTHON"
								class="category-answer form-control orange-hover-btn" value="9"
								style="margin: auto; width: 10%">PYTHON &nbsp; <input
								type="radio" name="category" id="자바스크립트"
								class="category-answer form-control orange-hover-btn" value="10"
								style="margin: auto; width: 10%">자바스크립트 &nbsp; <input
								type="radio" name="category" id="정보처리기사"
								class="category-answer form-control orange-hover-btn" value="11"
								style="margin: auto; width: 10%">정보처리기사 &nbsp; <input
								type="radio" name="category" id="수학"
								class="category-answer form-control orange-hover-btn" value="12"
								style="margin: auto; width: 10%">수학 &nbsp; <input
								type="radio" name="category" id="한국사"
								class="category-answer form-control orange-hover-btn" value="13"
								style="margin: auto; width: 10%">한국사 &nbsp; <input
								type="radio" name="category" id="과학"
								class="category-answer form-control orange-hover-btn" value="14"
								style="margin: auto; width: 10%">과학 &nbsp; <input
								type="radio" name="category" id="사회"
								class="category-answer form-control orange-hover-btn" value="15"
								style="margin: auto; width: 10%">사회 &nbsp; <input
								type="radio" name="category" id="공무원"
								class="category-answer form-control orange-hover-btn" value="16"
								style="margin: auto; width: 10%">공무원 &nbsp; <input
								type="radio" name="category" id="임용고시"
								class="category-answer form-control orange-hover-btn" value="17"
								style="margin: auto; width: 10%">임용고시 &nbsp; <input
								type="radio" name="category" id="수능"
								class="category-answer form-control orange-hover-btn" value="18"
								style="margin: auto; width: 10%">수능 &nbsp; <input
								type="radio" name="category" id="전산세무"
								class="category-answer form-control orange-hover-btn" value="19"
								style="margin: auto; width: 10%">전산세무 &nbsp; <input
								type="radio" name="category" id="기타 등등"
								class="category-answer form-control orange-hover-btn" value="20"
								style="margin: auto; width: 10%">기타 등등 &nbsp;


						</div>

						<hr>

					</div>
				</div>
			</div>
			<br> <br>



			<div class="container" id="word-collect">


				<div class="container">
					<div class="row box-deleted">
						<div class="col-1">
							<div class="rounded box-delete"
								style="width: 100%; margin-top: 40%; font-size: 100%;">-</div>
						</div>
						<div class="col-11">
							<div class="row">

								<div class="col-1"></div>
								<div class="col-5">
									<textarea class="jumbotron" name="setWord" id="" cols="30"
										rows="8"
										style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>

								</div>
								<div class="col-1"></div>
								<div class="col-5">
									<textarea class="jumbotron" name="setMean" id="" cols="30"
										rows="8"
										style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>
								</div>
							</div>

						</div>


					</div>
				</div>



				<div class="container">
					<div class="row ">
						<div class="col-1">
							<div class="rounded box-delete"
								style="width: 100%; margin-top: 40%; font-size: 100%;">-</div>
						</div>
						<div class="col-11">
							<div class="row">

								<div class="col-1"></div>
								<div class="col-5">
									<textarea class="jumbotron" name="setWord" id="" cols="30"
										rows="8"
										style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>
								</div>
								<div class="col-1"></div>
								<div class="col-5">
									<textarea class="jumbotron" name="setMean" id="" cols="30"
										rows="8"
										style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>
								</div>
							</div>

						</div>


					</div>
				</div>

				<div class="container">
					<div class="row box-deleted">
						<div class="col-1">
							<div class="rounded box-delete"
								style="width: 100%; margin-top: 40%; font-size: 100%;">-</div>
						</div>
						<div class="col-11">
							<div class="row">

								<div class="col-1"></div>
								<div class="col-5">
									<textarea class="jumbotron" name="setWord" id="" cols="30"
										rows="8"
										style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>
								</div>
								<div class="col-1"></div>
								<div class="col-5">
									<textarea class="jumbotron" name="setMean" id="" cols="30"
										rows="8"
										style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>
								</div>
							</div>

						</div>


					</div>
				</div>
			</div>
			<div class="container ">
				<div class="row">
					<div style="text-align: center; margin: auto; font-size: 20px;">
						<img src="../images/add-btn.PNG" alt="학습노트 추가 버튼" class="add-btn">
						<span>추가하기</span> <input class="add-many" type="text"
							placeholder="10" value="10" style="border: none; width: 30px;">
					</div>
				</div>
			</div>


		</form>
	</div>
	<!-- content 종료 -->

	<script>
        
	$(document).ready(function(){
		
			
		setTimeout(function() {
		
		$("#영어1").trigger("click");
		
		}, 100);
		
		}); 
	
	
    $(".add-btn").click(function() {
		
		 var optionCount = $(".voteOption").length  // 옵션창 개수 
	        
	        if ( optionCount < 11) {
	        	var html = '<label>'+count+'</label><input type="text" id="voteOption'+count+'" placeholder="항목 입력" style="width:80%; margin-left: 5px"><br>'
	                 
	            $("#optionArea").append(html);
	            
	        }else {
	        	
	        	alert("투표 옵션은 10개까지만 추가 가능합니다.");
	            
	        }
		
		
		
	}	
		
		
        $(function () {

            $(document).on("click", ".add-btn", function () {
                var many = $(".add-many").val();
                var html = '<div class="container">'
                    + '<div class="row ">'
                    + '<div class="col-1" >'
                    + '<div class="rounded box-delete " style="width: 100%;  margin-top: 40%; font-size: 100%;">-</div>'
                    + '</div>'
                    + '<div class="col-11">'
                    + ' <div class="row">'

                    + '<div class="col-1"></div>'
                    + '<div class="col-5">'
                    + '<textarea class="jumbotron" name="setWord" id="" cols="30" rows="8"  style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>'
                    + '</div>'
                    + '<div class="col-1" ></div>'
                    + '<div class="col-5">'
                    + '<textarea class="jumbotron" name="setMean" id="" cols="30" rows="8"  style="font-size: 15px; width: 100%; size: 100%; padding: 0%;"></textarea>'
                    + '</div>'
                    + '</div>'

                    + '</div>'

                    + '</div>'
                    + '</div>';
                
                    if (many != null) {
                    for (var i = 0; i < many; i++) {

                        $("#word-collect").append(html)
                    }

                } else {

                    $("#word-collect").append(html);
                }
            });

            $(function () {
                /* $(".btn-w1").mouseenter(function () {
                    $(this).css("backgroundColor", "white").css("color", "#f15a25")
                });
                $(".btn-w1").mouseleave(function () {
                    $(this).css("backgroundColor", "#f15a25").css("color", "black")
                }); */
            

          
                $(document).on("click", ".box-delete", function () {
                    $(this).parent().parent().parent().remove();
                });


                
            })
        })

				        $(function(){
				
				    $(".bt-category-list").click(function () {
				
				    var flag = $(this).val();
				    var txt = $(this).html();
				    console.log("앤서"+txt)
				    var answer = "'#"+txt+"'";
				    
				    console.log("앤서"+answer)
				
				if (flag == "false") {
				// 선택으로 만들어라
				    $(".bt-category-list").val("false");
				    $(this).val("true");
				
				// 클릭 안된 상태
				            
				// 클릭된 상태
				
				
				    // 전부 이상한 색으로 바꾼다.
				    $(".bt-category-list").css("backgroundColor", "white").css("color", "#f15a25");
				    $(this).css("backgroundColor", "#f15a25").css("color", "white");;
				    $("#"+txt+"").prop('checked',true);
				    $(this).addClass("orange-hover-btn").addClass("form-control");
				} else {
				    // 선택전 색으로 가게 한다.
				    $(this).css("backgroundColor", "white").css("color", "#f15a25");
				    $(this).val("false")
				   
				}
				
				})
				
				
				})
        
    </script>

	<!-- footer 시작 -->
</body>

</html>