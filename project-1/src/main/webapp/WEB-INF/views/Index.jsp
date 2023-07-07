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
			width: 82%;
			vertical-align: top;
		}
		.tsidebar {
			display: inline-block;
			width: 16%;
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


</style>
		<!-- 상단 배너 출력 슬라이드 -->
		<div class="container-fluid  mb-3 hero-header">
            <video autoplay loop muted class="video-background" style="height: 340px; width: 1200px; margin-top: 100px;">
                <source src="<c:url value="resources/video/intro1_.mp4"/>" type="video/mp4">
            </video>
        </div>

        <!-- ocr 들어가면 사진 검색용 -->
		<div class="ml-5 mt-2 ">
	        <i class="bi bi-camera" hidden><a href="/modelOCR.do"> 사진으로 검색할래요 !!!</a></i>
	    </div>
	
		<!-- 검색창 밑 검색버튼  -->
		<div class="row justify-content-center">
	        <div class="col-lg-10 text-center">
	            <h1 class="mb-5" style="font-weight:bold;"><span style="color: #EF605D;">제품명,영양성분</span>을 검색해보세요.</h1>
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
	     
	  <!-- 2q번째 다이브 목록 -->
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
	  <jsp:include page="/WEB-INF/views/ListTable.jsp"/>
      
      <!--  4번째 다이브 목록 -->
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
            <div class="sidebar-item">
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
                    <li>
                        <div class="image d-flex">
                            <!-- <p style="position: relative; text-align:top; left:5px; width:30px; height:30px; color:gray; font-weight:bold;">4위</p>-->
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
                </ul>
            </div>
		</aside>
</section>

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
    	auto: true,
        autoControls: true,
        stopAutoOnClick: true,
        pager: true,
        nextSelector: '#slider-next',
   	    prevSelector: '#slider-prev',
   	    nextText: 'Onward →',
        prevText: '← Go back'
    });*/
});


    



//사이드바 함수 적용
$(document).ready(function() {
  $('.tsidebar').stick_in_parent();
});
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
    