<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!--  유튜브 자스 -->
<script src="<c:url value="/resources/tsfolder/js/TSmain.js"/>" crossorigin></script>
<!-- 유튜브용 부트스트랩 자스 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- 슬라이더를 위한 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<!-- 슬라이드 반응형 jqery -->
<script src="resources/tsfolder/js/jquery.sticky-kit.min.js"></script>

<script src="https://kit.fontawesome.com/c724cc2b3e.js" crossorigin="anonymous"></script>


<style>
	@media (min-width:43.75em) {
		.tscontainer {
			max-width: 100%;
			margin: 0 auto;
			position: relative;
		}
		.maints {
			display: inline-block;
			width: 80%;
			vertical-align: top;
			margin-right: 20px;
		}
		.tsidebar {
			display: inline-block;
			width: 17%;
			margin-left: 20px;
			vertical-align: top;
		}
		.fixedsticky {
			margin-top: 00px;
		}
	}
	.tsidebar {
		padding: 16px 1.5em;
		margin-top:80px;
		margin-bottom:10px;
	}

	.tscontainer {
		max-width: 85%;
		margin: 0 auto;
		position: relative;
	}
	.maints > div{
		background-color:white;
		border-radius:15px;
    }
    #tsmain{
  	  background: linear-gradient(to bottom, #ffffff, #FFFAFA);
    }
    aside > div {
	  border: 1px solid #ccc;
	  border-radius: 10px;
	  padding: 20px;
	  background-color: white;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  margin-bottom: 20px;
    }
    .magimg div a img{
    	padding: 10px;
    	width: 200px;
    	height: 150px;
    	
    }
	
</style>

<div id="tsmain" style="margin-top: 10px;">

		<div class="m-5 pt-5" style="display:flex; justify-content: center;">
	        <div class="slider1 ">
	            <div class="slide"><a href="#"><img style="width:100%; height:300px" src="<c:url value="/resources/images/tsimages/bannerevent.webp"/>"></a></div>
	            <div class="slide"><a href="#"><img style="width:100%; height:300px" src="<c:url value="/resources/images/tsimages/magazine2.webp"/>"></a></div>
	        </div>
	    </div>
	 

    
    <section class="tscontainer mx-3" style="width:90%;  border-radius: 5px;">
		<!-- 왼쪽 몸통부분 -->
	     <article class="maints justify-content-center">
	     	<div class="container my-3 pt-3">
		        <h3 class="display-4 text-center"><strong style="color:#EF605D; font-weight:900;">건강정보</strong> 페이지</h3>
		        <div class="row my-5" id="video-channel"></div>
		        <br>
		        <h3 class=" text-center" style="font-weight:bold; ">현직 약사가 쉽게 알려주는 <strong style="color:#EF605D; font-weight:900;">건강정보</h3>
		        <div class="row my-5" id="video-container"></div>
		        
		        <div class="magimg d-flex py-3 justify-content-center">
			        <div class="tsmg"><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>"></a></div>
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=02"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>"></a></div>
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=03"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Hia.jpg"/>"></a></div>
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=04"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Pro.jpg"/>"></a></div>
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=05"/>"><img src="<c:url value="/resources/images/thumbnail_img/YellowM_Mus.jpg"/>"></a></div>
	        	</div>
		    </div>    
	     </article>
	     
	     <!-- 오른쪽 슬라이드 -->
		<aside class="tsidebar fixedsticky">
			<!--  로그인 목록 창 -->
			<div class="login-section justify-content-center">
				<img src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="50" height="25">
            	<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="100" height="25">
            	<br/>
            	<p class="my-3" style="margin-bottom:20px; color:gray; font-size:13px; font-weight:500;">
            		영양제와 건강에 대한 모든 것,<br/>
					<span style="color:#EF605D">Madi-Q</span>에서 확인하세요!</p>
                <ul class="sidemgrg" style=" list-style:none; padding-inline-start: 0px;">
                    <a href="<c:url value="/magazine.do?no=01"/>" >
                        <div class="image d-flex">
                        	<img src="<c:url value="/resources/images/tsimages/rank_crown_gold_48.svg"/>" style=" position: absolute; vertical-align:top; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                        	<img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>" alt="*" style="width:300px; height:100px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#EF605D; font-size:13px; font-weight:bold;">영양소 A to Z</p>
                        	<p style="flex-wrap:wrap; color:black; line-height:18px; font-size:15px; font-weight:bold;  text-align: center;">운동러들의 필수 보충제,<br/> 아르기닌의 부작용</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.77
                        	</p>
                        </div>
                    </a>
                    <a href="<c:url value="/magazine.do?no=02"/>" >
                        <div class="image d-flex">
	                        <img src="<c:url value="/resources/images/tsimages/rank_crown_silver_48.svg"/>" style=" position: absolute; vertical-align:top; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                        	<img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>" alt="*" style="width:300px; height:100px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#EF605D; font-size:13px; font-weight:bold;">영양소 A to Z</p>
                        	<p style="flex-wrap:wrap; color:black; line-height:18px; font-size:15px; font-weight:bold;  text-align: center;">진짜 효과 있는<br/>콜라겐을 고르는법</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.34
                        	</p>
                        </div>
                    </a>
                    <a href="<c:url value="/magazine.do?no=03"/>" >
                        <div class="image d-flex">
                             <img src="<c:url value="/resources/images/tsimages/rank_crown_bronze_48.svg"/>" style=" position: absolute; vertical-align:top; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                        	 <img src="<c:url value="/resources/images/thumbnail_img/RedM_Hia.jpg"/>" alt="*" style="width:300px; height:100px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#EF605D; font-size:13px; font-weight:bold;">영양소 A to Z</p>
                        	<p style="flex-wrap:wrap; color:black; line-height:18px; font-size:15px; font-weight:bold;  text-align: center;">먹는 히알루론산은 효과가<br/>없다는데,그러면 주사로 맞아볼까?</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.22
                        	</p>
                        </div>
                    </a>
                 </ul>
			</div>
		</aside>
	</section>

</div>

<script>
$(document).ready(function(){
    $('.slider1').bxSlider({
        slideWidth: 1500,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 1,
        auto : true,
        stopAutoOnClick : true,
        pager : true,
    });
});

//사이드바 함수 적용
$(document).ready(function() {
  $('.tsidebar').stick_in_parent();
});
</script>

<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>