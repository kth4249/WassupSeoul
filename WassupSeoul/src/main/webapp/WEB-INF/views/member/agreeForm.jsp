<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/common.css">
    <title>agree</title>

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
</head>

<style>
    @import url('https://fonts.googleapis.com/css?family=Poor+Story&display=swap');

    .container2 {
        padding-right: 15px;
        padding-left: 15px;

        width: 100%;
        height: 100%;
        text-align: center;
        position: relative;
        z-index: 1;
    }

    .container2::after {
        width: 100%;
        height: 100%;
        content: "";
        background: url("../img/서울2.jpg");
        position: absolute;
        top: 0;
        left: 0;
        z-index: -1;
        opacity: 0.5;
    }

    body {
        height: 1000px;
    }


    .infoBox {
        background-color: white;
        background-color: rgba(255, 255, 255, 0.5);
        width: 800px;
        height: 600px;
    }

    /* number 태그 화살표 제거 */
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    .nanum {
        font-size: 20px;

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
    }
</style>

<script>
    $(document).ready(function () {
        $('.check-all').click(function () {
            $('.cb').prop('checked', this.checked);
        });
    });
</script>

<body>

    <div class="container2">


        <div class="row">
            <div class="col-md-12">
                <h1 class="mt-5" style="font-size: 80px;">Terms of Use</h1><br>
				
                <div class="infoBox mx-auto">

					
                    <fieldset class="join_contentback">
						
	                        <form class="form1 font-weight-bold text-center" >
	                            <input type="checkbox" id="total_agree" class="check-all">
	                            <label for="total_agree">
	                                <h5 class="nanum mt-5" style="font-size: 35px;"><strong>모두 확인, 동의합니다.</strong></h5>
	                            </label>
	                        </form>
	                        <br>
	
	                        <form>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="checkbox" id="agree1" class="cb">
	                            <label for="agree1" class="nanum">&nbsp;만 14세 이상입니다.<strong>(필수)</strong></label>
	                        </form>
	
	                        <form>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="checkbox" id="agree2" class="cb">
	                            <label for="agree2" class="nanum">&nbsp;이용약관 동의<strong>(필수)</strong></label>
	
	                            <!-- 하이퍼링크로 만들기 -->
	                            &nbsp;
	                            <a href="#" data-toggle="modal" data-target="#exampleModalScrollable">
	                                <u class="nanum"><small>내용보기</small></u>
	                            </a>
	                        </form>
	
	                        <form>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="checkbox" id="agree3" class="cb">
	                            <label for="agree3" class="nanum">&nbsp;개인정보 수집 및 이용 동의<strong>(필수)</strong></label>
	
	                            &nbsp;
	                            <!-- 하이퍼링크로 만들기 -->
	                            <a href="#" data-toggle="modal" data-target="#exampleModalScrollable">
	                                <u class="nanum"><small>내용보기</small></u>
	                            </a>
	                        </form>
	
	                        <form>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="checkbox" id="agree4" class="cb">
	                            <label for="agree4" class="nanum">&nbsp;이메일 마케팅 수신 동의</label>
	                        </form>
	
	                        <form>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="checkbox" id="agree5" class="cb">
	                            <label for="agree5" class="nanum">&nbsp;생년월일과 성별 및 수집및 이용동의</label>
	                        </form>
	
	                        <form>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="checkbox" id="agree6" class="cb">
	                            <label for="agree6" class="nanum">&nbsp;개인정보 유효기간 3년 지정(미동의 시 1년)</label>
	                        </form>
	
	                        <br>
	                        <br>
	                        <input type="button" class="btn btn-danger btn-lg nanum" 
	                        onclick="location.href='${pageContext.request.contextPath}/member/signUpForm'">다음 단계로 !</input>
	
	                        <p class="mt-5 mb-3 text-muted small text-center">&copy; WS Corp. All Rights Reserved.</p>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalScrollable">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="nav-scroller py-1 mb-2">
                        <ul class="nav nav-tabs">
                            <li class="nav-item nanum">
                                <a class="nav-link show active" data-toggle="tab" href="#terms1">이용약관</a>
                            </li>
                            <li class="nav-item nanum">
                                <a class="nav-link" data-toggle="tab" href="#terms2">개인정보 처리방침</a>
                            </li>
                            <li class="nav-item nanum">
                                <a class="nav-link" data-toggle="tab" href="#terms3">청소년 보호정책</a>
                            </li>
                        </ul>

                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade show active" id="terms1">

                                <pre style="white-space: pre-wrap" id="prespace">

어려서부터 우리집은 가난했었고 
남들 다하는 외식 몇번 한적이 없었고 
일터에 나가신 어머니 집에 없으면 
언제나 혼자서 끓여먹었던 라면 
그러다 라면이 너무 지겨워서 
맛있는것좀 먹자고 대들었었어 
그러자 어머님이 마지못해 꺼내신 
숨겨두신 비상금으로 시켜주신 
자장면하나에 너무나 행복했었어 
하지만 어머님은 왠지 드시질 않았어 
어머님은 자장면이 싫다고 하셨어 
어머님은 자장면이 싫다고 하셨어 

야이야이야아아 
그렇게 살아가고 그렇게 후회하고 눈물도 흘리고 
야이야이야아아 
그렇게 살아가고 너무나 아프고 하지만 다시 웃고 

중학교 1학년때 도시락 까먹을때 
다같이 함께 모여 도시락 뚜껑을 열었는데 
부자집아들녀석이 나에게 화를 냈어 
반찬이 그게 뭐냐며 나에게 뭐라고 했어 
창피했어 그만 눈물이 났어 
그러자 그녀석은 내가 운다며 놀려댔어 
참을수 없어서 얼굴로 날아간 내 주먹에 
일터에 계시던 어머님은 또 다시 학교에 
불려오셨어 아니 또 끌려오셨어 
다시는 이런일이 없을 거라며 비셨어 
그녀석 어머니께 고개를 숙여 비셨어 
(우리 어머니가 비셨어) 

야이야이야아아 
그렇게 살아가고 그렇게 후회하고 눈물도 흘리고 
야이야이야아아 
그렇게 살아가고 너무나 아프고 하지만 다시 웃고 

아버님없이 마침내 우리는 해냈어 
마침내 조그만 식당을 하나 갖게 됬어 
그리 크진 않았지만 행복했어 
주름진 어머니 눈가엔 눈물이 고였어 
어머니와 내이름의 앞글자를 따서 
식당이름을 짓고 고사를 지내고 
밤이 깊어가도 아무도 떠날줄 모르고 
사람들의 축하는 계속 되었고 
자정이 다되서야 돌아갔어 
피곤하셨는지 어머님은 어느새 깊이 
잠이 들어버리시고는 깨지 않으셨어 
다시는... 

난 당신을 사랑했어요 
한번도 말을 못했지만 
사랑해요 이젠 편히 쉬어요 
내가 없는 세상에서 영원토록 

야이야이야아아 
그렇게 살아가고 그렇게 후회하고 눈물도 흘리고 
야이야이야아아 
그렇게 살아가고 너무나 아프고 하지만 다시 웃고 

야이야이야아아 
그렇게 살아가고 그렇게 후회하고 눈물도 흘리고 
야이야이야아아 
그렇게 살아가고 너무나 아프고 하지만 다시 웃고...
</pre>
                            </div>

                            <div class="tab-pane fade" id="terms2">
                                <pre style="white-space: pre-wrap" id="prespace">
모두)가라 가라 갇혀 확 갇혀 내 안에 갇혀 확 갇혀 
가라 가라 갇혀 확 갇혀 사랑안에 갇혀 확 갇혀

은)소리 없이 보내리라 말이 없이 보내리라 
그리워 지리라 네가 소리없이 보내리라 
말이 없이 보내리라 그리워 지리라 네가 

황보)약해지지마 헤어져도 우린 이대로 갈 수 없어 
커져가는 응어리를 버려야해 떠나가려해
    
려원)나 하나가 네게 있어 뭐가 그리 중요했니 
나처럼 전처럼 그렇게 바라봐
    
이니)알 수 없는 미래보다 지금이 더 좋아보여 
잊어버려 나라는 이름을
    
모두)다시 부르지마 
어디서 어떻게든 모른채 지나쳐 
다시 날 찾지마 어디서 어떻게든 
죽어도 나를 찾지마 
come a come come a come 
다시 찾아주길 위해서 나는 너의 곁을 떠난다 
come a come some a some some a some 
결심했다 너를 위해서 나는 너의 곁을 떠난다 
some a some so loose I've been abused 
absoulutely make you curse I make you 
dismiss me dis piss me 
이미 마음이 너의 곁을 떠난다 

은)소리 없이 보내리라 말이 없이 보내리라 
그리워지리라 네가 

려원)저 하늘을 바라보는 나날들이 늘어가도 나처럼 
전처럼 행복해져야해 

이니)내 곁에서 아주 멀리 떠나가줘 너를 잊게 
목소리라도 들을 수 없게 

모두)다시 부르지마 어떻게 해서든 모른채 지나쳐 
다시 날 찾지마 어디서 어떻게든 죽어도 나를 
찾지마 행복하게 살아야해 그 하나면 돼 나에겐 
(come a come come a come) 
다시 부르지마 어디서 어떻게든 모른채 지나쳐 
다시 날 찾지마 어디서 어떻게든 죽어도 나를 
찾지마 

모두)가라 가라 갇혀 확 갇혀 내 안에 갇혀 확 갇혀 
가라 가라 갇혀 확 갇혀 사랑안에 갇혀 확 갇혀 
                </pre>
                            </div>
                            <div class="tab-pane fade" id="terms3">
                                <pre style="white-space: pre-wrap" id="prespace">
학!학!학!학!학교를 안갔어 학!학!학!학!학교를 안갔어
학!학!학!학!학교를 안갔어 학!학!학!학!학교를 안갔어

어쩌면 좋겠어 학교를 안갔어
아니 아니야 안간게 아니야 실수로 못갔어 
정말이야 믿어줘 제발좀 들어줘
일부러 그런게 아니야 내 얘길 들어봐줘
학교를 가는 길에 시계를 들여다보니 
이게 웬일이니 시간이 남는게 아니겠니
그래서 딱 한판만 정말 딱 한판만 하고 가려고
오락실로 들어가게 됐어 그만
그런데 오늘따라 왠일인지 내게 뭐가 씌였는지
한판을 깨고 두판을 깨도 왜 죽지를 않는건지
결국 난 모든 기록을 깨고 내 이름을 새기고
멋있게 걸어 나오는데 아! 버스를 놓쳤어

학!학!학!학! 학교를 안갔어 학!학!학!학! 학교를 안갔어
학!학!학!학! 학교를 안갔어 학!학!학!학! 학교를 안갔어

떠나는 스쿨버스 야속한 스쿨버스
돌아와줘 플리스 날 구해줘 SOS
소리쳐도 버스는 멀어졌기에 나는
할수 없이 달려가서 지하철을 탔거든
그런데 이게 왠일 믿을수 없는일
작년에 전학간 내가 사랑하던 지윤일
만난거야 갑자기 하늘의 축복이
내 가슴은 콩당콩당콩당 내눈에 눈물이
어떻게 살았는지 어디에 사는지
끝없이 얘기는 오가고 웃음꽃을 피웠지
그리고 나서 용기를 내서 연락처를 물어봤지
그러자 그녀가 말했지
"그런데 너 내릴때 지나지 않았니?"

학!학!학!학! 학교를 안갔어 학!학!학!학! 학교를 안갔어
학!학!학!학! 학교를 안갔어 학!학!학!학! 학교를 안갔어

결국 오후가 되서야 학교에 도착한거야
교문앞에선 내 마음은 엄마야
화난 선생님 얼굴 무서운 엄마의 얼굴 
회초리 내 종아리 그냥 도망갈까 멀리 멀리
그래도 용기를 내서 교실문을 열었는데
혼나긴 커녕 매맞긴 커녕 박수를 받았어
(헤~ 엄마 미안해요)  
</pre>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>









        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>


</body>

</html>