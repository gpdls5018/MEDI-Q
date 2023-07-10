<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!-- jQuery를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<!-- 슬라이더를 위한 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<!-- 해시태그를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<!-- 슬라이드 반응형 jqery -->
<script src="resources/tsfolder/js/jquery.sticky-kit.min.js"></script>


<style>

 .btn-6c img {
        margin-bottom: 10px;
    }

    .btn-6c lable {
        display: block;
        white-space: nowrap;
        font-size: 12px;
    }

    .btn-6c {
        display: flex;
        color: #ffffff;
        background: #ffffff;
        position: relative;
        flex-direction: column;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        border: 1px solid var(--color-bs-gray-300);
        width: 100px;
        height: 100px;
        padding: 10px;
        border-radius: 12px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        line-height: 24px;
    }
    
    .btn {
        
        font-size: 16px;
        cursor: pointer;
        padding: 40px 40px;
        margin: 10px 10px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        position: relative;
        text-align: center;
        color: black;
    }
    .tagify {
   		width: 80%;
    }
    /*사이드 랭킹바 만든 css*/
    .tsbutton {
		display: block;
		border-radius: 4px;
		text-decoration: none;
		text-align: center;
		color: #fff;
		background-color: #0071fc;
		padding: .5em
	}
	.maints {
		margin: 1em 0em 1em 1em;
	}
	.tsidebar {
		padding: 16px 1.5em;
		margin-bottom:10px;
	}
	.tsidebar .unlist li {
	    position: relative;
	    display: flex;
	    width: 100%;
	    height: 80px;
	    margin: 0 0 20px 0;
	    padding: 
	    background-color: #ffffff;
	    border-radius: 8px;
	    box-shadow: 0px 0px 2px #444;
	    align-items: center;
	}

	.tsidebar .unlist li img{
	    width: 50px;
	    height: 35px;
	    text-align: center;
	}
	
	@media (min-width:43.75em) {
		.tscontainer {
			max-width: 100%;
			margin: 0 auto;
			position: relative;
		}
		.maints {
			display: inline-block;
			width: 75%;
			vertical-align: top;
			margin-right: 20px;
		}
		.tsidebar {
			display: inline-block;
			width: 20%;
			margin-left: 20px;
			vertical-align: top;
		}
		.fixedsticky {
			margin-top: 00px;
		}
	}
	aside > div {
	  border: 2px solid #ccc;
	  border-radius: 10px;
	  padding: 20px;
	  background-color: white;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  margin-bottom: 20px;
    }
	.gCSEJp {
        display: flex;
        flex-direction: column;
        position: relative;
        padding: 40px 20px;
    }
    .gCSEJp > h1 {
        color: gray;
        font-weight: 900;
        margin-bottom: 24px;
    }
    .ktaGqG {
        display: inline-block;
        width: calc(100% - 10px);
        transform: translateX(10px);
        height: 139px;
        background-color: #EF605D;
        border-radius: 20px;
        margin-bottom: 20px;
        list-style-type: none;
        position: relative;
    }
    .jZuajW {
        position: absolute;
        left: -10px;
        z-index: 5;
        display: flex;
        flex-direction: column;
        top: 50%;
        transform: translateY(-50%);
        height: 110px;
        width: 25px;
        -webkit-box-align: center;
        align-items: center;
        justify-content: space-around;
    }
    .hBxOSS {
        cursor: pointer;
        border-radius: 20px;
        height: 139px;
        box-shadow: rgba(101, 101, 101, 0.3) 2px 2px 4px 4px;
    }
    .iJGurJ {
        position: relative;
        height: 100%;
        border-bottom: none;
        background-color: white;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        width: 92%;
        padding: 22px 0px 22px 30px;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .enbDhJ {
        font-weight: bold;
        height: 22px;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: start;
        justify-content: flex-start;
        border-radius: 10px;
        color: black;
    }
    .ZyIFk {
        display: flex;
        gap: 8px;
    }
    .maints > div{
		background-color:white;
 		border: 2px solid #eaeaea;
 		border-radius:15px;

    }
    section {
	  background: linear-gradient(to bottom, #ffffff, #FFFAFA);
	}

    .section .content {
        width: 90%;
        margin: 30px;
        text-align: center;
        position: relative;
    }
    .section1-2b .txt1 {
        font-weight: 700;
        font-size: 20px;
        color: #101219;
    }
    .section1-2b .ingredient-wrap {
 		display:flex;
 		flex-wrap: wrap;
        width: calc(100% + 20px);
        margin-top: 10px;
        justify-content:center; 
        align-items: center
        
    }
    .section1-2b .txt1 span {
        color: #EF605D;
    }
    .section1-2b .ingredient-wrap .ingredient-one .txt-fix {
	    display: table-cell;
	    vertical-align: middle;
	    height: 120px;
	    font-weight: bold;
	    font-size: 16px;
	    line-height: 20px;
	    color: #101219;
	    text-align: center;
	    width: 100%;
	}
    .section1-2b .ingredient-wrap .ingredient-one {
        width: calc(20% - 35px);
        height: 80px;
        margin: 15px 15px 0px 0px;
        float: left;
        border-radius: 20px;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        text-align: center;
        background: #FFFFFF;
        display: table;
        border: 1px solid #E6E9ED;
    }

    .section1-2b .more-pop-ingredient {
        float: right;
        font-weight: bold;
        font-size: 16px;
        line-height: 1;
        text-align: right;
        margin: 10px 0px 0px 20px;
        text-decoration: underline;
        color: #9BA1AA;
        cursor: pointer;
    }
    .ingredient-wrap a{
  		flex-basis: 16%;
    	text-align: center;
        text-decoration:none; 
    }
    /*3번째 div 목록*/
    .section1-2e {
		margin: 30px;
        width: 95%;
    }
    .section .content {
        margin: 0px auto;
        text-align: center;
        position: relative;
    }
    .section1-2e .txt1 {
        display: block;
        color: #9BA1AA;
        text-align: center;
        font-weight: 700;
        font-size: 20px;
        line-height: 1;
    }
    .section1-2e .txt2 {
        display: block;
        font-weight: 700;
        color: #101219;
        font-size: 26px;
        text-align: center;
        line-height: 34px;
        margin: 10px 0px 28px;
    }
    .section1-2e .txt2 span {
        color: #EF605D;
    }
    .section1-2e .swiper-container2 {
        overflow: hidden;
        width: calc(100% + 20px);
        padding: 0px 0px 80px;
        transform: translateX(-10px);
    }
    .u510{
        display: none;
    }
    .slideriview {
    	border-radius: 20px;
    	box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    }


</style>

 	<!-- 처음 인덱스 킬때 전체화면 비디오 출력 -->
			<div id="tsvideo-container">
			    <video id="video" autoplay muted>
	                <source src="<c:url value="/resources/video/intro1_.mp4"/>" type="video/mp4">
			    </video>
			    <div class="videologo">
			    	<img class="px-2"src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="50" height="25">
	           		<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="100" height="25">
			    </div>
			    <div id="video-controls">
			      <button class="btn btn-warning" onclick="closeVideo()">Home<br/>가기</button>
			    </div>
			    <div id="video-label">
		    	  <label for="stop-video-checkbox">
			        동영상 오늘 하루 그만 보기
			        <input type="checkbox" id="stop-video-checkbox">
			      </label>
			    </div>
			</div>

<!-- 메인 바디 부분 -->
<div id="tsmain" style="margin-top: 10px;">
	 
  <section id="section-119">
        <div class="content-slider">
          <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
          <input type="radio" id="banner2" class="sec-1-input" name="banner">
          <input type="radio" id="banner3" class="sec-1-input" name="banner">
          <input type="radio" id="banner4" class="sec-1-input" name="banner">
          <div class="slider">
            <div id="top-banner-1" class="banner">
              <div class="banner-inner-wrapper" >
                <h1>글자입력</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">홈으로</a></div>
              </div>
            </div>
            <div id="top-banner-2" class="banner">
              <div class="banner-inner-wrapper" id="tsbaimg2">
                 <h1>글자</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">건강 및 분석하기</a></div>
              </div>
            </div>
            <div id="top-banner-3" class="banner" id="tsbaimg3">
              <div class="banner-inner-wrapper">
                 <h1>글자</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">사진으로 약 검색하기</a></div>
              </div>
            </div>
            <div id="top-banner-4" class="banner" id="tsbaimg4">
              <div class="banner-inner-wrapper">
                 <h1>졸리닭</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">건강검진</a></div>
              </div>
            </div>
          </div>
          <nav>
            <div class="controls">
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
		<div class="row justify-content-center mt-5 pt-5">
	        <div class="col-lg-10 text-center">
	            <h1 class="mb-5" style="font-weight:bold; color:black;"><span style="color: #EF605D;">제품명,영양성분</span>을 검색해보세요.</h1>
	            <form class="position-relative w-75 mx-auto animated slideInDown d-flex input-wrapper" action="/hashtag.do" method="post" style="box-shadow: 0px 0px 5px gray; border-radius: 20px;">
	                <input class="border-0 rounded-pill w-100 px-5 py-3 ps-4 pe-5 flex-grow-1" type="text" name="postTag" 
	                placeholder="제품명 및 영양성분을 입력하세요" value="${not empty searchTags ? fn:replace(searchTags,'#',',#') : ''}">
	                <input name="searchTags" type="hidden" id="hiddenInput" value="">
	                <button type="submit" class="btn rounded-pill py-2 px-4 top-0 end-0 me-2" >
						<img src="<c:url value="/resources/images/tsimages/free-icon-magnifying-glass-4475396.png"/>" style="width:30px; height:30px">
					</button>
	            </form>
	        </div>
	        <div id="hashtaglink" class="ml-1 py-3 row" >
	       	 	<button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-skin-protection-5228128.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: green;">#피부건강</lable></button>&nbsp;
	        	<button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-immunity-5106341.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: palevioletred;">#면역력 증진</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-male-gender-2404544.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: mediumpurple;">#전립선 건강</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-weight-scale-7984802.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: sandybrown;">#체지방 감소</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-vitamins-525955.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: salmon;">#비타민</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-glucose-meter-4228683.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: lightskyblue;">#혈당</lable></button>&nbsp;
		    </div >
	    </div>
	    
<!-- 검색창 밑부분! 사이드바와 몸통 부분 -->
<section class="tscontainer mt-5" style="width:90%;  border-radius: 5px;">
	<!-- 왼쪽 몸통부분 -->
     <article class="maints justify-content-center">
     <!-- 1번째 다이브 목록 -->
     	<div class="template__Wrapper-sc-5bsqyv-0 gCSEJp">
	        <h1>$이태성$님의 최근 분석 리포트</h1>
	        <div class="DefaultReportItem__ReportBook-sc-rysw89-0 ibNwmg">
	            <a style="text-decoration:none;" data-gtm-id="report-home-recent-blank" class="DefaultReportItem__ItemWrapper-sc-rysw89-1 ktaGqG" href="/analyzeMyFood.do">
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
	     
	  <!-- 2번째 다이브 목록 -->
	  <div class="section section1-2b py-4 my-2">
	        <div class="content">
	            <span class="txt1"><span>인기 성분</span>이에요</span>
	            <div class="ingredient-wrap">
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">포스트<br/>바이오틱스</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">오메가3</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">프로바이오틱스<br/>(유산균)</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">비타민C</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">가르시니아<br/>캄보지아</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">레시틴</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">코엔자임Q10</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">비타민B1</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">비타민A</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">칼슘</div></a>
	            </div>
	            <div class="clearfix">
	                <a tabindex="0" class="more-pop-ingredient pt-4 mr-5" href="#">인기성분 더보기</a>
	            </div>
	        </div>
	    </div>
	    
	  <!--  3번째 다이브 목록 -->
	
	    
	    
  	  <!--  *번째 다이브 목록 -->
      
      <!--  *번째 다이브 목록 -->
	    <div class="m-5 " style="display:flex; justify-content: center;">
	        <div class="slider1 ">
	            <div class="slide"><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=02"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=03"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Hia.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=04"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Pro.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=05"/>"><img src="<c:url value="/resources/images/thumbnail_img/YellowM_Mus.jpg"/>"></a></div>
	        </div>
	    </div>
	</article>
		<!-- 오른쪽 슬라이드 -->
		<aside class="tsidebar fixedsticky">
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
            		40만 건의 분석 결과를 <br/>토대로 선정된
					믿을 수<br/> 있는 진짜 랭킹을<br/>  확인해 보세요.</span></p>
                <ul class="unlist" style="padding-inline-start: 0px;">
                    <li>
                        <div class="image">
                        	<!--<img src="<c:url value="/resources/images/tsimages/ranking1.webp"/>" style=" position: relative; vertical-align:top; left:5px; width:30px; height:30px;" alt="*">-->
                            <img src="<c:url value="/resources/images/tsimages/destination-1.jpg"/>" alt="*">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:gray; font-size:8px; font-weight:bold;">종근당 건강</p>
                        	<br/>
                        	<p style="flex-wrap:wrap; color:black; font-size:10px; font-weight:bold;  text-align: center;">락토핏</p>
                        	<br/>
                        	<p style="color:gray; font-size:8px; font-weight:bold;">
                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
                        	4.64(814)
                        	</p>
                        </div>
                    </li>
                    <li>
                        <div class="image">
                            <img src="<c:url value="/resources/images/tsimages/destination-2.jpg"/>" alt="*">
                        </div>
                         <div style="margin-top:20px; margin-left:10px; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:gray; font-size:8px; font-weight:bold;">고려은단</p>
                        	<br/>
                        	<p style="color:black; font-size:10px; font-weight:bold; text-align: center;">비타민C 1000</p>
                        	<br/>
                        	<p style="color:gray; font-size:8px; font-weight:bold;">
                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
                        	4.66(178)
                        	</p>
                        </div>
                    </li>
                    <li>
                        <div class="image">
                            <img src="<c:url value="/resources/images/tsimages/destination-3.jpg"/>" alt="*">
                        </div>
                         <div style="margin-top:20px; margin-left:10px; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:gray; font-size:8px; font-weight:bold;">종근당</p>
                        	<br/>
                        	<p style="color:black; font-size:10px; font-weight:bold; text-align: center;">칼슘앤마그네슘</p>
                        	<br/>
                        	<p style="color:gray; font-size:8px; font-weight:bold;">
                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
                        	4.67(115)
                        	</p>
                        </div>
                    </li>
                    <!--  랭킹 3개만 출력하기 위해서 잠시 주석
                    <li>
                        <div class="image d-flex">
                             <p style="position: relative; text-align:top; left:5px; width:30px; height:30px; color:gray; font-weight:bold;">4위</p>
                            <img src="<c:url value="/resources/images/tsimages/destination-4.jpg"/>" alt="*">
                        </div>
                         <div style="margin-top:20px; margin-left:10px; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:gray; font-size:8px; font-weight:bold;">얼라이브</p>
                        	<br/>
                        	<p style="color:black; font-size:10px; font-weight:bold; text-align: center;">원스데일리 포 맨</p>
                        	<br/>
                        	<p style="color:gray; font-size:8px; font-weight:bold;">
                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
                        	4.41(37)
                        	</p>
                        </div>
                    </li>
                    <li>
                        <div class="image d-flex">
                            <img src="<c:url value="/resources/images/tsimages/package-1.jpg"/>" alt="*">
                        </div>
                         <div style="margin-top:20px; margin-left:10px; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:gray; font-size:8px; font-weight:bold;">쏜 리서치</p>
                        	<br/>
                        	<p style="color:black; font-size:10px; font-weight:bold; text-align: center;">Basic B Complex </p>
                        	<br/>
                        	<p style="color:gray; font-size:8px; font-weight:bold;">
                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
                        	4.63(19)
                        	</p>
                        </div>
                    </li>
                     -->
                </ul>
            </div>
		</aside>
</section>

<!-- 매인 배너 슬라이드 -->
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CSSRulePlugin3.min.js"></script>
<script>
// The DOM element you wish to replace with Tagify
var input = document.querySelector('input[name=postTag]');
var whitelist = ["#혈압","#당뇨","#면역력 증진","#전립선 건강","#체지방 감소","#피로개선","#혈당","#비타민","#오메가","#피부건강"];
// initialize Tagify on the above input node reference
var tagify = new Tagify(input,{
    enforceWhitelist: true,
    whitelist : whitelist
})
$('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
tagify.on('input', e => console.log(e.detail));
$('#hashtaglink button lable').click(function() {
    tagify.addTags([{value:$(this).html(), style:"--tag-bg:"+$(this).css('color')}]);
});
tagify.on('add', e=> {
    $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
});
tagify.on('remove', e=> {
    $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
});

$(document).ready(function(){
    $('.slider1').bxSlider({
        slideWidth: 800,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 1,
        auto : true,
        stopAutoOnClick : true,
        pager : true,
    });
    
    /* 처음 배너할 때 코드
    $('.ba1').bxSlider({
    	 slideWidth: 800,
         minSlides: 2,
         maxSlides: 2,
         slideMargin: 1,
         auto : true,
         stopAutoOnClick : true,
         pager : true,
    }); */
});


//비디오 히든 로직
document.addEventListener("DOMContentLoaded", function() {
	  var checkbox = document.getElementById("stop-video-checkbox");
	  var videoContainer = document.getElementById("tsvideo-container");

	  // 저장된 값 가져오기
	  var hideUntilDate = localStorage.getItem("hideUntilDate");

	  // 저장된 값이 있고, 현재 날짜보다 크면 동영상 숨김
	  if (hideUntilDate && hideUntilDate >= getCurrentDate()) {
	    videoContainer.style.display = "none";
	    checkbox.checked = true;
	  }

	  checkbox.addEventListener("change", function() {
	    if (checkbox.checked) {
	      // 하루 동안 동영상 숨기기
	      var nextDay = new Date();
	      nextDay.setDate(nextDay.getDate() + 1);
	      var hideUntilDate = formatDate(nextDay);
	      localStorage.setItem("hideUntilDate", hideUntilDate);
	      videoContainer.style.display = "none";
	    } else {
	      // 체크 해제 시 동영상 표시
	      localStorage.removeItem("hideUntilDate");
	      videoContainer.style.display = "block";
	    }
	  });

	  // 현재 날짜 반환하는 함수
	  function getCurrentDate() {
	    var now = new Date();
	    return formatDate(now);
	  }

	  // 날짜를 "YYYY-MM-DD" 형식으로 변환하는 함수
	  function formatDate(date) {
	    var year = date.getFullYear();
	    var month = ("0" + (date.getMonth() + 1)).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    return year + "-" + month + "-" + day;
	  }
	});
	
/*배너 영상돌리기*/
function bannerSwitcher() {
    next = $('.sec-1-input').filter(':checked').next('.sec-1-input');
    if (next.length) next.prop('checked', true);
    else $('.sec-1-input').first().prop('checked', true);
  }

  var bannerTimer = setInterval(bannerSwitcher, 5000);

  $('.controls label').click(function() {
    clearInterval(bannerTimer);
    bannerTimer = setInterval(bannerSwitcher, 5000)
  });



//사이드바 함수 적용
$(document).ready(function() {
  $('.tsidebar').stick_in_parent();
});
</script>
</div><!-- id=main  -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
    