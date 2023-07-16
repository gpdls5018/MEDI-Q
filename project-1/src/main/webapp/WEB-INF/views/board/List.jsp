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
        	top:calc(100vh - 850px);
        	left:10%;
        	color:white;
        	margin:0px;
        }
        .qna_img{
            position:absolute;
            width: 200px;
            top:calc(100vh - 700px);
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
        <div class="container-fluid pt-3 mt-3">
            <div class="row d-flex flex-wrap align-content-stretch">
                <div class="d-flex col-2">
                </div>
                <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="col">
                        <h2 class="font-weight-bold ml-5">지금 인기있는 질문!!</h2>
                        <div class="row justify-content-center">
	                        <!-- 게시판 시작 -->
	                        <div class="qna-card">
		                        <div class="ingredient-tags">
		                            <div class="ingredient-tag">
		                                성분 정보
		                            </div>
		                        </div>
		                        <br/>
		                        <a tabindex="0" class="qna-main text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="#">
		                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>영양제 유통기한 넘은 것은 얼마 후 까지 먹어도 될까요?</span>
		                            <span class="txt2">대체로 몇 개월 ~ 몇년까지 초과한 것을 억어도 되는지 궁금하고 분말,연질 캡슐, 경질 캡슐, 타블렛 등 제재에 따라 
		                            섭취 기한이 긴 순서를 각각 알고 싶습니다.</span>
		                        </a>
		                        <a tabindex="0" class="qna-user-wrap text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="#">
		                                <div class="qna-user-icon qna-user-icon-1"></div>
		                                <div class="qna-user-txt">A.영양제 유통기한이 지났다면 아깝지만 건강을 위해서 버리는게 나아요.</div>
		                            <div class="user-info-row">
		                                <span class="user-name">유**</span>
		                                <span class="user-agesex">30대/여</span>
		                            </div>
		                        </a>
		                    </div><!-- qna-card의 끝 -->
		                    <div class="qna-card">
		                        <div class="ingredient-tags">
		                            <div class="ingredient-tag">
		                                성분 정보
		                            </div>
		                        </div>
		                        <br/>
		                        <a tabindex="0" class="qna-main text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="#">
		                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>과다 복용 관련</span>
		                            <span class="txt2">인터넷에서 찾아보니깐 섭취권장량이 남성 16mgNE라고 하는데 어플은 50~1000mgNE 까지가 최적적량이라고
                                        나와있는데 뭐가 맞는건가요? 제가 잘못 이해하고 있는건가요?</span>
		                        </a>
		                        <a tabindex="0" class="qna-user-wrap text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="#">
		                                <div class="qna-user-icon qna-user-icon-1"></div>
		                                <div class="qna-user-txt">A.권장섭취량과 충분섭취량,상한섭취량을 구분해서 영양소를 복용해주세요</div>
		                            <div class="user-info-row">
		                                <span class="user-name">만**</span>
		                                <span class="user-agesex">30대/남</span>
		                            </div>
		                        </a>
		                    </div><!-- qna-card의 끝 -->
		                    <div class="qna-card">
		                        <div class="ingredient-tags">
		                            <div class="ingredient-tag">
		                                기타
		                            </div>
		                        </div>
		                        <br/>
		                        <a tabindex="0" class="qna-main text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="#">
		                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>코로나 걸렸을 때 영양제</span>
		                            <span class="txt2">코로나 확진 4일차에요. 혹시 같이 먹으면 좋은 영양제 있을까요? 궁금합니다.</span>
		                        </a>
		                        <a tabindex="0" class="qna-user-wrap text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="#">
		                                <div class="qna-user-icon qna-user-icon-1"></div>
		                                <div class="qna-user-txt">A.코로나 감염을 예방하기 위해, 또는 코로나 후유증에서 빨리 벗어나기 위해서는 비타민 C, 비타민 D, 아연 등
                                        면역에 관련된 영양제가 도움이 됩니다.</div>
		                            <div class="user-info-row">
		                                <span class="user-name">나**</span>
		                                <span class="user-agesex">20대/여</span>
		                            </div>
		                        </a>
		                    </div><!-- qna-card의 끝 -->
                        </div>
                        <br/>
                        <br/>
                        <br/>
  
                        <h2 class="ml-5 font-weight-bold font-weight-bold">Q & A 게시판</h2>
                        <!-- 질문에 대한 컨테이너 -->
                        <a  href='<c:url value="/board/Write.do"/>'><span class="btn_text">질문 작성</span></a>
                        <div class="row justify-content-center">
                        	<div class="jumbotron bg-info">
								<h1>
									Spring Framework <small>한줄 댓글-전체 목록 페이지(${listPagingData.map.nowPage }/${listPagingData.map.totalPage })</small>
								</h1>
							</div>
                        	<c:if test="${empty listPagingData.records }" var="isEmpty">
								<div>등록된 자료가 없습니다.</div>
							</c:if>
							<!-- 여기부터 리스트 나올 것: 1제목,2내용,3나이,4성별,5작성자 -->
                            <c:if test="${not isEmpty }">
                            	<c:forEach var="record" items="${listPagingData.records }">
									<div class="qna-card">
				                        <div class="ingredient-tags">
				                            <div class="ingredient-tag">
				                                기타
				                            </div>
				                        </div>
				                        <br/>
				                        <a tabindex="0" class="qna-main text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="/board/View.do?no=${record.NO }">
				                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>${record.TITLE }</span>
				                            <span class="txt2">${record.CONTENT }</span>
				                        </a>
				                        <a tabindex="0" class="qna-user-wrap text-decoration-none" title="이 Q&amp;A의 상세정보 보기" href="/board/View.do?no=${record.NO }">
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