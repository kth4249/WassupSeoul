<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/form-validation.css"
   type="text/css">
<title>Appo_Join_Agree</title>
</head>
<style>
#prespace {
   white-space: pre-wrap;
   /* CSS3*/
   white-space: -moz-pre-wrap;
   /* Mozilla, since 1999 */
   white-space: -pre-wrap;
   /* Opera 4-6 */
   white-space: -o-pre-wrap;
   /* Opera 7 */
   word-wrap: break-all;
   /* Internet Explorer 5.5+ */
}
</style>

<body>


   <%@ include file="../common/header.jsp"%>

   <div class="row">
      <div class="col-md-12">
         <div class="container" id="container_2">
            <div class="py-5">

               <img
                  src="<%=request.getContextPath()%>/resources/appoimg/appologo_White.png"
                  class="mb-4 rounded mx-auto d-block" width="72" height="auto">
               <h1 class="h2 mb-3 font-weight-bold text-center">회원가입</h1>
               <br>

               <fieldset class="join_contentback">
                  <br>

                  <form class="form1" action="joinForm"
                     method="GET" name="agreeForm" id="form1"
                     onsubmit="return validate();">

                     <div class="text-center">
                        <input type="checkbox" id="check-all" class="check-all">

                        <label for="check-all">
                           <h5>
                              <strong>모두 확인, 동의합니다.</strong>
                           </h5> 
                        </label>
                     </div>

                     <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
                           id="agree1" name="agree1" class="cb"> <label
                           for="agree1">&nbsp;만 14세 이상입니다.<strong>(필수)</strong>
                        </label>
                     </div>

                     <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
                           id="agree2" name="agree2" class="cb"> <label
                           for="agree2">&nbsp;이용약관 동의<strong>(필수)</strong>
                        </label>

                        <!-- 하이퍼링크로 만들기 -->
                        &nbsp; <a href="#" data-toggle="modal"
                           data-target="#exampleModalScrollable"> <u><small>내용보기</small></u>
                        </a>
                     </div>

                     <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
                           id="agree3" name="agree3" class="cb"> <label
                           for="agree3">&nbsp;개인정보 수집 및 이용 동의<strong>(필수)</strong>
                        </label> &nbsp;
                        <!-- 하이퍼링크로 만들기 -->
                        <a href="#" data-toggle="modal"
                           data-target="#exampleModalScrollable"> <u><small>내용보기</small></u>
                        </a>
                     </div>

                     <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
                           id="agree4" name="agree4" class="cb"> <label
                           for="agree4">&nbsp;이메일 마케팅 수신 동의</label>
                     </div>

                     <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
                           id="agree5" name="agree5" class="cb"> <label
                           for="agree5">&nbsp;생년월일과 성별 및 수집및 이용동의</label>
                     </div>

                     <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
                           id="agree6" name="agree6" class="cb"> <label
                           for="agree6">&nbsp;개인정보 유효기간 3년 지정(미동의 시 1년)</label>
                     </div>

                     <hr>

                     <small>
                        <p class="font-weight-bold ml-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보
                           수집</p>
                     </small>

                     <table class="ml-3">
                        <tr>
                           <th><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>필수</strong></small></th>
                           <th><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small></th>
                        </tr>
                        <tr>
                           <th class="thcolor"><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>목적</strong></small>
                           </th>
                           <td><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용자
                                 식별,서비스 이행을 위한 연락</small></td>
                        </tr>
                        <tr>
                           <th class="thcolor"><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>항목</strong></small>
                           </th>
                           <td><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름,아이디,비밀번호,이메일</small></td>
                        </tr>
                        <tr>
                           <th class="thcolor"><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>보유기간</strong></small></th>
                           <td><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴 후
                                 5일까지</small></td>
                        </tr>
                     </table>
                     <br>

                     <table class="ml-3">
                        <tr>
                           <th><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>선택</strong></small></th>
                           <th><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small></th>
                        </tr>
                        <tr>
                           <th class="thcolor"><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>목적</strong></small>
                           </th>
                           <td><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;맞춤 정보 제공,
                                 마케팅</small></td>
                        </tr>
                        <tr>
                           <th class="thcolor"><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>항목</strong></small>
                           </th>
                           <td><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별, 생년월일</small></td>
                        </tr>
                        <tr>
                           <th class="thcolor"><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>보유기간</strong></small></th>
                           <td><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴 후
                                 5일까지</small></td>
                        </tr>
                     </table>
                     <br><br>
                     
                     <button class="btn btn-lg btn-primary btn-block" type="submit">동의하고
                        가입하기</button>
                  </form>
               </fieldset>

               <p class="mt-5 mb-3 text-muted small text-center">&copy; Appo
                  Corp. All Rights Reserved.</p>
            </div>



            <!-- Modal -->
            <div class="modal fade" id="exampleModalScrollable" tabindex="-1"
               role="dialog" aria-labelledby="exampleModalScrollableTitle"
               aria-hidden="true">
               <div class="modal-dialog modal-dialog-scrollable modal-lg"
                  role="document">
                  <div class="modal-content">
                     <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <div class="modal-body">
                        <div class="nav-scroller py-1 mb-2">
                           <ul class="nav nav-tabs">
                              <li class="nav-item"><a class="nav-link show active"
                                 data-toggle="tab" href="#terms1">이용약관</a></li>
                              <li class="nav-item"><a class="nav-link"
                                 data-toggle="tab" href="#terms2">개인정보 처리방침</a></li>
                              <li class="nav-item"><a class="nav-link"
                                 data-toggle="tab" href="#terms3">청소년 보호정책</a></li>
                              <li class="nav-item"><a class="nav-link"
                                 data-toggle="tab" href="#terms4">전자금융거래 약관</a></li>
                           </ul>
                           <div id="myTabContent" class="tab-content">
                              <div class="tab-pane fade show active" id="terms1">
                                 <pre style="white-space: pre-wrap" id="prespace"
                                    class="modal-contents">



② "쇼핑몰"과 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다.</pre>
                              </div>
                              <div class="tab-pane fade" id="terms2">
                                 <pre style="white-space: pre-wrap" id="prespace">


1. 개인정보 처리방침이란?
                                                </pre>
                              </div>
                              <div class="tab-pane fade" id="terms3">
                                 <pre style="white-space: pre-wrap" id="prespace">


1. 청소년 보호를 위한 목표 및 기본 원칙
                              </div>
                              <div class="tab-pane fade" id="terms4">
                                 <pre style="white-space: pre-wrap" id="prespace">


                              </div>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary"
                              data-dismiss="modal">확인</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>



   <div>
      <%@ include file="../common/footer.jsp"%>
   </div>

   <script>
      var doc = document; 
      var form1 = doc.getElementById('form1'); 
      var inputs = form1.getElementsByTagName('INPUT'); 
      var form1_data = {
         "agree1": false, 
         "agree2": false, 
         "agree3": false
      }; 
   
      var agree1 = doc.getElementById('agree1'); 
      var agree2 = doc.getElementById('agree2'); 
      var agree3 = doc.getElementById('agree3'); 
      
      function checkboxListener() {
         form1_data[this.name] = this.checked; 

         if(this.checked) {
            // submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분. 
            this.parentNode.style.color = "#000"; 
         }
      }
      
      agree1.onclick = agree2.onclick = agree3.onclick = checkboxListener; 

      var all = doc.getElementById('check-all'); 

      all.onclick = function() {
         if (this.checked) {
            setCheckbox(form1_data, true); 
         } else {
            setCheckbox(form1_data, false); 
         }
      }; 
      
      function setCheckbox(obj, state) {
         for (var x in obj) {
            obj[x] = state; 

            for(var i = 0; i < inputs.length; i++) {
               if(inputs[i].type == "checkbox") {
                  inputs[i].checked = state; 
               }
            }

         }
      }
      
      form1.onsubmit = function(e) {
         e.preventDefault(); // 서브밋 될때 화면이 깜빡이지 않게 방지

         if ( !form1_data['agree1'] ) {
            alert('14세 이상을 선택을 하지 않았습니다'); 
            agree1.parentNode.style.color = 'red'; 
            return false; 
         }

         if ( !form1_data['agree2'] ) {
            alert('이용약관에 동의하여 주시길 바랍니다.'); 
            agree2.parentNode.style.color = 'red';
            return false; 
         }
         
         if ( !form1_data['agree3'] ) {
            alert('개인정보수집에 동의하여 주시길 바랍니다.'); 
            return false; 
         }

         this.submit(); 
      }; 
      
   </script>




</body>
</html>