<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- summerNote script -->

<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>



<title>summerModal</title>

<style>
@import
	url('https://fonts.googleapis.com/css?family=Poor+Story&display=swap');

.nanum {
	font-family: 'Poor Story', cursive;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	max-width: 100%;
	width: auto;
}
</style>
</head>


<body>


	<div class="modal fade" id="summerModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form action="insert" method="post" id="summernoteForm">
						<textarea id="summernote" name="boardContent"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary nanum"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger nanum uploadBtn">작성</button>
				</div>
			</div>
		</div>
	</div> 
	

	<script>
	
	$(function(){
		/* ===============3/23 미현 수정================ */
		
	    //섬머노트 셋팅 뀨
	      $('#summernote').summernote({
		        height: 300,                 // set editor height 에디터 높이
		        minHeight: null,             // set minimum height of editor 최소 높이
		        maxHeight: null,             // set maximum height of editor 최대 높이
		        focus: true,				// 에디터 로딩후 포커스를 맞출지 여부
		        lang: "ko-KR",				// 한글 설정
		        fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
		        fontNamesIgnoreCheck : [ '맑은고딕' ],
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
			            }
		       	   }
				}
      		});
		});
   
     /**
	* 이미지 파일 업로드
	*/
	
	
	$(document).on("click",".uploadBtn",function(){
		console.log("summernoteForm");
		$("#summernoteForm").submit();
	});
     
		function sendFile(file, el) {
			data = new FormData();
			data.append("file", file);
			data.append("boardWriter", "${loginMember.memberNo}")
			$.ajax({
				data : data,
				type : "POST",
				url : "fileUpload",
				cache : false,
				contentType : false,
				processData : false,
				enctype: 'multipart/form-data',
				success: function(result) {
					
					$(el).summernote('editor.insertImage', result);
					
				  },
				  error : function(e){
					  console.log("ajax 실패");
					  console.log(e);
				  }
			});
		}
	
	/* =============== 미현 끝================ */
  </script>

</body>

</html>