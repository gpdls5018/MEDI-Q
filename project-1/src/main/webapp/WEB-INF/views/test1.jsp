<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 메인 바디 부분 -->
<div id="tsmain">
	<div class="everybanner1">
	
		<a href="<c:url value="/healthresult.do?no=1"/>">먹는 점수 출력</a>
		
    </div>

</div><!-- id=main  -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>