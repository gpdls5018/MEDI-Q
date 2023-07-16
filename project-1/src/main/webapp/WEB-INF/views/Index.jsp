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
            box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.4);
        }

        .box.active {
            background-color: #bbb;
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
			    <div class="videologo">
			    	<img class="px-2"src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="100" height="50">
	           		<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="200" height="50">
			    </div>
			    <div id="video-controls">
			      <button class="btn" onclick="closeVideo()">Home</button>
			    </div>
			    <div id="video-label">
		    	  <label for="stop-video-checkbox">
			        동영상 오늘 하루 그만 보기
			        <input type="checkbox" id="stop-video-checkbox">
			      </label>
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
	              </div>
	            </a>
            </div>
            <div id="top-banner-2" class="banner" id="tsbaimg2">
	            <a href="<c:url value="/analyzeMyFood.do"/>">
	              <div class="banner-inner-wrapper" id="banner-inner-wrapper2"  >
	               	 <p style="color:gray;">과도하거나 부족하지 않을까?</p>
	                 <h1>💊 영양제를 분석 받으세요!</h1>
	              </div>
	            </a>
            </div>
            <div id="top-banner-3" class="banner" id="tsbaimg3">
	            <a href="#">
	              <div class="banner-inner-wrapper" id="banner-inner-wrapper3" >
	              	 <p style="color:gray;">내가 먹고 있는 영양제 괜찮을까?</p>
	                 <h1>📷 사진으로 영양제를 검색해보세요!</h1>       
	              </div>
	            </a>
            </div>
            <div id="top-banner-4" class="banner" id="tsbaimg4">
	            <a href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>">
	              <div class="banner-inner-wrapper" id="banner-inner-wrapper4" >
	              	 <p style="color:gray;">내 위암 발병률은 몇 퍼센트일까?</p>
	                 <h1>😥 주요 질환의 발병<br/> 위험도를 예측해드려요!</h1>
	              </div>
	            </a>
            </div>
          </div>
          <nav>
            <div class="controls" >
              <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><p>홈페이지</p></label>
              <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><p>건강 및 분석</p></label>
              <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><p>사진으로 약 검색하기</p></label>
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
		<div class="row justify-content-center pt-5" style="margin: 60px 0px 0px 0px">
	        <div class="col-lg-10 text-center">
	            <h1 class="my-5" style="font-weight:bold; color:black;"><span style="color: #EF605D;">👋 제품명 또는 영양성분</span>을 검색해보세요.</h1>
	            <form class="position-relative w-75 mx-auto animated slideInDown d-flex input-wrapper" action="/hashtag.do" method="post" style="box-shadow: 0px 0px 5px gray; border-radius: 20px;">
	                <input class="border-0 rounded-pill w-100 px-5 py-3 ps-4 pe-5 flex-grow-1" type="text" name="postTag" 
	                placeholder="제품명 및 영양성분을 입력하세요" value="${not empty searchTags ? fn:replace(searchTags,'#',',#') : ''}">
	                <input name="searchTags" type="hidden" id="hiddenInput" value="">
	                <button type="submit" class="btn rounded-pill py-2 px-4 top-0 end-0 me-2" >
						<img src="<c:url value="/resources/images/tsimages/free-icon-magnifying-glass-4475396.png"/>" style="width:30px; height:30px">
					</button>
	            </form>
	        </div>
	        <div id="hashtaglink" class="ml-1 py-5 row" >
       	        <span class="s-txt1">인기 검색어</span>
                <a href="#" style="font-weight: bold;color:green">#피부건강</a>&nbsp;
	        	<a href="#" style="font-weight: bold;color:palevioletred">#면역력 증진</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:mediumpurple ">#전립선 건강</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:sandybrown">#체지방 감소</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:salmon ">#비타민</a>&nbsp;
		        <a href="#" style="font-weight: bold;color:lightskyblue ">#혈당</a>&nbsp;
		        <span class="s-txt2">(07/15&nbsp;기준)</span>
		    </div >
	    </div>
	    
<!-- 검색창 밑부분! 사이드바와 몸통 부분 -->
<section class="tscontainer" style="width:100%;  border-radius: 5px;">
	<!-- 왼쪽 몸통부분 -->
     <article class="maints justify-content-center px-3">
     <!-- 1번째 다이브 목록 -->
     	<div class="template__Wrapper-sc-5bsqyv-0 gCSEJp">
	        <h1 class="text-center mb-3" style="font-size: 30px; color: black;">$사용자$님의 최근 분석 리포트</h1>
	        <div class="DefaultReportItem__ReportBook-sc-rysw89-0 ml-1 ibNwmg d-flex" style="justify-content:flex-start; margin-top: 30px; margin-bottom: 40px;">
	            <a data-gtm-id="report-home-recent-blank" class="DefaultReportItem__ItemWrapper-sc-rysw89-1 ktaGqG" href="<c:url value="/analyzeMyFood.do"/>" style="text-decoration: none;">
	                <div class="DefaultReportItem__Springs-sc-rysw89-8 jZuajW">
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                </div>
	                <article class="DefaultReportItem__InnerContents-sc-rysw89-2 hBxOSS" style="display: block;">
	                    <div class="DefaultReportItem__BackgroundWrapper-sc-rysw89-3 iJGurJ">
	                        <div>
	                            <div class="DefaultReportItem__ScoreDate-sc-rysw89-5 enbDhJ">분석한 기록이 없습니다.</div>
	                            <p class="DefaultReportItem__Score-sc-rysw89-6 jeiOCr">??<span>점</span></p>
	                        </div>
	                        <div class="DefaultReportItem__Purpose-sc-rysw89-7 ZyIFk">
	                            <p>먹고 있는 영양제를 분석해 보세요!</p>
	                        </div>
	                    </div>
	                </article>
	             </a>
	          </div>
	     </div>
	     
	     <!--  2번째 다이브 목록 -->
		<div class="section section1-2c">
	       <a href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>" style="text-decoration: none;">
	           <div class="content">
	               <span class="txt1"><span style="display: block; text-align: center; width: 100%;">👨‍⚕️ 주요 질환의 발병 위험도를 예측해드려요</span></span>
	               <br/>
	               <span class="text-center txt2" style="margin-top: 40px; margin-bottom: 40px;">MEDI-Q의 인공지능 기술로 분석하는 건강검진!</span>
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
	            <div class="ingredient-wrap" style="margin-top: 40px;">
                    <div class="box-container">
		                <c:forEach var="name" items="${top10}">
						    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
						        <b style="font-size: 14px;">${name}</b>
						    </div>
						</c:forEach>
                	</div>
	            </div>
	            <div class="clearfix">
	                <a tabindex="0" class="more-pop-ingredient pt-4 mr-3" href="/NutrientSelect.do">영양성분 더보기</a>
	            </div>
	        </div>
	    </div>
	    
	   <!-- 4번째 다이브 목록 -->
	   <!-- 인기 영양제 Top10 -->
	   <div class="section section1-2s ranking-190">
	        <div class="content" style="margin-top:60px;">
	            <div class="txt2" style="margin-bottom: 20px;"><span style="color:black; font-size: 30px;">💊 인기 영양제</span> <span style="font-size: 30px;">Top 10</span></div>
	            <div class="tab-contents" style="display: block;">
	                <div class="tab-content tab-content-001 new-wide-main-060 new-wide-main-090 active width-flt1" style="padding-top: 20px;">
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
	                        <a tabindex="0" class="more-pop-health mt-5" href="/ranking/selectfood.do"><b>건강기능식품 더보기</b></a>
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
	            <div class="get-20-2-home-txt2" style="display: block; text-align: center; width: 100%; margin-top: 35px; margin-bottom: 35px; font-size: 18px;">전문가가 직접 답해드려요!</div>
	            <div class="qna-list-wrap">
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                성분 정보
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>epa높은 오메가3 구미나 츄어블 있을까요?</span>
	                            <span class="txt2">알약을 아예 못먹어서 여태 키즈 제품을 먹었습니다. 중성지방 콜레스테롤때문에 epa가 높은 제품을 먹고싶은데..<br/> 추천해주시면 너무 감사해요ㅠㅠ</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">액체형(리퀴드) 오메가3 제품을 선택하거나, 일반 캡슐 제품을 잘라서 내용물만 섭취하시는 것을 추천해요!</div>
	                            <div class="user-info-row">
	                                <span class="user-name">김**</span>
	                                <span class="user-agesex">20대 / 여</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝 -->
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                영양제 조합
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>혈압약 처방 받았습니다.</span>
	                            <span class="txt2">누보로젯 40/2.5/5/10 처방 받았습니다. 현재 영양제와의 점수가 안맞네요. 멀 빼야하고 대신해서 멀 넣어야하는지<br/> 알려주세요. 혈압약을 먹기 전에는 96점이였습니다.</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">혈압약을 드시면서 피해야 하는 것과 계속 섭취해도 괜찮은 영양제를 알려드릴게요.</div>
	                            <div class="user-info-row">
	                                <span class="user-name">김**</span>
	                                <span class="user-agesex">30대 / 남</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝 -->
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                영양제 조합
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>흡연자 영양제 정리 부탁드립니다</span>
	                            <span class="txt2">흡연자여서 전에 Q&amp;A로 추천을 받은 영양제는 어려울거 같아서요 B6는 20 B12는 55까지 최대로 잡고 알려주시면<br/> 감사하겠습니다 마그네슘도 50정도가 부족해서 같이 부탁드릴게요</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">영양제 선택은 건강에 대해 가장 중요하게 생각하는 가치에 따라 달라질 수 있어요.</div>
	                            <div class="user-info-row">
	                                <span class="user-name">루**</span>
	                                <span class="user-agesex">20대 / 남</span>
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
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>코로나 걸렸을 때 영양제</span>
	                            <span class="txt2">코로나 확진 4일차에요. 혹시 같이 먹으면 좋은 영양제 있을까요? 궁금합니다. </span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">코로나 감염을 예방하기 위해, 또는 코로나 후유증에서 빨리 벗어나기 위해서는 비타민 C, 비타민 D, 아연 등<br/> 면역에 관련된 영양제가 도움이 됩니다. </div>
	                            <div class="user-info-row">
	                                <span class="user-name">물**</span>
	                                <span class="user-agesex">30대 / 여</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝 -->
	            </div>

	            <div class="clearfix mt-5 my-2 mr-5">
	                <a tabindex="0" class="more-qna" href="<c:url value="/board/List.do" />"><b>Q&amp;A 더보기</b></a>
	            </div>
	        </div>
	    </div>
	  
	    
	    
	   <!--  6번째 다이브 목록 -->
		<div class="section6 pt-5" style="display:flex; align-items:center; max-width: 1050px; flex-direction: column;">
			<span style="font-weight: bold;">영양제와 건강에 대한 모든 것,<br/> <p stlye="#EF605D">MEDI-Q</p>에서 확인하세요</span>
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
            <div class="container-xxl py-4">
                <div class="container">
                    <div class="mainMap" id="map" style="border-radius: 10px;">
                        <button type="button" class="btn" id="tsBtn">
                        	<span>🩺병원 & 💊약국찾기</span>
                        </button>
                        <div class="mapLayer">
                            <div class="closeLayerButton" onclick="closeMapLayer()">&times;</div>
                            	<h2>주소</h2>
      	                     	<p style="font-size:17px; color:gray; font-weight: bold; margin-bottom: 0px;">서울시 금천구 가산동 426-5<br/> 월드메르디앙 2차 413호(Madi-Q팀)</p>
      	                     	<p style="font-size:15px; color:gray;">(주)한국소프트웨어아이엔씨 (153-759)</p>
                           		<a href="https://naver.me/Fcacgzd6" target="_blank">
                           		<img src="<c:url value="/resources/images/tsimages/img_naver.png"/>" alt="NAVER">  지도로 보기</a>
                           		<a href="https://place.map.kakao.com/1784287516" target="_blank"> 
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
		        <p style="text-align: center; font-weight:bold; font-size:13px;"><span style="color:#EF605D">Madi-Q</span>를 더 안전하고<br/> 편리하게 이용하세요</p>
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
            <div class="sidebar-item pt-5 mt-5">
            	<img src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="50" height="25">
            	<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="100" height="25">
            	<br/>
            	<p class="my-3" style="margin-bottom:20px; color:gray; font-size:12px; font-weight:500;">
            		<span class="py-3">
            		AI모델의 분석 결과를 바탕으로<br/>
            		선정된 랭킹을 직접 확인해 보세요.</span></p>
                <ul class="unlist" style="padding-inline-start: 0px;">
				<c:forEach items="${listData}" var="item" varStatus="status">
	            	<c:if test="${status.index < 3}">
                    <li>
                        <div class="image" >
	            			<a href="/detail.do?no=${item.no}">
	                            <c:if test="${not empty item.imgURL}">
									<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
								</c:if>
		          				<c:if test="${empty item.imgURL}">	
									<img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
								</c:if>
                    		</a>
                        </div>
                        <div style="align-items: center; margin-top:25px; margin-left:10px; justify-content: center; text-align: start; line-height: 1px; font-weight:400;">
	            			<a href="/detail.do?no=${item.no}">
	                        	<p style="line-height: 10px; color:gray; font-size:9px; font-weight:bold;">${item.company}</p>
	                        	<br/>
	                        	<p style="line-height: 11px; color:black; font-size:11px; font-weight:bold;">${item.productName}</p>
	                        	<br/>
	                        	<p style="color:gray; font-size:10px; font-weight:bold;">
	                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
	                        	&nbsp;${item.AVG_Score }&nbsp;(${item.REVIEW_Count})
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
    