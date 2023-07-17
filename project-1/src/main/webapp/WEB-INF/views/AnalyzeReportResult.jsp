<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
</style>
<body>
	<div class="container mt-5">
		<div style="background-image:url(<c:url value="/resources/images/basic/result.png"/>);background-repeat : no-repeat;background-size : contain;background-position:right,center;">
			<div class="my-title d-flex effect-custom-font justify-content-right m-auto" style="width:80%;">
				<div class="mt-5 float-right" style="font-size:40px;"><span style="background-color:#ffdcdc;">${memberDto.name}</span>님의 분석 결과</div>
			</div>
			<div class="m-5">
				<div class="effect-custom-font ml-5" >총 점수는 <span style="font-size:70px;">${resultListDto.resultScore}</span></div>
				<button class="btn effect-custom-font ml-5" style="border-radius:15px;background-color:#ff5924;color:white;width:40%;">다시 분석하기</button>
			</div>
			<div class="m-5" style="height:3px;background-color:#ccc"></div>
		</div>
		<div class="m-5">
			<div class="effect-custom-font m-1" style="font-size:30px;color:#868686;text-align:center;">영양제 분석 리포트</div>
			<div class="effect-custom-font mb-3" style="font-size:20px;text-align:center;">
			<span style="color:#868686;font-size:15px;">성별</span>
			<c:if test="${memberDto.gender eq 'M'}" var="gender">
				남
			</c:if>
			<c:if test="${not gender}">
				여
			</c:if>
			<span style="color:#868686;font-size:15px;">나이</span>
			<fmt:parseDate value="${memberDto.birth}" var="birth" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${birth}" var="birth1" pattern="yyyy"/>
			<fmt:parseNumber value="${birth.time / (1000*60*60*24*365)}" integerOnly="true" var="birthYear"></fmt:parseNumber>
			<c:set var="today" value="<%=new java.util.Date()%>" />
			<c:set var="nowDate"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
			${nowDate - birth1}
			</div>
			
			<div class="jumbotron effect-custom-font" style="border-radius:25px;">
				<div class="row">
					<div class="col-6">
						<c:if test="${resultListDto.resultScore < 50}" var="score">
							<span style="font-size:25px;text-weight:bold;">🔥 MEDI-Q 와 조금 더 노력해봐요! 🔥</span>
						</c:if>
						<c:if test="${not score}">
							<span style="font-size:25px;text-weight:bold;">🎉 와우! 정말 잘하고 있어요 🎉</span>
						</c:if>
						<div class="mt-5" style="font-size:15px;">
							<ul style="line-height: 40px;">
								<li style="color:#6e6e6e;">
									홍성민님은 현재 <span style="font-size:17px;color:#000000;background-color:#ffdcdc">${fn:length(resultListDto.listdto)}개의 목적</span>
									을 위해 영양제를 섭취 중이시네요!
								</li>
								<li style="color:#6e6e6e;">
									<span style="font-size:17px;color:#000000;background-color:#ffdcdc;">
									${resultListDto.ingredientCount}개의 영양제</span>
									를 통해 <span style="font-size:17px;color:#000000;background-color:#ffdcdc">${fn:length(resultListDto.nutrient_list_report)+resultListDto.ingredientCount}개의 영양소</span>를 섭취하고 있어요.
								</li>
							</ul>
						</div>
					</div>
					<div class="col-6">
						  <div class="ml-3" style="width:300px;height:300px;">
						    <canvas id="chart"></canvas>
						  </div>
					</div>
				</div>
			</div>
			<div class="mt-5 effect-custom-font">
				<div class="effect-custom-font m-1" style="font-size:30px;color:#868686;text-align:center;">섭취 목적별 기능성 원료 분석</div>
			</div>
			<c:forEach items="${resultListDto.listdto}" var="dto" varStatus="loop">
			<div class="jumbotron" style="border-radius:25px;">
				<div class="row">
					<div class="col-3">
						<div class="effect-custom-font" style="font-size:30px;">
							<div>#${loop.count} ${dto.takePurpose}</div>
							<div><img src="<c:url value="/resources/images/health_img/${dto.takePurpose}"/>.png" style="width:150px;height:150px;"/></div>
						</div>
					</div>
					<div class="col-9">
						<div class="effect-custom-font mb-3" style="font-size:15px;color:#6e6e6e;">
								${dto.takePurpose}  을(를) 위해 필요한 영양소 <span style="font-size:20px;color:#000000">${fn:length(dto.foodList)} 가지 중 ${fn:length(dto.foodList) - fn:length(dto.ingredient_list_no_report)} 개</span> 를 섭취하고 있습니다
						</div>
						<c:if test="${fn:length(dto.foodForHelpPurpose) eq 0}" var="noHelp">
							<div class="effect-custom-font"><span style="font-size:17px;color:red;background-color:#ffdcdc">현재 아무런 기능성 원료도 섭취하지 않아요!</span>  <span style="color:red;font-size:15px;background-color:#ffdcdc">아래의 추천 기능성 원료를 참고해 주세요</span></div>
							<img src="<c:url value="/resources/images/basic/warning.png"/>" style="width:200px;height:200px;"/>
						</c:if>
						<c:if test="${not noHelp}">
						<div class="effect-custom-font" style="font-size:20px;">${dto.takePurpose}  에 도움이 되는 건강기능 식품과 해당 성분입니다</div>
							<ul class="list-unstyled mt-5">
							<c:forEach items="${dto.foodForHelpPurpose}" var="helpfood">
								<li class="effect-custom-font" style="font-size:20px;">- ${helpfood.key}</li>
									<ul class="list-unstyled" style="line-height:30px;">
									<c:forEach items="${helpfood.value}" var="nutrient">
										<li class="effect-custom-font" style="font-size:15px;">✅ ${nutrient}</li>
									</c:forEach>
									</ul>
							</c:forEach>
							</ul>
						</c:if>
						<div class="effect-custom-font mt-5" style="font-size:20px;">${dto.takePurpose}에 좋은 추천 기능성 원료</div>
						<c:forEach items="${dto.ingredient_list_no_report}" var="ingredient" varStatus="index">
							
							<span class="effect-custom-font p-0 m-2" style="background-color:#fdb576;border-radius:15px;font-size:15px;">${ingredient}</span>
							<c:if test="${index.count % 4 == 0}">
								<br>
							</c:if>
						</c:forEach>
					</div>
				</div>
				
			</div>
			</c:forEach>
			<div class="effect-custom-font m-1" style="font-size:30px;color:#868686;text-align:center;">5대 영양소</div>
			<div class="effect-custom-font">
				<div class="row jumbotron m-1"  style="border-radius:25px;">
					<div class="col-6" style="border-radius:15px;">
						현재 섭취하고 있는 5대 영양소입니다
						<ul class="list-unstyled mt-3">
							<c:forEach items="${resultListDto.nutrient_list_report}" var="nutrient">
							<a href="/NutrientDetail.do?name=${nutrient}"><li>✅ ${nutrient}</li></a>
							</c:forEach>
						</ul>
					</div>
					<div class="col-6" style="border-radius:15px;">
						현재 섭취하고 있지 않는 5대 영양소입니다
						<div class="mt-3" style="overflow: auto;height:300px;">
							<ul class="list-unstyled mt-3">
							<c:forEach items="${resultListDto.nutrient_list_no_report}" var="no_nutrient">
								<a href="/NutrientDetail.do?name=${no_nutrient}"><li style="font-size:15px;">❌ ${no_nutrient}</li></a>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	console.log('${resultListDto.nutrient_list_report}');
	var listVitamin = '${resultListDto.nutrient_list_report}';
	var reg_ex = /[\[\]\\\/ ]/gim;
	listVitamin = listVitamin.replace(reg_ex,'').split(',');
	var graph_data = [1,1,1,1,1,1];
	var check_list = ['비타민A','비타민B','비타민C','비타민D','칼슘','마그네슘']
	check_list.forEach(function(checkitem,index){
	    listVitamin.forEach(function(listitem){
	        if(listitem.includes(checkitem)) {
	           graph_data[index] = 6;
	        }
	    })
	})
	const data = {
			  labels: [
			    '비타민 A',
			    '비타민 B',
			    '비타민 C',
			    '비타민 D',
			    '칼슘',
			    '마그네슘',
			  ],
			  datasets: [{
			    label: '영양소',
			    data: graph_data,
			    fill: true,
			    backgroundColor: 'rgba(255, 99, 132, 0.2)',
			    borderColor: 'rgb(255, 99, 132)',
			    pointBackgroundColor: 'rgb(255, 99, 132)',
			    pointBorderColor: '#fff',
			    pointHoverBackgroundColor: '#fff',
			    pointHoverBorderColor: 'rgb(255, 99, 132)'
			  },
			  {
			    data: [0, 0, 0, 0, 0, 0, 0],
			    fill: false,
			  }]
			};


			const ctx = document.getElementById('chart').getContext('2d');
			new Chart(ctx, {
			  type: 'radar',
			  data: data,
			  options: {
			    elements: {
			      line: {
			        borderWidth: 2
			      }
			    },
			    scales : {
			      r: {
			            angleLines: {
			                display: true
			            }
			      }
			    },
			    legend: {
			        display: false  // 레이블 숨김
		      	}
			  },
			});
	</script>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>