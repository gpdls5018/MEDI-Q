<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
        .container {
            margin-top: 80px;
        }
        
        .nav {
            display: flex;
            justify-content: space-between; 
            list-style: none;
        }
        
        .nav-item {
            padding-left: 2px;
            padding-right: 2px;
        }
        
        .nav-link {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 10px;
            flex-grow: 1;
            text-align: center;
        }
        
        .nav-link:hover {
            color: inherit;
            background-color: inherit;
        }
        
        .nav-link:hover::before {
            color: inherit;
            background-color: inherit;
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
            
        }
       
        .nav-link.active::before {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
        }
    
        .tab {
            display: none;
            padding: 20px;
            border: 1px solid #ddd;
            border-top: none;
        }
        
        .tab.active {
            display: block;
        }

        .box-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .box {
            width: 110px;
            height: 110px;
			box-shadow: 0px 0px 7px rgba(0, 0, 0, 0.4);
        	transition: box-shadow 0.3s ease;
            border: 1px solid #ddd;
            border-radius: 10px 10px 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            position: relative;
            margin: 17.8px; /*배치되는 div 크기 맞추기*/
        }

        .box a {
            color: black;
            text-decoration: none;
        }

        .box:hover {
            font-weight: bold;
            box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.4);
        }

        .box.active {
            background-color: #bbb;
        }

        /*프로그레스 바*/
        .progress {
        	margin-top: -7px;
            width: 100%;
            height: 30px;
            background-color: #fcf8e3;
            position: relative;
            overflow: hidden;
            border: solid 1px;
        }

        .progress-bar-inner {
            position: absolute;
            top: 0;
            left: 0;
            width: 0%;
            height: 100%;
            background-color: rgb(253, 186, 41);
            animation: fillProgress 1.5s linear forwards;
        }
        .progress-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black;
            font-weight: bold;
        }

       
        
        /* 이미지 추가 */
		.image {
			position: relative;
			display: flex;
	        justify-content: center;
	        align-items: center;
			
		}
		
		.bj-img {
			border-radius: 10px 10px 10px 10px;
		}
		
		
		.image .text {
			position: absolute;
			top: 40px;
		 	font-weight: bold;
			color: black;
		}
        
		/*아래방향 화살표*/
		.arrow-down {
			width: 0;
	    	height: 0;
			border-left: 7px solid transparent;
			border-right: 7px solid transparent;
			border-top: 7px solid black;
		}

		/* 관련 영양제 뿌려주기 */
	    .scrollable-container {
	        height: 750px;  /* 스크롤 가능한 컨테이너의 높이 */
	        overflow-y: auto;  /* 세로 스크롤바 표시 */
	    }
	
	    .nutrient-item {
	        padding: 10px;
	        border-bottom: 1px solid #ccc;  /* 각 영양소 항목의 아래 경계선 설정 */
    	}
    	
    	/* WebKit 스크롤바 스타일링 */
	    .scrollable-container::-webkit-scrollbar {
	        width: 8px;  /* 스크롤바 너비 */
	    }

		.scrollable-container::-webkit-scrollbar-thumb {
	        background-color: rgb(253, 186, 41);  /* 스크롤바 썸네일 배경색 */
	        border-radius: 4px;  /* 스크롤바 썸네일 모서리 반경 */
	    }
		
	    .scrollable-container::-webkit-scrollbar-track {
	        background-color: #f1f1f1;  /* 스크롤바 트랙 배경색 */
	        border-radius: 4px;  /* 스크롤바 트랙 모서리 반경 */
	    }
	    
	    .scrollable-container::-webkit-scrollbar-thumb:hover {
		    background-color: #dc3545;  /* 스크롤바 썸네일 배경색 (호버 상태) */
		}
		
		/* 스타일 추가 */

		.search {
		  display: flex;
		}
		
		.searchTerm {
		  width: 500px;
		  border: 3px solid #0062cc;
		  border-right: none;
		  padding: 5px;
		  height: 50px;
		  border-radius: 10px 0 0 10px;
		  outline: none;
		}
		
		.searchTerm:focus{
		  color: black;
		}
		
		.searchButton {
		  width: 60px;
		  height: 50px;
		  border: 1px solid #0062cc;
		  background: #0062cc;
		  text-align: center;
		  color: #fff;
		  border-radius: 0 10px 10px 0;
		  cursor: pointer;
		  font-size: 20px;
		}
	
		.searchResults {
			width: 500px;
			text-align: left;
			margin-top: 20px;
			display: none; /* 초기에 숨김 처리 
			max-height: 100px;
			overflow-y: auto;
			border: 1px solid #ccc;
			padding: 10px;
		}			
		
		.searchResult {
		    cursor: pointer;
		    margin-bottom: 5px;
		}
	
		

    </style>
</head>
<body>

	<!-- 검색창 -->
	<div class="search d-flex justify-content-center" style="margin-top: 120px;">
	    <input style="font-size:17px;" type="text" class="searchTerm text-center" placeholder="어떤 영양소를 찾고 계신가요?‍"/>
	    <div class="searchResults"></div>
	    <button type="submit" class="searchButton">
        <i class="fa fa-search"></i>
   	    </button>
    </div>


    <div class="container mb-5" style="margin-top: 50px;">
        <div>
            <ul class="nav">
                <li class="nav-item col-3">
                    <a class="nav-link active" href="#" onclick="openTab(event, 'popular')">인기 영양소</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'vitamin')">비타민</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'mineral')">미네랄 및 기타영양소</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'functional')">기능성 원료</a>
                </li>
            </ul>
        </div>
        <div class="tab pt-1 pb-5" style="display:block; border:0px;">
            <div class="active border-0 text-center" style="padding-top:20px">
                <!-- 이미지 -->
                <div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text" style="color: black;">
		           		<b style="font-size: 30px;">💊&nbsp;${param.name }</b><br/>
		           		<small>궁금했던 모든 것, 바로 확인해보세요!</small>
                	</div>
    			</div>
            </div>
            <div class="d-flex justify-content-center">
                <div id="outer" class="d-flex justify-content-center w-75 mt-5 pt-4 pb-5" style="border: #ddd solid; border-radius: 10px;">
                    <div id="inner" class="w-75 ">
                        <div class="mt-4">
                            <h4><b>1. 관련 건강고민</b></h4>
                            <hr class="bg-warning mb-4">
                            <c:forEach var="n_func" items="${n_FUNC }" varStatus="loop">
    							<span style="font-size: 15px; display: inline-block; width: 192px;"><mark>&nbsp;${loop.count}) ${n_func}&nbsp;</mark></span>
    							<c:if test="${(loop.count % 3 == 0) && !loop.last}">
    								<hr/>
    							</c:if>
                            </c:forEach>
                            <c:forEach var="i_func" items="${i_FUNC }" varStatus="loop">
    							<span style="font-size: 15px; display: inline-block; width: 192px;"><mark>&nbsp;${loop.count}) ${i_func}&nbsp;</mark></span>
                            	<c:if test="${(loop.count % 3 == 0) && !loop.last}">
    								<hr/>
    							</c:if>
                            </c:forEach>
                        </div>
                        <div class="mt-5">
                            <h4><b>2. 상세설명</b></h4>
                            <hr class="bg-warning mb-4">
                            <p style="font-size: 15px;">${desc }</p>
                            <p style="font-size: 15px;">${i_desc }</p>
                        </div>
                        <div class="mt-4">
                            <h4><b>3. 섭취량</b></h4>
                            <hr class="bg-warning mb-4">
                            
                            <div class="justify-content-center">
                                <div class="d-flex flex-column align-items-center">
                                
                                <!-- 5대 상한 있음 -->
	                            <c:if test="${not empty n_UL_M }" var="limit">
                        	        <c:if test="${not empty n_UL_M}">
		                            <p style="font-size: 13px; margin-bottom: 13px;" class="mt-2">
	                                	남성 권장 섭취량: ${n_DRI_M }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                	<c:if test="${not empty n_UL_M}">
	                                	남성 상한 섭취량: ${n_UL_M }<br/>
	                                	</c:if>
		                                여성 권장 섭취량: ${n_DRI_F }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                <c:if test="${not empty n_UL_F}">
		                                	여성 상한 섭취량: ${n_UL_F }
		                                </c:if>
	                                
		                                <div style="height:1px;">
		                                	<span class="arrow-down"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow-down"></span>
		                                </div>
		                            </p>
		                            <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
		                            </c:if>
	                            </c:if>
	                            
	                            <!-- 5대 상한 없음 -->
	                            <c:if test="${not limit && empty i_DRI}">
		                            <p style="font-size: 13px; margin-bottom: 13px;" class="mt-2">
	                                	남성 권장 섭취량: ${n_DRI_M }<br/><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/> -->
		                                여성 권장 섭취량: ${n_DRI_F }<br/><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/> -->
		                                <div style="height:1px;">
		                                	<span class="arrow-down"></span><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		                                </div>
	                                </p> 
	                                <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
	                            </c:if>
	                            
	                            <!-- 기능성 상한 있음 -->
	                            <c:if test="${not empty i_DRI && not empty i_UL }">
		                            <p style="font-size: 13px; margin-bottom: 13px;" class="mt-2">
		                                	권장 섭취량: ${i_DRI }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                	상한 섭취량: ${i_UL }<br/>
		                                <div style="height:1px;">
		                                	<span class="arrow-down"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow-down"></span>
		                                </div>
		                            </p>
		                            <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
                            	</c:if>
	                            
	                            <!-- 기능성 상한 없음 -->	
	                            <c:if test="${not empty i_DRI && empty i_UL }">
		                            <p style="font-size: 13px; margin-bottom: 13px;" class="mt-2">
		                                	권장 섭취량: ${i_DRI }<br/><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/> -->
		                                <div style="height:1px;">
		                                	<span class="arrow-down"></span><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		                                </div>
		                            </p>
		                            <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
                            	</c:if>
                            	
	                            </div>
                            </div>
                        </div>
                        <c:if test="${not empty n_DRI_M }" var="vit"></c:if>
                        <c:if test="${vit }">
	                        <div class="mt-5">
		                        <c:if test="${not empty n_LACK }">
		                            <h4><b>4. 결핍시 증상</b></h4>
		                            <hr class="bg-warning mb-4">
		                            <p style="font-size: 15px;">· ${n_LACK }이 있어요.</p>
		                        </c:if>
	                        </div>
                        </c:if>
                        <c:if test="${vit }">
                        	<c:if test="${not empty caution }">
		                        <div class="mt-5 pt-1">
		                            <h4><b>5. 주의사항</b></h4>
		                            <hr class="bg-warning mb-4">
		                            <p style="font-size: 15px;">${caution }</p>
		                        </div>
		                    </c:if>
                        </c:if>
                        <c:if test="${not vit }">
                            <c:if test="${not empty i_caution }">
		                        <div class="mt-5">
		                            <h4><b>4. 주의사항</b></h4>
		                            <hr class="bg-warning mb-4">
		                            <p style="font-size: 15px;">${i_caution }</p>
		                        </div>
		                    </c:if>
                        </c:if>
                        <c:if test="${vit }">
	                        <div class="mt-4">
		                        <c:if test="${not empty caution}" var="exist">
		                            <h4><b>6. 섭취 음식</b></h4>
		                            <hr class="bg-warning mb-4">
		                            <p style="font-size: 15px;">· ${n_FOOD }에서 섭취할 수 있어요.</p>
		                        </c:if>
		                        <c:if test="${not exist }">
		                        	<h4><b>5. 섭취 음식</b></h4>
		                            <hr class="bg-warning mb-4">
		                            <p style="font-size: 15px;">· ${n_FOOD }에서 섭취할 수 있어요.</p>
		                        </c:if>
	                        </div>
	                    </c:if>
	                    <c:if test="${vit }">
	                        <div class="mt-5">
		                        <c:if test="${not empty caution}" var="exist">
		                            <h4><b>7. 추천 영양제</b></h4>
		                            <hr class="bg-warning mb-4">
		                            <p class="text-center pt-4" style="font-size: 17px;"><b>'${param.name}'을(를) 포함하고 있는 영양제 Top 5에요!</b></p>
		                            <p style="font-size: 15px;">
		                                <div class="scrollable-container">
										    <div class="box-container justify-content-center">
											    <c:forEach var="productInfo" items="${productInfoList}" varStatus="loop">
												    <div class="box" style="white-space: nowrap; width:550px; onclick="location.href='/NutrientDetail.do?name=${productInfo.PRODUCTNAME}'">
					    								<c:if test="${loop.count == 1 }">
															<b class="text-center" style="width:115px; font-size: 15px;">🥇 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 2 }">
															<b class="text-center" style="width:115px; font-size: 15px;">🥈 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 3 }">
															<b class="text-center" style="width:115px; font-size: 15px;">🥉 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count > 3 }">
															<b class="text-center" style="width:115px; font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp; ${loop.count }위</b>
														</c:if>
														
												    	<!-- imgurl 있으면 가져옴 -->
												    	<c:if test="${productInfo.IMGURL != null }" var="existimg">
												        	<img src="${productInfo.IMGURL}" alt="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" style="width: 100px; height: 100px;">
												        </c:if>
												        <!-- imgurl 없으면 대체이미지 -->
												        <c:if test="${not existimg }">
  													        <img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" style="width: 100px; height: 100px;">
												        </c:if>
												        
												        <b class="text-center" style="font-size: 13px; width: 230px;">${productInfo.PRODUCTNAME}</b>
												    </div>
												</c:forEach>
											</div>
										</div>        
		                            </p>
		                        </c:if>
		                        <c:if test="${not exist }">
		                        	<h4><b>6. 추천 영양제</b></h4>
		                            <hr class="bg-warning">
		                            <p style="font-size: 15px;">
		                                영양제1, 영양제2, 영양제3                 
		                            </p>
		                        </c:if>
	                        </div>
	                    </c:if>
	                    <c:if test="${not vit }">
	                    	<c:if test="${not empty i_caution }">
			                    <div class="mt-5">
			                    	<h4><b>5. 추천 영양제</b></h4>
		                            <hr class="bg-warning">
		                            <p style="font-size: 15px;">
		                                영양제1, 영양제2, 영양제3                  
		                            </p>
		                        </div>    
		                    </c:if>
		                    <c:if test="${empty i_caution }">
		                    	<div class="mt-5">
			                    	<h4><b>4. 추천 영양제</b></h4>
		                            <hr class="bg-warning">
		                            <p style="font-size: 15px;">
		                                영양제1, 영양제2, 영양제3                  
		                            </p>
		                        </div> 
		                    </c:if>
	                    </c:if>
                    </div>
                </div>
            </div>
        </div>
        
        	<!-- 탭 이동처리 -->
       		<div id="popular" class="tab active border-0" style="display:none;">
			
                <!-- 인기성분에 해당하는 상자 내용 -->
   				<div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text text-color:black text-center">
		           		<b style="font-size: 30px;">👨‍⚕&nbsp;인기 성분 Top 10</b><br/>
		           		<small>100개 영양성분 중 가장 인기있는 10개 성분의 Best 제품을 만나보세요!</small>
                	</div>
    			</div>
                <div class="box-container">
	                <c:forEach var="name" items="${vitaminNames}">
					    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>
            
	        <div id="vitamin" class="tab" style="display: none;">
               	<!-- 비타민에 해당하는 상자 내용 -->
   				<div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text text-color:black text-center">
		           		<b style="font-size: 30px;">🍊&nbsp;비타민 찾아보기</b><br/>
		           		<small>비타민의 중요성과 효과를 자세히 알아보세요!</small>
                	</div>
    			</div>
    			<div class="box-container">
	                <c:forEach var="name" items="${vitaminNames}">
					    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>

            <div id="mineral" class="tab">
                <!-- 미네랄에 해당하는 상자 내용 -->
                <div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text text-color:black text-center">
		           		<b style="font-size: 30px;">🥗&nbsp;미네랄 및 기타영양소 찾아보기</b><br/>
		           		<small>미네랄 및 기타영양소의 중요성과 효과를 자세히 알아보세요!</small>
                	</div>
    			</div>
    			<div class="box-container">
	                <c:forEach var="name" items="${etcNames}">
					    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>
                
            <div id="functional" class="tab">
                <!-- 기능성 원료에 해당하는 상자 내용 -->
                <div class="image mt-2">
	                <img class="bg-img w-100" style="height:150px" src="<c:url value="/resources/images/nutrient_img/bg_nt.jpg"/>"/>
	                <div class="text text-color:black text-center">
		           		<b style="font-size: 30px;">🌿&nbsp;기능성 원료 찾아보기</b><br/>
		           		<small>기능성 원료의 중요성과 효과를 자세히 알아보세요!</small>
                	</div>
    			</div>
    			<div class="box-container">
	                <c:forEach var="name" items="${ingredientNames}">
					   <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>
    
    </div>
    <script>

	    function fade(element) {
	    	var op = 0;  // 초기 투명도
	    	var timer = setInterval(function () {
	            if (op >= 1) {
	            	clearInterval(timer);  // 애니메이션 종료
	            }
	            element.style.opacity = op;  // 투명도 설정
	            element.style.filter = 'alpha(opacity=' + op * 100 + ')';  // IE8 이하 대응
	            op += 0.1;  // 투명도 증가량
	        }, 50);  // 간격(ms)
	    }
	
	    function fadeInTab(tabElement) {
	        tabElement.style.display = "block";  // 탭 컨텐츠 보이기
	        fade(tabElement);  // 페이드인 효과 적용
	    }
	
	    function openTab(evt, tabName) {
	    	var i, tabContent, tabLinks;
	
	        tabContent = document.getElementsByClassName("tab");
	        for (i = 0; i < tabContent.length; i++) {
	            tabContent[i].style.display = "none";  // 모든 탭 컨텐츠 숨기기
	        }
	
	        tabLinks = document.getElementsByClassName("nav-link");
	        for (i = 0; i < tabLinks.length; i++) {
	            tabLinks[i].classList.remove("active");  // 모든 탭 링크에서 'active' 클래스 제거
	        }
	
	        var currentTab = document.getElementById(tabName);
	        console.log(currentTab)
	        // Remove immediate display and directly apply fade-in effect
	        currentTab.style.opacity = 0;
	        currentTab.style.filter = 'alpha(opacity=0)';
	        currentTab.style.border = 0;
	        fadeInTab(currentTab);  // 선택한 탭 컨텐츠를 페이드인으로 보이게 함
           
	    	evt.currentTarget.classList.add("active");  // 선택한 탭 링크에 'active' 클래스 추가
	    }
	        
        
     	// 진행 바 업데이트를 위한 변수 및 값 설정
        var progressElement = document.querySelector('.progress-bar-inner'); // 진행 바 요소 선택
        var textElement = document.querySelector('.progress-text'); // 텍스트 요소 선택

        var animationDuration = 1500; // 애니메이션 지속 시간 (밀리초)
        var targetValue = 50; // 목표 값 (%) 27~73
        
        // 상한 존재시 50% -> 73%로 변경
        var n_UL_M = "${n_UL_M}";
        var i_UL = "${i_UL}";
        
        if(n_UL_M.trim() !== "" || i_UL.trim() !=="" ){
        	targetValue = 73;
        }
        
        var updateInterval = 30; // 업데이트 간격 (밀리초)

        var progressValue = 0; // 현재 진행 값
        var currentValue = 0; // 현재 표시 값

        var increment = 1; // 증가량 계산

        // 진행 바 업데이트 함수
        function updateProgress() {
            progressValue += increment; // 진행 값 증가
            currentValue = Math.min(Math.round(progressValue), targetValue); // 현재 표시 값 계산
            
            progressElement.style.width = currentValue + '%'; // 진행 바 너비 설정
            textElement.textContent = '💊 적합한 섭취량을 알아보세요!' // 텍스트 내용 설정

            if (currentValue >= targetValue) {
                clearInterval(progressInterval); // 목표 값에 도달하면 업데이트 간격을 멈춤
            }
        }

        // 주기적으로 진행 바 업데이트 실행
        const progressInterval = setInterval(updateProgress, updateInterval);

        // 상세페이지 넘어왔을 때 위쪽 탭 밑줄 없애는 코드
        document.addEventListener('DOMContentLoaded', function() {
  			var show = document.querySelector('body > div.container.mb-5 > div.tab.pt-1.pb-5');
  			var removetarget = document.querySelector('body > div.container.mb-5 > div:nth-child(1) > ul > li:nth-child(1) > a');
  			if (show.style.display === 'block') {
    			removetarget.classList.remove("active");
  			}
		});
        
        // 제품 이미지 로드 에러시 해당 img태그 삭제 후 대체 img태그 수정
        function handleImageError(imgElement) {
			// 대체 이미지 태그 생성
			var altSrc = imgElement.alt;
			var newImg = document.createElement('img');
			newImg.setAttribute('src', altSrc);
			newImg.setAttribute('style', imgElement.getAttribute('style'));
			
			// 기존 img 태그를 대체 이미지 태그로 교체
			imgElement.parentNode.replaceChild(newImg, imgElement);
		}
		
		// 모든 img 태그에 대해 이벤트 리스너 등록
		var imgTags = document.getElementsByTagName('img');
		for (var i = 0; i < imgTags.length; i++) {
			imgTags[i].addEventListener('error', function() {
			handleImageError(this);
			});
		}
        
		//영양소 검색
        // 영양소 검색 기능
var searchResultsContainer = document.querySelector('.searchResults');
var searchTermInput = document.querySelector('.searchTerm');

// 영양소 입력란 입력 시 이벤트 핸들러
searchTermInput.addEventListener('input', searchNutrient);

// 영양소 검색 함수
function searchNutrient() {
    // 입력된 영양소 정보 가져오기
    var searchTerm = searchTermInput.value;

    // 검색 결과 가져오기 (가상의 결과로 예시를 보여줍니다)
    var searchResults = searchNutrients(searchTerm);

    // 결과 표시하기
    searchResultsContainer.innerHTML = ''; // 이전 결과 지우기

    if (searchResults.length > 0) {
        for (var i = 0; i < searchResults.length; i++) {
            var result = document.createElement('p');
            result.textContent = searchResults[i];
            result.classList.add('searchResult');
            searchResultsContainer.appendChild(result);
        }
        searchResultsContainer.style.display = 'block'; // 결과 창 표시
    } else {
        searchResultsContainer.style.display = 'none'; // 결과 창 숨김
    }
}

// 가상의 영양소 검색 함수 (실제로는 데이터베이스나 API 등을 활용해야 함)
function searchNutrients(searchTerm) {
    // 가상의 검색 결과 (예시)
    var nutrients = [
        '비타민 A',
        '비타민 B',
        '비타민 C',
        '비타민 D',
        '칼슘',
        '철분',
        '아연',
        '마그네슘',
        '오메가-3',
        '단백질'
    ];

    // 입력된 영양소 정보와 일치하는 결과 필터링
    var results = nutrients.filter(function(nutrient) {
        return nutrient.toLowerCase().includes(searchTerm.toLowerCase());
    });

    return results;
}
        
        
        
        
        
    </script>
</body>
</html>
