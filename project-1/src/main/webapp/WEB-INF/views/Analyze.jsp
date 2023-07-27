<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .delete_report:hover {
   		border-radius:20px;
   		padding:5px;
    	background-color:#f06060;
    }
</style>

	<div class="container mt-5" style="min-height: 860px;">
		<img src="https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg" style="width: 100%; height: 300px; border-radius: 20px;" >
		<div class="my-title d-flex effect-custom-font justify-content-between m-auto" style="width:80%;height:200px;">
			<div class="mt-5" style="font-size:40px;"><span style="background-color:#ffdcdc;">${UserName}</span>님의 <br>영양제 분석 리포트</div>
			<div class="mt-3">
			<c:if test="${info.prof_Img_Fl eq 'Y' }" var="isProfImg">
				<c:set var="uploadFolder" value="${fn:split(profImg.pi_Path,'\\\\')[fn:length(fn:split(profImg.pi_Path, '\\\\'))-1] }"/>
				<img class="rounded-circle" alt="사용자 이미지" src="<c:url value="/images/${uploadFolder }/${profImg.pi_Filename }.${profImg.pi_Ext }" />" style="width: 200px; height: 200px">
			</c:if>
			<c:if test="${not isProfImg }">
				<img class="rounded-circle" alt="기본 프로필" src="<c:url value="/images/basic/friend.png" />" style="width: 200px; height: 200px">
			</c:if>
			</div>
		</div>
		<div class="m-5" style="height:3px;background-color:#ccc"></div>
		<div class="m-5">
			<div class="btn btn-warning effect-custom-font" style="border-radius:15px;width:100%;" onclick="location.href='/AnalyzeNewReport.do'">새로 분석하기</div>
		</div>
		<div class="report_recent effect-custom-font m-5" style="font-size:25px;">
			<div>최근 분석 리포트</div>
			<div class="jumbotron" style="box-shadow: 5px 5px 5px grey;border-radius:25px;">
				<div style="margin: 10px 0px 0px 20px;">
                <div class="enbDhJ1"><span class="p-1"style="font-size:15px;color:white;background-color:#EF605D;border-radius:15px;">${analyzeReport.analyzeDate}</span><span style=" float: right;"></span></div>
                	<p style="">${analyzeReport.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
            	</div>
	            <div class="ZyIFk1 d-block mt-3" style="margin-left: 20px;">
	                <div><span style="color:#545454; font-weight: bold;">섭취 목적</span> :<br/> ${analyzeReport.takePurposes}</div>
	                <div><span style="color:#545454; font-weight: bold;">섭취중인 영양제</span> :<br/> ${analyzeReport.takeFoods}</div>
	            </div>	
			</div>
		</div>
		<div class="report_recent effect-custom-font m-5" style="font-size:25px;">
			<div>저장된 분석 리포트</div>
			<c:forEach items="${analzeReportAll}" var="analyzeReportOne">
			<div class="jumbotron p-3" style="box-shadow: 5px 5px 5px grey;border-radius:25px;font-size:15px;height:200px;">
                <div class="enbDhJ1"><span class="p-1"style="font-size:15px;color:white;background-color:#EF605D;border-radius:15px;">${analyzeReportOne.analyzeDate}</span>
                	<span style=" float: right;"class="delete_report" data-value="${analyzeReportOne.analyzeno}">
               		🗑</span>
               		<input type="hidden" value="${analyzeReportOne.analyzeno}"/>
               	</div>
                	<p style="">${analyzeReportOne.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
	            <div class="ZyIFk1 d-block mt-3" style="margin-left: 20px;">
	                <div><span style="color:#545454; font-weight: bold;">섭취 목적</span> :<br/> ${analyzeReportOne.takePurposes}</div>
	                <div><span style="color:#545454; font-weight: bold;">섭취중인 영양제</span> :<br/> ${analyzeReportOne.takeFoods}</div>
	                
	            </div>	
			</div>
			</c:forEach>
		</div>
	</div>
<script>
// jQuery를 사용하여 이벤트 핸들러 추가
const deleteButtons = document.querySelectorAll(".delete_report");

deleteButtons.forEach(button => {
  button.addEventListener('click', function(e) {
    var itemNo = e.target.dataset.value;
    Swal.fire({
    	  title: '삭제하시겠어요??',
    	  text: "저장된 리포트를 삭제합니다",
    	  icon: 'warning',
    	  
    	  showCancelButton: true,
    	  confirmButtonColor: '#3085d6',
    	  cancelButtonColor: '#d33',
    	  confirmButtonText: '삭제'
    	}).then((result) => {
    	  if (result.isConfirmed) {
    	    Swal.fire(
    	    		'Deleted!',
    	      '삭제되었습니다!',
    	      'success',
    	    )
    	    setTimeout(function() {$.ajax({
    			   url: "<c:url value='/deleteAnalyzeReport.do'/>?analyzeno="+itemNo,
    		   }).done(function() {
    			   location.reload();
    		   }).fail(function(error) {
    			   console.log(error);
    		   });
    	    },1500);
    	  }
    	})
    
  });
});
</script>

<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>