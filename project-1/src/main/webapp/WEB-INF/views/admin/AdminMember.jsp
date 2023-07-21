<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 예시로 Chart.js 라이브러리를 사용하여 막대 그래프 생성하는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">



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
    	margin: 20px 40px;
    	
    }
    
    /* 컨텐츠 내 차트 */
    .chart-container {
    	width: 600px; 
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
        background-color: rgba(54, 162, 235, 0.6);
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    /* 버튼 스타일링 */
    .button-wrapper {
        display: flex;
        justify-content: space-between;
    }

    .button {
        border-radius: 4px;
        background-color: #EF605D;
        border: none;
        color: white;
        text-align: center;
        cursor: pointer;
        margin: 2px;
        font-size: 9px;
    }
    
    .button:hover {
	    background-color: #d64845; /* 버튼 호버 시 배경색이 더 진한 색으로 변경 */
    }

    .button span {
        cursor: pointer;
        display: inline-block;
    }
    
    /* 스크롤바 색상 설정 */
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
	        			&nbsp;&nbsp;영양소 테이블 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
						<i class="fas fa-heartbeat" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;건강고민 및 선호제형 관리
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
	        			<i class="fas fa-search" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;질병 예측 결과 조회
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
			
			<h4 class="text-center" style="width:95%; padding-bottom: 20px; border-bottom: 1px solid #ccc;"><b>회원 관리</b></h4>
	    
	    	<!-- 1번 div -->
	        <div class="each-container">
		        <!-- 도표1: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px;">
				    <canvas id="lineChart"></canvas>
				</div>
				 <!-- 도표2: 막대 그래프 -->
		        <div class="chart-container">
		            <canvas id="barChart"></canvas>
		        </div>
			</div>
	    	
	        <!-- 2번 div -->
			<div class="each-container">
				<!-- 회원테이블 -->
		        <div class="chart-container table-wrapper" style="height: 650px; overflow: auto;">
		        	<p class="text-center" style="font-size: 16px;"><b>회원 목록</b></p>
				    <table>
				        <tr>
				            <th>아이디</th>
				            <th>이름</th>
				            <th>생년월일</th>
				            <th>이메일</th>
				            <th>설정</th>
				        </tr>
				        <c:forEach var="member" items="${members }">
					        <tr>
					            <td>${member.id }</td>
					            <td>${member.name }</td>
					            <td>${member.birth }</td>
					            <td>${member.email }</td>
					            <td>
					            	<div class="button-wrapper">
					            		<!-- 수정 버튼 -->
				                        <button class="button" onclick="location.href='/editMember?id=${member.id}'">
				                            <span>수정</span>
				                        </button>
				                        <!-- 삭제 버튼 -->
				                        <button class="button" onclick="deleteMember(${member.id})">
				                            <span>삭제</span>
				                        </button>
				                    </div>
					            </td>
					        </tr>
				        </c:forEach>
				        
				    </table>
				</div>
			</div>
			
		
			
			
		    
	    </div><!-- 전체 내용 -->
	    
	</div><!-- 컨테이너 -->
	
    <script>
	    
		// 막대 그래프
	    new Chart(document.getElementById('barChart'), {
            type: 'bar',
            data: {
                labels: ['A', 'B', 'C', 'D'],
                datasets: [{
                    label: '막대 그래프',
                    data: [30, 50, 70, 40],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
	
	    // 라인 차트
	    new Chart(document.getElementById('lineChart'), {
	        type: 'line',
	        data: {
	            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
	            datasets: [{
	                label: '라인 차트',
	                data: [10, 20, 30, 25, 35],
	                borderColor: 'rgba(54, 162, 235, 1)',
	                borderWidth: 1,
	                fill: false
	            }]
	        },
	        options: {
	            responsive: true,
	            maintainAspectRatio: false,
	            scales: {
	                y: {
	                    beginAtZero: true
	                }
	            }
	        }
	    });
	
	    // 파이 차트
	    new Chart(document.getElementById('pieChart'), {
	        type: 'pie',
	        data: {
	            labels: ['Red', 'Blue', 'Yellow'],
	            datasets: [{
	                data: [30, 40, 20],
	                backgroundColor: [
	                    'rgba(255, 99, 132, 0.6)',
	                    'rgba(54, 162, 235, 0.6)',
	                    'rgba(255, 206, 86, 0.6)'
	                ],
	                borderColor: [
	                    'rgba(255, 99, 132, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)'
	                ],
	                borderWidth: 1
	            }]
	        },
	        options: {
	            responsive: true,
	            maintainAspectRatio: false
	        }
	    });
	
	    // 레이더 차트
	    new Chart(document.getElementById('radarChart'), {
            type: 'radar',
            data: {
                labels: ['A', 'B', 'C', 'D', 'E'],
                datasets: [{
                    label: '레이더 차트',
                    data: [70, 80, 60, 90, 50],
                    backgroundColor: 'rgba(75, 192, 192, 0.6)', // 보라색으로 변경
                    borderColor: 'rgba(75, 192, 192, 1)', // 보라색으로 변경
                    borderWidth: 1,
                    pointBackgroundColor: 'rgba(75, 192, 192, 1)', // 보라색으로 변경
                    pointBorderColor: '#fff',
                    pointHoverBackgroundColor: '#fff',
                    pointHoverBorderColor: 'rgba(75, 192, 192, 1)' // 보라색으로 변경
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    r: {
                        beginAtZero: true
                    }
                }
            }
        });
	    
		// 회원 삭제 함수
        function deleteMember(id) {
            if (confirm('정말로 이 회원을 삭제하시겠습니까?')) {
                // 삭제 요청을 서버로 보낼 수 있는 코드 작성
                // 삭제 후 페이지 새로고침 또는 필요한 동작 수행
                alert('회원 삭제 처리를 수행합니다. (회원 ID: ' + id + ')');
            } else {
                // 삭제 취소 시 동작
            }
        }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
        
        
        
        
    </script>
</body>
</html>