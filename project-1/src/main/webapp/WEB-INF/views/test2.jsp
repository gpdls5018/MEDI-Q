<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<jsp:include page="/WEB-INF/views/template/SelectFoodListStyleScript.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     <style>
body{
	background-color: white;
}
#contentInfoCon {
    position: relative;
    height: 383px;
    display: flex;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
#contentInfoCon .content-sub-tit {
    font-size: 16px;
    color: #222;
    overflow: hidden;
}
#contentInfoCon .content-tit {
    color: #222;
    font-size: 45px;
    font-weight: 700;
    line-height: 1.36;
    letter-spacing: -0.02em;
    margin-top: 37px;
}
.visual-img-con {
	position:absolute;
	width:100%;
	height:100%;
    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_company.jpg") no-repeat;
    background-color: #fff;
    z-index: 1;
    top:70px;
	border:none;
}
.tsarea {
	position: absolute;
	width: 1000px;
	height: 250px;
	top:170px;
	left:50px;
	border:none;
	z-index: 2;
	text-align: center;
	box-shadow: 0px 0px 0px white;
	align-items: center;
}
.food-box {
    border: 1px solid #ccc;
    padding: 15px;
    margin: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
  }
  
  .food-info {
    font-weight: bold;
    margin-bottom: 10px;
  }
  
  .label-value-container {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
  }
  
  .label {
    color: #888;
    font-size: 12px;
    flex: 1;
  }
  
  .value {
    color: #333;
    font-size: 14px;
    flex: 2;
  }
  
  h1 {
	  text-align: center;
	}
  .chart_dnt_1,
  .chart_dnt_2 {
    width: 300px;
    display: inline-block;
  }
  .overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.6);
  z-index: 1000;
}

/* 모달 스타일 */
.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  z-index: 1001;
}
.modal-content {
  background-color: white;
  margin: 20% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 600px;
  border-radius: 5px;
}
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span><span style="color:#EF605D;">MEDI-Q</span> 영양제 인기순위</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">실제 섭취하는 유저들의 리뷰와 피드백으로 만든<br/> 가장 믿을만한 영양제 랭킹을 만나보세요</p>
            </h3>
        </div>
    </aside>
    
<!-- ------------------------------------------------------------------------------- -->    
<div class="all-wrap">
	<div class="all-wrap-in all-wrap-in-070">
		<div class="ingredient-search-top">
			<div class="content" style="background-color:#fdfbf6; padding-bottom: 20px;">
			<!-- 건기식 또는 회사이름을 적었을 경우 -->
				<div class="top-wrap-070">
					<h1 class="txt2 text-center" style="margin-bottom: 30px; font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<span>건강 고민</span></h1>
				</div>
				<div class="overlay" id="overlay"></div>
				<button id="openModalBtn">모달 열기</button>
				<!-- 모달 -->
				<div id="modal" class="modal">
			 		<div class="modal-content">
			 			<form action="/food/userinfo.do" method="post">
			    		<input name="height" id="height" required placeholder="키를 입력해주세요">
				    	<input name="Weight" id="weight" required placeholder="몸무게를 입력해주세요">
				   	 	<input name="age" id="age" value="${age }" hidden="true">
				   	 	<input name="Fatrate" id="fatrate" required placeholder="지방의 비율을 입력해주세요">
				   	 	<input name="Prorate" id="prorate" required placeholder="단백질의 비율을 입력해주세요">
				   	 	<input name="Cbhrate" id="cbhrate" required placeholder="탄수화물의 비율을 입력해주세요">
				    	<select id="healthIssueSelect" name="healthIssueSelect" onchange="submitForm()" class="ipt-main">
							<option value="1">앉아서 일하는 경우</option>
							<option value="2">가벼운 활동(운동없이 약간의 활동)</option>
							<option value="3">보통 활동(주3~4회 운동)</option>
							<option value="4">활발한 활동(주 5~7회 운동)</option>
							<option value="5">매우 활발한 활동(일일 운동 및 육체적 노동)</option>
						</select>
				    	<button id="caloriesBtn" name="cabtn" style="border: 1px solid black;background-color: black;color:white;font:bold;border-radius: 5px 5px 5px 5px;">칼로리 계산</button>
				    	</form>
					</div>
				</div>
			
			
				<div class="chart_dnt_2">
					  <h1>칼로리기준 탄단지 비율</h1>
					  <canvas id="chart_doughnut_2"></canvas>
				</div>
    			<p id="result"></p>
    			
				<c:if test="${not empty fat}">
					<div class="chart_dnt_1">
					  <h1>탄단지 비율</h1>
					  <canvas id="chart_doughnut_1"></canvas>
					</div>
				</c:if>
				<div class="ipt-main-wrap"></div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
					<div class="ipt-main-wrap">
						<form action="/food/foodsearch.do">
							<input id="searchProduct3" type="text" name="food" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${takefood}" required placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</form>
					</div>
				</div>
			</div>
		</div>
<!-- ----------------------여기부터 시작----------------------------------- -->
	<style>
	/*오픈chat용 css*/	
	#chatMessage{
	 	height:550px;
	 	background:#FBFFDC;
	 	border:1px solid #EDEAED;
	 	overflow:auto;
	}
	/* //이거 참고용으로 가져온것임 완성하면 지워야됨
	.bottom .black {
		color: #3333;
		border-top: 1px solid #dbdbdb;
	} 
	*/
	.ext {
		text-align: left;
	}
	
	.ext span {
		/*background: #98EECC;*/
		background: #D0F5BE;
		border-radius: 12px 12px 12px 2px;
		margin:10px 20px;
	}
	
	.int {
		text-align: right;
	}
	
	.int span {
		/*background: #D0F5BE;*/
		background: #98EECC;
		border-radius: 12px 12px 2px 12px;
		margin:10px 20px;
	}
	.ocspan{
		display: inline-block;
		max-width: 180px;
		padding: 5px 10px;
		position: relative;
		word-wrap: break;
	}
	/*오픈chat용 css 끝*/	
	</style>	
		<div class="container">
			<fieldset class="form-group">
				<legend>실시간 채팅(웹소켓)</legend>
				
				<form>
					<div class="form-group">
						<label><kbd>닉네임 설정</kbd></label>
						<input type="text" class="form-control" id="chatnickname" placeholder="닉네임 입력">
					</div>
					<input class="btn btn-primary" type="button" id="ocEnterBtn" value="입실">
					<input class="btn btn-danger" type="button" id="ocExitBtn" value="퇴실">
					<!-- 여기가 채팅방시작 -->
					<div class="form-group">
						<h4>오픈 채팅창 내용입니다</h4>
						<div id="chatMessage"></div>
					</div>
					<!-- 메세지 등록버튼 -->
					<div class="form-group">
						<label><kbd>메시지input 버튼임</kbd></label><!-- message를 ociMessage로 변경 -->
						<input type="text" class="form-control" id="ociMessage" placeholder="채팅 입력">
					</div>
				</form>
				
			</fieldset>
		</div><!-- container -->
<script>
	//오픈채팅용 자바스크립트 시작
	//오픈채팅웹소켓 저장용
	var ocwsocket;
	//오픈채팅닉네임 저장용
	var chatnickname;
	//내가 닉네임을 적어서 오픈채팅창 방에 들어오는 걸로 확정!
	$('#ocEnterBtn').one('click',function(){
		ocwsocket = new WebSocket("ws://localhost:9090<c:url value="/chat-ws"/>");

		console.log('ocwsocket:',ocwsocket);
		//서버와 연결된 웹 소켓에 이벤트 등록
		ocwsocket.onopen = open;
		ocwsocket.onclose = function(){
			appendMessage(" 연결이 끊어졌습니다.");
		};
		ocwsocket.onmessage=receive;//ocwsocket이 메세지를 받으면 recevive함수 실행
		ocwsocket.onerror=function(e){
			console.log('에러 발생:',e);
		};
	});
	//서버에 연결되었을때 호출되는 콜백함수
	function open(){
		//서버로 연결한 사람의 정보(닉네임) 전송
		//사용자가 입력한 닉네임 저장
		chatnickname = $('#chatnickname').val();
		ocwsocket.send('msg:'+chatnickname+' 가(이) 입장했습니다.');
		appendMessage(" 참가하였습니다.");
	}
	//서버에서 메세지를 받을때마다 호출되는 함수
	function receive(e){
		//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다.
		console.log('서버로부터 받은 메세지:',e.data);
		if(e.data.substring(0,4).toUpperCase() ==='MSG:'){
			//서버로부터 받은 메세지를 msg:부분을 자르고 div로 출력
			appendMessage('<p class="ext"><span class="ocspan">'+e.data.substring(4)+'</span></p>');
		}
	}
	//사용자가 입력한 메세지(확인용) 또는 서버로부터 받은 메세지를 채팅창에 출력하는 함수
	function appendMessage(msg){
		$('#chatMessage').append(msg);
		//스크롤바를 자동으로 위로 올리기
		$('#chatMessage').get(0).scrollTop=$('#chatMessage').get(0).scrollHeight;
	}
	
	//퇴장 버튼
	$('#ocExitBtn').one('click',function(){
		ocwsocket.send('msg:'+chatnickname+' 가(이) 퇴장했습니다.');
		ocwsocket.close();
	});
	//
	$('#ociMessage').on('keypress',function(e){
		
		if(e.keyCode===13){//엔터 입력
			//입력한 메시지 서버로 전송
			ocwsocket.send('msg: '+chatnickname+': '+$(this).val());
			appendMessage('<p class="int"><span class="ocspan">'+$(this).val()+"</span></p>");
			$(this).val("");
			//포커스 주기
			$(this).focus();
		}
	});
	//오픈채팅용 자바스크립트 끝
</script>
<!-- 이 아래 코드는 그 참고용으로 가져온것임 끝나면 지워야됨 -->
		<!-- 
		<div class="bottom black" style="background-color: rgb(255, 255, 255);"><div class="bottom_plus"><div class="my_info"><span>Guest_ccb84</span></div><button class="call_admin"><img src="//coktv24.1.inde.biz/plugin/indeSet/img/alarm.png">관리자호출</button></div>
					<table>
						<tbody><tr>
							<td class="inputWrap group">
								<div class="plus hoverOpacity"></div>
								<div class="whisperWrap"></div>
								<div class="emoticon hoverOpacity"></div>
								<div class="inputContent">
									<div class="chatInput" contenteditable="true" onclick="this.contentEditable='true'; this.focus(); return false;" placeholder="채팅 입력." tabindex="0"></div>
								</div>
							</td>
						</tr>
					</tbody></table>
					<div class="menuBar" style="display: none;"><div title="스크롤 고정" class="menu-style menubar-scroll" style="background-image: url(&quot;//coktv24.1.inde.biz/skin/basic/img/scroll.png&quot;); background-position: 0px -4px; float: right; margin: 0px;"></div><div title="이모티콘" class="menu-style menubar-emoticon hoverOpacity" style="background-image: url(&quot;//coktv24.1.inde.biz/skin/basic/img/black/emoticon.png&quot;);"></div><div title="관리자 호출" class="menu-style menubar-call_admin" style="background-image: url(&quot;//coktv24.1.inde.biz/skin/basic/img/alarm.png&quot;);"></div></div>
				</div>
		 -->
<!-- -----------------------------여기가 웹소캣 실시간 채팅 끝------------------------------------- -->
		<div class="new-wide-wrap new-wide-wrap-070">
			<div class="left-wing  ">
			    <ul class="sm-menu-wrap">
			        
			    </ul>
			</div>
			<c:forEach items="${foodlist }" var="foodlist">
				<div class="food-box">
				<form action="/food/intakefood.do">
				<input name="no" value="${foodlist.no }" type="hidden">
					<div class="food-info">음식 정보</div>
				  
				  <div class="label-value-container">
				    <div class="label">음식 번호:</div>
				    <div class="input value">${foodlist.no}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">음식 이름:</div>
				    <div class="value">${foodlist.foodname}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">제조사:</div>
				    <div class="value">${foodlist.company}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">1회 섭취량:</div>
				    <div class="value">${foodlist.oneprovide}${foodlist.capacity}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">칼로리:</div>
				    <div class="value">${foodlist.calorie}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">단백질:</div>
				    <div class="value">${foodlist.protein}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">지방:</div>
				    <div class="value">${foodlist.fat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">포화 지방:</div>
				    <div class="value">${foodlist.saturatedfat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">불포화 지방:</div>
				    <div class="value">${foodlist.unsaturatedfat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">트랜스 지방:</div>
				    <div class="value">${foodlist.transfat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">탄수화물:</div>
				    <div class="value">${foodlist.carbohydrate}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">총 당류:</div>
				    <div class="value">${foodlist.sugar}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">식이섬유:</div>
				    <div class="value">${foodlist.dietaryfiber}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">콜레스테롤:</div>
				    <div class="value">${foodlist.cholesterol}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">나트륨:</div>
				    <div class="value">${foodlist.sodium}</div>
				  </div>
				  <button id="ingestionbtn" style="border: 1px solid black">섭취</button>
				</form>
				</div>
			</c:forEach>
		</div>
	</div>
	<a id="goto_top" href="#" title="맨 위로"></a><!-- 위로가기 -->
</div><!-- all-wrap의 끝 -->
<script>
        if ($(this).scrollTop() > 20) {
            $('#goto_top').fadeIn();
            $('.f-footer-row1').addClass('active');
            $('.h-header').addClass('scroll');
            $('.all-wrap-in').addClass('scroll');
        } else {
            $('#goto_top').fadeOut();
            $('.h-header').removeClass('scroll');
            $('.all-wrap-in').removeClass('scroll');
        }

        /*화면 스크롤에 따른 조건부 노출 : 최하단 고정 행, 위로가기 버튼 */
        $(window).scroll(function() {
            if ($(this).scrollTop() > 20) {
                $('#goto_top').fadeIn();
                $('.f-footer-row1').addClass('active');
                $('.h-header').addClass('scroll');
                $('.all-wrap-in').addClass('scroll');
            } else {
                $('#goto_top').fadeOut();
                $('.h-header').removeClass('scroll');
                $('.all-wrap-in').removeClass('scroll');
            }

            /*우측 플로팅 영역관련*/
            var height1 = $(window).scrollTop();
            /*var rfixed = $('.r-fixed-area');
            var section1 = rfixed.offset().top;*/

            if(height1 > 200){
                $('.height1.active').addClass('fixed');
            }else{
                $('.height1.active').removeClass('fixed');
            }

            if(height1 > 6){
                $('.height2.active').addClass('fixed');
            }else{
                $('.height2.active').removeClass('fixed');
            }
        });

        $('#goto_top').click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
        var myChart = {
        		  init : function(){
        		    myChart.chart_line();
        		    myChart.chart_doughnut.init_doughnut();
        		  },
        		  
        		  // 차트 - 라인
        		  chart_line : function(){
        		    
        		  }, 
        		  
        		  // 차트 - 도넛   
        		  chart_doughnut : {
        		    init_doughnut : function(){
        		      myChart.chart_doughnut.chart_1();
        		    },
        		    chart_1 : function(){    
        		      var chart = document.getElementById("chart_doughnut_1");
        		      var data = {
        		          labels: ["탄수화물","지방","단백질"],
        		          datasets: [
        		              {
        		                  data: [${carbohydrate}, ${fat}, ${protein}],
        		                  backgroundColor: [
        		                      "#f23456",
        		                      "#afff2a",
        		                      "#f5dc5a"
        		                  ],
        		                  hoverBackgroundColor: [
        		                      "#123456",
        		                      "#654321",
        		                      "#456123"
        		                  ]
        		              }]
        		      };
        		      var myDoughnutChart = new Chart(chart, {
        		          type: 'doughnut',
        		          data: data,
        		          options: {
        		              responsive: true,
        		              legend: false,
        		              title: {
        		                  display: false,
        		                  text: 'Chart.js Doughnut Chart'
        		              },
        		              animation: {
        		                  animateScale: true,
        		                  animateRotate: true
        		              },
        		              tooltips: {
        		                  callbacks: {
        		                      label: function(tooltipItem, data) {
        		                          var dataset = data.datasets[tooltipItem.datasetIndex];
        		                          var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
        		                              return previousValue + currentValue;
        		                          });
        		                          var currentValue = dataset.data[tooltipItem.index];
        		                          var precentage = Math.floor(((currentValue/total) * 100)+0.5);
        		                          return data.labels[tooltipItem.index] + " : " + precentage + " %";
        		                      },
        		                       mode: 'label'
        		                  }
        		              },
        		              cutoutPercentage:40,
        		          },
        		      });
        		    },
        		    // 차트1
        		  }
        		}
        		myChart.init();
        
        
</script>
<script>
		    var dailyCalories = ${dailyCalories};
		    console.log('dailyCalories : ' + ${dailyCalories})
		    // 계산된 칼로리 출력
		    var resultElement = document.getElementById('result');
		    resultElement.innerHTML = "하루에 필요한 칼로리: " + dailyCalories.toFixed(2) + "kcal";
		    var myChart = {
	        		  init : function(){
	        		    myChart.chart_line();
	        		    myChart.chart_doughnut.init_doughnut();
	        		  },
	        		  
	        		  // 차트 - 라인
	        		  chart_line : function(){
	        		    
	        		  }, 
	        		  
	        		  // 차트 - 도넛   
	        		  chart_doughnut : {
	        		    init_doughnut : function(){
	        		      myChart.chart_doughnut.chart_2();
	        		    },
	        		    chart_2 : function(){    
	        		      var chart = document.getElementById("chart_doughnut_2");
	        		      var data = {
	        		          labels: ["탄수화물","단백질","지방"],
	        		          datasets: [
	        		              {
	        		                  data: [(${dailyCalories}*${Cbhrate})/4, (${dailyCalories}*${Prorate})/4, (${dailyCalories}*${Fatrate})/9],
	        		                  backgroundColor: [
	        		                      "#f23456",
	        		                      "#afff2a",
	        		                      "#f5dc5a"
	        		                  ],
	        		                  hoverBackgroundColor: [
	        		                      "#123456",
	        		                      "#654321",
	        		                      "#456123"
	        		                  ]
	        		              }]
	        		      };
	        		      var myDoughnutChart = new Chart(chart, {
	        		          type: 'doughnut',
	        		          data: data,
	        		          options: {
	        		              responsive: true,
	        		              legend: false,
	        		              title: {
	        		                  display: false,
	        		                  text: 'Chart.js Doughnut Chart'
	        		              },
	        		              animation: {
	        		                  animateScale: true,
	        		                  animateRotate: true
	        		              },
	        		              tooltips: {
	        		                  callbacks: {
	        		                      label: function(tooltipItem, data) {
	        		                          var dataset = data.datasets[tooltipItem.datasetIndex];
	        		                          var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
	        		                              return previousValue + currentValue;
	        		                          });
	        		                          var currentValue = dataset.data[tooltipItem.index];
	        		                          var precentage = Math.floor(((currentValue/total) * 100)+0.5);
	        		                          return data.labels[tooltipItem.index] + " : " + precentage + " %";
	        		                      },
	        		                       mode: 'label'
	        		                  }
	        		              },
	        		              cutoutPercentage:40,
	        		          },
	        		      });
	        		    },
	        		    // 차트2
	        		  }
	        		}
	        		myChart.init();
</script>
<script>
document.getElementById("openModalBtn").addEventListener("click", function() {
	  document.getElementById("overlay").style.display = "block";
	  document.getElementById("modal").style.display = "block";
	});

	// 배경 오버레이 또는 모달을 클릭하여 닫을 때 동작
	document.getElementById("overlay").addEventListener("click", closeModal);
	document.getElementById("modal").addEventListener("click", closeModal);
	
	document.getElementById("caloriesBtn").addEventListener("click", function() {
		  calculateCalories();
		  closeModal();
		});

	function closeModal(event) {
	  if (event.target === document.getElementById("overlay") || event.target === document.getElementById("modal")) {
	    document.getElementById("overlay").style.display = "none";
	    document.getElementById("modal").style.display = "none";
	  }
	}
	
</script>
</body>
</html>