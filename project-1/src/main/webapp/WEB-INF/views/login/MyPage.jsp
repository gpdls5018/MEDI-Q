<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- MyPage.jsp -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- 
<script src="<c:url value="/resources/dist/jquery.bs.calendar.js"/>" ></script>
 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- 로그인 후에만 들어올 수 있도록 -->
<style>
	a:hover{
		text-decoration: none;
		color: rgb(13, 184, 193);
	}
	a{
		color: black;
	}
	.borderline{
		border: solid 1.5px lightgrey;
	}
	.custom-file-input:lang(en)~.custom-file-label::after {
        content: "파일찾기";
    }
	body{
        padding: 0;
        margin: 0;
        list-style: none;
    }
    /*
    .calendar {
    	margin-top: 50px;
    	display: none;
    	left: 0;
    	background-color: white;
        height: 100%;
        width: 500px;
        position: fixed;
        transition: left .3s;
    }*/
</style>

<!-- datepicker css -->
<style>
        .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 

        .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 

        .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 

        .ui-state-default,
        .ui-widget-content .ui-state-default,
        .ui-widget-header .ui-state-default,
        .ui-button,
        html .ui-button.ui-state-disabled:hover,
        html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 

        .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 

        .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 

        .ui-widget.ui-widget-content { border: 1px solid #eee; } 

        #datepicker:focus>.ui-datepicker { display: block; } 

        .ui-datepicker-prev,
        .ui-datepicker-next { cursor: pointer; } 

        .ui-datepicker-next { float: right; } 

        .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 

        .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 

        .ui-datepicker-calendar { width: 100%; } 

        .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 

        .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

        .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 

        .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 

        .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 

        .ui-state-hover,
        .ui-widget-content .ui-state-hover,
        .ui-widget-header .ui-state-hover,
        .ui-state-focus,
        .ui-widget-content .ui-state-focus,
        .ui-widget-header .ui-state-focus,
        .ui-button:hover,
        .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 

        .ui-widget-header .ui-icon { background-image: url('<c:url value="/resources/images/basic/btns.png"/>'); } 

        .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 

        .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 

        .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 

        .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 

        .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 

        .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 

        .ui-state-highlight,
        .ui-widget-content .ui-state-highlight,
        .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 

        .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 

        .inp:focus { outline: none; background-color: #eee; } 
</style>
<body>
	<div class="container" style="margin-top: 50px">
		<!-- 캘린더 
		<div class="calendar">
	        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
	            <h5 class="text-center text-secondary" id="offcanvasExampleLabel">일정확인</h5>
	            <div class="offcanvas-body d-flex justify-content-center p-0">
	                <div data-bs-toggle="calendar" id="calendar_offcanvas" class="rounded w-75" data-bs-target="<c:url value="/resources/demo/events.json"/>"></div>
	            </div>
	        </div>
	    </div>
	    <div class="dropdown-center">
	        <div class="dropdown-menu p-0">
	            <div data-bs-toggle="calendar" id="calendar_dropdown" data-bs-target="<c:url value="/resources/demo/events.json"/>"></div>
	        </div>
	    </div>
	
	    <div data-bs-toggle="calendar" id="calendar_inline" class="col shadow rounded" data-bs-target="<c:url value="/resources/demo/events.json"/>" style="display: none;"></div>
	     달력 끝 -->
	    
	    <div style="height: 50px"></div>
		<div class="rounded-lg borderline p-3 mb-3 shadow">
			<div class="row d-flex px-3 py-3" >
				<c:if test="${info.prof_Img_Fl eq 'Y' }" var="isProfImg">
					<c:set var="uploadFolder" value="${fn:split(profImg.pi_Path,'\\\\')[fn:length(fn:split(profImg.pi_Path, '\\\\'))-1] }"/>
					<img class="rounded-circle" alt="사용자 이미지" src="<c:url value="/resources/images/${uploadFolder }/${profImg.pi_Filename }.${profImg.pi_Ext }" />" style="width: 80px; height: 80px">
				</c:if>
				<c:if test="${not isProfImg }">
					<img class="rounded-circle" alt="기본 프로필" src="<c:url value="/resources/images/basic/friend.png" />" style="width: 80px; height: 80px">
				</c:if>
				<span class="align-self-center mr-auto ml-2" id="id" style="font-weight: bold">${info.id }</span>
				<a type="button" class="btn btn-outline-info align-self-center mx-2" href="javascript:viewCalendar()">건강기록</a>
				<a type="button" class="btn btn-outline-info align-self-center mx-2" href='<c:url value="/project/MentalTest.do"/>'>정신건강 테스트</a>
				<a type="button" class="btn btn-outline-info align-self-center" href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>">건강검진정보 불러오기</a>
				<input type="button" id="imgEdit" value="이미지 수정" class="btn btn-outline-info align-self-center mx-2" data-target="#modalView" data-backdrop="static"/>
				<a type="button" href="" class="btn btn-outline-info align-self-center" data-target="#modalView" data-backdrop="static">회원정보 수정</a>
			</div>
		</div>
		
		<input class="datepicker" style="display: none" placeholder="날짜를 선택해 주세요">
		
<!-- 건강기록 css -->
<style>
.acco img,i{
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

.diaryStart{
	margin-left: 200px;
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

		<div class="row diaryStart">	        
	        <div class="col diary" style="max-width: 800px">
	        	<form action="#">
	        		<input type="hidden" name="img" value=""/>
	        		<!-- 다른 날짜 클릭하면 클릭한 날짜가 보이도록 -->
					<h1><span class="clickDate">${current }</span> 건강 기록</h1>
					
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
								<h2 class="flipIn">복용 영양제</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="add">
									<input class="form-control" value="비타민" style="height: 35px; width: 100px">
									<input class="form-control mx-2" type="number" min="1" max="6" value="1" style="height: 35px; width: 50px"> 정
									<i class="xmark fa-regular fa-circle-xmark ml-1"></i>
								</div>
								<div class="add">
									<input class="form-control" value="철분제" style="height: 35px; width: 100px">
									<input class="form-control mx-2" type="number" min="1" max="6" value="1" style="height: 35px; width: 50px"> 정
									<i class="xmark fa-regular fa-circle-xmark ml-1"></i>
								</div>
								<div class="add">
									<input class="form-control" value="엽산" style="height: 35px; width: 100px">
									<input class="form-control mx-2" type="number" min="1" max="6" value="1" style="height: 35px; width: 50px"> 정
									<i class="xmark fa-regular fa-circle-xmark ml-1"></i>
								</div>
								<a href="javascript:addList()" id="add">추가</a>	
							</div>							
						</li>
<!-- 알레르기 css -->				
<style>
	.full{
		background-color: coral;
		border-radius: 10%;
	}
	.allergy{
		padding-left: 0;
		padding-right: 0;
		margin: 5px 5px;
	}
</style>	
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">알레르기</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="row mx-1">
									<div class="col allergy">
								    	<img class="d-block mx-auto" alt="알류" src='<c:url value="/resources/images/allergy/egg.png"/>'>
								    	<small class="d-block text-center">알류</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="우유" src='<c:url value="/resources/images/allergy/milk.png"/>'>
								    	<small class="d-block text-center">우유</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="메밀" src='<c:url value="/resources/images/allergy/memil.png"/>'>
								    	<small class="d-block text-center">메밀</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="땅콩" src='<c:url value="/resources/images/allergy/peanut.png"/>'>
								    	<small class="d-block text-center">땅콩</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="대두" src='<c:url value="/resources/images/allergy/bean.png"/>'>
								    	<small class="d-block text-center">대두</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="밀" src='<c:url value="/resources/images/allergy/wheat.png"/>'>
								    	<small class="d-block text-center">밀</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="고등어" src='<c:url value="/resources/images/allergy/mackerel.png"/>'>
								    	<small class="d-block text-center">고등어</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="게" src='<c:url value="/resources/images/allergy/crab.png"/>'>
								    	<small class="d-block text-center">게</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="새우" src='<c:url value="/resources/images/allergy/shrimp.png"/>'>
								    	<small class="d-block text-center">새우</small>	
							    	</div>
							    </div>
							    <div class="row mx-1">
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="토마토" src='<c:url value="/resources/images/allergy/tomato.png"/>'>
								    	<small class="d-block text-center">토마토</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="복숭아" src='<c:url value="/resources/images/allergy/peach.png"/>'>
								    	<small class="d-block text-center">복숭아</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="호두" src='<c:url value="/resources/images/allergy/walnut.png"/>'>
								    	<small class="d-block text-center">호두</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="돼지고기" src='<c:url value="/resources/images/allergy/pork.png"/>'>
								    	<small class="d-block text-center mx-n2">돼지고기</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="닭고기" src='<c:url value="/resources/images/allergy/chicken.png"/>'>
								    	<small class="d-block text-center">닭고기</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="쇠고기" src='<c:url value="/resources/images/allergy/beef.png"/>'>
								    	<small class="d-block text-center">쇠고기</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="오징어" src='<c:url value="/resources/images/allergy/squid.png"/>'>
								    	<small class="d-block text-center">오징어</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="조개류" src='<c:url value="/resources/images/allergy/clam.png"/>'>
								    	<small class="d-block text-center">조개류</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="잣" src='<c:url value="/resources/images/allergy/pinenut.png"/>'>
								    	<small class="d-block text-center">잣</small>	
							    	</div>
							    </div>
								<a href="javascript:addInput()" id="addInput">추가</a>	
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
						
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">기타 메모</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요" rows="5"></textarea>
							</div>
						</li>
					</ul>
					<button type="submit" id="memoSend" class="btn btn-outline-primary mt-3">확인</button>
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
	
		<!-- 수정/삭제시 사용할 모달 시작 -->
		<div class="modal fade" id="modalView">	
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h5 class="modal-title">모달 헤더</h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body d-flex justify-content-center" style="height: 130px">
						<form class="form-inline justify-content-center" action="" method="POST">
							<input type="hidden" name="mode" value="editBtn"/>			
							<input type="hidden" name="id" value="${info.id }"/>
							<input type="password" name="password" class="form-control mx-2" placeholder="비밀번호를 입력하세요"/>
							<div class="custom-file" style="width: 300px; display: none">
					            <input type="file" class="custom-file-input" name="file" id="customFile" accept=".jpg,.img,.png,.bmp,.gif">
					            <label class="custom-file-label justify-content-start" for="customFile">${empty profImg ? "파일 선택" : profImg.pi_Filename+='.'+=profImg.pi_Ext }</label>
					        </div>
					        <a type="button" name="defaultImg" href="<c:url value="/project/ProfImgEdit.do"/>" class="btn btn-outline-info mx-2" style="display: none">기본이미지로 변경</a>
							<input type="submit" class="btn btn-info mx-2" value="확인" />
						</form>			
					</div>
				</div>
			</div>
		</div>
		<!-- 수정/삭제시 사용할 모달 끝 -->
	</div><!-- 컨테이너 -->
</body>
</html>
<script>
/*
	//캘린더
	function viewCalendar(){
		$('.calendar').toggle();
		(function ($) {
	        $.bsCalendar.setDefault('width', 500);
	        $('#calendar_dropdown').bsCalendar({width: 300});
	        $('#calendar_inline').bsCalendar({width: '300px'});
	        $('#calendar_inline').bsCalendar('setDate', '2023-12-24');
	        $('#calendar_offcanvas').bsCalendar({width: '80%'});
	        $('#calendar_navbar').bsCalendar({width: 300})
	    }(jQuery));
	}
*/	
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});
	function viewCalendar(){
		$(function(){
		  $('.datepicker').datepicker().toggle('.datepicker');
		})
	}
	$('.datepicker').change(function(){
		//console.log('datepicker:',$(this).val())	
		$('.clickDate').html($(this).val())
	});
	
	//건강기록 저장하기
	$('#memoSend').click(function(){
		
		var head='',respiratory='',stomach='',mental='',chest='',body = '';
		
		$('.acco').find('.headSelcted').each(function(){
			head += $(this).html()+' ';
		});
		head = head.substring(0,parseInt(head.length)-1);

		$('.acco').find('.respSelcted').each(function(){
			respiratory += $(this).html()+' ';
		});
		respiratory = respiratory.substring(0,parseInt(respiratory.length)-1);

		$('.acco').find('.stomachSelcted').each(function(){
			stomach += $(this).html()+' ';
		});
		stomach = stomach.substring(0,parseInt(stomach.length)-1);

		$('.acco').find('.mentalSelcted').each(function(){
			mental += $(this).html()+' ';
		});
		mental = mental.substring(0,parseInt(mental.length)-1);

		$('.acco').find('.chestSelcted').each(function(){
			chest += $(this).html()+' ';
		});
		chest = chest.substring(0,parseInt(chest.length)-1);

		$('.acco').find('.bodySelcted').each(function(){
			body += $(this).html()+' ';
		});
		body = body.substring(0,parseInt(body.length)-1);
		
		//복용 영양제+정 수
		var nutrients = '';
		$('.add').find('input').each(function(index){
			//console.log('count:',count)
			if(index%2==0){
				nutrients += $(this).val();
			}
			else{
				nutrients += '/'+$(this).val()+'$';
			}		
		});
		nutrients = nutrients.substring(0,parseInt(nutrients.length)-1);
		
		//알레르기
		var allergy = '';
		$('.acco').find('.full').each(function(){
			allergy += $(this).find('small').html()+' ';
		});
		allergy = allergy.substring(0,parseInt(allergy.length)-1);

		$.ajax({
			data:{
				date:$('.clickDate').html(),
				id:$('#id').html(),
				condition:$('.acco').find('.circle').prop('alt'),
				head:head,
				respiratory:respiratory,
				stomach:stomach,
				mental:mental,
				chest:chest,
				body:body,
				nutrients:nutrients,
				allergy:allergy,
				height:height.value,
				weight:weight.value,
				content:$('[name=content]').val()
			},
			url:'/project/Memo.do',
			dataType:'json',
			method:'post'
		}).done(function(data){
			console.log('success',data)
		}).fail(function(){
			console.log('fail')
		});
		return false;
	});
</script>
	
<script>
/*
	//'+' 아이콘에 속성 추가(모달,마진)
	$('.fa-plus').each(function(){
		$(this).attr({'data-toggle':"modal",'data-target':"#myModal",style:'margin-left: 5px; cursor: pointer;'});
	})
*/
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
	
	//알레르기 아이콘 클릭 이벤트
	$('.allergy').click(function(){
		$(this).toggleClass('full');
	});
	
	//복용 약 추가하기
	function addList(){
		var origin = $('#add').prev();
		var clone = origin.clone();
		origin.after(clone.children(':eq(0)').val('').end().children(':eq(1)').val('1').end())
		//복용 약 삭제하기
		$('.xmark').click(function(){
			$(this).parent().remove()
		});
	}
	
	//복용 약 삭제하기
	$('.xmark').click(function(){
		$(this).parent().remove()
	});
	
	
	//알레르기 추가하기
	function addInput(){
		var input = `<div class="row m-1">
						<input class="form-control" placeholder="알레르기명" style="height: 35px; width: 110px">
						<i class="xmark fa-regular fa-circle-xmark ml-2 align-self-center"></i>
					</div>`;
		$('#addInput').prev().after(input);
		
		//추가한 알레르기 삭제하기
		$('.xmark').click(function(){
			$(this).parent().remove()
		});
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

<script>
	//이미지 수정하기
	$('#imgEdit').click(function(){
		$(this).attr('data-toggle','modal');
		$('form').attr('action','<c:url value="/project/ProfImgEdit.do"/>');
		$('form').attr('enctype','multipart/form-data');
		$('.modal-title').html('수정할 프로필 이미지를 선택해주세요');
		$('input[type=password]').css('display','none');
		$('.custom-file').css('display','');
		$('a[name=defaultImg]').css('display','');
		
		$(".custom-file-input").on("change", function() {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings().html(fileName);
        });
	})

	//회원 정보 수정하기
	$('#imgEdit').next().click(function(){
		$(this).attr('data-toggle','modal');
		$('form').attr('action','<c:url value="/project/Password.do"/>');
		$('.modal-title').html('회원정보 수정을 위해 비밀번호를 입력해주세요');
		$('.custom-file').css('display','none');
		$('a[name=defaultImg]').css('display','none');
		$('input[type=password]').css('display','');
	});
</script>