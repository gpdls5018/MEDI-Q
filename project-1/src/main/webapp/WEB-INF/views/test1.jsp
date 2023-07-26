<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 메인 바디 부분 -->
<style>
progress {
    background-color: #f3f3f3;
    border: 0;
    height: 2.5em;
    width: 100%;
}

progress::-webkit-progress-bar {
    background-color: #e0eaf0;
}

progress::-webkit-progress-value {
    background-color: #329ad1;
}

progress {
    width: 33%;
    height: 30px; /* 원하는 프로그레스 바 높이로 조정하세요 */
    position: relative;
    border: 1px solid black;
    
    }
#myProgress,#myProgress1{
	border-right: 2px dotted #000;
}
</style>
<div id="tsmain">
	<div class="everybanner1">
	<div>
	<form action="<c:url value="/healthresult.do"/>">
		<input id="aaa" name="no">먹는 영양제의 번호를 쓰시오</input><br/>
		<button onclick="aaa()">점수 출력&nbsp;</button>
	</form>
	</div>
	<br/>
		<c:forEach items="${results}" var="result">
			${result}<br/>
		</c:forEach>
		총 점수 : ${totalresult }점
    </div>
    <div class="progress-container" style="white-space: nowrap;">
	  <progress id="myProgress"></progress><progress id="myProgress1"></progress><progress id="myProgress2"></progress>
	</div>
</div><!-- id=main  -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>