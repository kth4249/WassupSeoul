<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/timeline.css">

<!-- summerNote 링크연결 -->
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- 끝 -->

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>



<title>summerModal</title>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

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



	
	<div class="writeOptionArea shake">
		<form class="form-signin">
			<a href="#" data-toggle="modal" data-target="#summerModal"> <img
				class="writeOption" src="/img/paperclip.png" alt="">
				<p class="arrow_box">파일첨부</p>
			</a>
		</form>
	</div>

	<div class="modal fade" id="summerModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form action="">
						<div class="nanum">
							<textarea name="content" id="summernote" value=""></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary nanum"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger nanum">작성</button>
				</div>
			</div>
		</div>
	</div>




	<script>
    $(document).ready(function () {
      $('#summernote').summernote({
        height: 300,                 // set editor height 에디터 높이
        minHeight: null,             // set minimum height of editor 최소 높이
        maxHeight: null,             // set maximum height of editor 최대 높이
        focus: true,				// 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",				// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다'	,
		callbacks: {				//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			}
		}
    });
    /**
  	* 이미지 파일 업로드
  	*/
  	function uploadSummernoteImageFile(file, editor) {
  		data = new FormData();
  		data.append("file", file);
  		$.ajax({
  			data : data,
  			type : "POST",
  			url : "/uploadSummernoteImageFile",
  			contentType : false,
  			processData : false,
  			success : function(data) {
              	//항상 업로드된 파일의 url이 있어야 한다.
  				$(editor).summernote('insertImage', data.url);
  			}
  		});
  	}

    $('.summernote').summernote({
      height: 150,   //set editable area's height
      codemirror: { // codemirror options
        theme: 'monokai'
      }
    });
	 // 서머노트에 text 쓰기
    $('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);


    // 서머노트 쓰기 비활성화
    $('#summernote').summernote('disable');

    // 서머노트 쓰기 활성화
    $('#summernote').summernote('enable');


    // 서머노트 리셋
    $('#summernote').summernote('reset');


    // 마지막으로 한 행동 취소 ( 뒤로가기 )
    $('#summernote').summernote('undo');
    // 앞으로가기
    $('#summernote').summernote('redo');
  </script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

</body>

</html>