<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="m" uri="/WEB-INF/tlds/common.tld" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>    
    <script src="https://kit.fontawesome.com/dedb6fdace.js" crossorigin="anonymous"></script>
    
    <!-- firebase -->
	<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-messaging.js"></script>

    <!-- fontaswem-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>    
  	
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value="/tsfolder/lib/animate/animate.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/tsfolder/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/tsfolder/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"/>" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet  누나꺼랑 겹침
    <link href="/tsfolder/css/bootstrap.min.css" rel="stylesheet">
     -->

    <!-- Template Stylesheet -->
    <link href="<c:url value="/tsfolder/css/style.css"/>" rel="stylesheet">
	
     <!-- Template Javascript -->
     <script src="<c:url value="/tsfolder/js/main.js"/>" ></script>
     
     <!-- googlefont -->
	<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2? family=Hahmlet&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
	<title>TemplateApplyingModule.jsp</title>
	<style>
        .bs-canvas-overlay {
            opacity: 0.85;
            z-index: 1100;
        }
        .bs-canvas {
            top: 0;
            z-index: 1110;
            overflow-x: hidden;
            overflow-y: auto;
            width: 330px;
            transition: margin .4s ease-out;
            -webkit-transition: margin .4s ease-out;
            -moz-transition: margin .4s ease-out;
            -ms-transition: margin .4s ease-out;
        }
        .bs-canvas-left {
            left: 0;
            margin-left: -330px;
        }
        .bs-canvas-right {
            right: 0;
            margin-right: -330px;
        }
        .bg-gra{
            background:white;
            z-index: 500;
            box-shadow: rgba(101, 101, 101, 0.3) 2px 2px 4px 4px;
        }
        .bg-gra1{
		    background: #FDCDBC;
            z-index: 500;
        }
        .text1{
            font-size: 3rem;
        }
        .text2{
        	font-size: 1.25rem;
        }
        /* 버튼 애니메이션 */
		.sidemenu a{
			display: block;
		    height: 60px;
		    line-height: 60px;
		    width: 100%;
		    position: relative;
		    margin-left: 17px;
		    color:black;
		    /*border-bottom: 3px dashed rgb(101, 101, 101, 0.3);*/
		}


.ditem {
	display:flex;
	flex-direction: column;
	justify-content: space-between;
	line-height: 30px;
	margin: 0px;
}
.ditem a {
	align-items:center;
	margin: 10px;
	padding: 3.5px;
	text-decoration: none;
}
.tsnavul {
	text-decoration: none;
	justify-content: center;
	align-items: center;
}
.tsnavli {
	margin: 0px 30px;
	color:black;
}
.tsnava1 {
	color: #FD9F28;
	font-weight: 600;
	align-items: center;
	font-size: 21px;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
}
.tsnava2 {
	color: #EF605D;
	font-weight: bold;
	font-size: 30px;
	align-items: flex-end;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    margin-right: 25px;
    padding-top: 0px;
}
.tsnava3 {
	color: black;
	font-weight: bold;
	font-size: 16px;
    padding-top: 10px;
}
.tsnava1:hover {
	color:black;
	text-decoration: none;
}
.tslogina span:hover {
	color:white;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
	text-decoration: none;
}

.tsnava2:after {
	display: none;
}
ul {
	list-style: none;
	margin-bottom: 0px;
}
		/* 드롭다운 버튼 스타일 */
        .dropdown-toggle {
            padding: 2px;
            cursor: pointer;
        }

        .dropdown-toggle:hover {
            background-color: black;
            color: white;
            border-radius: 10px;
            text-decoration: none;
        }

        /* 드롭다운 메뉴 스타일 */
        .dropdown-menu {
        	width:1760px;
            border: none;
            background-color: rgba(0,0,0,0);
        }
/*탑 메뉴 토글바 */
#ts__menu {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    z-index: 100;
    box-sizing: border-box;
}
#ts__menu .ts__menu__bg {
    position: fixed;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.22);
}
#ts__menu .pc__ts__menu {
    position: absolute;
    top: 20px;
    left: 260px;
    width: 1400px;
    background-color: #fff;
    padding-bottom: 20px;
    background-image: url(https://www.bundangcheil.com/images/pc_ham_menu_bg.svg);
    background-repeat: no-repeat;
    background-position: 95% 100%;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
    border-radius: 50px 0px 50px 50px;
    border: 2px solid #EF605D;
}
#ts__menu .ts__box {
    width: 100%;
    max-width: 1500px;
    margin: 0 auto;
    display: flex;
    border: 1px solid rgba(112,112,112,0.15);
    border-top: 0;
    border-bottom: 0;
    min-height: 390px;
    height: 100%;
}
#ts__menu .ts__box .left__wr {
    width: calc(100% - 400px);
    display: flex;
}
#ts__menu .ts__box .left__wr li {
    width: 25%;
    border-right: 1px solid rgba(112,112,112,0.15);
    padding: 45px 34px;
    list-style: none;
}
#ts__menu .ts__box .left__wr li .title {
    font-size: 23px;
    font-weight: bold;
    color: #152358;
    padding-bottom: 30px;
}
#ts__menu .ts__box .left__wr li a {
    display: block;
    width: 100%;
    text-decoration: none;
    line-height: 50px;
    color: black;
}
#ts__menu .ts__box .right__wr {
    width: 400px;
    padding-top: 20px;
    margin-bottom: 20px;
    text-align: center;
    position: relative;
}
#ts__menu .ts__box .right__wr div a {
    text-decoration: none;
    font-weight:bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    color: black;
}
#ts__menu .ts__box .right__wr .home__btn {
    display: inline-block;
    width: 102px;
    height: 40px;
    line-height: 40px;
    border: none;
    border-radius: 50px;
    background-color: #FDCDBC;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    margin-top: 26px;
}
    </style>
</head>
<body>
<div class="container-fluid position-relative p-0" style="width:100%;">
	 <nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="justify-content:space-around; padding:10px 0px;" id="navbar">

        <a class="navbar-brand" href="<c:url value='/' />">
        	<img src="<c:url value='/images/mainicon.png' />" width="50" height="40">
        	<img src="<c:url value='/images/maintitle.png' />" width="160" height="40">
        </a>
        
        <ul class="tsnavul d-flex" >
        	<li class="tsnavli">
	            <a class="tsnava1" href="<c:url value="/NutrientSelect.do"/>">
	             영양성분 검색
	            </a>
	       </li>
	       <li class="tsnavli">
	            <a class="tsnava1" href="<c:url value="/ranking/selectfood.do"/>">
	             영양제 검색
	            </a>
	       </li>
	       <li class="tsnavli" >
	            <a class="tsnava1" href="<c:url value="/magazineindex.do"/>">
	             메디큐 칼럼
	            </a>
	       </li>
	       <li class="tsnavli">
	            <a class="tsnava1" href="<c:url value="/board/List.do" />">
	             커뮤니티
	            </a>
	       </li>
        </ul>
        
        <fmt:bundle basename="config.tokens">
			<fmt:message key="secret-key" var="key"/>
        </fmt:bundle>
        <c:set var="token" value="${cookie['User-Token'].value }"/>
        <c:set var="payload" value='${m:getTokenPayloads(token,key) }' />
        <ul class="d-flex" style="margin-right: 50px;">
        	<li class="text2 mx-2 dropdown" style="display:flex; align-items: center;">
        		<c:if test="${not empty token}" var="isLogin">       
                    <a class="tslogina" style="text-decoration: none;" href="<c:url value="/project/MyPage.do"/>"><span class="tsnava3" ><span style="color:#EF605D;">'${payload.name}'</span>님 반갑습니다</span></a>
                </c:if>
                <c:if test="${not isLogin}">
                    <a class="tslogina" style="text-decoration: none;" href="<c:url value="/project/Login.do"/>"><span class="tsnava3" >로그인 후 이용해 주세요</span></a>        
                </c:if>
        	</li>
	        <li class="text2 mx-2 dropdown">
	            <!--<a class="tsnava2 dropdown-toggle" role="button" id="navbarDropdown" data-toggle="dropdown">${empty token ? "로그인 후 이용해 주세요" : payload.name+="님 반갑습니다" }</a>-->
	             <a class="tsnava2 dropdown-toggle" role="button" id="navbarDropdown" data-toggle="dropdown">&#9776;</a>
	            <div class="dropdown-menu dropdown-menu-right" style="text-align: center;" aria-labelledby="navbarDropdown">
	            	<div id="ts__menu" class="on" style="display: block;">
						<div class="ts__menu__bg"></div>
						<div class="pc__ts__menu">
							<div class="ts__box">
								<ul class="left__wr">
									<li>
										<p class="title">영양소 찾기</p>
										<a href="<c:url value="/NutrientSelect.do"/>">인기 영양소</a>
							            <a href="<c:url value="/NutrientSelectVitamin.do"/>">비타민</a>	   
							            <a href="<c:url value="/NutrientSelectMineral.do"/>">미네랄 및 기타영양소</a>	         
							            <a href="<c:url value="/NutrientSelectFunctional.do"/>">기능성 원료</a>
										
									</li>
									<li>
										<p class="title">영양제 찾기</p>
										<a href="<c:url value="/ranking/selectfood.do"/>">전체 검색</a>
							            <a href="<c:url value="/ranking/selectfoodnutrient.do"/>">성분 검색</a>	 			
							            <a href="<c:url value="/ranking/selectfoodcompany.do"/>">제품명/브랜드 검색</a>										
									</li>
									<li>
										<p class="title">정신건강 테스트</p>
										<a href="<c:url value="/project/MentalTest1.do"/>">심리적 스트레스</a>
										<a href="<c:url value="/project/MentalTest2.do"/>">흡연 유형 평가</a>			
										<a href="<c:url value="/project/MentalTest3.do"/>">알코올 의존(AUDIT-K)</a>				
										<a href="<c:url value="/project/MentalTest4.do"/>">우울증(CES-D)</a>									
									</li>
									<li>
										<p class="title">무엇을 넣지</p>
										<a class="dropdown-item" href="<c:url value="/AdminMain.do"/>">관리자</a>
	                    				<a class="dropdown-item" href="<c:url value="/test1.do"/>">태현(테스트)</a>
										
									</li>
								</ul>
								<div class="right__wr">
									<img src="<c:url value="/images/tsimages/mascot.png"/>" style="height: 230px; width: 400px;" >
									<div class="d-flex">
						                <c:if test="${not empty token}" var="isLogin">       
						                    <a class="dropdown-item" href="<c:url value="/project/MyPage.do"/>">마이 페이지</a>
						                    <a class="dropdown-item" href="<c:url value="/project/Logout.do"/>">로그아웃</a>
						                </c:if>
						                <c:if test="${not isLogin}">
						                    <a class="dropdown-item" href="<c:url value="/project/Login.do"/>">로그인</a>        
						                    <a class="dropdown-item" href="<c:url value="/project/Join.do"/>">회원가입</a>       
						                </c:if>
					                </div>
									<a href="<c:url value='/' />" class="home__btn">Home<img src="https://www.bundangcheil.com/images/pcham_menu_arrow.svg" alt="이동"></a>
								</div>
							</div>
						</div>
					</div>
	            </div>
	        </li>
	    </ul>
    </nav>
    <!-- navbar left side
    				<div class="d-flex">
		                <c:if test="${not empty token}" var="isLogin">       
		                    <a class="dropdown-item" href="<c:url value="/project/MyPage.do"/>">마이 페이지</a>
		                    <a class="dropdown-item" href="<c:url value="/project/Logout.do"/>">로그아웃</a>
		                    <a class="dropdown-item" href="<c:url value="/AdminMain.do"/>">관리자</a>
		                    <a class="dropdown-item" href="<c:url value="/test1.do"/>">태현(테스트)</a>
		                    <a class="dropdown-item" href="#">테스트용</a>
		                </c:if>
		                <c:if test="${not isLogin}">
		                    <a class="dropdown-item" href="<c:url value="/project/Login.do"/>">로그인</a>        
		                    <a class="dropdown-item" href="<c:url value="/project/Join.do"/>">회원가입</a>       
		                </c:if>
	                </div>
    
    
    
    
    
    <div class="bs-canvas bs-canvas-left position-fixed h-100 justify-content-start" style="z-index:99999; background: linear-gradient(to bottom, #ffffff, #FFFAFA);">
        <header class="bs-canvas-header p-4 bg-gra1 justify-content-center align-items-center">
        	<h4 class="d-inline-block mb-0 text1">
        		<img src="<c:url value='/images/mainicon.png' />" width="30" height="35">
        		<img src="<c:url value='/images/maintitle.png' />" width="140" height="35">
        	</h4>
            <button type="button" class="bs-canvas-close close mt-2" aria-label="Close">
                <span aria-hidden="true" class="text-dark text1">&times;</span>
            </button>
        </header>

        <div class="bs-canvas-content px-3 pb-5 ">
            <div class="accordion">
             <div class="section" >
		          <h3>
		            <a class="text-decoration-none font-weight-bold" href="<c:url value="/"/>">
		            <img src="<c:url value="/images/tsimages/free-icon-home-3771140.png"/>" style="opacity: 0.7;" width="25" height="25">
		         
		             &nbsp; 홈으로 가기
		            
		            </a>
		          </h3>
	        </div>
	        
	        <div id="one" class="section" active:false>
	          <h3 class="d-flex">
	            <a href="#one" style="align-items: center;">
	                <img src="<c:url value="/images/tsimages/free-icon-vitamins-525955.png"/>" width="25" height="25">
	                &nbsp; 영양성분 검색
	                <span class="arrow-down" style="margin-left: 70px;" ></span>
	            </a>
	          </h3>
	          <div class="ditem">
	            <a href="<c:url value="/NutrientSelect.do"/>">인기 영양소</a>
	 
	            <a href="<c:url value="/NutrientSelectVitamin.do"/>">비타민</a>
	   
	            <a href="<c:url value="/NutrientSelectMineral.do"/>">미네랄 및 기타영양소</a>
	         
	            <a href="<c:url value="/NutrientSelectFunctional.do"/>">기능성 원료</a>
	          </div>
	        </div>
	        <div  id="two" class="section" active:false>
	          <h3 class="d-flex">
	            <a href="#two" class="text-decoration-none" style="align-items: center;">
	                <img src="<c:url value="/images/shape/캡슐.png"/>" style="opacity: 0.8;" width="25" height="25">
	                &nbsp; 영양제 검색
	                <span class="arrow-down" style="margin-left: 90px;" ></span>
	            </a>
	          </h3>
	          <div class="ditem tstm3">
	          	<a href="<c:url value="/ranking/selectfood.do"/>">전체 검색</a>
	          	
	            <a href="<c:url value="/ranking/selectfoodnutrient.do"/>">성분 검색</a>
	 			
	            <a href="<c:url value="/ranking/selectfoodcompany.do"/>">제품명/브랜드 검색</a>
	          </div>
	        </div>
	        <div id="three" class="section">
	          <h3>
	            <a class="text-decoration-none" href="<c:url value="/magazineindex.do"/>">
	                <img src="<c:url value="/images/tsimages/free-icon-whats-new-5511348.png"/>" width="25" height="25">
	                &nbsp; 메디큐 칼럼
	            </a>
	        </div>
	        <div id="four" class="section large">
	          <h3>
	            <a class="text-decoration-none" href="#">
	                <img src="<c:url value="/images/tsimages/free-icon-data-analysis-3449317.png"/>" width="25" height="25">
	                &nbsp; 분석 및 결과
	            </a>
	          </h3>
	        </div>
	        <div id="five" class="section">
	          <h3>
	            <a class="text-decoration-none" href="<c:url value="/board/List.do" />">
	                <img src="<c:url value="/images/tsimages/free-icon-chat-724715.png"/>" width="25" height="25">
	                &nbsp; 커뮤니티
	            </a>
	          </h3>
	        </div>
	        <div id="six" class="section" active:false>
	          <h3 class="d-flex">
	            <a href="#six" style="align-items: center;">
	                <img src="<c:url value="/images/tsimages/free-icon-lifestyle-4807765.png"/>" width="25" height="25">
	                &nbsp; 정신건강 테스트
	                <span class="arrow-down" style="margin-left: 120px;"></span>
	            </a>
	          </h3>
	          <div class="ditem" style="border: none;">
	              <a href="<c:url value="/project/MentalTest1.do"/>">심리적 스트레스</a>
	      
				  <a href="<c:url value="/project/MentalTest2.do"/>">흡연 유형 평가</a>
			
				  <a href="<c:url value="/project/MentalTest3.do"/>">알코올 의존(AUDIT-K)</a>
				
				  <a href="<c:url value="/project/MentalTest4.do"/>">우울증(CES-D)</a>
	          </div>
	        </div>
	      </div>
        </div>
    </div>
	navbar left side end-->
</div>
<script>
	const firebaseConfig = {
        apiKey: "AIzaSyBVyjlJuzy9Qd41-v2meIh79Ti7OEm0TSc",
        authDomain: "my-project-a3614.firebaseapp.com",
        projectId: "my-project-a3614",
        storageBucket: "my-project-a3614.appspot.com",
        messagingSenderId: "337911613778",
        appId: "1:337911613778:web:707752d0cacb5e27eed28b",
        measurementId: "G-D28J07Z2PH"
    };
	
	firebase.initializeApp(firebaseConfig);
	
	document.addEventListener('DOMContentLoaded', function() {
		if ('serviceWorker' in navigator) {
			const messaging = firebase.messaging();        	
	        navigator.serviceWorker.register("../firebase-messaging-sw.js")
                    .then(register => {         
                    	//console.log('register:',register)
                         messaging.requestPermission()
                        .then(function() {
                            return messaging.getToken();  
                        })
                        .then(async function(token) {
                        	//Firebase콘솔에 앱과 웹 두개를 추가하고 그래야 메시지 전송버튼이 보임
                            //아래 토큰을 복사해서 파이어베이스 콘솔에서 메시지를 보낸다
                            //혹은 스프링 REST API에서 메시지를 보낸다
                        	await fetch('/webpush', { method: 'post', body: token})
                        	
                        	//포그라운드일 때
                            messaging.onMessage(payload => {
                            	var dts = new Date(2023, 6, 22, 19, 51, 0, 0);
                                const title = payload.notification.title
                                const options = {
                                    body : payload.notification.body,
                                    icon: payload.notification.icon,
                                    timestamp: dts
                                }
                                //const notification = new Notification(title,options);
								
                                navigator.serviceWorker.ready.then(registration => {
                                    registration.showNotification(title, options);
                                    console.log('time:',options.timestamp)
                                })
                                
                            })
                        })
                        .catch(function(err) {
                            console.log("Error Occured");
                        })
                    })
		}
	});
	//스크롤을 내리면 값에 변화에 따라 배경색 주기
	jQuery(document).ready(function ($) {
	    $(window).scroll(function () {
	        var $this = $(window);
	
	        if ($this.scrollTop() > 200) {
	            $('#navbar').addClass('bg-gra');
	        } else {
	            $('#navbar').removeClass('bg-gra');
	        }
	    });
	});
</script>
 