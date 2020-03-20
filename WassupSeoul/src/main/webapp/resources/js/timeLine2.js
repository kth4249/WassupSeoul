	// 댓글 클릭시 댓글 보기 
	$(".commentArea").click(function() {
					
		var postNo = $(this).attr("name");
					
		$.ajax({
					url : "selectReply",
					data : {postNo : postNo},
					type : "post",
					success : function(reply) {
						
						var htmls = "";
											
					if (reply.isEmpty()) {
							
							htmls += '<!-- 댓글작성 --> ';
							htmls += '	<div class="inputCommentWrap" style="border: 1px solid black;"> ';
							htmls += '	<div class="writePost" style="width: 80%; display: inline-block; margin-left: 3px;"> ';
							htmls += '	<textarea class="writeCommentArea nanum autosize" id="writeCommentAreaStyle" rows="1"  style="font-size: 15px;" placeholder="댓글을 작성해 보세요"></textarea> ';
							htmls += '	</div> ';
							htmls += '		<div style="width: 20%; display: inline-block; position: absolute;"> ';
							htmls += '		<button type="submit" class="btn nanum" id="commentBtn" name="${board.boardNo}" style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px;">작성</button> ';
							htmls += '	</div> ';
							htmls += '</div> '; 
							htmls += '<!-- 댓글작성 --> ';
					}else{
						for(var i = 0; i<reply.size(); i++) {
							
							htmls += '<!-- 댓글작성 --> ';
							htmls += '	<div class="inputCommentWrap" style="border: 1px solid black;"> ';
							htmls += '	<div class="writePost" style="width: 80%; display: inline-block; margin-left: 3px;"> ';
							htmls += '	<textarea class="writeCommentArea nanum autosize" id="writeCommentAreaStyle" rows="1"  style="font-size: 15px;" placeholder="댓글을 작성해 보세요"></textarea> ';
							htmls += '	</div> ';
							htmls += '		<div style="width: 20%; display: inline-block; position: absolute;"> ';
							htmls += '		<button type="submit" class="btn nanum" id="commentBtn" name="${board.boardNo}" style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px;">작성</button> ';
							htmls += '	</div> ';
							htmls += '</div> '; 
							htmls += '<!-- 댓글작성 --> ';
							htmls += '<!-- 댓글보기 --> ';
							htmls += '	<div style="border: 1px solid black;"> ';
							htmls += '	<div style="position: relative; left: 14px; border: 0px white; width: 98%;"> ';
							htmls += '		<div class="postMainWrap" style="border-bottom: 0px; height: 80%;"> ';
							htmls += '		<div class="profile${contextPath}/resources/img/Area" id="profileImgArea" style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;"> ';
							htmls += '		<img src="     ${contextPath}/resources/img/ogong.jpg     " style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;"> ';
							htmls += '	</div> ';
							htmls += '		<div class="profileNameArea  nanum" id="profileNameArea" style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;"> ';
							htmls += '			<div> ';
							htmls += '				<p style="margin-bottom: 0;">        손오공             </p> ';
							htmls += '			</div> ';
							htmls += '				<div style="margin-bottom: 0; display: inline-block;"> ';
						    htmls += '				<p style="margin-bottom: 0;">               2020. 2. 20 pm 3:45                </p> ';
							htmls += '			</div> ';
							htmls += '			<div class="doubleCommentArea" style="display: inline-block; width: 14%; margin-bottom: 0px; padding-left: 2%;"> ';
							htmls += '				<p style="margin-bottom: 0; font-size: 13px;">댓글2</p> ';
							htmls += '			</div> ';
							htmls += '			<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 100%;"> ';
							htmls += '				<img class="likeBtn shake"	src="${contextPath}/resources/img/like.png" style="width: 16px; height: 16px; position: relative; bottom: 3px;"> ';
							htmls += '</div> ';
							htmls += '		<p style="margin-bottom: 0; font-size: 13px; display: inline-block;">5</p> ';
							htmls += '		</div> ';
							htmls += '		<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;"> ';
							htmls += '			<div> ';
							htmls += '				<div class="optionChevron"> ';
							htmls += '					<img src="${contextPath}/resources/img/download.png" style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 7px;"> ';
							htmls += '					<div class="hide nanum" id="postMenu2" style="width: 100px; height: 80px; border: black 2px solid; background-color: white; float: right; position: relative; right: 25px; bottom: 12px;"> ';
							htmls += '						<ul> ';
							htmls += '							<li><a href="#" name="deletePost" style="color: black;">댓글 삭제</a></li> ';
							htmls += '						<li><a href="#" name="deletePost" style="color: black;">댓글 수정</a></li> ';
							htmls += '						</ul> ';
							htmls += '					</div> ';
							htmls += '				</div> ';
							htmls += '			</div> ';
							htmls += '		</div> ';
							htmls += '	</div> ';
							htmls += '	<div class="commentContentWrap nanum"> ';
							htmls += '		<div style="padding-left: 10px; font-weight: bolder;"> ';
							htmls += '			<p> Wassup Seoul 댓글 테스트중                              </p> ';
							htmls += '		</div> ';
							htmls += '	</div> ';
							htmls += '</div> ';
							htmls += '<!-- 댓글 1 --> ';
							htmls += '<!-- 대댓글 --> ';
							htmls += '<div class="doubleCommentWrap" style="display: none;"> ';
							htmls += '	<!-- 대댓글보기1 --> ';
							htmls += '	<div style="border: px solid black; border-top: 2px solid black;"> ';
							htmls += '		<div style="position: relative; left: 40px; border: 0px white; width: 92%;"> ';
							htmls += '<div class="postMainWrap" style="border-bottom: 0px"> ';
							htmls += '<div class="profileImgArea" id="profileImgArea" style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;"> ';
							htmls += '<img src="${contextPath}/resources/img/account.png" style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;"> ';
							htmls += '</div> ';
							htmls += '<div class="profileNameArea  nanum" id="profileNameArea" style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;"> ';
							htmls += '<div> ';
							htmls += '<p style="margin-bottom: 0;">삼장법사</p> ';
							htmls += '</div> ';
							htmls += '<div style="margin-bottom: 0; display: inline-block;"> ';
							htmls += '						<p style="margin-bottom: 0;">2020. 2. 20 pm 3:47</p> ';
							htmls += '					</div> ';
							htmls += '		<div style="display: inline-block; width: 8%; margin-bottom: 0px; height: 100%;"> ';
							htmls += '				<img class="likeBtn shake" src="${contextPath}/resources/img/like.png" 	style="width: 15px; height: 15px; position: relative; float: right; top: 1px;"> ';
							htmls += '				</div> ';
							htmls += '					<p style="margin-bottom: 0; font-size: 13px; display: inline-block;">2</p> ';
							htmls += '				</div> ';
							htmls += '<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;"> ';
							htmls += ' <div> ';
							htmls += '						<div class="optionChevron"> ';
							htmls += '							<img src="${contextPath}/resources/img/download.png" style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 3px;"> ';
							htmls += '							<div class="hide nanum" id="postMenu2" style="width: 100px; height: 80px; border: black 2px solid; background-color: white; float: right; position: relative; right: 21px; bottom: 12px;"> ';
							htmls += '								<ul>';
							htmls += '									<li><a href="#" name="deletePost" style="color: black;">댓글 삭제</a></li> ';
							htmls += '								<li><a href="#" name="deletePost" style="color: black;">댓글 수정</a></li> ';
							htmls += '								</ul> ';
							htmls += '							</div> ';
							htmls += '						</div> ';
							htmls += '					</div> ';
							htmls += '				</div>';
							htmls += '			</div>';
							htmls += '			<div class="commentContentWrap nanum" sytle="font-weight: bolder;"> ';
							htmls += '				<p>                 Wassup Seoul 대댓글 테스트중                          </p> ';
							htmls += '			</div> ';
							htmls += '		</div> ';
							htmls += '	</div> ';
							htmls += '	<!-- 대댓글보기1 --> ';
							htmls += '	</div> ';
							htmls += '	<!-- 대댓글 --> ';
							htmls += '	<!-- 대댓글작성 --> ';
							htmls += '	<div class="inputCommentWrap" style="border: 1px solid black;"> ';
							htmls += '		<div class="writePost"	style="width: 80%; display: inline-block; margin-left: 3px;"> ';
							htmls += '			<textarea class="writeCommentArea2 nanum" id="writeCommentAreaStyle" rows="1" style="border-left: none;" placeholder="댓글을 작성해 보세요"></textarea> ';
							htmls += '		</div> ';
							htmls += '		<div style="width: 20%; display: inline-block; position: absolute;"> ';
							htmls += '			<button type="submit" class="btn nanum"	style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px">작성</button> ';
							htmls += '		</div> ';
							htmls += '	</div> ';
							htmls += '	<!-- 대댓글작성 --> ';
							htmls += '</div> ';
							htmls += ' <!-- 댓글보기 --> ';
 								
						 }	//each end
						 
						} 
						 $(this).parent().next("div").html(htmls);		
						 
						 $(this).parent().next("div").toggle(100);
						 $('.writeCommentArea').focus();
					},
					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
			}); 