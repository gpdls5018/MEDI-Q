<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>MEDI Q</title>
<style>
	.qna_banner{
      	width:75%;
      	height:280px;
      	background-color:#FDCDBC;
          border-radius: 30px;
      }
      .qna_title{
      	position:relative;
      	top:calc(100vh - 96vh);
      	left:10%;
      	color:white;
      	margin:0px;
      }
      .qna_img{
          position:absolute;
          width: 200px;
          top:calc(100vh - 85vh);
          right:20%;
      }
      .text_1{
      	font-size:70px;
      	font-weight:bold;
      }
      .text_2{
      	font-size:30px;
      	font-weight:bold;
      }
      .text_3{
      	font-size:20px;
      	font-weight:bold;
      }
	.qna_now{
		height:80px;
	}
	.qna_ans{
		height:80px;
	}
	.card_deco{
		width: 92%;
	    display: block;
	    background: #FFFFFF;
	    border: 1px solid #E6E9ED;
	    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
	    border-radius: 20px;
	    text-align: left;
	}
	.card_deco_body{
		padding:0.5rem;
		background-color:#fc6124;
		border-radius: 20px;
	}
	.btn_deco{
		width:110px;
       	height:40px;
		background-color: #ff956c;
		border-radius:10px;
		box-shadow: 1px 1px 2px gray;
		border: none;
		color:white;
	}
	.btn_deco:hover {
		color:rgba(255,255,255,0.8);
	} 
	.qna_mascot{
		width:40px;
		position:relative;
		border-radius: 50%;
		background-size:contain;
	}
	.card_font1{
		font-weight: 700;
	    display: block;
	    font-size: 20px;
	    line-height: 26px;
	    text-align: left;
	    color: #101219;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
	.card_font2{
		font-weight: 600;
	    display: block;
	    text-align: left;
	    font-size: 16px;
	    line-height: 24px;
	    color: #787E8B;
	    margin: 8px 0px 0px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
	.card_font3 {
		color: #9BA1AA;
	    font-weight: 500;
	    font-size: 14px;
	    line-height: 22px;
	}
	.a_deco{
		color:black;
		cursor: pointer;
	}
	.a_deco:hover{
		color:gray;
	}
	.tsnava2:after {
		display: none;
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
	    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg") no-repeat;
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
	body{
		background-color: #fdfbf6;
	}
	.page-link{
		color:gray;
		margin:0px 10px 10px 0px;
		list-style: none;
		border: 2px solid #E6E9ED;
		transition: all 0.3s ease 0s;
		border-radius: 10px;
		font-weight: bold;
	}
	.page-link:hover{
		color:gray;
		
	}
	.page-item:last-child .page-link {
	    border-top-right-radius: 10px;
	    border-bottom-right-radius: 10px;
	}
	.page-item:first-child .page-link {
	    border-top-left-radius: 10px;
	    border-bottom-left-radius: 10px;
	}
	/*openchat용 css시작*/
	.ocfixed{
		position: fixed;
	    top: 360px; 
	    left: 30px;
	    width:400px; 
	    padding: 10px;
	    background:#FFF3D1; 
	    border: 4px solid #FFF0BB;
	    border-radius: 30px;
	    color:black;
	    z-index: 1000; 
	}
	.chatlegend{
		color:#201c1c;
		font-weight:700;
	}
	#chatMessage{
	 	height:300px;
	 	background:#FBFFDC;
	 	/*border:2px solid #EEFFD3; 완성시 삭제 예정*/
	 	border-radius: 2px;
	 	color:#7A7C7D;
	 	font-weight:500;
	 	overflow:auto;
	}
	.ext {
		text-align: left;
	}
	.ext span {
		background: #D0F5BE;
		border-radius: 18px 15px 18px 2px;
		color:#2b2323;
		margin:10px 20px;
	}
	.int {
		text-align: right;
	}
	.int span {
		background: #98EECC;
		border-radius: 15px 18px 2px 18px;
		color:#2b2323;
		margin:10px 20px;
	}
	.ocspan{
		display: inline-block;
		max-width: 180px;
		padding: 5px 10px;
		position: relative;
		word-wrap: break;
	}
	.btn_oc{
		width: 20px;
  		height: 20px;
	}
	#ocEnterBtn{
		/*border:2px solid #A6CAEA; 완성시 삭제 예정*/
		background:#C4CAEA;
		color:#464141;
	}
	#ocExitBtn{
		/*border:2px solid #EAEEF8; 완성시 삭제 예정*/
		background:#FADCE0;
		color:#464141;
	}
	/*오픈chat용 css 끝*/	
</style>
	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
        <!-- 브랜드 스토리 -->
        <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span><span style="color:#EF605D;">MEDI-Q</span> Q&amp;A</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">답답했던 영양제의 모든 것!<br/> 이제는 전문가에게 1 : 1로 물어보세요</p>
            </h3>
        </div>
    </aside>

        <div class="container-fluid" style="padding-top:150px">
            <div class="row d-flex flex-wrap align-content-stretch">
                <!-- 오픈채팅방 시작 -->
                <div class="d-flex col-3">
                	<div class="ocfixed">
	                	<div class="container">
							<fieldset>
								<legend class="chatlegend">오픈 채팅방</legend>
									<input type="text" class="form-control mb-3 btn" id="chatnickname" placeholder='"여기"를 눌러 닉네임을 입력해주세요.'>
									<div style="display: flex; justify-content: center;" class=" mb-3">
										<input class="btn mr-3" type="button" id="ocEnterBtn" value="입장하기">
										<input class="btn ml-3" type="button" id="ocExitBtn" value="퇴장하기">
									</div>
									<!-- 여기가 채팅방시작 -->
									<div id="chatArea" class="mb-3" style="display: none;">
										<!-- <h4>오픈 채팅방 내용입니다</h4>이거 삭제 할 수도 있음 -->
										<div id="chatMessage" class="mb-3"></div>
										<!-- 메시지 등록버튼 -->
										<!-- message를 ociMessage로 변경 -->
										<input type="text" class="form-control btn" id="ociMessage" placeholder="채팅을 입력해주세요.">
									</div>
							</fieldset>
						</div><!-- container -->
					</div>
                </div><!-- col-3 -->
                <div class="d-flex col-6 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="row pb-3"><!-- 세로로 자주찾는 질문&답변 게시물-->
                    	<!-- 인기 있는 질문시작 -->
                        <img src="<c:url value="/images/qna/qna_now.png"/>" class="qna_now">
                        <!-- 토큰이 존재하는 경우 버튼을 보여줍니다. -->
                        <c:if test="${not empty id }" var="isWriter"><!-- True,False를 isWriter에 저장-->
	                        <div class="col p-0 mt-5">
	                        	<a class="d-flex justify-content-end text-decoration-none" href='<c:url value="/board/Write.do"/>'>
	                        		<button class="btn_deco text_3" style="font-size:20px;">질문 작성</button>
	                        	</a>
	                        </div>
                        </c:if>
                        <div class="row justify-content-center pt-3 pb-3">
	                        <c:if test="${not isEmpty}">
	                        	<c:forEach var="like" items="${listPagingData.likes }"><!-- 추천수 TOP3 -->
			                        <a class="card_deco text-decoration-none a_deco col-12 p-1 m-2" href="<c:url value="/board/View.do?no=${like.NO }"/>">
			                            <div class="card-body p-2 mx-3 mb-3 mt-1 ">
      		                            	<p class="card-text"><h6 class="font-weight-bold  p-2" style="width:100px; border-radius:20px; background-color:#FFC0CB; color:#EF605D;">${like.POSTDATE }</h6></p>			                            
			                                <span class="card-title font-weight-bold card_font1"><sapn style="color:#EF605D;">Q.&nbsp;</sapn> ${like.TITLE }</span>
			                                
			                                <p class="card-text"><h5 class="card_font2">${like.CONTENT }</h5></p>
			                                <hr style="border: 1px solid #E6E9ED;"/>
			                                <span class="card-text"><h6 class="font-weight-bold card_font3">${like.NAME } ${like.AGE_GROUP} / ${like.GENDER}</h6></span>
			                            </div>
			                        </a>
								</c:forEach>
							</c:if>
                        </div>

                        <br/>
  						<div class="row align-items-end pt-4 pb-2">
  							<div class="col pt-3">
  								<!-- 1:1 답변 게시 시작 -->
	                        	<img src="<c:url value="/images/qna/qna_ans.png"/>" class="qna_ans">
	                        </div>
	                   
                        </div>
                        <!-- 질문에 대한 컨테이너 -->
                        <div class="row justify-content-center pt-2">
                        	<c:if test="${empty listPagingData.records }" var="isEmpty">
								<div>등록된 자료가 없습니다.</div>
							</c:if>
							<c:if test="${not isEmpty}">
                            	<c:forEach var="record" items="${listPagingData.records }">
                            		<a class="card_deco text-decoration-none a_deco col-12 p-1 m-2" href="<c:url value="/board/View.do?no=${record.NO }"/>">
			                            <div class="card-body  p-2 mx-3 mb-3 mt-1">			                                
			                            	<p class="card-text"><h6 class="font-weight-bold p-2" style="width:100px; border-radius:20px; background-color:#FFC0CB; color:#EF605D;">${record.POSTDATE }</h6></p>
			                                <span class="card-title font-weight-bold card_font1"><span style="color:#EF605D;">Q.&nbsp;</span>${record.TITLE }</span>
			                                <p class="card-text"><h5  class="card_font2">${record.CONTENT }</h5></p>
				                            <hr style="border: 1px solid #E6E9ED;"/>
			                                <span class="card-text"><h6 class="font-weight-bold card_font3">${record.NAME } ${record.AGE_GROUP} / ${record.GENDER}</h6></span>
			                            </div>
			                        </a>
								</c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="d-flex col-3 flex-wrap align-content-stretch">
                </div>
            </div>
        </div>
    </main>
	<!-- 페이징 출력 -->
	<div class="p-3">${listPagingData.pagingString}</div>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<script>
	//오픈채팅용 자바스크립트 시작
	//오픈채팅웹소켓 저장용
	var ocwsocket;
	//오픈채팅닉네임 저장용
	var chatnickname;
	//내가 닉네임을 적어서 오픈채팅창 방에 들어오는 걸로 확정!
	$('#ocEnterBtn').on('click',function(){
		chatnickname = $('#chatnickname').val();
		if (chatnickname.trim() === '') {
		    alert('닉네임 입력 시 입장 가능합니다.');
		    return;
		}
		ocwsocket = new WebSocket("ws://192.168.0.16:9090<c:url value="/chat-ws"/>");
		$('#chatArea').show();
		console.log('ocwsocket:',ocwsocket);
		//서버와 연결된 웹 소켓에 이벤트 등록
		ocwsocket.onopen = open;
		$(this).prop('disabled', true);
	    $('#chatnickname').prop('readonly', true);

		ocwsocket.onclose = function(){
			appendMessage(" 연결이 끊어졌습니다.");
			appendMessage("<br>재접속은 새로고침(F5).");
			appendMessage("<br>이후의 메시지는 전달되지 않습니다.");
			//appendMessage("<br>이후의 메시지는" + "<br>" + "전달되지 않습니다.");// 완성시 삭제 예정
		};
		ocwsocket.onmessage=receive;//ocwsocket이 메시지를 받으면 recevive함수 실행
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
		appendMessage("오픈 채팅방에 참가하였습니다.");
		$('#ociMessage').focus();
	}
	//서버에서 메시지를 받을때마다 호출되는 함수
	function receive(e){
		//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다.
		console.log('서버로부터 받은 메시지:',e.data);
		if(e.data.substring(0,4).toUpperCase() ==='MSG:'){
			//서버로부터 받은 메시지를 msg:부분을 자르고 div로 출력
			appendMessage('<p class="ext"><span class="ocspan">'+e.data.substring(4)+'</span></p>');
		}
	}
	//사용자가 입력한 메시지(확인용) 또는 서버로부터 받은 메시지를 채팅창에 출력하는 함수
	function appendMessage(msg){
		$('#chatMessage').append(msg);
		//스크롤바를 자동으로 위로 올리기
		$('#chatMessage').get(0).scrollTop=$('#chatMessage').get(0).scrollHeight;
	}
	
	//퇴장 버튼
	$('#ocExitBtn').one('click',function(){
		ocwsocket.send('msg:'+chatnickname+' 가(이) 퇴장했습니다.');
		ocwsocket.close();
		//$('#chatArea').hide();//퇴장 버튼 누를시 채팅 내용이 없어짐(애매함)
	});
	//
	$('#ociMessage').on('keypress',function(e){
		
		if(e.keyCode===13){//엔터 입력
			//입력한 메시지 서버로 전송
			ocwsocket.send('msg: '+chatnickname+'님: '+$(this).val());
			appendMessage('<p class="int"><span class="ocspan">'+$(this).val()+"</span></p>");
			$(this).val("");
			//포커스 주기
			$(this).focus();
		}
	});
	//오픈채팅용 자바스크립트 끝
</script>
