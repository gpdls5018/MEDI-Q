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

        h2, p {
            text-align: center;
        }
       
        p {
            padding: 20px;
            border-bottom: 3px solid rgb(253, 186, 41);
        }

    </style>
</head>
<body>
    <div class="container" style="margin-top: 80px;">
        <div>
            <ul class="nav">
                <li class="nav-item col-3">
                    <a class="nav-link active" href="#" onclick="openTab(event, 'popular')">인기 영양소</a>
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
            <div id="popular" class="tab active border-0">
                <!-- 비타민에 해당하는 상자 내용 -->
                <h2>인기 영양소 선택</h2>
                <p>현재 인기 영양소를 선택할 수 있는 상자입니다.</p>
                <div class="box-container justify-content-sm-between">
                    <div class="box col-sm-2"><a href="<c:url value="/NutrientDetail.do"/>">비타민 A</a></div>
                    <div class="box col-sm-2">비타민 B</div>
                    <div class="box col-sm-2">비타민 C</div>
                    <div class="box col-sm-2">비타민 D</div>
                    <div class="box col-sm-2">비타민 E</div>
                </div>
            </div>
                
            <div id="vitamin" class="tab">
                <!-- 비타민에 해당하는 상자 내용 -->
                <h2>비타민 선택</h2>
                <p>비타민 A, 비타민 B 등을 선택할 수 있는 상자입니다.</p>
            </div>

            <div id="mineral" class="tab">
                <!-- 미네랄에 해당하는 상자 내용 -->
                <h2>미네랄 선택</h2>
                <p>미네랄 선택을 위한 상자입니다.</p>
            </div>
                
            <div id="functional" class="tab">
                <!-- 기능성 원료에 해당하는 상자 내용 -->
                <h2>기능성 원료 선택</h2>
                <p>기능성 원료 선택을 위한 상자입니다.</p>
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
        
    </script>

</body>
</html>