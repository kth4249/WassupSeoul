<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wassup, Seoul Lounge</title>
</head>
<style>
  .loungeHeader {
    width: 100%;
    height: 400px;
    position: relative;
  }

  .loungeBack {
    position: relative;
  }

  .loungeBack::after {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    background-image: url('${contextPath}/resources/img/골목4.jpg');
    background-size: cover;
    width: 100%;
    height: 100%;
    opacity: 0.6;
    z-index: -1;
    background-repeat: no-repeat;
  }


  .streetBtn {
    background-color: rgba(100, 255, 255, 0.2) !important;
  }

  #createStreet {
    position: absolute;
    bottom: 0px;
    right: 20px;
  }

  .btn-custom {
    background-color: rgba(100, 255, 255, 0.5) !important;
    color: black !important;
  }

  .streetSort{
    width: 17%;
    margin: 20px 20px;
  }
</style>

<body>
<%@include file="common/header.jsp" %>
  <div class="container-fluid loungeBack">
    <div class="row">
      <div class="col-md-12">
        <div class="loungeHeader headerMargin nanum text-center">
          <br><br><br><br><br><br><br>
          <h1 style="text-shadow: 0px 0px 2px #0874c6, 0px 0px 5px #c60850"><strong>Wassup, Seoul!</strong></h1>
          <div id="createStreet">
            <div class="form-group" style="display: inline-block;">
              <select class="custom-select nanum">
                <option selected>인기 골목 순</option>
                <option value="1">주민 많은 순</option>
                <option value="2">주민 적은 순</option>
                <option value="3">최신 개설 순</option>
              </select>
            </div>
            <button type="button" class="btn btn-primary btn-custom nanum">골목 개설</button>
          </div>
        </div>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-md-2">
        <ul class="nav nav-tabs">
          <a href="#" class="btn btn-primary" style="color: white;">
            전체
          </a>
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#gangnam">강남</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#gangbuk">강북</a>
          </li>
        </ul>
        <div id="myTabContent" class="tab-content">
          <div class="list-group streetBtn tab-pane fade active show" id="gangnam">
            <a href="#" class="list-group-item list-group-item-action streetBtn">강동구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">송파구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">강남구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">서초구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">동작구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">관악구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">금천구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">양천구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">영등포구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">강서구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">구로구</a>
          </div>
          <div class="list-group streetBtn tab-pane fade" id="gangbuk">
            <a href="#" class="list-group-item list-group-item-action streetBtn">강북구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">노원구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">도봉구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">광진구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">중랑구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">성동구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">동대문구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">성북구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">중구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">종로구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">용산구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">서대문구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">은평구</a>
            <a href="#" class="list-group-item list-group-item-action streetBtn">마포구</a>
          </div>
        </div>
      </div>
      <div class="col-md-10">
        <div class="row">

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="streetSort">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title nanum">
                  <a href="#">골목 이름</a>
                </h4>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
                <p class="card-text">#키워드</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <%@ include file="common/footer.jsp" %>
    
    
  </div>



</body>
</html>