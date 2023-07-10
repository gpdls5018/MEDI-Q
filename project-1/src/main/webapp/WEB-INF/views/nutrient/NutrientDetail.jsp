<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
        .container {
            margin-top: 80px;
        }
        
        .nav {
            display: flex;
            justify-content: space-between; 
            list-style: none;
        }
        
        .nav-item {
            padding-left: 2px;
            padding-right: 2px;
        }
        
        .nav-link {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 10px;
            flex-grow: 1;
            text-align: center;
        }
        
        .nav-link:hover {
            color: inherit;
            background-color: inherit;
        }
        
        .nav-link:hover::before {
            color: inherit;
            background-color: inherit;
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
            
        }
       
        .nav-link.active::before {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
        }
    
        .tab {
            display: none;
            padding: 20px;
            border: 1px solid #ddd;
            border-top: none;
        }
        
        .tab.active {
            display: block;
        }

        .box-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .box {
            width: 110px;
            height: 110px;
            background-color: #eee;
            transition: background-color 0.3s;
            border: 1px solid #ddd;
            border-radius: 10px 10px 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 10px;
            margin-bottom: 10px;
            cursor: pointer;
            position: relative;
        }

        .box a {
            color: black;
            text-decoration: none;
        }

        .box:hover {
            background-color: #ddd;
            font-weight: bold;
        }

        .box.active {
            background-color: #bbb;
        }

        /*프로그레스 바*/
        .progress {
            margin-top: 5px;
            width: 100%;
            height: 30px;
            background-color: #f2f2f2;
            position: relative;
            overflow: hidden;
        }

        .progress-bar-inner {
            position: absolute;
            top: 0;
            left: 0;
            width: 0%;
            height: 100%;
            background-color: rgb(253, 186, 41);
            animation: fillProgress 1.5s linear forwards;
        }
        .progress-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black;
            font-weight: bold;
        }

        @keyframes fillProgress {
            0% {
                width: 0%;
            }
            100% {
                width: 50%; /* 성분에 따라 맞춰야함 */
            }
        }
        
        /* 이미지 추가 */
		.image {
			position: relative;
			display: flex;
	        justify-content: center;
	        align-items: center;
			
		}
		
		.bj-img {
			border-radius: 10px 10px 10px 10px;
		}
		
		
		.image .text {
			position: absolute;
			top: 40px;
		 	font-weight: bold;
			color: black;
		}
        


    </style>
</head>
<body>
    <div class="container mb-5" style="margin-top: 80px;">
        <div>
            <ul class="nav">
                <li class="nav-item col-3">
                    <a class="nav-link active" href="<c:url value="/NutrientSelect.do"/>" onclick="openTab(event, 'popular')">인기 영양소</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'vitamin')">비타민</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'mineral')">미네랄</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'functional')">기능성 원료</a>
                </li>
            </ul>
        </div>
        <div class="pt-2 pb-5">
            <div id="popular" class="tab active border-0 text-center">
                <!-- 이미지 -->
                <div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text" style="color: black;">
		           		<b>${param.name }</b><br/>
		           		<small>궁금했던 모든 것, 바로 확인해보세요!</small>
                	</div>
    			</div>
            </div>
            <div class="d-flex justify-content-center">
                <div id="outer" class="d-flex justify-content-center w-75 mt-3" style="border: #ddd solid; border-radius: 10px;">
                    <div id="inner" class="w-75">
                        <div class="mt-4">
                            <h4>관련 건강고민</h4>
                            <hr class="bg-warning">
                            <p>${n_FUNC }</p>
                        </div>
                        <div class="mt-5">
                            <h4>상세설명</h4>
                            <hr class="bg-warning">
                            <p>${desc }</p>
                        </div>
                        <div class="mt-5">
                            <h4>섭취량</h4>
                            <hr class="bg-warning">
                            <p>
                                	남성 권장 섭취량: ${n_DRI_M }<br/>
                                <c:if test="${not empty n_UL_M}">
                                	남성 상한 섭취량: ${n_UL_M }<br/>
                                </c:if>
                                	여성 권장 섭취량: ${n_DRI_F }<br/>
                                <c:if test="${not empty n_UL_F}">
                                	여성 상한 섭취량: ${n_UL_F }
                                </c:if>
                                <div class="progress w-75 progress-bar text-danger mt-3" > 
                                    <div class="progress-bar-inner"></div>
                                    <div class="progress-text"></div>
                                </div>                 
                            </p>
                        </div>
                        <div class="mt-5">
                            <h4>결핍시 증상</h4>
                            <hr class="bg-warning">
                            <p>${n_LACK }이 있어요.</p>
                        </div>
                        <c:if test="${not empty caution}">
                        <div class="mt-5">
                            <h4>주의사항</h4>
                            <hr class="bg-warning">
                            <p>${caution }</p>
                        </div>
                        </c:if>
                        <div class="mt-5">
                            <h4>섭취 음식</h4>
                            <hr class="bg-warning">
                            <p>${n_FOOD }에서 섭취할 수 있어요.</p>
                        </div>
                        <div class="mt-5">
                            <h4>추천 영양제</h4>
                            <hr class="bg-warning">
                            <p>
                                <div>영양제1, 영양제2, 영양제3</div>                   
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- 탭 이동처리 -->
        <div style="display:none;">
       		<div id="popular" class="tab active border-0">
                <!-- 인기성분에 해당하는 상자 내용 -->
                <!-- 이미지 -->
   				<div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text text-color:black">
		           		<b>인기 성분 Top 100</b><br/>
		           		<small>800개 영양성분 중 가장 인기있는 100개 성분의 Best 제품을 만나보세요</small>
                	</div>
    			</div>
                <div class="box-container">
	                <c:forEach var="name" items="${vitaminNames}">
					    <div class="box col-sm-2" style="white-space: nowrap;">
					    	<a href="<c:url value="/NutrientDetail.do?name=${name}"/>"> 
					    		<b style="font-size: 14px;">${name}</b>
					    	</a>
					    </div>
					</c:forEach>
                </div>
            </div>
            
	        <div id="vitamin" class="tab">
               	<!-- 비타민에 해당하는 상자 내용 -->
	                <!-- 이미지 -->
	   				<div class="image mt-2">
		                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
		                <div class="text text-color:black">
			           		<b>비타민 선택</b><br/>
			           		<small>비타민 A, 비타민 B 등을 선택할 수 있는 상자입니다.</small>
	                	</div>
	    			</div>
	    			<div class="box-container">
		                <c:forEach var="name" items="${vitaminNames}">
						    <div class="box col-sm-2" style="white-space: nowrap;">
						    	<a href="<c:url value="/NutrientDetail.do?name=${name}"/>"> 
						    		<b style="font-size: 14px;">${name}</b>
						    	</a>
						    </div>
						</c:forEach>
	                </div>
	            </div>
	
	            <div id="mineral" class="tab">
	                <!-- 미네랄에 해당하는 상자 내용 -->
	                <div class="image mt-2">
		                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
		                <div class="text text-color:black">
			           		<b>미네랄 선택</b><br/>
			           		<small>미네랄 선택을 위한 상자입니다.</small>
	                	</div>
	    			</div>
	    			<div class="box-container">
		                <c:forEach var="name" items="${etcNames}">
						    <div class="box col-sm-2" style="white-space: nowrap;">
						    	<a href="<c:url value="/NutrientDetail.do"/>">
						    		<b style="font-size: 14px;">${name}</b>
						    	</a>
						    </div>
						</c:forEach>
	                </div>
	            </div>
	                
	            <div id="functional" class="tab">
	                <!-- 기능성 원료에 해당하는 상자 내용 -->
	                <div class="image mt-2">
		                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
		                <div class="text text-color:black">
			           		<b>기능성 원료 선택</b><br/>
			           		<small>기능성 원료 선택을 위한 상자입니다.</small>
	                	</div>
	    			</div>
	    			<div class="box-container">
		                <c:forEach var="name" items="${ingredientNames}">
						    <div class="box col-sm-2" style="white-space: nowrap;">
						    	<a href="<c:url value="/NutrientDetail.do"/>">
						    		<b style="font-size: 14px;">${name}</b>
						    	</a>
						    </div>
						</c:forEach>
	                </div>
	            </div>
    		</div>
    
    </div>
    <script>

        function fade(element) {
        	var op = 0;  // 초기 투명도
        	var timer = setInterval(function () {
	            if (op >= 1) {
	            clearInterval(timer);  // 애니메이션 종료
	            }
	            element.style.opacity = op;  // 투명도 설정
	            element.style.filter = 'alpha(opacity=' + op * 100 + ')';  // IE8 이하 대응
	            op += 0.1;  // 투명도 증가량
	        }, 50);  // 간격(ms)
        }

        function fadeInTab(tabElement) {
	        tabElement.style.display = "block";  // 탭 컨텐츠 보이기
	        fade(tabElement);  // 페이드인 효과 적용
        }

        function openTab(evt, tabName) {
        	var i, tabContent, tabLinks;

	        tabContent = document.getElementsByClassName("tab");
	        for (i = 0; i < tabContent.length; i++) {
	            tabContent[i].style.display = "none";  // 모든 탭 컨텐츠 숨기기
	        }

	        tabLinks = document.getElementsByClassName("nav-link");
	        for (i = 0; i < tabLinks.length; i++) {
	            tabLinks[i].classList.remove("active");  // 모든 탭 링크에서 'active' 클래스 제거
	        }

	        var currentTab = document.getElementById(tabName);
	        // Remove immediate display and directly apply fade-in effect
	        currentTab.style.opacity = 0;
	        currentTab.style.filter = 'alpha(opacity=0)';
	        currentTab.style.border = 0;
	        fadeInTab(currentTab);  // 선택한 탭 컨텐츠를 페이드인으로 보이게 함

        	evt.currentTarget.classList.add("active");  // 선택한 탭 링크에 'active' 클래스 추가
        }
        
        
     	// 진행 바 업데이트를 위한 변수 및 값 설정
        var progressElement = document.querySelector('.progress-bar-inner'); // 진행 바 요소 선택
        var textElement = document.querySelector('.progress-text'); // 텍스트 요소 선택

        var animationDuration = 1500; // 애니메이션 지속 시간 (밀리초)
        var targetValue = 50; // 목표 값 (%)
        var updateInterval = 20; // 업데이트 간격 (밀리초)

        var progressValue = 0; // 현재 진행 값
        var currentValue = 0; // 현재 표시 값

        var increment = targetValue / (animationDuration / updateInterval); // 증가량 계산

        // 진행 바 업데이트 함수
        function updateProgress() {
            progressValue += increment; // 진행 값 증가
            currentValue = Math.min(Math.round(progressValue), targetValue); // 현재 표시 값 계산
            
            progressElement.style.width = currentValue + '%'; // 진행 바 너비 설정
            textElement.textContent = currentValue + '%'; // 텍스트 내용 설정

            if (currentValue >= targetValue) {
                clearInterval(progressInterval); // 목표 값에 도달하면 업데이트 간격을 멈춤
            }
        }

        // 주기적으로 진행 바 업데이트 실행
        const progressInterval = setInterval(updateProgress, updateInterval);

    </script>
</body>
</html>
