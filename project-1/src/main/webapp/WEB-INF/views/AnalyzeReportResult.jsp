<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
body{
	background-color: #fdfbf6;
}
   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }

progress::-webkit-progress-bar {
    background-color: #e0eaf0;
}

progress::-webkit-progress-value {
    background-color: #329ad1;
}

progress {
    background-color: #FFFFFF;
    width: 300px;
    height: 30px; /* 원하는 프로그레스 바 높이로 조정하세요 */
	border-top: 1px solid black;
	border-bottom: 1px solid black;
    position: relative;
}
#myProgress1::-webkit-progress-value {
	background-color: #00FF2B;
}
#myProgress::-webkit-progress-value {
	background-color: #0040FF;
	border-left: 1px solid black;
}
#myProgress2::-webkit-progress-value {
	background-color: #E02828;
}
 /*ts 스타일 공간*/
    .my-title {
    	position:relative;
    	background-image: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
    	background-repeat: no-repeat;
    	background-size: cover;
    	margin-top: 70px;
    }
    .tsanalyze {
    	display: flex;
    	flex-direction:column;
    	justify-content:center;
    	border-radius: 40px 40px 0px 0px;
		box-shadow: rgba(108, 108, 108, 0.15) 0px -1px 10px;
		margin-top: 50px;
    }
</style>
<body>
	<div class="container my-3" style="min-height: 880px; max-width: 920px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-left" style="flex-direction:column; align-items:center; width:100%; height:200px;">
			<c:set var="today" value="<%=new java.util.Date()%>" />
			<c:set var="nowDate" value="${today}"/>
			<fmt:formatDate var="formattedDate" value="${nowDate}" pattern="yyyy.MM.dd" />
			<!--<div class="float-right mt-3" style="font-size:32px; margin-right: 250px;"><span style="font-size:36px; color:#ffdcdc;">${memberDto.name} </span>님의 분석 결과</div> -->
			<div class="float-right mt-3" style="font-size:18px; margin-right: 350px;"><span style="font-size:20px; color:#ffdcdc;">${formattedDate}</span> 기준</div>
			<div class="effect-custom-font my-2" style="margin-right: 350px; font-size: 24px;" >총 점수는 <span style="font-size:50px;">${resultListDto.resultScore}</span>점</div>
			<button class="btn effect-custom-font my-2" onClick="location.href='<c:url value="/AnalyzeNewReport.do"/>'" style="border-radius:15px;background-color:#ff5924;color:white;width:40%; margin-right: 350px;">다시 분석하기</button>
		</div>
		
		<div class="tsanalyze">
			<div class="m-3">
				<div class="effect-custom-font m-1" style="font-size:24px;color:#868686;text-align:center;"><span style="font-size:26px; color:#ffdcdc;">${memberDto.name} </span>님의 <br/>영양제 분석 리포트</div>
				<div class="effect-custom-font my-3" style="font-size:20px;text-align:center;">
				<span style="color:#868686;font-size:15px;">성별</span>
				<c:if test="${memberDto.gender eq 'M'}" var="gender">
					남성
				</c:if>
				<c:if test="${not gender}">
					여성
				</c:if>
				<span style="color:#868686;font-size:15px; margin-left: 30px;">나이</span>
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
							<c:if test="${resultListDto.resultScore < 30}">
								<span style="font-size:25px;text-weight:bold;">💥 이대로는 안돼요! 분발해봐요! 💥</span>
							</c:if>
							<c:if test="${resultListDto.resultScore >=30 and resultListDto.resultScore < 60}">
								<span style="font-size:25px;text-weight:bold;">🔥 MEDI-Q 와 조금 더 노력해봐요! 🔥</span>
							</c:if>
							<c:if test="${resultListDto.resultScore >=60 and resultListDto.resultScore <= 100}">
								<span style="font-size:25px;text-weight:bold;">🎉 와우! 정말 잘하고 있어요 🎉</span>
							</c:if>
							<div class="mt-3" style="font-size:15px;">
								<ul style="line-height: 40px;">
									<li style="color:#6e6e6e;">
										${memberDto.name}님은 현재 <span style="font-size:17px;color:#000000;background-color:#ffdcdc">${fn:length(resultListDto.listdto)}개의 목적</span>
										을 위해 영양제를 섭취 중이시네요!
									</li>
									<li style="color:#6e6e6e;">
										<span style="font-size:17px;color:#000000;background-color:#ffdcdc;">
										${resultListDto.ingredientCount}개의 영양제</span>
										를 통해 <span style="font-size:17px;color:#000000;background-color:#ffdcdc">기능성 영양소 ${resultListDto.ingredientCount}개, </span>
									</li>
									<li style="color:#6e6e6e;">
										섭취하고 있는 
										<span style="font-size:17px;color:#000000;background-color:#ffdcdc;">5대영양소는 현재 총 ${fn:length(resultListDto.nutrient_list_report)} 개</span>
										 이므로
									</li>
									<li>
										점수는 <span style="font-size:23px;color:#000000;">${resultListDto.resultScore}</span> 점 입니다
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
								<div>${loop.count}. ${dto.takePurpose}</div>
								<div><img src="<c:url value="/images/health_img/${dto.takePurpose}"/>.png" style="width:150px;height:150px;"/></div>
							</div>
						</div>
						<div class="col-9">
							<div class="effect-custom-font mb-3" style="font-size:15px;color:#6e6e6e;">
									'${dto.takePurpose}' 에 도움이 되는 기능성 원료 <span style="font-size:20px;color:#000000">${fn:length(dto.foodList)} 가지 중 ${fn:length(dto.foodList) - fn:length(dto.ingredient_list_no_report)} 개</span> 를 섭취하고 있습니다
							</div>
							<c:if test="${fn:length(dto.foodForHelpPurpose) eq 0}" var="noHelp">
								<div class="effect-custom-font"><span style="font-size:17px;color:red;background-color:#ffdcdc">현재 아무런 기능성 원료도 섭취하지 않아요!</span>  <span style="color:red;font-size:15px;background-color:#ffdcdc">아래의 추천 기능성 원료를 참고해 주세요</span></div>
								<img src="<c:url value="/images/basic/warning.png"/>" style="width:200px;height:200px;margin-left:100px;"/>
							</c:if>
							<c:if test="${not noHelp}">
							<div class="effect-custom-font" style="font-size:20px;">아래는 복용 중이신 영양제 중 '${dto.takePurpose}' 에 도움이 되는 기능성 원료입니다</div>
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
							<div class="effect-custom-font mt-5" style="font-size:20px;">'${dto.takePurpose}'에 좋은 추천 기능성 원료</div>
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
							<div class="mt-3" style="overflow: auto;height:300px;">
								<ul class="list-unstyled mt-3">
									<c:forEach items="${resultListDto.nutrient_list_report}" var="nutrient">
									<a href="/NutrientDetail.do?name=${nutrient}"><li>✅ ${nutrient}</li></a>
									</c:forEach>
								</ul>
							</div>
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
				<div class="mt-5 effect-custom-font">
					<div class="effect-custom-font m-1" style="font-size:30px;color:#868686;text-align:center;">5대 영양소 섭취량 비교</div>
				</div>
				<div class="jumbotron" style="border-radius:25px;">
					<span style="font-size:25px;text-weight:bold;"> 권장 섭취량 : 건강한 생활을 위해 섭취하도록 정하여 장려하는 양. </span><br/>
					<span style="font-size:25px;text-weight:bold;"> 상한 섭취량 : 인체 건강에 유해한 영향이 나타나지 않는 최대 영양소 섭취 수준. </span><br/><br/>
					<div class="row">
						<div class="effect-custom-font" style="font-size:15px;">
							<c:forEach items="${resultListDto.nutnumlist }" var="item">
								<span style="display: inline-block; margin-right: 10px;">${item}</span>
							</c:forEach>
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
	var graph_data = [1,1,1,1,1,1,1,1,1,1];
	var check_list = ['비타민A','비타민B','비타민C','비타민D','비타민E','칼슘','마그네슘','아연','망간','단백질']
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
			    '비타민 E',
			    '칼슘',
			    '마그네슘',
			    '아연',
			    '망간',
			    '단백질'
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
			    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			    fill: false,
			  },
			  {
			    data: [6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
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
</html>