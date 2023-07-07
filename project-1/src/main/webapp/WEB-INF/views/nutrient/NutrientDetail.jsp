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
    <div class="container" style="margin-top: 80px;">
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
        <div class="pt-2">
            <div id="popular" class="tab active border-0 text-center">
                <!-- 이미지 -->
                <div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text" style="color: black; font-size: 40px;">
		           		<b>비타민 A</b><br/>
                	</div>
    			</div>
            </div>
            <div class="d-flex justify-content-center">
                <div id="outer" class="d-flex justify-content-center w-75 mt-3" style="border: #ddd solid; border-radius: 10px;">
                    <div id="inner" class="w-75">
                        <div class="mt-4">
                            <h4>관련 건강고민</h4>
                            <hr class="bg-warning">
                            <p>
                                <kbd>노화 & 항산화</kbd>, <kbd>눈 건강</kbd>, <kbd>간 건강</kbd>, <kbd>장 건강</kbd>, <kbd>탈모 & 손톱 건강</kbd>, <kbd>피부 건강</kbd>
                            </p>
                        </div>
                        <div class="mt-5">
                            <h4>상세설명</h4>
                            <hr class="bg-warning">
                            <p>
                                · 세포의 성장과 재생에 꼭 필요한 영양소에요.<br/>
                                · 피부와 점막을 건강하게 유지하는데 중요해요.<br/>
                                · 눈에서 빛을 흡수하는 세포를 만드는데 필요해요.                        
                            </p>
                        </div>
                        <div class="mt-5">
                            <h4>섭취량</h4>
                            <hr class="bg-warning">
                            <p>
                                남성 권장/상한 섭취량<br/>
                                <div class="progress w-75 progress-bar text-danger mt-3" > 
                                    <div class="progress-bar-inner"></div>
                                    <div class="progress-text"></div>
                                </div>                 
                            </p>
                        </div>
                        <div class="mt-5">
                            <h4>결핍시 증상</h4>
                            <hr class="bg-warning">
                            <p>
                                야맹증, 성장장애, 피부건조증 등                      
                            </p>
                        </div>
                        <div class="mt-5">
                            <h4>주의사항</h4>
                            <hr class="bg-warning">
                            <p>
                                · 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있음<br/>
                                · 임신 중 과다 복용시 기형 발생 위험 있음<br/>
                                · 고용량 섭취하면 간 기능에 영향을 줄 수 있으므로 전문가와 상담 필요                   
                            </p>
                        </div>
                        <div class="mt-5">
                            <h4>섭취 음식</h4>
                            <hr class="bg-warning">
                            <p>
                                토마토, 당근, 호박 등에서 섭취할 수 있음             
                            </p>
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

</body>
</html>