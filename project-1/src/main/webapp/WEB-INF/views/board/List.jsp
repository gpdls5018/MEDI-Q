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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <title>MEDI Q</title>
    <style>
        figure{
            width: 100%;
            height: 400px;
            background: #FDCDBC;
            position: relative;
            overflow: hidden;
            padding-top: 250px;
            border-bottom-right-radius: 30px;
            border-bottom-left-radius: 30px;            
        }

        figure img {
            position: absolute;
            top: 0px;
            right: 200px;
            width: 20%;
        }

        figure .inner {
            width: 100%;
            top: -220px;
            left: 200px;
            position: relative;
        }

        figure .inner h1 {
            font-size: 150px;
            color: #fff;
        }
        figure .inner h3 {
            font-size: 50px;
            color: #fff;
        }
        .card{
            box-shadow: 2px 2px 10px rgb(165, 165, 165) ;
        }
        .text1{
            font-size: 20px;
        }
        .text2{
            font-size: 17px;
        }
        h1 {
            font-family:'Dongle',sans-serif;
            font-size: 5rem;
        }
        h2 {
            font-family:'Dongle',sans-serif;
            font-size: 4.5rem;
        }
        h3 {
            font-family:'Dongle',sans-serif;
            font-size: 4rem;
        }
        h4 {
            font-family:'Dongle',sans-serif;
            font-size: 3rem;
        }
        h5 {
            font-family:'Dongle',sans-serif;
            font-size: 2.25rem;
        }
        h6 {
            font-family:'Dongle',sans-serif;
            font-size: 2rem;
        }
    </style>
</head>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<div id="tsmain">
<body>
	
    <!-- <header class="p-3 bg-danger" alt="메뉴 부분">
        <div class="container">
            <div class="row">
                <h1 class="col-6 text-center"><a class="text-light text-decoration-none" href="#">Logo Position(Top)</a></h1>
                <ul class="list-unstyled d-flex align-items-center p-1">
                    <li class="col"><a class="text-light text-decoration-none" href="#">MENU1</a></li>
                    <li class="col"><a class="text-light text-decoration-none" href="#">MENU2</a></li>
                    <li class="col"><a class="text-light text-decoration-none" href="#">MENU3</a></li>
                    <li class="col"><a class="text-light text-decoration-none" href="#">MENU4</a></li>
                    <li class="col"><a class="text-light text-decoration-none" href="#">MENU5</a></li>
                </ul>
            </div>
        </div>
    </header> -->
    <main>
        <div class="container-fluid">
            <figure>
                <img src="<c:url value="/resources/images/qna/pharm.png"/>">
                <div class="inner">
                    <h1>Q & A</h1>
                    <h3>답답했던 영양제의 모든 것!</h3>
                    <h3>전문가에게 물어보세요</h3>
                </div>
            </figure>
        </div>
        <div class="everybanner1">
			<div class="everybanner1-1 clearfix"></div>
		</div>
        <div class="container-fluid pt-3 mt-3">
            <div class="row d-flex flex-wrap align-content-stretch">
                <div class="d-flex col-2">
                </div>
                <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="col">
                        <h2 class="m-3 font-weight-bold font-weight-bold">인기있는 질문!!</h2>
                        <div class="row justify-content-center">
                            <div class="card col-12 m-2 p-0">
                                <!--  -->
                                <a class="card-body text-dark text-decoration-none p-2" href="https://www.naver.com">
                                    <p class="card-title text1 font-weight-bold"><h4>Q.영양제 유통기한 넘은 것은 얼마 후 까지 먹어도 될까요?</h4></p>
                                    <p class="card-text"><h6>대체로 몇 개월 ~ 몇년까지 초과한 것을 억어도 되는지 궁금하고 분말,
                                        연질 캡슐, 경질 캡슐, 타블렛 등 제재에 따라 섭취 기한이 긴 순서를 각각 알고 싶습니다.</h6>
                                    </p>
                                    <p class="card-text text2 font-weight-bold pt-1"><h5>A.영양제 유통기한이 지났다면 아깝지만 건강을 위해서 버리는게 나아요.</h5></p>
                                    <p class="card-text"><h6 class="font-weight-bold">유** 30대/여</h6></p>
                                </a>
                            </div>
                            <div class="card col-12 m-2 p-0">
                                <a class="card-body text-dark text-decoration-none p-2" href="https://www.daum.net">
                                    <p class="card-title text1 font-weight-bold"><h4>Q.과다 복용 관련</h4></p>
                                    <p class="card-text"><h6>인터넷에서 찾아보니깐 섭취권장량이 남성 16mgNE라고 하는데 어플은 50~1000mgNE 까지가 최적적량이라고
                                        나와있는데 뭐가 맞는건가요? 제가 잘못 이해하고 있는건가요?</h6>
                                    </p>
                                    <p class="card-text text2 font-weight-bold pt-1"><h5>A.권장섭취량과 충분섭취량,상한섭취량을 구분해서 영양소를 복용해주세요</h5></p>
                                    <p class="card-text"><h6 class="font-weight-bold">만** 30대/남</h6></p>
                                </a>
                            </div>
                            <div class="card col-12 m-2 p-0">
                                <a class="card-body text-dark text-decoration-none p-2" href="https://www.naver.com">
                                    <p class="card-title text1 font-weight-bold"><h4>Q.코로나 걸렸을 때 영양제</h4></p>
                                    <p class="card-text">
                                        <h6>코로나 확진 4일차에요. 혹시 같이 먹으면 좋은 영양제 있을까요? 궁금합니다.</h6>
                                    </p>
                                    <p class="card-text text2 font-weight-bold pt-1">
                                        <h5>A.코로나 감염을 예방하기 위해, 또는 코로나 후유증에서 빨리 벗어나기 위해서는 비타민 C, 비타민 D, 아연 등
                                        면역에 관련된 영양제가 도움이 됩니다.</h5>
                                    </p>
                                    <p class="card-text"><h6 class="font-weight-bold">나** 20대/여</h6></p>
                                </a>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <br/>
  
                        <h2 class="m-2 font-weight-bold font-weight-bold">Q & A 게시판</h2>
                        <!-- 질문에 대한 컨테이너 -->
                        <a  href='<c:url value="/board/Write.do"/>'><span class="btn_text">질문 작성</span></a>
                        <div class="row justify-content-center">
                        	<div class="jumbotron bg-info">
								<h1>
									Spring Framework <small>한줄 댓글-전체 목록 페이지(${listPagingData.map.nowPage }/${listPagingData.map.totalPage })</small>
								</h1>
							</div>
                        	<table>
                        		<tbody class="table-sm down-file-body">
		                        	<c:if test="${empty listPagingData.records }" var="isEmpty">
									<tr>
										<td colspan="4">등록된 글이 없습니다.</td>
									</tr>
									</c:if>
		                            <!-- 여기부터 리스트 나올 것: 1제목,2내용,3나이,4성별,5작성자 -->
		                            <c:if test="${not isEmpty }">
		                            	<c:forEach var="record" items="${listPagingData.records }">
			                                <div class="card col-12 m-2 p-0">
				                                <a class="card-body text-dark text-decoration-none p-2" href="<c:url value="/board/View.do?NO=${record.NO }"/>">
				                                    
				                                    <p class="card-title text1 font-weight-bold"><h4>${record.TITLE }</h4></p>
				                                    <p class="card-text"><h6>${record.CONTENT }</h6></p>
				                                    <p class="card-text text2 font-weight-bold pt-1"><h5>답글:A.권장섭취량과 충분섭취량,상한섭취량을 구분해서 영양소를 복용해주세요</h5></p><!-- A는 admin(관리자) --> 
				                                    <p class="card-text"><h6 class="font-weight-bold">${record.NAME } ${record.AGE_GROUP} / ${record.GENDER} <%-- 작성일:${record.POSTDATE } --%></h6></p>
				                                </a>
			                                </div>
		                                </c:forEach>
		                            </c:if>
		                            
                            	</tbody>
                            </table>
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