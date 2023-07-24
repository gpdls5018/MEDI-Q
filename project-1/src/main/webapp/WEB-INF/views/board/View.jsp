<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<title>MEDI Q</title>
</head>
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
		background-color:#FDCDBC;
		border-radius: 20px;
	}
	.btn_deco{
		background: linear-gradient(180deg,#fd9068,#fbc1ab);
	}
	.qna_mascot{
		width:40px;
		position:relative;
		border-radius: 50%;
		background-size:contain;
	}
	.qna_ans{
		width:400px;
		height:90px;
	}
	.card_font1{
		font-size:26px;
	}
	.card_font2{
		color: #EF605D;
	}
</style>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 메인 바디 부분 -->
<body>
	<main>
	    <div class="d-flex justify-content-center" style="padding-top:120px;">
	        <div class="qna_banner">
	            <div class="qna_title">
	                <p class="text_1 m-0">Q &amp; A</p>
	                <span class="text_2 m-0">답답했던 영양제의 모든 것!</span>
	            	<p class="text_2">전문가에게 물어보세요</p>
	            </div>
	            <img src="<c:url value="/resources/images/qna/pharm.png"/>" class="qna_img">
			</div>
        </div>
        <!-- 게시판 시작 -->
	    <div class="container-fluid pt-5 mt-3">
	        <div class="row d-flex flex-wrap align-content-stretch">
	            <div class="d-flex col-2">
	            </div>
	            <!-- 게시판 가운데 부분 -->
	            <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
	                <div class="col pb-5">
	                    <img src="<c:url value="/resources/images/qna/qna_ans.png"/>" class="qna_ans ml-1">
	                    <div class="row justify-content-center">
	                    	<!--여기부터 답변출력  -->
	                    	<c:if test="${! empty FAILURE}">
								<div class="alert alert-success alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Failure!</strong> ${FAILURE }
								</div>
							</c:if>
							<!-- 질문 출력 부분 -->
							<div class="card_deco col-12 p-1 m-2">
	                            <div class="card-body p-2 m-3">
	                                <span class="card-title font-weight-bold card_font1"><span class="card_font2">Q.&nbsp;</span>${record.TITLE }</span>
	                                <br>
	                                <p class="card-text"><h5>${record.CONTENT }</h5></p>
	                                <hr style="border: 1px solid #E6E9ED;"/>
	                                <span class="card-text"><h6 class="font-weight-bold text-muted">${record.NAME } ${record.AGE_GROUP} / ${record.GENDER}</h6></span>
	                                <p class="card-text"><h6 class="font-weight-bold text-muted">${record.POSTDATE }</h6></p>
	                            </div>
	                        </div>
	                        <br/>
	                        <br/>
	                        <!-- 임시위치 버튼 -->
	                        <div class="d-flex flex-wrap flex-direction justify-content-center" id="content_footer">
								<a href='<c:url value="/board/Edit.do?no=${record.NO}"/>'class="text-decoration-none p-1">
									<button class="btn btn-light text-light btn_deco">수정</button>
								</a> 
								<a href="javascript:isDelete();" class="text-decoration-none p-1">
									<button class="btn btn-light text-light btn_deco">삭제</button>
								</a> 
								<a href='<c:url value="/board/List.do"/>' class="text-decoration-none p-1">
									<button class="btn btn-light text-light btn_deco">목록</button>
								</a>
								<!-- id가 관리자일때만 버튼이 보임 -->
								<!-- 기능구현이 끝나면 이 주석을 지워주세요 --><!-- 기능구현이 된다면 not을 붙이고 지워주셍 -->
								<!-- 참이면(not false) -->
								<%-- <c:if test="${sessionScope.id==comment.id }"> --%>
								<c:if test="${true}">
									<a href='<c:url value="/board/AnswerWrite.do?no=${record.NO}&title=${record.TITLE }"/>' class="text-decoration-none p-1">
										<button class="btn btn-light text-light btn_deco">답변작성</button>
									</a>
									<a href='<c:url value="/board/AnswerEdit.do?NO=${record.NO}&title=${record.TITLE }"/>' class="text-decoration-none p-1">
										<button class="btn btn-light text-light btn_deco">답변수정</button>
									</a>
									<a href='<c:url value="/board/AnswerWrite.do?no=${record.NO}&title=${record.TITLE }"/>' class="text-decoration-none p-1">
										<button class="btn btn-light text-light btn_deco">답변삭제</button>
									</a> 
								</c:if>
							</div>
	                    </div>
					</div><!-- 답변게시판 질문부분 끝 -->
	                <!-- 답변 게시판(관리자) -->
	                
	                <!-- 출력 부분 -->
	                <div class="card_deco col-12 p-1">
	                	
                        <div class="card-body card_deco_body m-2" style="padding:.5rem;">
                            <div class="card-text d-flex align-items-center">
                            	<img src="<c:url value="/resources/images/qna/pharmacist.png"/>" class="qna_mascot">
                            	<span class="text-light font-weight-bold text_3 ml-2">메디큐 약사님의 답변입니다</span>
                            </div>
                        </div>
                        <!--  -->
                        <div class="card-body m-2">
                        	<br>
                        	<!-- 답글이 존재하지 않을시 뷰 --
                        	<!-- 기능 구현 하기위해 not을 붙여둠 -->
                        	<c:if test="${not empty records}" var="isEmpty">
								<div id="empty-comment">
									<div class="font-weight-bold">약사님의 답변을 기달리는 중입니다.</div>
								</div>
							</c:if>
	                        <!-- 답글이 존재시 뷰 -->
	                        <c:if test="${not empty paramMap }">
		                        <span class="card-text"><h5>${paramMap.CONTENT}</h5></span><!-- 답변내용 -->
		                        <hr style="border: 1px solid #E6E9ED;"/>
		                        <div class="card-text d-flex align-items-center">
			                       	<button class="btn btn-light text-light btn_deco mr-3" onclick="increaseNum()">도움이 돼요</button>
			                       	<span class="font-weight-bold"><span id="number">0</span>명에게 도움이 됐습니다.</span>
			                   	</div>
			                   	<!-- 토큰의 id가 관리자일때 삭제버튼 표시 -->
			                   	<!-- 만약 기능 성공시 이 주석 삭제 -->
			                   	<%-- 
			                   	<c:if test="${sessionScope.id==comment.id }" var="isSame">
									<button class="btn btn-info btn-sm my-delete ">삭제</button> 
								</c:if>
								<c:if test="${not isSame }">삭제불가입니다</c:if> 
								--%>
							</c:if>
	                   	</div>
                        
                    </div>
                </div>
            </div>
            <div class="d-flex col-2 flex-wrap align-content-stretch">
            </div>
	        <div class="row d-flex flex-wrap flex-direction mt-2 justify-content-center">
	        	<div class="col-2"></div>
                <%-- <a class="col text-decoration-none text-dark text-center text_3 p-3" href="<c:url value="/board/View.do?no=${record.no-1}"/>">이전 질문</a> --%>
                <a class="col text-decoration-none text-dark text-center text_3 p-3" href="<c:url value="/board/List.do"/>">질문 목록</a><!-- 그냥 넘길지 page번호까지 넘길지 고민 중 -->
                <%-- <a class="col text-decoration-none text-dark text-center text_3 p-3" href="<c:url value="/board/View.do?no=${record.no+1}"/>">다음 질문</a> --%>
                <div class="col-2"></div>
            </div>
	    </div>
	    <br/>
	</main>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<script>
	function isDelete(){
		if(confirm("삭제하시겠습니까?")){
			location.replace("<c:url value="/board/Delete.do?no=${record.NO}"/>");
		}
	}
	//도움이 되요 증가함수
	function increaseNum() {
		var count = 0;//초기 숫자 값 설정  	
		count++;//숫자 증가
		document.getElementById("number").textContent = count;//숫자 표시 업데이트
	}
</script>