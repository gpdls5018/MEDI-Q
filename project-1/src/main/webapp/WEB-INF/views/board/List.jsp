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
        .btn_deco{
        	width:120px;
        	height:50px;
			background: linear-gradient(180deg,#fd9068,#fbc1ab);
		}
		.qna_now{
			width:550px;
			height:90px;
		}
		.qna_bbs{
			width:325px;
			height:90px;
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
	            <img src="<c:url value="/resources/images/qna/pharm.png"/>" class="qna_img">
			</div>
        </div>
        <div class="container-fluid pt-5 mt-5">
            <div class="row d-flex flex-wrap align-content-stretch">
                <div class="d-flex col-2">
                </div>
                <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="col">
                        <img src="<c:url value="/resources/images/qna/qna_now.png"/>" class="qna_now ml-4">
                        <div class="row justify-content-center">
	                        <c:if test="${not isEmpty}">
	                        	<c:forEach var="record" items="${listPagingData.records }">
			                        <!-- 게시판 시작 -->
			                        <div class="qna-card">
				                        <div class="ingredient-tags">
				                            <div class="ingredient-tag">
				                                기타
				                            </div>
				                        </div>
				                        <br/>
				                        <a tabindex="0" class="qna-main text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=${record.NO }"/>">
				                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>${record.TITLE }</span>
				                            <span class="txt2">${record.CONTENT }</span>
				                        </a>
				                        <a tabindex="0" class="qna-user-wrap text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=${record.NO }"/>">
				                                <div class="qna-user-icon qna-user-icon-1"></div>
				                                <div class="qna-user-txt">A.코로나 감염을 예방하기 위해, 또는 코로나 후유증에서 빨리 벗어나기 위해서는 비타민 C, 비타민 D, 아연 등
		                                        면역에 관련된 영양제가 도움이 됩니다.</div>
				                            <div class="user-info-row">
				                                <span class="user-name">${record.NAME }</span>
				                                <span class="user-agesex">${record.AGE_GROUP} / ${record.GENDER}</span>
				                            </div>
				                        </a>
				                    </div><!-- qna-card의 끝 -->
								</c:forEach>
							</c:if>
                        </div>
                        <br/>
                        <br/>
                        <br/>
  						<div class="row align-items-end">
  							<div class="col">
	                        	<img src="<c:url value="/resources/images/qna/qna_bbs.png"/>" class="qna_bbs ml-4">
	                        </div>
	                        <div class="col">
	                        	<a class="d-flex justify-content-end mr-5 text-decoration-none" href='<c:url value="/board/Write.do"/>'>
	                        		<button class="btn btn-light text-light btn_deco text_3" style="font-size:20px;">질문 작성</button>
	                        	</a>
	                        </div>
                        </div>
                        <!-- 질문에 대한 컨테이너 -->
                        <div class="row justify-content-center">
                        	<c:if test="${empty listPagingData.records }" var="isEmpty">
								<div>등록된 자료가 없습니다.</div>
							</c:if>
							<!-- 여기부터 리스트 나올 것: 1제목,2내용,3나이,4성별,5작성자 -->
                            <c:if test="${not isEmpty}">
                            	<c:forEach var="record" items="${listPagingData.records }">
									<div class="qna-card">
				                        <div class="ingredient-tags">
				                            <div class="ingredient-tag">
				                                기타
				                            </div>
				                        </div>
				                        <br/>
				                        <a tabindex="0" class="qna-main text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=${record.NO }"/>">
				                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>${record.TITLE }</span>
				                            <span class="txt2">${record.CONTENT }</span>
				                        </a>
				                        <a tabindex="0" class="qna-user-wrap text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=${record.NO }"/>">
				                                <div class="qna-user-icon qna-user-icon-1"></div>
				                                <div class="qna-user-txt">
				                                	<c:if test="${not empty listPagingData.records }" var="isEmpty">
														<div>약사님의 답변을 기달리는 중입니다.</div>
													</c:if>
				                                </div>
				                            <div class="user-info-row">
				                                <span class="user-name">${record.NAME }</span>
				                                <span class="user-agesex">${record.AGE_GROUP} / ${record.GENDER}</span>
				                            </div>
				                        </a>
				                    </div><!-- qna-card의 끝 -->
			                    </c:forEach>
                            </c:if>
                        </div>
                        <hr>
                    </div>
                </div>
                <div class="d-flex col-2 flex-wrap align-content-stretch">
                </div>
            </div>
        </div>
    </main>
	<!-- 페이징 출력 -->
	<div>${listPagingData.pagingString}</div>
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