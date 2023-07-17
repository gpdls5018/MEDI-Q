<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<style>
   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .hr-class {
    	border : solid 3px #ccc;
    }
</style>
<div class="container">
	<div class="jumbotron m-5 effect-custom-font" style="font-size:40px;">AI를 이용한 나의 질병 예측</div>
	
	<div class="jumbotron m-5 effect-custom-font">
		<a href="/DiabetesPredict.do?userId="> 1. 당뇨병 예측하기 >>> 클릭시 이동</a>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>