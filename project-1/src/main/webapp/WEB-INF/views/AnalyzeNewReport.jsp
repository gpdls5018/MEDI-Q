<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!-- top이랑 겹쳐서 주석처리(필요없으면 삭제하기)
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 -->
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
    .effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .change-style{
      font-size:15px;
      cursor:pointer;
      border-radius: 15px;
      color:#939393
    }
    .change-style:hover {
      background-color:#ff4b4b;
      color: white;
    }
    .card {
      background-color: white;
      color: black;
      border-radius: 15px;
    }
    .card:hover {
      background-color:#ff4b4b;
      color: white;
      border-radius: 15px;
    }
    .card-checked {
      background-color:#FFDDD0;
      border: 3px solid #ff4b4b;
      color: #ff4b4b;
      border-radius: 15px;
    }
    .food-li {
      background-color: white;
      color: black;
      border-radius: 15px;
      flex: 0 0 25%;
    }
    .food-li:hover {
      border: #ff4b4b solid 2px;
    }
    .food-li-checked {
      border: #ff4b4b solid 2px;
    }
    
    .check-effect-tag {
      color:#9e9e9e;
      background-color: white;
    }
    .check-effect-tags span:hover {
      color:#ff5924;
      background-color:#ffece5;
    }
    .check-effect-tag-select {
      color:#ff4b4b;
      background-color:#ffece5;
    }
</style>
<body>
	<div class="container mt-5 effect-custom-font">
		<div class="my-title d-flex justify-content-between m-auto" style="width:80%;">
			<div class="mt-5" style="font-size:40px;"><span style="background-color:#ffdcdc;">${UserName}</span>님의 분석 리포트</div>
		</div>
		<div class="m-5" style="height:3px;background-color:#ccc"></div>
    <!--Q1#-->
    <form id="sendReportData" action="<c:url value="/analyzeMyReport.do"/>" method="post" onsubmit="preventSubmit(event)">
    <div class="m-5" style="font-size:30px;"><span>Q1#</span> 영양제 관련 취향을 선택해주세요.</div>
		<div class="m-5 d-flex justify-content-around">
			<div class="jumbotron p-4" style="border-radius:15px;width:30%;height:200px;">
				<div class="d-flex">
					<div class="effect-custom-font" style="font-size:35px;">1️⃣ 섭취 목적</div>
					<div class="take-purpose-div p-2">
            			<span style="color:#ff4b4b;font-size:20px;" class="take-purpose-span"></span>
          			</div>
				</div>
        		<div id="take-purpose" class="effect-custom-font p-2 change-style">변경하기</div>
        		<div id="choose-purposes" class="mt-2"></div>
			</div>
	      	<div class="jumbotron p-4" style="border-radius:15px;width:30%;height:200px;">
				<div class="d-flex">
					<div class="effect-custom-font" style="font-size:35px;">2️⃣ 선호 제형</div>
					<div class="effect-custom-font p-2">
	           	 		<span class="prefer-shape-span" style="color:#ff4b4b;font-size:20px;"></span>
	          		</div>
				</div>
	       		<div id="prefer-shape" class="effect-custom-font p-2 change-style">변경하기</div>
	       		<div id="choose-shapes" class="mt-2"></div>
			</div>
	      	<div class="jumbotron p-4" style="border-radius:15px;width:30%;height:200px;">
				<div class="d-flex">
					<div class="effect-custom-font" style="font-size:35px;">3️⃣ 선호 유형</div>
					<div class="effect-custom-font p-2">
			            <span class="prefer-type-span" style="color:#ff4b4b;font-size:20px;"></span>
			        </div>
				</div>
        		<div id="prefer-type" class="effect-custom-font p-2 change-style">변경하기</div>
        		<div id="choose-types" class="mt-2"></div>
			</div>
		</div>
	    <!--Q2#-->
	    <div class="question-2 m-5 effect-custom-font">
	      <div style="font-size:30px;"><span>Q2#</span> 현재 먹고 있는 영양제를 등록해보세요!<button class="btn btn-warning m-5 effect-custom-font" style="border-radius:15px;" id="search-myFood">영양제 검색하러 가기-></button></div>
	      <div class="jumbotron food-selected-list" style="height:500px;">
	        <ul class="list-unstyled d-flex"  style="flex-wrap: wrap;" id="last-choose-food-data">
	        
	        </ul>
	      </div>
	    </div>
    	<!-- 분석하기 -->
    	<div class="m-5">
      		<button class="btn btn-danger" style="border-radius:15px; width:100%" id="analyze-myFood">분석하기</button>
    	</div>
    	<input type="hidden" name="takePurpose" id="takePurPose" value=""/>
    	<input type="hidden" name="takeFood" id="takeFood" value=""/>
   </form>
</div>


  <!-- modal 등록하기 : 선호 유형 -->
  <div class="modal fade" id="prefer-type-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-lg">
  		<div class="modal-content effect-custom-font">
  			<div class="modal-header m-5">
  				<h4 class="modal-title">💡 영양제를 선택할 때, 어떤점을 중요하게 생각하나요?</h4>
	          	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            	<span aria-hidden="true">&times;</span>
	          	</button>
  			</div>
  			<div class="ml-5" style="color:#545454">중복 선택이 가능합니다. (최대 3개)</div>
  			<div class="modal-body p-2" style="height:200px;flex:1;">
  				<div class="check-effect-tags d-flex m-3" style="flex-wrap: wrap;">
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">비싸더라도 좋은 원료</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">가성비</span>
			    </div>
			    <div class="check-effect-tags d-flex m-3" style="flex-wrap: wrap;">
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">딱 한가지 핵심 원료만</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">관련 영양소를 한 번에</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">낱개 포장</span>
			    </div>
			    <div class="check-effect-tags d-flex m-3" style="flex-wrap: wrap;">
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">최대한 많은 양</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">딱 필요한 만큼만</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">하루 한번 만</span>
			    </div>
  			</div>
  			<div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	          <button type="button" class="btn btn-primary" id="save-prefer-type">저장하기</button>
	        </div>
  		</div>
  	</div>
  </div>
  
  
  
  <!-- modal 등록하기 : 선호 제형 -->
  <div class="modal fade" id="prefer-shape-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-lg">
      <div class="modal-content effect-custom-font">
        <div class="modal-header m-5">
	        <h4 class="modal-title">💡 어떤 제형을 선호하시나요?</h4>
          	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
            	<span aria-hidden="true">&times;</span>
          	</button>
        </div>
        <div class="ml-5" style="color:#545454">중복 선택이 가능합니다. (최대 3개)</div>
        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
        	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/과립.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">과립</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/바.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">바</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/분말.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">분말</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/시럽.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">시럽</h5>
	            </div>
          	</div>
        </div>
        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/액상.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">액상</h5>
	            </div>
          	</div>
        	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/정제.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">정제</h5>
	            </div>
          	</div>
        	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/젤리.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">젤리</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/캡슐.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">캡슐</h5>
	            </div>
          	</div>  
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" id="save-prefer-shape">저장하기</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- modal 등록하기 : 섭취 목적-->
  <div class="modal fade" id="take-purpose-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
      <div class="modal-content effect-custom-font">
        <div class="modal-header m-5">
          <h4 class="modal-title">💡 영양제를 먹는 이유가 무엇인가요?</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="ml-5" style="color:#545454">중복 선택이 가능합니다. (최대 3개)</div>
        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/간 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">간 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/뼈 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">뼈 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/두뇌활동.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">두뇌활동</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/피부 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">피부 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈중 콜레스테롤.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">혈중 콜레스테롤</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/장 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">장 건강</h5>
            </div>
          </div>
        </div>

        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/눈 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">눈 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/면역 기능.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">면역 기능</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/수면.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">수면</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈액 순환.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">혈액 순환</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/운동 능력.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">운동 능력</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/체지방.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">체지방</h5>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" id="save-take-purpose">저장하기</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 내가 먹고 있는 영양제 검색 -->
  <div class="modal fade" id="take-foodList-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      	<div class="modal-content effect-custom-font">
        	<div class="modal-header">
          		<div class="search-bar ml-3" style="width:100%;">
          			<h5 class="modal-title p-3">💡 섭취중인 영양제를 등록해주세요
	          			<button type="button" class="close m-0" data-dismiss="modal" aria-label="Close">
			            	<span aria-hidden="true">&times;</span>
			          	</button>
		          	</h5>
          			<div class="input-group">
	      				<input id=searchText class="form-control" type="text" placeholder="브랜드명 혹은 제품명을 입력해주세요" style="border-radius:15px;background-color:#f6f6f6;width:100%;">
	          		</div>
	        	</div>
        	</div>
        	<div class="modal-body">
		        <div class="ml-5">
		          <ul class="list-unstyled d-flex" id="searchFoodList" style="flex-wrap: wrap;">
		            <li class="food-li m-2" style="text-align: center;flex-basis: 100px;display:None">
		              <img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="width:150px;height:150px;border-radius: 15px;">
		              <div style="font-size: 15px;color: #939393;width:150px;"></div>
		            </li>
		          </ul>
	          </div>
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        		<button type="button" class="btn btn-primary" id="save-take-food">저장하기</button>
      		</div>
    	</div>
	</div>
  </div>
</body>
<script>
	
  $("#take-purpose").click(function(e){
    e.preventDefault();
    $('#take-purpose-modal').modal("show");
  });
  
  $("#prefer-shape").click(function(e){
	    e.preventDefault();
	    $('#prefer-shape-modal').modal("show");
  });
  
  $("#prefer-type").click(function(e){
	    e.preventDefault();
	    $('#prefer-type-modal').modal("show");
  });
  
  $('.check-effect-tags').children().click(function() {
      console.log($(this).html());
      $(this).toggleClass('check-effect-tag-select');
  });
  

  const ulDiv = document.querySelector('#searchFoodList');
	$( "#searchText" ).autocomplete({
	   source : function(request,response) {
		   $.ajax({
			   url: "<c:url value='/searchMyFood.do'/>",
			   data : { "searchWord" : $( "#searchText" ).val()},
		   }).done(function(searchFood) {
			   	var nameList = searchFood.map(function(item){return item['PRODUCTNAME'];});
			   	response(nameList);
			   	var imgList = searchFood.map(function(item){return item['IMGURL'];});
			   	while (ulDiv.childElementCount > 1) {
			   		ulDiv.removeChild(ulDiv.lastChild); // 마지막 자식 요소를 제거
			   	}
			   	searchFood.forEach(function(item) {
			   		var li = document.querySelector('.food-li').cloneNode(true);
			   		li.style.display = '';
			   		li.classList.replace('food-li-checked','food-li');
			   		if (item['IMGURL']===undefined) {
			   			item['IMGURL'] = 'http://localhost:9090/images/thumbnail_img/NO_IMG.jpeg';
			   		}
			   		li.querySelector('img').src = item['IMGURL'];
			   		li.querySelector('div').innerHTML = item['PRODUCTNAME'];
			   		ulDiv.appendChild(li);
			   	});
			   	
		   }).fail(function(error) {
			   	console.log(error);
		   });
	   }
	});

  
  $("#take-foodList-modal").on("shown.bs.modal", function() {
	    // 자동완성 기능 초기화
	    $("#searchText").autocomplete("option", "appendTo", "#take-foodList-modal");
  });
  $('#search-myFood').click(function(e) {
    e.preventDefault();
    $('#take-foodList-modal').modal("show");
  });

  
  
  $(document).on('click', '.food-li', function() {
	  console.log("asd");
    if($(this).hasClass("food-li")) {
      $(this).toggleClass("food-li-checked");
    }
  });

///////////////////////////////////////섭취목적
  $("#take-purpose-modal .card").click(function(){
    if($(this).hasClass("card")) {
      $(this).toggleClass("card-checked");
    }
  });
  let takePurPoses= Array();
  $('#save-take-purpose').click(function() {
    var takePurPose = document.querySelectorAll('#take-purpose-modal .card-checked');
    takePurPoses = [];
    for(var i=0; i<takePurPose.length;i++) {
      console.log(takePurPose[i].querySelector(".card-title").innerHTML);
      takePurPoses.push(takePurPose[i].querySelector(".card-title").innerHTML);
    }
    document.querySelector('#choose-purposes').innerHTML = takePurPoses;
    document.querySelector(".take-purpose-span").innerHTML = takePurPoses.length;
    $('#take-purpose-modal').modal('hide');
  });
///////////////////////////////////////


///////////////////////////////////////선호제형
  $("#prefer-shape-modal .card").click(function(){
    if($(this).hasClass("card")) {
      $(this).toggleClass("card-checked");
    }
  });
  let preferShapes= Array();
  $('#save-prefer-shape').click(function() {
    var preferShape = document.querySelectorAll('#prefer-shape-modal .card-checked');
    preferTypes = [];
    for(var i=0; i<preferShape.length;i++) {
      console.log(preferShape[i].querySelector(".card-title").innerHTML);
      preferShapes.push(preferShape[i].querySelector(".card-title").innerHTML);
    }
    document.querySelector('#choose-shapes').innerHTML = preferShapes;
    document.querySelector(".prefer-shape-span").innerHTML = preferShapes.length;
    $('#prefer-shape-modal').modal('hide');
  });
///////////////////////////////////////

//////////////////////////////////////선호 유형
  let preferTypes= Array();
  $('#save-prefer-type').click(function() {
    var preferType = document.querySelectorAll('.check-effect-tag-select');
    preferTypes = [];
    for(var i=0; i<preferType.length;i++) {
      console.log(preferType[i].innerHTML);
      preferTypes.push(preferType[i].innerHTML);
    }
    document.querySelector('#choose-types').innerHTML = preferTypes;
    document.querySelector(".prefer-type-span").innerHTML = preferTypes.length;
    $('#prefer-type-modal').modal('hide');
  });
  
//////////////////////////////////////







  var takeFoods = Array();
  $('#save-take-food').click(function() {
    var takeFood = document.querySelectorAll('#searchFoodList .food-li-checked');
    var foodContainer = $('.food-selected-list ul');
    //$('.food-selected-list ul li').remove('li'); 
    $('#take-foodList-modal .food-li-checked').clone(true).appendTo(foodContainer);
    for(var i=0; i<takeFood.length;i++) {
      console.log(takeFood[i].querySelector("div").innerHTML);
      takeFoods.push(takeFood[i].querySelector("div").innerHTML);
    }
    $('#take-foodList-modal').modal('hide');
  });

  
  function preventSubmit(event) {
    event.preventDefault(); // 전송을 막는 메소드
  }
  $('#analyze-myFood').click(function() {
    document.querySelector("#takePurPose").value = takePurPoses;
    document.querySelector("#takeFood").value = takeFoods;
    console.log('takePurPoses :',takePurPoses);
    console.log('takeFoods :',takeFoods);
    let timerInterval;
    Swal.fire({
      title: '분석중입니다!',
      html: 'I will close in <b></b> milliseconds.',
      timer: 2000,
      timerProgressBar: true,
      didOpen: () => {
        Swal.showLoading()
        const b = Swal.getHtmlContainer().querySelector('b')
        timerInterval = setInterval(() => {
          b.textContent = Swal.getTimerLeft()
        }, 100)
      },
      willClose: () => {
        clearInterval(timerInterval);
        console.log(document.querySelector("#takeFood").value);
        console.log(document.querySelector("#takePurPose").value);
        document.querySelector("#sendReportData").submit();
      }
    }).then((result) => {
      /* Read more about handling dismissals below */
      if (result.dismiss === Swal.DismissReason.timer) {
        console.log('I was closed by the timer');
      }
    })
  });
  
//유효성 검사 코드 값이 없으면 버튼 비활성화
const analyzeButton = document.getElementById('analyze-myFood');

// take-purpose-span, prefer-shape-span, prefer-type-span 엘리먼트 선택
const takePurposeSpan = document.querySelector('.take-purpose-span');
const preferShapeSpan = document.querySelector('.prefer-shape-span');
const preferTypeSpan = document.querySelector('.prefer-type-span');

// #last-choose-food-data 요소 선택
const lastChooseFoodData = document.getElementById('last-choose-food-data');

// analyze-myFood 버튼 상태 업데이트 함수
function updateAnalyzeButtonState() {
  // take-purpose-span, prefer-shape-span, prefer-type-span의 내용을 가져옴
  const takePurpose = takePurposeSpan.textContent.trim();
  const preferShape = preferShapeSpan.textContent.trim();
  const preferType = preferTypeSpan.textContent.trim();

  // #last-choose-food-data의 자식 요소 개수 확인
  const foodItemCount = lastChooseFoodData.children.length;

  // take-purpose-span, prefer-shape-span, prefer-type-span, #last-choose-food-data 중 하나라도 빈 값인 경우
  if (takePurpose === '' || preferShape === '' || preferType === '' || foodItemCount === 0) {
    // analyze-myFood 버튼 비활성화
    analyzeButton.disabled = true;
  } else {
    // 모든 값이 채워진 경우 analyze-myFood 버튼 활성화
    analyzeButton.disabled = false;
  }
}

// analyze-myFood 버튼 상태 업데이트 함수 호출
updateAnalyzeButtonState();

// take-purpose-span, prefer-shape-span, prefer-type-span, #last-choose-food-data 내용 변경 감지 이벤트 리스너 추가
takePurposeSpan.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);
preferShapeSpan.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);
preferTypeSpan.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);
lastChooseFoodData.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);

</script>
