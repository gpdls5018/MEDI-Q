<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 예시로 Chart.js 라이브러리를 사용하여 막대 그래프 생성하는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery"></script>

<style>

    #admin_sidebar {
        width: 290px;
        height: 835px;
        margin: 20px;
        margin-left: 40px;
        padding: 40px;
        border: 1px solid #ccc;
        background-color: #f7f7f7;
    }

    #admin_content {
    	width: 1500px;
    	height: 835px;
        padding: 20px;
        margin: 20px;
        margin-right: 40px;
        border: 1px solid #ccc;
        background-color: #f7f7f7;
    }
    
    /* 스타일 수정된 메뉴 목록 */
    #admin_sidebar h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    #admin_sidebar ul {
        list-style: none;
        padding: 0;
    }

    #admin_sidebar li {
        margin-bottom: 10px;
    }

    #admin_sidebar a {
        display: block;
        padding: 5px 10px;
        text-decoration: none;
        color: #333;
        margin-top: 28px;
        margin-bottom: 28px;
    }

    #admin_sidebar a:hover {
        background-color: #f0f0f0;
    }

    /* 예시 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ccc;
    }

    th {
        background-color: #f0f0f0;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    /* 예시 도표 스타일 - Chart.js styles */
    .chart-container canvas {
        max-width: 100%;
    }
    
    
    /* 예시로 그래프를 표시할 div의 스타일 */
    .chart-container {
        padding: 20px;
        margin-bottom: 20px;
    }


</style>
</head>
<body>

	<div class="d-flex" style="margin-top: 75px;">
		
		<!-- 관리자 사이드바 -->
		<div id="admin_sidebar">
	        <h2 class="text-center">관리자 메뉴</h2>
	        <ul>
	        	<li><a href="#">메인 화면</a></li>
	            <li><a href="<c:url value="/AdminMember.do"/>">회원 관리</a></li>
	            <li><a href="#">영양소 테이블 관리</a></li>
	            <li><a href="#">건강고민 및 선호제형 관리</a></li>
	            <li><a href="#">머신러닝 모델 관리</a></li>
	            <li><a href="#">질병 예측 결과 조회</a></li>
	            <li><a href="#">피드백 관리</a></li>
	            <li><a href="#">서비스 통계 및 분석</a></li>
	            <li><a href="#">시스템 로그 관리</a></li>
	            <li><a href="#">보안 관리</a></li>
	            <li><a href="#">서비스 설정 관리</a></li>
	        </ul>
	    </div>
	
		<!-- 관리자 내용 -->
	    <div id="admin_content" style="display: flex; flex-wrap: wrap;">
	        <div class="chart-container" style="width: 570px; height: 300px;">
        	<h4>회원 관리</h4>
            <!-- 여기에 도표 생성을 위한 코드를 추가하세요 (예: Chart.js, Datawrapper 등) -->
            <!-- 예시로 막대 그래프를 사용한다고 가정합니다 -->
	            <canvas id="barChart"></canvas>
	        </div>
	        <div class="chart-container" style="width: 570px; height: 300px;">
			    <canvas id="lineChart"></canvas>
			</div>
			<div class="chart-container" style="width: 570px; height: 300px;">
			    <canvas id="pieChart"></canvas>
			</div>
	
	        <div class="chart-container" style="width: 570px; height: 300px;">
	        	<h4>예시 표</h4>
	            <!-- 여기에 표를 생성하는 코드를 추가하세요 (예: HTML table) -->
	            <table>
	                <tr>
	                    <th>이름</th>
	                    <th>나이</th>
	                    <th>성별</th>
	                </tr>
	                <tr>
	                    <td>John</td>
	                    <td>30</td>
	                    <td>남성</td>
	                </tr>
	                <tr>
	                    <td>Jane</td>
	                    <td>25</td>
	                    <td>여성</td>
	                </tr>
	            </table>
	        </div>
	    </div>
	    
	    
	    
	    
	</div><!-- 컨테이너 -->
	
    <script>
	    
	    $(document).ready(function() {
	        // 차트 데이터와 옵션 설정
	        var barChartData = {
	            labels: ["옵션1", "옵션2", "옵션3", "옵션4"],
	            datasets: [{
	                label: "점수",
	                data: [75, 90, 60, 85],
	                backgroundColor: ["#ff6384", "#36a2eb", "#cc65fe", "#ffce56"],
	                borderWidth: 1
	            }]
	        };
	
	        var barChartOptions = {
	            responsive: true,
	            maintainAspectRatio: false,
	            scales: {
	                y: {
	                    beginAtZero: true
	                }
	            }
	        };
	        
	        var pieChartData = {
	           labels: ["A", "B", "C"],
	           datasets: [{
	               data: [30, 25, 45],
	               backgroundColor: ["#ff6384", "#36a2eb", "#cc65fe"],
	               borderWidth: 1
	           }]
	        };
	        
	        var pieChartOptions = {
	            responsive: true,
	            maintainAspectRatio: false
	        };
	
	        var lineChartData = {
	            labels: ["1월", "2월", "3월", "4월", "5월", "6월"],
	            datasets: [{
	                label: "매출",
	                data: [2000, 3000, 1500, 5000, 4000, 6000],
	                borderColor: "#36a2eb",
	                borderWidth: 2,
	                fill: false
	            }]
	        };
	        
	        var lineChartOptions = {
	           responsive: true,
	           maintainAspectRatio: false,
	           scales: {
	               y: {
	                   beginAtZero: true
	               }
	           }
	        };
	        
	        // 막대 그래프 생성
	        var ctx = document.getElementById('barChart').getContext('2d');
	        new Chart(ctx, {
	            type: 'bar',
	            data: barChartData,
	            options: barChartOptions
	        });
	        
	     	// 라인 차트 생성
	        var lineCtx = document.getElementById('lineChart').getContext('2d');
	        new Chart(lineCtx, {
	            type: 'line',
	            data: lineChartData,
	            options: lineChartOptions
	        });
	
	        // 파이 차트 생성
	        var pieCtx = document.getElementById('pieChart').getContext('2d');
	        new Chart(pieCtx, {
	            type: 'pie',
	            data: pieChartData,
	            options: pieChartOptions
	        });
	        
	        
		});
        
        
        
        
    </script>
</body>
</html>