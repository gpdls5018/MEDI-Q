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
			width:120px;
        	height:50px;
			background-color: #FDCDBC;
			border-radius:15px;
			box-shadow: 1px 1px 2px gray;
			border: none;
			color:#EF605D;
		}
		.btn_deco:hover {
			color:black;
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
	width: 700px;
	height: 250px;
	top:120px;
	left:150px;
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
	border: 1px solid #E6E9ED;
	transition: all 0.3s ease 0s;
}
.page-link:hover{
	color:gray;
	
}
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 120px;">
                <span style="color:#EF605D; font-size: 32px;">Q &amp; A</span>
                <p style="font-weight: 600; font-size: 40px; margin-top: 10px; color:gray">답답했던 영양제의 모든 것!<br/> 전문가에게 물어보세요</p>
            </h3>
        </div>
    </aside>

        <div class="container-fluid pt-5 mt-5">
            <div class="row d-flex flex-wrap align-content-stretch">
                <div class="d-flex col-3"></div>
                <div class="d-flex col-6 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="row"><!-- 세로로 자주찾는 질문&답변 게시물-->
                    	<!-- 인기 있는 질문시작 -->
                        <img src="<c:url value="/images/qna/qna_now.png"/>" class="qna_now" style="width: 450px; height: 80px;">
                        <!-- 토큰이 존재하는 경우 버튼을 보여줍니다. -->
                        <c:if test="${not empty id }" var="isWriter"><!-- True,False를 isWriter에 저장-->
	                        <div class="col mt-4">
	                        	<a class="d-flex justify-content-end text-decoration-none mr-1" href='<c:url value="/board/Write.do"/>'>
	                        		<button class=" btn_deco text_3" style="font-size:20px;">질문 작성</button>
	                        	</a>
	                        </div>
                        </c:if>
                        <div class="row justify-content-center pt-2">
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
  							<div class="col">
  								<!-- 1:1 답변 게시물 시작 -->
	                        	<img src="<c:url value="/images/qna/qna_ans.png"/>" class="qna_ans p-0 m-0" style="width: 370px; height: 80px;">
	                        </div>
	                   
                        </div>
                        <!-- 질문에 대한 컨테이너 -->
                        <div class="row justify-content-center p-0 m-0">
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
			                                <!-- 답변의 title을 필라이즈는 보여주지만 뽑기 힘들어서 일단 버림 삭제 예정?
			                                <hr style="border: 1px solid #E6E9ED;"/>
			                                <div class="card-text d-flex align-items-center">
				                            	<img src="<c:url value="/images/qna/pharmacist.png"/>" class="qna_mascot">
				                            	<%-- 
				                            	<c:if test="${empty listPagingData.records }" var="isEmpty">
				                            		<div class="text_3 ml-1">약사님의 답변을 기다리는 중입니다.</div>
												</c:if> --%>
				                            </div> -->
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