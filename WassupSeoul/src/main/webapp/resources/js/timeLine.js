$(document).ready(function() {
	// 새로고침

	//  게시글, 댓글 수정/삭제 메뉴창 보이기, 숨기기
	$(".optionChevron>img").click(function() {
		$(this).next("div").toggleClass("hide");
	});

	$(".likeNum").click(function() {
		$(this).next("div").toggleClass("hide");
	});

	// 댓글 영역 숨기기
	$(".commentArea").click(function() {
		$(this).parent().next("div").toggle(100);
		$('.writeCommentArea').focus();
	});

	// 대댓글 영역 숨기기
	$(".doubleCommentArea").click(function() {
		$(this).parent().parent().parent().next("div").toggle(100);
		// $(".inputCommentWrap").toggle(500);
		$('.writeCommentArea2').focus();
	});

	// 게시글 작성 영역 높이 자동증가
	$('.writePost').on('keyup', 'textarea', function(e) {
		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
	});
	$('.writePost').find('textarea').keyup();

	// 댓글 작성 영역 높이 자동증가
	$('.inputCommentWrap').on('keyup', 'textarea', function(e) {
		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
	});
	$('.inputCommentWrap').find('textarea').keyup();

	// 댓글 출력 영역 높이 자동증가
	$('.commentContentWrap').on('keyup', 'textarea', function(e) {
		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
	});
	$('.commentContentWrap').find('textarea').keyup();

	// 게시글 출력 영역 높이 자동증가
	$('.postMainWrap').on('keyup', 'textarea', function(e) {
		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
	});
	$('.postMainWrap').find('textarea').keyup();

	// 게시물 없을때 게시글 작성 클릭시 커서 이동
	$(".noPostSignArea").click(function() {
		$('.postArea').focus();
	});

	
     
});

   


