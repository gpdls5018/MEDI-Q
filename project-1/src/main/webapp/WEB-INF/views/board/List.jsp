<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
        .btn_deco{
        	width:120px;
        	height:50px;
			background: linear-gradient(180deg,#fd9068,#fbc1ab);
		}
		.qna_now{
			width:550px;
			height:90px;
		}
		.qna_ans{
			width:400px;
			height:90px;
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
			background:linear-gradient(180deg,#ff4b09,#ff956c);
		}
		.qna_mascot{
			width:40px;
			position:relative;
			border-radius: 50%;
			background-size:contain;
		}
		.card_font1{
			font-size:26px;
		}
		.card_font2{
			color: #EF605D;
		}
		.a_deco{
			color:black;
            cursor: pointer;
		}
		.a_deco:hover{
			color:gray;
		}
    </style>
</head>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<div id="tsmain">
<body>
    <main>
	    <div class="d-flex justify-content-center" style="padding-top:120px;">
	        <div class="qna_banner">
	            <div class="qna_title">
	                <p class="text_1 m-0">Q &amp; A</p>
	                <span class="text_2 m-0">답답했던 영양제의 모든 것!</span>
	            	<p class="text_2">전문가에게 물어보세요</p>
	            </div>
	            <img src="<c:url value="/images/qna/pharm.png"/>" class="qna_img">
			</div>
        </div>
        <div class="container-fluid pt-5 mt-5">
            <div class="row d-flex flex-wrap align-content-stretch">
                <div class="d-flex col-2">
                </div>
                <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="col">
                        <img src="<c:url value="/images/qna/qna_now.png"/>" class="qna_now">
                        <div class="row justify-content-center pt-4">
	                        <c:if test="${not isEmpty}">
	                        	<c:forEach var="record" items="${listPagingData.records }">
			                        <a class="card_deco text-decoration-none a_deco col-12 p-1 m-2" href="<c:url value="/board/View.do?no=${record.NO }"/>">
			                            <div class="card-body p-2 m-3">
			                                <span class="card-title font-weight-bold card_font1"><span class="card_font2">Q.&nbsp;</span>${record.TITLE }</span>
			                                <br>
			                                <p class="card-text"><h5>${record.CONTENT }</h5></p>
			                                <hr style="border: 1px solid #E6E9ED;"/>
			                                <span class="card-text"><h6 class="font-weight-bold text-muted">${record.NAME } ${record.AGE_GROUP} / ${record.GENDER}</h6></span>
			                                <p class="card-text"><h6 class="font-weight-bold text-muted">${record.POSTDATE }</h6></p>
			                            </div>
			                        </a>
								</c:forEach>
							</c:if>
                        </div>
                        <br/>
                        <br/>
                        <br/>
  						<div class="row align-items-end pb-4">
  							<div class="col">
	                        	<img src="<c:url value="/images/qna/qna_ans.png"/>" class="qna_ans p-0 m-0">
	                        </div>
	                        <!-- 토큰이 존재하는 경우 버튼을 보여줍니다. -->
	                        <c:if test="${not empty id }" var="isWriter"><!-- True,False를 isWriter에 저장-->
		                        <div class="col">
		                        	<a class="d-flex justify-content-end text-decoration-none mr-1" href='<c:url value="/board/Write.do"/>'>
		                        		<button class="btn btn-light text-light btn_deco text_3" style="font-size:20px;">질문 작성</button>
		                        	</a>
		                        </div>
	                        </c:if>
                        </div>
                        <!-- 질문에 대한 컨테이너 -->
                        <div class="row justify-content-center p-0 m-0">
                        	<c:if test="${empty listPagingData.records }" var="isEmpty">
								<div>등록된 자료가 없습니다.</div>
							</c:if>
							<c:if test="${not isEmpty}">
                            	<c:forEach var="record" items="${listPagingData.records }">
                            		<a class="card_deco text-decoration-none a_deco col-12 p-1 m-2" href="<c:url value="/board/View.do?no=${record.NO }"/>">
			                            <div class="card-body p-2 m-3">
			                                <span class="card-title font-weight-bold card_font1"><span class="card_font2">Q.&nbsp;</span>${record.TITLE }</span>
			                                <br>
			                                <p class="card-text"><h5>${record.CONTENT }</h5></p>
			                                <!-- 답변의 title을 필라이즈는 보여주지만 뽑기 힘들어서 일단 버림 삭제 예정?
			                                <hr style="border: 1px solid #E6E9ED;"/>
			                                <div class="card-text d-flex align-items-center">
				                            	<img src="<c:url value="/images/qna/pharmacist.png"/>" class="qna_mascot">
				                            	<%-- 
				                            	<c:if test="${empty listPagingData.records }" var="isEmpty">
				                            		<div class="text_3 ml-1">약사님의 답변을 기다리는 중입니다.</div>
												</c:if> --%>
				                            </div> -->
				                            <br/>
			                                <span class="card-text"><h6 class="font-weight-bold text-muted">${record.NAME } ${record.AGE_GROUP} / ${record.GENDER}</h6></span>
			                                <p class="card-text"><h6 class="font-weight-bold text-muted">${record.POSTDATE }</h6></p>
			                            </div>
			                        </a>
								</c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="d-flex col-2 flex-wrap align-content-stretch">
                </div>
            </div>
        </div>
    </main>
	<!-- 페이징 출력 -->
	<div class="p-3">${listPagingData.pagingString}</div>
	<!-- css적용 안했음  -->
    <!-- <ul class="pagination pagination-lg  justify-content-center">
        <li class="page-item"><a class="page-link" href="#">Prev</a></li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul> -->
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>