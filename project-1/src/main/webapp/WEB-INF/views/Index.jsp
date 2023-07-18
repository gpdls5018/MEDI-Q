<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<style>
	
	/*인기 영양소 Top10*/
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
            box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.8);
        }

        .box.active {
            background-color: #bbb;
        }
    
		.videologo {
		    font-family: Arial, sans-serif;
		    font-size: 24px;
		    color: #FFFFFF;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
		}

</style>
<!-- 슬라이더를 위한 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<!-- 해시태그를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<!-- 슬라이드 반응형 jqery -->
<script src="<c:url value="/resources/tsfolder/js/jquery.sticky-kit.min.js"/>" ></script>




 	<!-- 처음 인덱스 킬때 전체화면 비디오 출력 -->
			<div id="tsvideo-container">
			    <video id="video" autoplay muted loop>
	                <source src="<c:url value="/resources/video/intro1_.mp4"/>" type="video/mp4">
			    </video>
			    <div class="videologo" style=" font-size:27px; color:white; margin-top: 190px; margin-bottom: 220px; margin-left: 520px; margin-right: 520px;">
	           		<!-- 동영상 화면 문구 -->
		        	<div class="text-center" style="display: flex; align-items: center; justify-content: center; font-size: 65px; font-weight:bold;">건강고민은&nbsp;  
						<img class="pr-3 pl-1" src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="120" height="75">
	           			<img class="pr-2" src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="300" height="75">
					</div>
		        	<br/>
		        	<div class="text-center" style="margin-top: 50px;">영양제 분석, 건강예측 AI 등 저희만의 특별한 서비스를 이용해보세요.</div>
		        	<div class="text-center" style="margin-top: 30px;">스마트 헬스케어 솔루션, MEDI-Q가 여러분을 위해 준비되어 있습니다!</div>
		        	<!-- 홈버튼 -->
		        	<div style="display: flex; align-items: center; justify-content: center;">
			        	<div id="video-controls" style="margin-top:390px; margin-right: 250px;">
					        <button class="btn" onclick="closeVideo()" style="width:120px; background-color: rgb(248,182,43);">홈으로 이동</button>
					    </div>
					    <!-- 그만보기 -->
					    <div id="video-label" style=" margin-top:390px; margin-right: 300px; display: flex; align-items: center; justify-content: center;">
				    	    <label for="stop-video-checkbox" style="font-size:18px; color:white; margin-bottom:30px; font-weight: normal; cursor: pointer;">
					        오늘 하루 그만 보기
					        <input type="checkbox" id="stop-video-checkbox" style="width:20px;">
					        </label>
					    </div>
					</div>
			    </div>
			</div>

<!-- 메인 바디 부분 -->
<div id="tsmain">
	 
  <section id="section-119">
        <div class="content-slider">
          <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
          <input type="radio" id="banner2" class="sec-1-input" name="banner">
          <input type="radio" id="banner3" class="sec-1-input" name="banner">
          <input type="radio" id="banner4" class="sec-1-input" name="banner">
          <div class="slider">
            <div id="top-banner-1" class="banner">
	            <a href="#">
	              <div class="banner-inner-wrapper" id="banner-inner-wrapper1" >
	              	 <p style="color: grey;">어떤 건강고민이 있으신가요?</p>
	                 <h1 style="font-size: 57px;">😀 MEDI-Q와 함께 건강한 삶을 시작해보세요!</h1>
	              </div>
	            </a>
            </div>
            <div id="top-banner-2" class="banner" id="tsbaimg2">
	            <a href="<c:url value="/NutrientSelect.do"/>">
	              <div class="banner-inner-wrapper" id="banner-inner-wrapper2"  >
	               	 <p style="color: grey;">내가 먹고 있는 영양제 괜찮을까?</p>
	                 <h1>💊 영양성분을 검색해보세요!</h1>
	              </div>
	            </a>
            </div>
            <div id="top-banner-3" class="banner" id="tsbaimg3">
	            <a href="<c:url value="/analyzeMyFood.do"/>">
	              <div class="banner-inner-wrapper" id="banner-inner-wrapper3" >
	                 <p style="color: grey;">과도하거나 부족하지 않을까?</p>
	                 <h1>📋 복용 중인 영양제를 분석받으세요!</h1>       
	              </div>
	            </a>
            </div>
            <div id="top-banner-4" class="banner" id="tsbaimg4">
	            <a href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>">
	              <div class="banner-inner-wrapper" id="banner-inner-wrapper4" >
	              	 <p style="color: grey;">내 위암 발병률은 몇 퍼센트일까?</p>
	              	 <h1 style="font-size: 57px;">🧬 주요 질환의 발병 위험도를 예측해드려요!</h1>
	              </div>
	            </a>
            </div>
          </div>
          <nav>
            <div class="controls" >
              <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><p>홈페이지</p></label>
              <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><p>영양소 검색</p></label>
              <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><p>건강 및 분석</p></label>
              <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><p>건강검진</p></label>
            </div>
          </nav>
        </div>
    </section>
		  

              
        <!-- ocr 들어가면 사진 검색용 -->
		<div class="ml-5 mt-2 ">
	        <i class="bi bi-camera" hidden><a href="/modelOCR.do"> 사진으로 검색할래요 !!!</a></i>
	    </div>
	
		<!-- 검색창 밑 검색 태그용 버튼  -->
		<div class="row justify-content-center pt-5" style="margin: 60px 0px 60px 0px">
	        <div class="col-lg-10 text-center">
	            <h1 class="my-5" style="font-weight:bold; color:black;"><span style="color: #EF605D;">👋 제품명 또는 영양성분</span>을 검색해보세요.</h1>
	            <form class="position-relative w-75 mx-auto animated slideInDown d-flex input-wrapper" required minlength="1" action="<c:url value="/functionfood/select.do"/>" style="box-shadow: 0px 0px 5px gray; border-radius: 20px;">
	                <input class="border-0 rounded-pill w-100 px-5 py-3 ps-4 pe-5 flex-grow-1" type="text" name="foodname" placeholder="제품명 및 영양성분을 입력하세요" >
	               <!-- placeholder="제품명 및 영양성분을 입력하세요" value="${not empty searchTags ? fn:replace(searchTags,'#',',#') : ''}">
	                <input name="searchTags" type="hidden" id="hiddenInput" value=""> -->
	                <button type="submit" class="btn rounded-pill py-2 px-4 top-0 end-0 me-2" >
						<img src="<c:url value="/resources/images/tsimages/free-icon-magnifying-glass-4475396.png"/>" style="width:30px; height:30px">
					</button>
	            </form>
	        </div>
	        <!-- 
	        <div id="hashtaglink" class="ml-1 py-5 row" >
       	        <span class="s-txt1">인기 검색어</span>
                <a href="#" style="font-weight: bold;color:green">#피부건강</a>&nbsp;
	        	<a href="#" style="font-weight: bold;color:palevioletred">#면역력 증진</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:mediumpurple ">#전립선 건강</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:sandybrown">#체지방 감소</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:salmon ">#비타민</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:lightskyblue ">#혈당</a>&nbsp;
		        <span class="s-txt2">(07/18&nbsp;기준)</span>
		    </div>
		     -->
	    </div>
	    
<!-- 검색창 밑부분! 사이드바와 몸통 부분 -->
<section class="tscontainer" style="width:100%;  border-radius: 5px;">
	<!-- 왼쪽 몸통부분 -->
     <article class="maints justify-content-center px-3">
     <!-- 1번째 다이브 목록 -->
     	<div class="template__Wrapper-sc-5bsqyv-0 gCSEJp">
     	<c:if test="${not empty analyzeReport}">
	        <h1 class="text-center mb-3" style="font-size: 30px; color: black;">📋 <span style="color:#EF605D; font-size: 34px;">${userName}</span>님의 최근 분석 리포트</h1>
	        <div class="ml-1 ibNwmg d-flex" style="justify-content:flex-start; margin-top: 30px; margin-bottom: 40px;">
	            <a data-gtm-id="report-home-recent-blank" class="ktaGqG" href="<c:url value="/analyzeMyFood.do"/>" style="text-decoration: none; background-color: 
			    ${	analyzeReport.score >= 0 && analyzeReport.score < 30 ? 'rgba(255, 0, 0, 0.7)' :
			        analyzeReport.score >= 30 && analyzeReport.score < 60 ? 'rgba(255, 165, 0, 0.7)' :
			        analyzeReport.score >= 60 && analyzeReport.score < 90 ? 'rgba(0, 128, 0, 0.7)' :
			        analyzeReport.score >= 90 && analyzeReport.score <= 100 ? 'rgba(0, 0, 255, 0.7)' :
			        ''
			    };" >
	                <article class="hBxOSS" style="display: block;">
	                    <div class="iJGurJ">
	                        <div style="margin: 10px 0px 0px 20px;">
	                            <div class="enbDhJ1">👀 최근 분석 결과입니다</div>
	                            <p class="jeiOCr1" style="">${analyzeReport.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
	                        </div>
	                        <div class="ZyIFk1 d-block mt-3" style="margin-left: 20px;">
	                            <div><span style="color:#545454; font-weight: bold;">섭취 목적</span> :<br/> ${analyzeReport.takePurposes}</div>
	                            <div><span style="color:#545454; font-weight: bold;">섭취중인 영양제</span> :<br/> ${analyzeReport.takeFoods}</div>
	                        </div>	                   
         </c:if>
            <c:if test="${empty analyzeReport}">
                <h1 class="text-center" style="font-size: 30px; color: black;">📋 나와 잘 맞는 영양제일까?</h1>
                <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:35px 0px;">적절하게 영양제를 먹고 있는지 MEDI-Q가 분석해 드릴게요</p>
		        <div class="ibNwmg ml-1 d-flex" style="justify-content:flex-start; margin-bottom: 35px;">
		            <a data-gtm-id="report-home-recent-blank" class=" ktaGqG" href="<c:url value="/analyzeMyFood.do"/>" style="text-decoration: none;">
		                <article class=" hBxOSS" style="display: block;">
		                    <div class=" iJGurJ">
	                        	<div>
		                        	<img src="https://cdn.pillyze.io/web/img/qna_anna_2x.webp" class="qwdfe" alt="전문가 그림">
			                            <div class=" enbDhJ ">나의 영양제 분석하고 추천받기</div>
			                            <p class="jeiOCr">답답했던 <span style="color:#EF605D;">영양제의 모든 것!</span> <br/>전문가와 함께해요 </p>
		                        </div>
	                        <!-- 
	                        <div class="ZyIFk">
	                            <p>내 영양제 분석하기</p>
	                        </div>
	                         -->
                        </c:if>
	                    </div>
	                </article>
	             </a>
	          </div>
	     </div>
	     
	     <!--  2번째 다이브 목록 -->
		<div class="section section1-2c">
	       <a href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>" style="text-decoration: none;">
	           <div class="content">
	               <span class="txt1" style=" text-align: center; width: 100%;">👨‍⚕️ 주요 질환의 발병 위험도를 예측해드려요 </span>
	               <br/>
	               <span class="text-center txt2" style="color:gray; margin:20px 0px 35px 0px; font-weight: bold;">MEDI-Q의 인공지능 기술로 분석하는 건강검진!</span>
	               <div class="banner-wrap">
	                   <div class="banner-txt1 mb-1">내 건강검진 결과를 입력하고</div>
	                   <div class="banner-txt2"><span>맞춤형 영양제를 추천</span> 받으세요</div>
	                   <img src="https://cdn.pillyze.io/web/img/s12c-bg.webp" class="banner-bg" alt="두 손으로 알약을 떠 받드는 그림">
	               </div>
	           </div>
	       </a>
	   </div>
	     
	  <!-- 3번째 다이브 목록 -->
	  <!-- 인기 영양소 Top10 -->
	  <div class="section section1-2b my-1" style="align-content: center;">
	        <div class="content" style="margin: 0px 0px 0px 0px;">
	            <span class="txt1"><span style="color:black;">🌿 인기 영양소</span> <span>Top10</span>
	            <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:35px 0px;">현재 조회수가 가장 높은 영양소 Top10을 알려드릴게요</p>
	            <div class="ingredient-wrap">
                    <div class="box-container" style="margin: 0px;">
		                <c:forEach var="name" items="${top10}">
						    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
						        <b style="font-size: 14px;">${name}</b>
						    </div>
						</c:forEach>
                	</div>
	            </div>
	            <div class="clearfix">
	                <a tabindex="0" class="more-pop-ingredient pt-4 mr-3" href="<c:url value="/NutrientSelect.do"/>" >영양성분 더보기</a>
	            </div>
	        </div>
	    </div>
	    
	   <!-- 4번째 다이브 목록 -->
	   <!-- 인기 영양제 Top10 -->
	   <div class="section section1-2s ranking-190">
	        <div class="content" style="margin-top:40px;">
	            <div class="txt2"><span style="color:black; font-size: 30px;">💊 인기 영양제</span> <span style="font-size: 30px;">Top 10</span></div>
	            <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:35px 0px;">현재 리뷰가 가장 좋은 영양제 Top10을 알려드릴게요</p>
	            <div class="tab-contents" style="display: block; margin-right: 30px;" >
	                <div class="tab-content tab-content-001 new-wide-main-060 new-wide-main-090 active width-flt1">
	                    <div class="filter-btns slt-sex">
	                    <!-- 
	                        <div class="filter-btns-in">
	                            <a tabindex="0" class="filter-btn active" href="#">전체 성별</a>
	                            <a tabindex="0" class="filter-btn" href="#">여성</a>
	                            <a tabindex="0" class="filter-btn" href="#">남성</a>
	                        </div>
	                    -->
	                    </div>
	                    <!--
	                    <div class="filter-btns2">
	                        <div class="filter-btns-in">
	                            <a tabindex="0" href="#" class="filter-btn filter-btn-b001 active"><div class="icon"><span style="font-size: 15px">ALL</span></div><div class="txt1">전체</div></a>
	                            <a tabindex="0" href="#" class="filter-btn filter-btn-b002 "><div class="icon"><span>20</span></div><div class="txt1">20대 이하</div></a>
	                            <a tabindex="0" href="#" class="filter-btn filter-btn-b003"><div class="icon"><span>30</span></div><div class="txt1">30대</div></a>
	                            <a tabindex="0" href="#" class="filter-btn filter-btn-b004"><div class="icon"><span>40</span></div><div class="txt1">40대</div></a>
	                            <a tabindex="0" href="#" class="filter-btn filter-btn-b005"><div class="icon"><span>50</span></div><div class="txt1">50대</div></a>
	                            <a tabindex="0" href="#" class="filter-btn filter-btn-b006"><div class="icon"><span>60</span></div><div class="txt1">60대 이상</div></a>
	                            <a tabindex="0" href="#" class="filter-btn filter-btn-b007"><div class="icon"><span span="" style="font-size: 15px">Kids</span></div><div class="txt1">키즈</div></a>
	                        </div>
	                    </div>
	 					 -->
	                    <div class="box-container ranking-card-wrap item-cards u510x">
                            <c:forEach items="${listData}" var="item" varStatus="status">
                            <c:if test="${status.index < 10}">
								<a style="text-decoration: none;" id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="box item-card" title="${item.productName} 자세히 보기">
								<c:if test="${not empty item.imgURL}">
									<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
								</c:if>
		          				<c:if test="${empty item.imgURL}">	
									<img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
								</c:if>
									<span id="item.company" class="txt1">${item.company}</span>
									<span id="item.productName" class="txt2">${item.productName}</span>
									<div class="review d-flex" style="width:inherit;">
										<span class="star-point"><fmt:formatNumber value="${item.AVG_Score }" pattern=".00"  var="AVG"/>${AVG }</span>
										<span class="txt3">(${item.REVIEW_Count }개)</span>
									</div>
									<!--<div class="card-tags">
									<c:set var="materialList" value="${fn:split(item.material, '$')}" />
										<c:forEach items="${materialList}" var="mater">
											<div class="card-tag">${mater }</div>
										</c:forEach>
									</div>  -->
								</a>
							</c:if>
							</c:forEach>
	                    </div><!-- card-wrap의 끝 -->

	                    <div class="clearfix">
	                        <a tabindex="0" class="more-pop-health mt-5" href='<c:url value="/ranking/selectfood.do"/>' > <b>건강기능식품 더보기</b></a>
	                    </div>
	                </div><!-- tab-content-001의 끝 -->
	            </div>
	        </div>
	    </div>
       
      
      <!--  5번째 다이브 목록 -->
      <div class="section section20-2 section20-2-home">
	        <div class="content">
	            <!-- <div class="qna-mark-home" style="display: block; text-align: center; width: 100%;">Q&amp;A</div> -->
	            <span class="ge-title get-20-2" style="display: block; text-align: center; width: 100%; font-size: 30px;">💡 지금 인기있는 질문 <p class="qna-mark-home" >Q&amp;A</p></span>
	            <div class="get-20-2-home-txt2" style="display: block; text-align: center; width: 100%; margin:35px 0px; font-size: 18px;">전문가가 직접 답해드려요!</div>
	            <div class="qna-list-wrap">
	                   <!--<div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                성분 정보
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=16"/>">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>epa높은 오메가3 구미나 츄어블 있을까요?</span>
	                            <span class="txt2">알약을 아예 못먹어서 여태 키즈 제품을 먹었습니다. 중성지방 콜레스테롤때문에 epa가 높은 제품을 먹고싶은데..<br/> 추천해주시면 너무 감사해요ㅠㅠ</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=16"/>">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">액체형(리퀴드) 오메가3 제품을 선택하거나, 일반 캡슐 제품을 잘라서 내용물만 섭취하시는 것을 추천해요!</div>
	                            <div class="user-info-row">
	                                <span class="user-name">김**</span>
	                                <span class="user-agesex">20대 / 여</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                영양제 조합
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=13"/>">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>영양제 유통기한 넘은 것은 얼마 후 까지 먹어도 될까요?</span>
	                            <span class="txt2">대체로 몇 개월 ~ 몇년까지 초과한 것을 억어도 되는지 궁금하고 분말, 연질 캡슐, 경질 캡슐, 타블렛 등 제재에 따라 섭취 기한이 긴 순서를 각각 알고 싶습니다.</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=13"/>">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">영양제 유통기한이 지났다면 아깝지만 건강을 위해서 버리는 게 나아요.</div>
	                            <div class="user-info-row">
	                                <span class="user-name">김**</span>
	                                <span class="user-agesex">30대 / 남</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                영양제 조합
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=14"/>">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>과다 복용 관련</span>
	                            <span class="txt2">인터넷에서 찾아보니깐 섭취권장량이 남성 16mgNE라고 하는데 어플은 50~1000mgNE 까지가 최적적량이라고 나와있는데 뭐가 맞는건가요? 제가 잘못 이해하고 있는건가요?</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=14"/>">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">권장섭취량과 충분섭취량, 상한섭취량을 구분해서 영양소를 복용해주세요 :)</div>
	                            <div class="user-info-row">
	                                <span class="user-name">루**</span>
	                                <span class="user-agesex">20대 / 남</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                기타
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=15"/>">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>코로나 걸렸을 때 영양제</span>
	                            <span class="txt2">코로나 확진 4일차에요. 혹시 같이 먹으면 좋은 영양제 있을까요? 궁금합니다. </span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=15"/>">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">코로나 감염을 예방하기 위해, 또는 코로나 후유증에서 빨리 벗어나기 위해서는 비타민 C, 비타민 D, 아연 등<br/> 면역에 관련된 영양제가 도움이 됩니다. </div>
	                            <div class="user-info-row">
	                                <span class="user-name">물**</span>
	                                <span class="user-agesex">30대 / 여</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝
	                      --> 
	                <c:forEach items="${boardList}" var="item" varStatus="status">
                        <c:if test="${status.index < 3}">
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                기타
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="/board/View.do?no=${item.no }">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>${item.title }</span>
	                            <span class="txt2">${item.content } </span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="/board/View.do?no=${item.no }">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">${item.content } </div>
	                            <div class="user-info-row">
	                                <span class="user-name">${boardmemberList.get(status.index).getName() }</span>
	                                <span class="user-agesex"><fmt:formatDate value="${boardmemberList[status.index].getBirth()}" pattern="yyyy" var="age" />${2023-age }세</span>
	                            </div>
	                        </a>
	                    </div>
		                </c:if>
		            </c:forEach>
	            </div>

	            <div class="clearfix my-5" style="margin-right: 80px;">
	                <a tabindex="0" class="more-qna" href="<c:url value="/board/List.do" />"><b>Q&amp;A 더보기</b></a>
	            </div>
	        </div>
	    </div>
	  
	    
	    
	   <!--  6번째 다이브 목록 -->
		<div class="section6 pt-5" style="display:flex; align-items:center; max-width: 1050px; flex-direction: column;">
			<span style="font-size:30px; display:block; font-weight: bold; text-align: center; margin-bottom: 40px;">영양성분과 건강에 대한 모든 것<br/> 📖<strong style="color:#EF605D"> MEDI-Q</strong>에서 확인하세요!</span>
	        <div class="slider1">
	            <div class="slide"><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>" style="width:100%; height:340px" ></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=02"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>" style="width:100%; height:340px" ></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=03"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Hia.jpg"/>" style="width:100%; height:340px" ></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=04"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Pro.jpg"/>" style="width:100%; height:340px" ></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=05"/>"><img src="<c:url value="/resources/images/thumbnail_img/YellowM_Mus.jpg"/>" style="width:100%; height:340px" ></a></div>
	        </div>
	    </div>
	    
	    <!--  7번째 다이브 목록 -->
      <div class="mainInner" style="margin: 50px 0px;">
            <h3 class="my-4" style="text-align: center; margin-top:20px; font-weight: bold;">우리 동네에 있는<span style="color: #EF605D"> 🩺병원 & 💊약국</span>찾기</h3>
            <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:35px 0px;">우리동네에 어떤 병원과 약국이 있을까?</p>
            <div class="container-xxl pb-4">
                <div class="container">
                    <div class="mainMap" id="map" style="border-radius: 10px;">
                        <button type="button" class="btn" id="tsBtn">
                        	<span>🩺병원 & 💊약국찾기</span>
                        </button>
                        <div class="mapLayer">
                            <div class="closeLayerButton" onclick="closeMapLayer()">&times;</div>
                            	<h2>주소</h2>
      	                     	<p style="font-size:17px; color:gray; font-weight: bold; margin-bottom: 0px;">서울특별시 금천구 가산디지털2로 101<br/> B동 B304호(MEDI-Q팀)</p>
      	                     	<p style="font-size:15px; color:gray;">(주)한국소프트웨어아이엔씨 (153-759)</p>
                           		<a href="https://naver.me/Fcacgzd6" target="_blank">
                           		<img src="<c:url value="/resources/images/tsimages/img_naver.png"/>" alt="NAVER">  지도로 보기</a>
                           		<a href="https://map.kakao.com/?urlX=473291&urlY=1104884&urlLevel=3&itemId=1784287516&q=%ED%95%9C%EB%9D%BC%EC%9B%90%EC%95%A4%EC%9B%90%ED%83%80%EC%9B%8C&srcid=1784287516&map_type=TYPE_MAP" target="_blank"> 
                           		<img src="<c:url value="/resources/images/tsimages/img_daum.png"/>" alt="다음지도 보기">  지도로 보기</a>
                        </div>          
                    </div>
                </div>
            </div>
        </div>
        <!--  병원찾기 지도 모달 누르면 나오는 부분 -->
	       <div class="modal fade align-items-center" id="tsModal" role="dialog" style="background-color: rgba(0, 0, 0, 0.5);">
			 <div class="modal-dialog modal-dialog-centered" style="align-content :center; width: 100%; height: 60%; max-width: 1400px;">
			   <!-- Modal content-->
			   <div class="modal-content" style="width: 100%; height: 100%;">
			     <div class="modal-header" >
			       <h4 class="modal-title">우리동네 병원&약국 찾기</h4>
			       <button type="button" class="close" data-dismiss="modal">&times;</button>
			     </div>
			     <div class="modal-body">
			       <h3 style="text-align: center;">🩺병원 & 💊약국정보</h3>
			       <div class="container-xxl py-5">
			         <div class="map_wrap">
			           <div id="modalmap" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			           <div id="menu_wrap" class="bg_white">
			             <div class="option">
			               <div>
			                 <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="가산동 병원" placeholder="ㅇㅇ동 병원을 입력" id="keyword" size="15">
			                    <button type="submit">검색하기</button>
			                  </form>
			                </div>
			              </div>
			              <hr>
			              <ul id="placesList"></ul>
			              <div id="pagination"></div>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
	</article>
	
		<!-- 오른쪽 슬라이드-->
		<aside class="tsidebar fixedsticky pr-3 mt-5"> 
			<!--  로그인 목록 창
			<div class="login-section justify-content-center">
		        <p style="text-align: center; font-weight:bold; font-size:13px;"><span style="color:#EF605D">MEDI-Q</span>를 더 안전하고<br/> 편리하게 이용하세요</p>
		        <a href="<c:url value="/project/Login.do"/>" style="text-decoration:none;">
		        	<button class="btn btn-outline-success" type="button" style="display: flex; flex-wrap: wrap; align-content: center; text-align: center; justify-content: center; font-size:13px; border-radius: 12px; width:90%; height:50px; font-weight:bold; color:#EF605D;">
		        		<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="60" height="30"> 로그인
		        	</button>
		        </a>	    
		        <div class="social d-flex justify-content-center">
		        	<a href="<c:url value="/project/Join.do" />" class="px-2 py-2 mr-md-1 text-dark"><strong style="color:#606060; font-weight:bold; text-decoration: underline;">회원가입</strong></a>
		        </div>
		    </div>
			 -->
            <div class="sidebar-item pt-4 mt-5">
            	<img src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="45" height="30">
            	<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="100" height="30">
            	<br/>
            	<p class="my-4" style="margin-bottom:20px; color:gray; font-size:12px; font-weight:500;">
            		<span class="py-3">
            		AI모델의 분석 결과를 바탕으로<br/>
            		선정된 랭킹을 직접 확인해 보세요.</span></p>
                <ul class="unlist" style="padding-inline-start: 0px;">
				<c:forEach items="${listData}" var="item" varStatus="status">
	            	<c:if test="${status.index < 3}">
	            		<c:choose>
				          <c:when test="${status.index == 0}">
				            <img src="<c:url value='/resources/images/tsimages/rank_crown_gold_48.svg'/>" style="top:10px; left:20px; width:50px; height:40px;" alt="*">
				          </c:when>
				          <c:when test="${status.index == 1}">
				            <img src="<c:url value='/resources/images/tsimages/rank_crown_silver_48.svg'/>" style="left:20px; width:50px; height:40px;" alt="*">
				          </c:when>
				          <c:when test="${status.index == 2}">
				            <img src="<c:url value='/resources/images/tsimages/rank_crown_bronze_48.svg'/>" style="left:20px; width:50px; height:40px;" alt="*">
				          </c:when>
						</c:choose>
                    <li>
                        <div class="image" >
	            			<a href="/detail.do?no=${item.no}" style="text-decoration:none;">
	                            <c:if test="${not empty item.imgURL}">
									<img src="${item.imgURL }" class="item-img" alt="${item.productName}" style="height: 70px">
								</c:if>
		          				<c:if test="${empty item.imgURL}">	
									<img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" style="height: 70px" alt="${item.productName}">
								</c:if>
                    		</a>
                        </div>
                        <div style="align-items: center; margin-top:25px; margin-left:10px; justify-content: center; text-align: start; line-height: 1px; font-weight:400;">
	            			<a href="/detail.do?no=${item.no}" style="text-decoration:none;">
	                        	<p style="line-height: 10px; color:gray; font-size:9px; font-weight:bold;">${item.company}</p>
	                        	<br/>
	                        	<p style="line-height: 11px; color:black; font-size:11px; font-weight:bold;">${item.productName}</p>
	                        	<br/>
	                        	<p style="color:gray; font-size:10px; font-weight:bold;">
	                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
	                        	&nbsp;<fmt:formatNumber value="${item.AVG_Score }" pattern=".00"  var="AVG"/>${AVG }&nbsp;(${item.REVIEW_Count})
	                        	</p>
                    		</a>
                        </div>
                    </li>
                    </c:if>
				</c:forEach>
                </ul>
            </div>
		</aside>
</section>

	<!--  메인 하단 -->
	<div class="section section1-3">
       <div class="content">
           <span class="txt1">건강한 영양제 &amp; 식단 관리를 위한 모든 것</span>
           <span class="txt2">걱정 없이, 쉽고 간편하게</span>
           <span class="txt3"><span>MEDI-Q</span>로 시작하세요.</span>
       </div>
   </div>
    
	<div class="section section1-5">
        <div class="content">

            <span class="txt1"><span style="color: #EF605D"> MEDI-Q</span>는 신뢰가 가득하여 믿을 수 있어요.</span>
            <span class="txt2" style="font-weight: bold;"><span style="color: #EF605D"> MEDI-Q</span>는 국내외 검증된 기관과<br>신뢰도 높은 연구 결과를 바탕으로 개인 맞춤형 분석 결과를 제공합니다.</span>

            <div class="rl-companies">
                <div class="rl-company rl-company1">식품의약품안전처</div>
                <div class="rl-company rl-company2">식품안전정보원</div>
                <div class="rl-company rl-company3">한국영양학회</div>
                <div class="rl-company rl-company4">EFSA</div>
                <div class="rl-company rl-company5">(사)대한약학회</div>
                <div class="rl-company rl-company6">NIH</div>
            </div>
        </div>
    </div>

<!-- 매인 배너 슬라이드 -->
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CSSRulePlugin3.min.js"></script>
<!-- 지도 스크립트 키 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=536a268ae501933d1ccf30618f1b4258&libraries=services"></script> 
 <!-- 메인 js-->
<script src="<c:url value="/resources/tsfolder/js/mainjs.js"/>" ></script>
<script>

</script>
</div><!-- id=main  -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
    