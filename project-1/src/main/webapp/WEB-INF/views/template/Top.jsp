<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- fontaswem-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>    
  	
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value="/resources/tsfolder/lib/animate/animate.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/tsfolder/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/tsfolder/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"/>" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet  누나꺼랑 겹침
    <link href="/resources/tsfolder/css/bootstrap.min.css" rel="stylesheet">
     -->

    <!-- Template Stylesheet -->
    <link href="<c:url value="/resources/tsfolder/css/style.css"/>" rel="stylesheet">
	
     <!-- Template Javascript -->
     <script src="<c:url value="/resources/tsfolder/js/main.js"/>" ></script>
     
     <!-- googlefont -->
	<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2? family=Hahmlet&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<style>
	body {
	    font-family:'동글', 산세리프;
	}
	span i:hover {
	  cursor: pointer;
	  border: 2px solid gray;
	  border-radius: 5px;
	}
</style>
     
    <title>TemplateApplyingModule.jsp</title>

</head>
<script>
	
//비디오 전체화면


	//쿠키값 가져오는 함수
	function getCookieValue(cookieName) {
		//debugger
		var cookies = document.cookie.split("; ");
	  	for (var i = 0; i < cookies.length; i++) {
	    	var cookie = cookies[i].split("=");
	    	var name = cookie[0];
	    	var value = cookie[1];
	    	if (name === cookieName) {
	      		return value;
	    	}
	  	}
	  	return "";
	}
	
	document.addEventListener("DOMContentLoaded", function() {
		//쿠키값 가져와서 로그인 상태 확인 함수
		function checkLoginStatus() {
		var token = getCookieValue("User-Token");
		//console.log("token",token);
		  	if(token) {
		    	// 토큰이 존재하면 로그인 상태로 간주
		    	// 로그아웃 버튼 보이기
		    	document.querySelector(".mypage").style.display = "";
		    	document.querySelector(".logout").style.display = "";
		    	document.querySelector(".login").style.display = "none";
		  	} else {
		    	// 토큰이 존재하지 않으면 로그아웃 상태로 간주
		    	// 로그아웃 버튼 숨기기
		    	document.querySelector(".mypage").style.display = "none";
		    	document.querySelector(".logout").style.display = "none";
		    	document.querySelector(".login").style.display = "";
		  	}
		}
		
		// 페이지 로딩 시 로그인 상태 확인
		checkLoginStatus();
	});
</script>
<body>
<div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-white mb-2 px-2 px-lg-5 py-lg-2 py-lg-0 justify-content-between" style="position: fixed; background-color: white; box-shadow: 0px 0px 5px #000; width: 100%;">
            <div id="mySidenav" class="sidenav">
                <div class="sidebar-header d-flex justify-content-start">
                    <img class="px-2"src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="50" height="25">
		            <img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="100" height="25">
                    <a class="sidenava1 ml-5 " href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="color:black;"><i class="fa-sharp fa-solid fa-circle-xmark fa-xl" style="color: #a3aec2;"></i></a>                    
                </div>
                <div class="container">
                    <ul class="list-unstyled components">
                        <li><a href="<c:url value="/NutrientSelect.do"/>" class="sidenava2" >
                            <img src="<c:url value="/resources/images/tsimages/free-icon-vitamins-525955.png"/>" loading="lazy" width="25" height="25" style="color: transparent;"/>
                            영양소</a></li>
                        <li><a class="sidenava4" href="<c:url value="/magazineindex.do"/>">
                            <img src="<c:url value="/resources/images/tsimages/free-icon-whats-new-5511348.png"/>" loading="lazy" width="25" height="25" style="color: transparent;"/>
                            Magazine(뉴스)</a></li>
                        <li><a class="sidenava3" href="#">
                            <img src="<c:url value="/resources/images/tsimages/free-icon-data-analysis-3449317.png"/>" loading="lazy" width="25" height="25" style="color: transparent;"/>
                            분석 및 결과</a></li>
                        <li><a class="sidenava5" href="#">
                            <img src="<c:url value="/resources/images/tsimages/free-icon-checkmark-9887473.png"/>" loading="lazy" width="25" height="25" style="color: transparent;"/>
                            섭취/체크</a></li>
                        <li><a class="sidenava6" href="#">
                            <img src="<c:url value="/resources/images/tsimages/free-icon-chat-724715.png"/>" loading="lazy" width="25" height="25" style="color: transparent;"/>
                            커뮤니티</a></li>
                        <li><a class="sidenava7" href="#">
                            <img src="<c:url value="/resources/images/tsimages/free-icon-lifestyle-4807765.png"/>" loading="lazy" width="25" height="25" style="color: transparent;"/>
                            건강예측</a></li>
                        <li><a class="sidenava8" href="#">
                            <img src="<c:url value="/resources/images/tsimages/free-icon-pharmacy-1404402.png"/>" loading="lazy" width="25" height="25" style="color: transparent;"/>
                            인근 의료기관</a></li>
                    </ul>
                </div>
              </div>
              
              <!-- 요소를 사용하여 navbar 열기-->
              <span onclick="openNav()"><i class="fas fa-solid fa-bars fa-2x mx-2" style="color: #EF605D;"></i></span>
				
		    
	        <a href="<c:url value="/" />" class="d-flex navbar-brand p-0 justify-content-end" style="width:55%;">
                <img class="px-2"src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="50" height="25">
           		<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="100" height="25">
           	</a>
           <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
           		<div class="mypage">
           			<a class="nav-link text-dark" href="<c:url value="/project/MyPage.do" />">마이페이지 <i class="fa-solid fa-paper-plane"></i></a><!-- 마이페이지 -->
           		</div>
	            <ul class="navbar-nav">
	                <li class="nav-item logout">
				        <a href="<c:url value="/project/Logout.do" />" class="btn btn-primary rounded-pill py-2 px-4 active">로그아웃 <i class="fa-regular fa-face-smile"></i></a><!-- 로그아웃(토큰) -->
				    </li>
	                <li class="nav-item login">
	                	<a href="<c:url value="/project/Login.do"/>" class="btn btn-primary rounded-pill py-2 px-4 active">로그인 <i class="fa-regular fa-face-meh"></i></a><!-- 로그인(토큰) -->
	                </li>
	          	</ul>
            </div>
        </nav>
    </div>

 