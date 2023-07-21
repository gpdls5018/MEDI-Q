<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 메인 바디 부분 -->
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
</div><!-- id=main  -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>