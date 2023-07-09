<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
<body>
	<div class="container mt-5">
		<div class="my-title d-flex effect-custom-font justify-content-between m-auto" style="width:80%;">
			<div class="mt-5" style="font-size:40px;"><span style="background-color:#ffdcdc;">홍성민</span>님의 분석 결과</div>
		</div>
		<div class="m-5" style="height:3px;background-color:#ccc"></div>
		<div class="m-5">
			<c:forEach items="${resultListDto.listdto}" var="dto">
			<div class="jumbotron" style="border-radius:15px;">
				<div class="effect-custom-font" style="font-size:30px;">${dto.takePurpose}</div>
				<div class="effect-custom-font" style="font-size:20px;">${dto.takePurpose}  을(를) 위해 필요한 영양소들 입니다</div>
				<ul class="list-unstyled">
				<c:forEach items="${dto.foodList}" var="food">
					<li class="effect-custom-font">${food}</li>
				</c:forEach>
				</ul>
				<div class="effect-custom-font" style="font-size:20px;">${dto.takePurpose}  에 도움이 되는 건강기능 식품과 해당 성분입니다</div>
				<ul class="list-unstyled">
				<c:forEach items="${dto.foodForHelpPurpose}" var="helpfood">
					<li class="effect-custom-font">${helpfood.key}</li>
						<ul>
						<c:forEach items="${helpfood.value}" var="nutrient">
							<li>${nutrient}</li>
						</c:forEach>
						</ul>
				</c:forEach>
				</ul>
				<div class="effect-custom-font" style="font-size:20px;">아직 섭취하지 않고 있는 영양소들</div>
				<ul class="list-unstyled">
					<c:forEach items="${dto.ingredient_list_no_report}" var="ingredient">
						<li>${ingredient}</li>
					</c:forEach>
				</ul>
			</div>
			</c:forEach>
			<div class="jumbotron" style="border-radius:15px;">
				섭취하고 있는 필수 영양소들 입니다
				<div>${resultListDto.nutrient_list_report}</div>
			</div>
			<div class="jumbotron" style="border-radius:15px;">
				섭취하지 않고 있는 필수 영양소들 입니다
				${resultListDto.nutrient_list_no_report}
			</div>
		</div>
		<div class="effect-custom-font" style="font-size:20px;">총 점수는 ${resultListDto.resultScore} 입니다.</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>