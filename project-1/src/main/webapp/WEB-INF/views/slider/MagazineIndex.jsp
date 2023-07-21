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
<script src="/resources/tsfolder/js/jquery.sticky-kit.min.js"></script>

<script src="https://kit.fontawesome.com/c724cc2b3e.js" crossorigin="anonymous"></script>


<style>
	.magimg div{
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		border-radius: 20px;
	}
    .magimg div a img{
    	border-radius: 20px;
    	padding: 5px;
    	margin: 10px 5px 0 5px;
    	width: 370px;
    	height: 220px;    	
    }
	
	.custom-sidebar{
		margin-top : 30px;
	 	margin-left: 45px;
	}
	.custom-sidebarS{
		margin-top : 23px;
	 	margin-left: 20px;
	}
	.sidebar-title{
		margin-top: 45px;
	}
	.custom-main{
		padding-left:170px;
		margin-bottom: 130px;
	}
	.first-text{
		margin-top: 50px;
	}

	.medi-img{
		margin-top :10px;
		margin-right: 25px;
		margin-bottom: 20px;
	}
	.medi-imgs{
		margin-right: 10px;
		margin-bottom: 20px;
	}
	
	.nav{
        display: flex;
        justify-content: space-between; 
        list-style: none;
    }
    .nav-link:hover {
        color: #FF4400;
        background-color: #FFFFFF;
    }       
    .nav-link{
        color: gray;
        font-weight: bold;
        font-size: 20px;
    }
    .nav-pills > .nav-item > .active{
        background-color: #FFFFFF !important;
        color: #FF4400;
    }
</style>

<div id="tsmain">
	<div class="everybanner1">
        <div class="everybanner1-1 clearfix"></div>
	</div>
	
    <div class="container">
        <ul class="nav nav-pills">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="pill" href="#home">전체</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="pill" href="#menu1">영양제 상식</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="pill" href="#menu2">영양소 A to Z</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#home">영양제 레시피</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#menu1">영양제 팩트체크</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#menu2">Health & Life</a>
            </li>
        </ul>
      </div>
    <section class="tscontainer custom-main" style="width:90%;  border-radius: 5px;">
		<!-- 왼쪽 몸통부분 -->
	     <article class="maints justify-content-center">
	     	<div class="container ">
		        <h3 class="display-4 text-center first-text" style="color: #2E8B57;"><strong><span style="color:#EF605D; font-weight:900;">
		        <img src="<c:url value="/resources/images/magazine_images/medi/healthcare.png"/>" class="img-fluid medi-imgs" style="width:110px">
		        건강정보</span> 페이지</strong></h3>
		        <div class="row my-1" id="video-channel"></div>
		        <br>
		        <h2 class="text-center " style="font-weight:bold; color: #00ACE5;">
		        <img src="<c:url value="/resources/images/magazine_images/medi/advice.png"/>" class="img-fluid medi-img" style="width:140px">
		        현직 약사가 쉽게 알려주는 <strong style="color:#FF4500; font-weight:900;">건강정보</strong></h2>
		        <div class="row my-1" id="video-container"></div>
		        
		        <div class="magimg d-flex py-3 justify-content-center">
			        <div class="tsmg"><a href="<c:url value="/magazine.do?no=06"/>"><img src="<c:url value="/resources/images/thumbnail_img/SkyM_Yoo.jpg"/>"></a></div>
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=02"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>"></a></div>
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=03"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Hia.jpg"/>"></a></div>
		        </div>
		        <div class="magimg d-flex justify-content-center mb-5">
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>"></a></div>
		            <div class="tsmg"><a href="<c:url value="/magazine.do?no=05"/>"><img src="<c:url value="/resources/images/thumbnail_img/YellowM_Mus.jpg"/>"></a></div>
	        		<div class="tsmg"><a href="<c:url value="/magazine.do?no=04"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Pro.jpg"/>"></a></div>
	        	</div>
		    </div>    
	     </article>
	     
	     <!-- 오른쪽 슬라이드
	     
		<aside class="tsidebar fixedsticky">
			-- 로그인 목록 창 --
			<div class="login-section" style="width: 230px; height: 1045px;">
			<div class="custom-sidebar">
				<img src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="25" height="25">
            	<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="95" height="25">
            </div>

            	<p class="custom-sidebarS" style="margin-bottom:20px; color:#191970; font-size:13px; font-weight:500; ">
            		영양제와 건강에 대한 모든 것,<br/>
					<span style="color:#1E90FF">MEDI-Q</span>에서 확인하세요!</p>
                <ul class="sidemgrg mt-3" style=" list-style:none; padding-inline-start: 0px;">
                    <a href="<c:url value="/magazine.do?no=01"/>" >
                        <div class="image d-flex">
                        
                        	<img src="<c:url value="/resources/images/tsimages/rank_crown_gold_48.svg"/>" style=" position: absolute; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                       	
                        	<img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>" alt="*" style="width:300px; height:150px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#FF4500; font-size:14px; font-weight:bold;">영양소 A to Z</p>
                        	<p style="flex-wrap:wrap; color:#191970; line-height:18px; font-size:13px; font-weight:bold;  text-align: center;"><span class="badge bg-warning">1</span>&nbsp;&nbsp;운동러들의 필수 보충제,<br/> 아르기닌의 부작용</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.77
                        	</p>
                        </div>
                    </a>
                     <a href="<c:url value="/magazine.do?no=05"/>" >
                        <div class="image d-flex sidebar-title">
                        
                             <img src="<c:url value="/resources/images/tsimages/rank_crown_bronze_48.svg"/>" style=" position: absolute; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                         
                        	 <img src="<c:url value="/resources/images/thumbnail_img/YellowM_Mus.jpg"/>" alt="*" style="width:300px; height:150px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#FF4500; font-size:13px; font-weight:bold;">떠먹여 주는 영양제 레시피</p>
                        	<p style="flex-wrap:wrap; color:#191970; line-height:18px; font-size:13px; font-weight:bold;  text-align: center;"><span class="badge bg-warning">2</span>&nbsp;&nbsp;운동 전후 보충제로 멸치 탈출!<br/> 운동 영양제 레시피</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.22
                        	</p>
                        </div>
                    </a>
                    
                    <a href="<c:url value="/magazine.do?no=02"/>" >
                        <div class="image d-flex sidebar-title">
                        
	                        <img src="<c:url value="/resources/images/tsimages/rank_crown_silver_48.svg"/>" style=" position: absolute; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                       	 
                        	<img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>" alt="*" style="width:300px; height:150px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#FF4500; font-size:14px; font-weight:bold;">영양소 A to Z</p>
                        	<p style="flex-wrap:wrap; color:#191970; line-height:18px; font-size:13px; font-weight:bold;  text-align: center;"><span class="badge bg-warning">3</span>&nbsp;&nbsp;진짜 효과 있는 콜라겐을<br/> 고르는법</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.34
                        	</p>
                        </div>
                    </a>
                   
                 </ul>
			</div>
		</aside>
		-->
	</section>


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
</div><!-- id=main  -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>