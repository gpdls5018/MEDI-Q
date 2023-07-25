<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 예시로 Chart.js 라이브러리를 사용하여 막대 그래프 생성하는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- jquery.slim.min에서 slim뺌 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>



<style>

	body {
        background-color: #f5f5f0;
	}

    /* 사이드바 */
    #admin_sidebar {
        width: 290px;
        height: 835px;
        margin: 10px 5px 20px 40px;
        padding: 30px 30px;
        border: 1px solid #ccc;
        background-color: white; 
        
    }
    
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
        font-size: 14px;
    }

    #admin_sidebar a:hover {
        background-color: #f0f0f0;
    }
    
    /* 사이드바 이모티콘 */
    i {
	  display: inline-block;
	  width: 27px; /* 원형의 지름 설정 */
	  height: 27px; /* 원형의 지름 설정 */
	  border-radius: 50%; /* 원형으로 만들기 위해 50%로 설정 */
	  background-color: #EF605D; /* 원하는 색상을 지정합니다. */
	  color: white;
	}
    
    /* 컨텐츠 전체 */
    #admin_content {
    	width: 1600px;
    	height: 835px;
        padding: 30px 10px;
        margin: 10px 40px 20px 5px;
        border: 1px solid #ccc;
        background-color: white; 
    }
    
    /* 4분할 */
    .each-container {
    	padding: 10px;
    	margin: 20px 15px;
    	
    }
    
    /* 컨텐츠 내 차트 */
    .chart-container {
    	width: 670px; 
    	height: 300px; 
    	margin: 5px;
    	padding: 20px 30px;
    	border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f7f7f7;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    

    /* 예시 테이블 스타일 */
    table {
        border-collapse: collapse;
        width: 100%;
        font-size: 12px;
        overflow: auto; /* 스크롤이 가능하도록 하기 위해 추가 */
        
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: center;
        padding: 8px;
    }

    th {
        background-color: rgba(75, 192, 192, 0.6);
    }

    tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    tbody tr:hover {
        background-color: #ddd;
    }
    
    /* 테이블 헤더 고정 */
	thead {
	    position: sticky;
	    top: 0;
	    background-color: #EF605D;
	}

    /* 버튼 스타일링 */
    .button-wrapper {
        display: flex;
        justify-content: center;
    }

    .button {
        border-radius: 4px;
        background-color: rgba(255, 206, 86, 1);
        border: none;
        color: white;
        text-align: center;
        cursor: pointer;
        margin: 2px;
        font-size: 9px;
    }
    
    .button:hover {
	    background-color: rgb(255,151,0); /* 버튼 호버 시 배경색이 더 진한 색으로 변경 */
    }

    .button span {
        cursor: pointer;
        display: inline-block;
    }
    
    /* 스크롤바 색상, 위치 설정 */
    .table-wrapper {
    }
    
	.table-wrapper::-webkit-scrollbar {
	  width: 10px; /* 스크롤바 너비 조절 */
	}
	
	.table-wrapper::-webkit-scrollbar-thumb {
	  background-color: #ccc; /* 스크롤바 색상 */
	  border-radius: 5px; /* 스크롤바 모서리 둥글게 설정 */
	}
	
	.table-wrapper::-webkit-scrollbar-thumb:hover {
	  background-color: #999; /* 스크롤바 호버시 색상 */
	}
	 
	/* 체인지 버튼 */ 
	#change {
	    border: 1px solid black;
	    border-radius: 5px;
	    cursor: pointer;
	    color: black;
	}
	
	/* td 호버 */
	td:hover {
	    cursor: pointer;
    }
	
</style>
</head>
<body>

	<div class="d-flex" style="margin-top: 75px;">
		
		<!-- 관리자 사이드바 -->
		<div id="admin_sidebar">
	        <h4 class="text-center" style="padding-bottom: 12px;"><b>관리자 메뉴</b></h4>
	        <ul>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-home" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;관리자 메인
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMember.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-users" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;회원 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-table" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;데이터베이스 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
						<i class="fas fa-medkit" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;영양제분석 결과 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-server" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;머신러닝 모델 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-heartbeat" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;질병예측 결과 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-comment" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;피드백 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-chart-bar" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;서비스 통계 및 분석
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-file-alt" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;시스템 로그 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-shield-alt" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;보안 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-cog" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;서비스 설정 관리
	        		</a>
	        	</li>
	        </ul>
	    </div><!-- 관리자 사이드바 -->
	    
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->	

		<!-- 전체 내용 -->
	    <div id="admin_content" style="display: flex; justify-content:center; flex-wrap: wrap;">
			
			<h4 class="text-center" style="width:95%; padding-bottom: 20px; border-bottom: 1px solid #ccc;"><b>데이터베이스 관리</b></h4>
	    
	    	<!-- 1번 div -->
	        <div class="each-container">
		        <!-- 도표1: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px;">
					<p class="text-center" style="font-size: 16px;"><b>Top10 영양제 테이블 통계</b></p>
					<div style="height: 200px; width: 550px; margin-left: 30px;">
				    	<!-- 혼합 차트를 그릴 캔버스 -->
    					<canvas id="mixedChart" style="width: 570px; height: 200px;"></canvas>
				    </div>
				</div>
				 <!-- 도표2: 막대 그래프 -->
		        <div class="chart-container">
		        	<p class="text-center" style="font-size: 16px;"><b>Top10 영양소 테이블 통계</b></p>
		        	<div style="height: 200px; width: 570px; margin-left: 20px;">
		            	<!-- 막대 차트를 그릴 캔버스 -->
    					<canvas id="barChart" style="width: 570px; height: 200px;"></canvas>
		            </div>
		        </div>
			</div>
	    	
	        <!-- 2번 div -->
			<div class="each-container">
				<!-- 회원테이블 -->
		        <div class="chart-container table-wrapper" style="height: 650px;">
			        <div style="display: flex; justify-content: center; align-items: center; margin-bottom: 13px;">
					    <select id="change" class="form-control mr-4" style="width: 190px; font-size: 16px; font-weight: bold;">
					        <option selected>영양제 테이블 목록</option>
					        <option>영양소 테이블 목록</option>
					    </select>
					</div>
		        	<div class="table-wrapper" style="height: 531px; overflow-y: auto; padding-right: 5px;">
					    <table id="first">
					        <thead>
				                <tr>
				                    <th>번호</th>
				                    <th>이름</th>
				                    <th>기능</th>
				                    <th>포함 영양소</th>
				                    <th>리뷰수</th>
				                    <th>별점</th>
				                </tr>
				            </thead>
				            <tbody>
						        <c:forEach var="foodInfo" items="${foodInfos}" varStatus="loop">
								    <tr onclick="location.href='/NutrientToFoodDetail.do?name=${foodInfo.productName }'">
								        <td>${loop.count}</td>
								        <td>${foodInfo.productName }</td>
								        <td>${fn:replace(foodInfo.material, '$', ',') }</td>
								        <td>${fn:replace(foodInfo.nutrient, '$', ',') }</td>
								        <td>${foodInfo.reviewCount }</td>
								        <td>${foodInfo.avgStarScore }</td>
								    </tr>
								</c:forEach>
					        </tbody>
					    </table>
					    <table id="second" style="display: none;">
					    	<thead>
				                <tr>
				                    <th>번호</th>
				                    <th>이름</th>
				                    <th>기능</th>
				                    <th>포함 영양제</th>
				                    <th>조회수</th>
				                </tr>
				            </thead>
				            <tbody>
						        <c:forEach var="member" items="${members }">
							        <tr>
							            <td></td>
							            <td></td>
							            <td></td>
							            <td></td>
							            <td></td>
							        </tr>
						        </c:forEach>
					        </tbody>
					    </table>
			    	</div>
				</div>
			</div><!-- 테이블 -->
	    </div><!-- 전체 내용 -->
	    
	</div><!-- 컨테이너 -->
	
    <script>
	    
	 	// 페이지 로드 시 차트 생성
	    document.addEventListener('DOMContentLoaded', () => {

	     	// select 요소의 변경 이벤트를 감지하여 처리
	        $("#change").change(function() {
	            var selectedOption = $(this).val();
	            if (selectedOption === "영양소 테이블 목록") {
	                // 영양소 테이블 목록이 선택되었을 때
	                $("#first").hide(); // first 테이블을 숨김
	                $("#second").show(); // second 테이블을 보임
	            } else {
	                // 영양제 테이블 목록이 선택되었을 때
	                $("#first").show(); // first 테이블을 보임
	                $("#second").hide(); // second 테이블을 숨김
	            }
	        });
	        
	        
	    });
	    
	 	// 혼합 차트 레이블
        var mixedLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

        // 혼합 차트 데이터 (레이블 10개에 맞게 데이터 갯수도 10개로 맞춤)
        var mixedData = {
            labels: mixedLabels,
            datasets: [
                {
                    type: 'line',
                    label: 'Line Dataset',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    data: [12, 19, 3, 5, 2, 10, 6, 8, 4, 15]
                },
                {
                    type: 'bar',
                    label: 'Bar Dataset',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                    data: [7, 11, 5, 8, 3, 12, 9, 5, 3, 6]
                }
            ]
        };

        // 혼합 차트 그리기
        var mixedChartCtx = document.getElementById('mixedChart').getContext('2d');
        var mixedChart = new Chart(mixedChartCtx, {
            type: 'bar',
            data: mixedData
        });

        // 첫 번째 AJAX 요청
        $.ajax({
            url: '/getFoodInfo',
            method: 'GET',
            dataType: 'json',
            success: function(response) {
                // 서버로부터 받은 데이터를 처리하는 로직
                console.log('첫 번째 AJAX 요청 성공:', response);
            },
            error: function(error) {
                console.error('첫 번째 AJAX 요청 실패:', error);
            }
        });     	
	     	
     	// 막대 차트 레이블
        var barLabels = ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange', 'Pink', 'Cyan', 'Lime', 'Brown'];

     	// 막대 차트 데이터 (레이블 10개에 맞게 데이터 갯수도 10개로 맞춤)
        var barData = {
            labels: barLabels,
            datasets: [{
                label: 'Bar Dataset',
                backgroundColor: ['red', 'blue', 'yellow', 'green', 'purple', 'orange', 'pink', 'cyan', 'lime', 'brown'],
                borderColor: 'black',
                borderWidth: 1,
                data: [12, 19, 3, 5, 2, 10, 6, 8, 4, 15]
            }]
        };

        // 막대 차트 그리기
        var barChartCtx = document.getElementById('barChart').getContext('2d');
        var barChart = new Chart(barChartCtx, {
            type: 'bar',
            data: barData
        });

        // 두 번째 AJAX 요청
        $.ajax({
            url: '두 번째_ajax_요청_URL_여기에_입력',
            method: 'GET',
            dataType: 'json',
            success: function(response) {
                // 서버로부터 받은 데이터를 처리하는 로직
                console.log('두 번째 AJAX 요청 성공:', response);
            },
            error: function(error) {
                console.error('두 번째 AJAX 요청 실패:', error);
            }
        });
        
        
        
        
        
        
    </script>
</body>
</html>