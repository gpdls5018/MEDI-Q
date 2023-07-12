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
            background: linear-gradient(180deg,#ffa585,#fedacd);
            z-index: 500;
        }
        .text1{
            font-size: 3rem;
        }
        .text2{
        	font-size: 1.25rem;
        }
    </style>
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
	
	//햄버거 버튼 클릭시 좌측에 메뉴바 열기/닫기
	jQuery(document).ready(function ($) {
        $(document).on('click', '.pull-bs-canvas-left', function () {
            $('body').prepend('<div class="bs-canvas-overlay bg-dark position-fixed w-100 h-100"></div>');
            if ($(this).hasClass('pull-bs-canvas-left'))
                $('.bs-canvas-left').addClass('ml-0');
            return false;
        });

        $(document).on('click', '.bs-canvas-close, .bs-canvas-overlay', function () {
            var elm = $(this).hasClass('bs-canvas-close') ? $(this).closest('.bs-canvas') : $('.bs-canvas');
            elm.removeClass('mr-0 ml-0');
            $('.bs-canvas-overlay').remove();
            return false;
        });
		//스크롤을 내리면 값에 변화에 따라 배경색 주기
        $(window).scroll(function () {
            var $this = $(window);

            if ($this.scrollTop() > 100) {
                $('#navbar').addClass('bg-gra');
            } else {
                $('#navbar').removeClass('bg-gra');
            }
        });
    });
</script>
<body>
<div class="container-fluid position-relative p-0">
	 <nav class="navbar navbar-expand-sm navbar-dark fixed-top justify-content-between" id="navbar">
        <div class="display-4 p-1 mx-4">
            <a class="pull-bs-canvas-left d-block text-white text-decoration-none">
                <span>&#9776;</span>
            </a>
        </div>
        <a class="navbar-brand" href="/">
        	<img src="<c:url value="/resources/images/mainicon.png" />" width="50" height="50">
        	<img src="<c:url value="/resources/images/maintitle.png" />" width="180" height="50">
        </a>
        <ul class="navbar-nav mr-5">
            <li class="nav-item text2 login m-1">
                <a class="nav-link btn btn-primary rounded-pill" href="<c:url value="/project/Join.do"/>">회원가입</a>
            </li>
            <li class="nav-item text2 login m-1">
                <a class="nav-link btn btn-primary rounded-pill" href="<c:url value="/project/Login.do"/>">로그인</a>
            </li>
            <li class="nav-item text2 mypage m-1">
                <a class="nav-link btn btn-primary rounded-pill" href="<c:url value="/project/MyPage.do"/>">마이 페이지</a>
            </li>
            <li class="nav-item text2 logout m-1">
                <a class="nav-link btn btn-primary rounded-pill" href="<c:url value="/project/Logout.do"/>">로그아웃</a>
            </li>
        </ul>
    </nav>
    <!-- navbar left side -->
    <div class="bs-canvas bs-canvas-left position-fixed bg-light h-100 justify-content-start">
        <header class="bs-canvas-header p-3 bg-gra">
            <h4 class="d-inline-block text-light mb-0 text1">MEDI Q</h4>
            <button type="button" class="bs-canvas-close close" aria-label="Close">
                <span aria-hidden="true" class="text-light text1">&times;</span>
            </button>
        </header>
        <div class="bs-canvas-content px-3 py-5 ">
            <div class="m-1">
                <a class="text-dark text-decoration-none font-weight-bold" href="<c:url value="/NutrientSelect.do"/>">
                	<img src="<c:url value="/resources/images/tsimages/free-icon-vitamins-525955.png"/>" width="25" height="25">
                	영양소
                </a>
            </div>
            <hr>
            <div class="m-1">
                <a class="text-dark text-decoration-none" href="<c:url value="/magazineindex.do"/>">
                	<img src="<c:url value="/resources/images/tsimages/free-icon-whats-new-5511348.png"/>" width="25" height="25">
                	Magazine(뉴스)
                </a>
            </div>
            <hr>
            <div class="m-1">
                <a class="text-dark text-decoration-none" href="#">
                	<img src="<c:url value="/resources/images/tsimages/free-icon-data-analysis-3449317.png"/>" width="25" height="25">
                	분석 및 결과
                </a>
            </div>
            <hr>
            <div class="m-1">
                <a class="text-dark text-decoration-none" href="#">
                	<img src="<c:url value="/resources/images/tsimages/free-icon-checkmark-9887473.png"/>" width="25" height="25">
                	섭취 / 체크
                </a>
            </div>
            <hr>
            <div class="m-1">
                <a class="text-dark text-decoration-none" href="#">
                	<img src="<c:url value="/resources/images/tsimages/free-icon-chat-724715.png"/>" width="25" height="25">
                	커뮤니티
                </a>
            </div>
            <hr>
            <div class="m-1">
                <a class="text-dark text-decoration-none" href="#">
                	<img src="<c:url value="/resources/images/tsimages/free-icon-lifestyle-4807765.png"/>" width="25" height="25">
                	건강예측
                </a>
            </div>
            <hr>
            <div class="dropdown m-1">
                <button type="button" class="btn dropdown-toggle p-0" data-toggle="dropdown">
                	<img src="<c:url value="/resources/images/tsimages/free-icon-pharmacy-1404402.png"/>" width="25" height="25">
                	정신 건강 분석
                </button>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">Link 1</a>
                  <a class="dropdown-item" href="#">Link 2</a>
                  <a class="dropdown-item" href="#">Link 3</a>
                </div>
            </div>
        </div>
    </div>
    <!-- navbar left side end-->
</div>

 