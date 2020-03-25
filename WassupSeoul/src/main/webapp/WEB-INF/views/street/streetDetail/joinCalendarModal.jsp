<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

  <!-- calendarJoin Modal -->
  <div class="modal fade" id="calendarJoinModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="calendarJoinModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:496px;">
      <div class="modal-content">

        <div class="modal-header">
          <h3 class="modal-title nanum" id="staticBackdropLabel">일정 참가</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body">
            <div class="card mb-3">
              <div class="card-header">
                  <div class="row">
                      <div class="col-md-2">
                          <h4 class="nanum" style="padding-top: 10px;">3일</h4>
                          <h6 class="nanum">월요일</h6>
                      </div>
                      <div class="col-md-10">
                      	  <input type="text" class="form-control-plaintext nanum" value="이것은 일정제목입니다.길게 쓰면 어떻게 될까요" readonly style="font-weight: bold; font-size: 16px;">
                          <input type="text" class="form-control-plaintext nanum" value="2020-03-25 오전 12:00" readonly style="font-weight: bold;">
                          <input type="hidden" id="thisJoinBoardNo">
                      </div>
                  </div>
                  
              </div>
              <div class="card-body">
                  <div class="row">
                      <label class="col-sm-4 col-form-label nanum" style="font-weight: bold;font-size: 20px;">현재 참석인원</label>
                      <div class="col-sm-8">
                          <div class="row">
                            <div class="col-sm-9"><input type="text" class="form-control-plaintext nanum" value="일이삼사오육칠팔구십일이삼사" readonly style="font-weight: bolder; font-size: 17px;"></div>
                            <div class="col-sm-9" style="background-color: black;height: 2px;"></div>
                          </div>
                          <div class="row">
                            <div class="col-sm-9"><input type="text" class="form-control-plaintext nanum" value="참가인원2 닉네임" readonly style="font-weight: bolder; font-size: 17px;"></div>
                            <div class="col-sm-9" style="background-color: black;height: 2px;"></div>
                          </div>
                      </div>
                  </div>
                  <br>
                  <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-success btn-block nanum joinSchedule">참석 하기</button>
                    </div>
                  </div>
              </div>
            </div>
        </div>

      </div>
    </div>
  </div>
  <!-- end -->
  
  <script>
  	$(".joinSchedule").on("click",function(){
  		alert("버튼클릭");
  	});
  </script>
  
</body>
</html>