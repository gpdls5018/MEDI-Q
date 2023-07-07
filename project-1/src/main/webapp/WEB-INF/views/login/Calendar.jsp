<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
	img{
		width: 40px;
		margin-left: 5px;
		cursor: pointer;
		border-radius: 
	}
	.transition {
  transition: all 0.25s ease-in-out;
}
.flipIn {
  animation: flipdown 0.5s ease both;
}

.diary{
	margin-top: 30px;
	padding-top: 50px;
	box-shadow: 0 10px 0 0 rgba(255, 104, 115, 1) inset;
  	background-color: rgba(254, 255, 250, 1);
}

h1, h2 {
  color: rgba(255, 104, 115, 1);
}
h1 {
  text-transform: uppercase;
  font-size: 36px;
  line-height: 42px;
  letter-spacing: 3px;
  font-weight: 100;
}
h2 {
  font-size: 26px;
  line-height: 34px;
  font-weight: 300;
  display: block;
  margin: 0;
  cursor: pointer;
}
.acco {
  color: rgba(48, 69, 92, 0.8);
  font-size: 17px;
  line-height: 26px;
  letter-spacing: 1px;
  position: relative;
  overflow: hidden;
  max-height: 800px;
  opacity: 1;
  transform: translate(0, 0);
  margin-top: 14px;
  z-index: 2;
  transition: all 0.5s ease-in-out;
}
ul {
  list-style: none;
  perspective: 900px;
  padding: 0;
  margin: 0;
}
ul li {
  position: relative;
  padding: 0;
  margin: 0;
  padding-bottom: 4px;
  padding-top: 18px;
  border-top: 1px dotted rgba(220, 231, 235, 1);
  animation: flipdown 0.5s ease both;
}
ul li:nth-of-type(1) {
  animation-delay: 0.5s;
}
ul li:nth-of-type(2) {
  animation-delay: 0.75s;
}
ul li:nth-of-type(3) {
  animation-delay: 1.0s;
}
ul li:last-of-type {
  padding-bottom: 0;
}

ul li input[type=checkbox] {
  position: absolute;
  cursor: pointer;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
}
ul li input[type=checkbox]:checked ~ .acco {
  margin-top: 0;
  max-height: 0;
  opacity: 0;
  transform: translate(0, 50%);
}

@keyframes flipdown {
  0% {
    opacity: 0;
    transform-origin: top center;
    transform: rotateX(-90deg);
  }
  5% {
    opacity: 1;
  }
  80% {
    transform: rotateX(8deg);
  }
  83% {
    transform: rotateX(6deg);
  }
  92% {
    transform: rotateX(-3deg);
  }
  100% {
    transform-origin: top center;
    transform: rotateX(0deg);
  }
}

/* 알림버튼 on/off */
.btn-onoff{
  position: relative;
  display: inline-block;
  vertical-align: middle;
  margin-left: 20px;
}
.btn-onoff input{
  position: absolute;
  opacity:0
}
.btn-onoff span{
	position: relative;
	display: block;
	width: 80px;
	height: 34px;
	border-radius: 40px;
	background: #ccc;
	border: 1px solid #ccc;
	-webkit-transition: 400ms;
	-moz-transition: 400ms;
	-ms-transition: 400ms;
	transition: 400ms
}
.btn-onoff input:checked ~ span{
  border: 1px solid #4CAF50;
  background: #4CAF50
}
.btn-onoff input ~ span:before{
	content: 'Off';
	display: block;
	width: 45px;
	height: 34px;
	position: absolute;
	right: 0px;
	font-size: 14px;
	font-family: "Arial";
	font-weight: bold;
	line-height: 34px;
	color: #444;
	padding: 0px 8px;
	letter-spacing: 1px;
	text-transform: uppercase;
	-webkit-transition: 500ms;
	-moz-transition: 500ms;
	-ms-transition: 500ms;
	transition: 500ms
}
.btn-onoff input:checked ~ span:before{
	content: 'On';
	right: 28px;
	color: #fff
}
.btn-onoff input ~ span:after{
	content: '';
	position: absolute;
	width: 26px;
	height: 26px;
	top: 4px;
	left: 4px;
	background: #fff;
	border-radius: 50%;
	-webkit-transition: 400ms;
	-moz-transition: 400ms;
	-ms-transition: 400ms;
	transition: 400ms
}
.btn-onoff:hover input ~ span:after{
	-webkit-transform:scale(0.9);
	-moz-transform:scale(0.9);
	-ms-transform:scale(0.9);
	transform:scale(0.9)
}
.btn-onoff input:checked ~ span:after{
	content: '';
	left: 51px;
}
    </style>
</head>
<body>
    <div class="" style="margin-top: 80px">
    	<div class="row">
	        <div class="col-lg-3 p-0" >
	        	<!-- 캘린더 -->
				<div class="calendar" >
			        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
			            <h5 class="text-center text-secondary" id="offcanvasExampleLabel">일정확인</h5>
			            <div class="offcanvas-body d-flex justify-content-center p-0">
			                <div data-bs-toggle="calendar" id="calendar_offcanvas" class="rounded w-75"></div>
			            </div>
			        </div>
			    </div>
			    <div class="dropdown-center">
			        <div class="dropdown-menu p-0">
			            <div data-bs-toggle="calendar" id="calendar_dropdown"></div>
			        </div>
			    </div>
			
			    <div data-bs-toggle="calendar" id="calendar_inline" class="col shadow rounded" style="display: none;"></div>
			    <!-- 달력 끝 -->
	        </div>
	        
	        <div class="col-lg-9 diary" style="max-width: 800px">
	        	<form action="#" >
	        		<input type="hidden" name="img" value=""/>
					<h1>오늘날짜 건강 기록</h1>
					<ul>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">오늘의 컨디션</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<img alt="happy" src="/resources/images/condition/happy.png" name="condition"/>
								<img alt="smile" src="/resources/images/condition/smile.png" name="condition"/>
								<img alt="good" src="/resources/images/condition/good.png" name="condition"/>
								<img alt="soso" src="/resources/images/condition/soso.png" name="condition"/>
								<img alt="sad" src="/resources/images/condition/sad.png" name="condition"/>
								<img alt="sosad" src="/resources/images/condition/sosad.png" name="condition"/>
								<img alt="angry" src="/resources/images/condition/angry.png" name="condition"/>
							</div>
						</li>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">증상체크</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<span class="head">머리</span>
								<div>
									<span class="btn btn-outline-secondary">두통</span>
									<span class="btn btn-outline-secondary">어지러움</span>
									<span class="btn btn-outline-secondary">발열</span>
									<span class="btn btn-outline-secondary">편두통</span>
									<span class="btn btn-outline-secondary">메스꺼움</span>
									<span class="btn btn-outline-secondary">구토</span>
								</div>
								<span class="respiratory">호흡기</span>
								<div>
									<span class="btn btn-outline-secondary">기침</span>
									<span class="btn btn-outline-secondary">가래</span>
									<span class="btn btn-outline-secondary">호흡곤란</span>
									<span class="btn btn-outline-secondary">코막힘</span>
								</div>
								<span class="stomach">배</span>
								<div>
									<span class="btn btn-outline-secondary">복통</span>
									<span class="btn btn-outline-secondary">설사</span>
									<span class="btn btn-outline-secondary">변비</span>
									<span class="btn btn-outline-secondary">속쓰림</span>
									<span class="btn btn-outline-secondary">소화불량</span>
									<span class="btn btn-outline-secondary">경련</span>
									<span class="btn btn-outline-secondary">식욕감퇴</span>
									<span class="btn btn-outline-secondary">복부 팽만감</span>
								</div>
								<span class="mental">정신</span>
								<div>
									<span class="btn btn-outline-secondary">우울</span>
									<span class="btn btn-outline-secondary">불면증</span>
									<span class="btn btn-outline-secondary">스트레스</span>
									<span class="btn btn-outline-secondary">감정기복</span>
									<span class="btn btn-outline-secondary">무기력</span>
									<span class="btn btn-outline-secondary">피곤함</span>
									<span class="btn btn-outline-secondary">집중력 감퇴</span>
								</div>
								<span class="chest">가슴</span>
								<div>
									<span class="btn btn-outline-secondary">호흡곤란</span>
									<span class="btn btn-outline-secondary">가슴통증</span>
									<span class="btn btn-outline-secondary">압박감</span>
								</div>
								<span class="body">신체</span>
								<div>
									<span class="btn btn-outline-secondary">근육경련</span>
									<span class="btn btn-outline-secondary">부종</span>
									<span class="btn btn-outline-secondary">피부발진</span>
									<span class="btn btn-outline-secondary">체중변화</span>
									<span class="btn btn-outline-secondary">가려움</span>
								</div>
							</div>
						</li>
<style>
	.add{
		display: flex;
		justify-content: between;
		align-items: center;
		margin-bottom: 5px;
	}
	.circle{
		border:3px solid skyblue;
		border-radius:100px 100px;
	}
</style>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">복용 약</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="add">
									<input class="bg-light form-control" value="비타민" style="height: 35px; width: 100px">
									<i class="fa-solid fa-plus"></i>
								</div>
								<div class="add">
									<input class="bg-light form-control" value="철분제" style="height: 35px; width: 100px">
									<i class="fa-solid fa-plus"></i>
								</div>
								<div class="add">
									<input class="bg-light form-control" value="철분제" style="height: 35px; width: 100px">
									<i class="fa-solid fa-plus"></i>
								</div>
								<a href="javascript:addList()" id="add">추가</a>	
							</div>							
						</li>
						
<style>
   .c-bmi {
	  
	  border-radius: .25rem;
	  box-sizing: border-box;
	  font-family: ui-sans-serif, system-ui, sans-serif;
	  padding: 1rem;
	  width: 40rem;
	  width: 100%;
	}
	.c-bmi__groups {
	  border: 0;
	  flex-wrap: wrap;
	  color: white;
	  font-weight: bold;
	  font-size: medium;
	  padding: 0;
	  text-align: center;
	  width: 100%;
	  margin-top: 30px;
	  display: flex;
	  justify-content: center;
	}
	.c-bmi__groups label {
	  display: block;
	  padding: .5rem;
	  position: relative;
	}
	
	[for="bmi-g0"] { background-color: #4691e2; }
	[for="bmi-g1"] { background-color: #0cb764; }
	[for="bmi-g2"] { background-color: #febf18; }
	[for="bmi-g3"] { background-color: #fc8711; }
	[for="bmi-g4"] { background-color: #ff6455; }
	[for="bmi-g5"] { background-color: #cc1100; color: #fff; }
	
	.c-bmi__groups input:checked + label::before {
	  background-color: #fff;
	  clip-path: polygon(0% 0%,0% 100%,75.00% 50.00%);
	  content: '';
	  display: inline-block;
	  height: 1rem;
	  left: 0.5rem;
	  position: absolute;
	  top: 0.35rem;
	  width: 1rem;
	}
	.c-bmi__groups input:checked + label + div {
	  display: block;
	  flex: 0 0 100%;
	}
	.c-bmi__label {
	  display: block;
	  font-size: medium;
	  margin: 0 0 1rem 0;
	  position: relative;
	}
	.c-bmi__label output {
	  position: absolute;
	  right: 0;
	  top: 0;
	}
	
	.c-bmi [type="radio"] { display: none; }
	
	/* RWD */
	@media (min-width: 600px) {
	  .c-bmi__groups { display: flex; }
	  .c-bmi__groups input:checked + label::before {
	    background-color: inherit;
	    clip-path: polygon(0% 0%,100% 0%,50% 100%);
	    left: 50%;
	    top: -1rem;
	    transform: translateX(-50%);
	    width: 1.5rem;
	  }
	  .c-bmi__groups label { flex: 1; }
	
</style>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">체중 키</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="c-bmi">
									<div class="d-inline-flex align-items-center">
										<span>키</span>
						                <input class="bg-light form-control ml-3" name="h" style="height: 35px; width: 80px"> &nbsp;cm
						                <span class="mx-3">체중</span>
						                <input class="bg-light form-control" name="w" style="height: 35px; width: 80px"> &nbsp;kg
						                <a class="btn btn-primary h-100 ml-3" href="javascript:result()">BMI 계산</a>
									</div>
									<div class="c-bmi__groups" readonly style="display: none">
										<span class="d-block">나의 체질량지수</span>
										
							            <input type="radio" id="bmi-g0" name="g" />
							            <label for="bmi-g0" name="l">저체중</label>
							              
							            <input type="radio" id="bmi-g1" name="g" checked />
							            <label for="bmi-g1" name="l">정상</label>
							              
							            <input type="radio" id="bmi-g2" name="g" />
							            <label for="bmi-g2" name="l">과체중</label>
							              
							            <input type="radio" id="bmi-g3" name="g" />
							            <label for="bmi-g3" name="l">경도비만</label>
							              
							            <input type="radio" id="bmi-g4" name="g" />
							            <label for="bmi-g4" name="l">중등도비만</label>
						            </div>
						            <div class="c-bmi__group-text font-weight-bold" name="text"></div>
						        </div>
							</div>
						</li>
					</ul>
					<button type="submit" class="btn btn-outline-primary mt-3">확인</button>
				</form>
			</div>
	    </div>
	    
	    <!-- 약복용 모달 시작 -->
	    <form action="#">
		    <div class="modal fade" id="myModal">
		    	<div class="modal-dialog modal-dialog-centered">
			      	<div class="modal-content">
			        	<div class="modal-header">
			          		<span class="modal-title font-weight-bold" style="font-size: 1.5rem">약 복용</span>
			        	</div>
				        <div class="modal-body">
				        	<div class="d-flex justify-content-between align-items-center">
				        		<div>
						         	<span>알람 여부</span>
						         	<label class="btn-onoff">
										<input type="checkbox" name="name" data-onoff="toggle"><span></span>
									</label>
								</div>
								<div class="d-inline-flex align-items-center">
									<span>복용 시간</span>
									<input type="time" class="form-control ml-3" name="pillTime" style="width: 150px"/>
								</div>
							</div>
							<div class="d-inline-flex align-items-center">
								<span>복용 정 수</span>
								<input type="number" class="form-control ml-3" name="pillCount" style="width: 100px"/>
							</div>
				        </div>
				        <div class="modal-footer">
				        	<button type="submit" class="btn btn-outline-info" data-dismiss="modal">확인</button>
				          	<button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
				        </div>
					</div>
			    </div>
		  	</div>
		</form><!-- 모달 끝 -->
    </div><!--container-->
</body>
</html>
<script>
	//+아이콘에 속성 추가(모달,마진)
	$('.fa-plus').each(function(){
		$(this).attr({'data-toggle':"modal",'data-target':"#myModal",style:'margin-left: 5px; cursor: pointer;'});
	})

	//증상체크
	$('.head').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('headSelcted');
		});
	});
	$('.respiratory').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('respSelcted');
		});
	});
	$('.stomach').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('stomachSelcted');
		});
	});
	$('.mental').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('mentalSelcted');
		});
	});
	$('.chest').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('chestSelcted');
		});
	});
	$('.body').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('bodySelcted');
		});
	});
	
	//컨디션 아이콘 클릭 이벤트
	$('.acco:eq(0)').children().click(function(){
		$('.acco:eq(0)').children().removeClass('circle');
		$(this).toggleClass('circle');
	});

	//달력 불러오기
	(function ($) {
	    $.bsCalendar.setDefault('width', 500);
	    $('#calendar_dropdown').bsCalendar({width: 300});
	    $('#calendar_inline').bsCalendar({width: '300px'});
	    $('#calendar_inline').bsCalendar('setDate', '2023-12-24');
	    $('#calendar_offcanvas').bsCalendar({width: '80%'});
	    $('#calendar_navbar').bsCalendar({width: 300});
	}(jQuery));
	
	//복용 약 추가하기
	function addList(){
		var origin = $('#add').prev();
		var clone = origin.clone();
		origin.after(origin.clone().children().val('').end());
	}
	
</script>
<!-- bmi 계산 -->
 <script>
 	var bmi = document.querySelector('.c-bmi');
 	var height = bmi.querySelector('input[name=h]');
 	var weight = bmi.querySelector('input[name=w]');
 	var gram = bmi.querySelectorAll('input[name=g]');
 	function result(){
 		bmi.querySelector('.c-bmi__groups').style.display='';
		var e=parseInt(height.value), //키 숫자타입으로 구하기
			t=parseInt(weight.value),//체중 숫자타입으로 구하기
		    i=parseFloat(t/(e/100)**2).toFixed(2),//bmi계산
		    h=[[0,18.49],[18.5,22.99],[23,24.99],[25,29.99],[30,100]]
	    	.findIndex(e=>
	        	e[0]<=i && i<e[1]
	        );            
	    gram[h].checked=!0
	
	    /*
	    [표준체중 계산 방법]
	    - 남성: 키(m) × 키(m) × 22
	   - 여성: 키(m) × 키(m) × 21
	    */
	   m=((e/100)*(e/100)*22).toFixed(2) //남자 표준 체중
	   f=((e/100)*(e/100)*21).toFixed(2) //여자 표준 체중

	   //성별 먼저 확인하기**************************
	   if(h!=1){
	   		console.log('당신의 적정 체중은'+(m-t)+'kg 입니다');
	        bmi.lastElementChild.innerHTML='당신의 BMI 지수는 <span class="text-info">'+i+'</span>이고<br/>적정 체중은 <span class="text-info">'+((m-t)>=0?"+"+(m-t).toFixed(2):(m-t).toFixed(2))+'kg</span> 입니다';
	   }
	   else{
	   		bmi.lastElementChild.innerHTML='정상입니다'
	   }
	}
	
	bmi.addEventListener('submit', result);
	bmi.dispatchEvent(new Event('input'));
</script>