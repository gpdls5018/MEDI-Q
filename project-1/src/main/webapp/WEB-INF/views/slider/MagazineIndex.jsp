<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!--  유튜브 자스 -->
<script src="/resources/tsfolder/js/TSmain.js"></script>
<!-- 유튜브용 부트스트랩 자스 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- 슬라이더를 위한 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />


<style>
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
	.tsidebar {
		padding: 16px 1.5em;
		margin-bottom:10px;
	}

	.tscontainer {
		max-width: 100%;
		margin: 0 auto;
		position: relative;
	}
	.maints > div{
		background-color:white;
		border: 2px solid #eaeaea;
		border-radius:15px;
    }
    aside > div {
	  border: 2px solid #ccc;
	  border-radius: 10px;
	  padding: 20px;
	  background-color: white;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  margin-bottom: 20px;
    }
	
</style>
<body>
<div id="tsmain" style="margin-top: 10px;">

		<div class="m-5 py-5" style="display:flex; justify-content: center;">
	        <div class="slider1 ">
	            <div class="slide"><a href="#"><img style="width:100%; height:450px" src="<c:url value="/resources/images/tsimages/ba1.jpg"/>"></a></div>
	            <div class="slide"><a href="#"><img style="width:100%; height:450px" src="<c:url value="/resources/images/tsimages/magazine2.webp"/>"></a></div>
	        </div>
	    </div>
	 

    
    <section class="tscontainer mt-5" style="width:90%;  border-radius: 5px;">
		<!-- 왼쪽 몸통부분 -->
	     <article class="maints justify-content-center">
	     	<div class="container mt-5 pt-5">
		        <h3 class="display-4 text-center"><strong style="color:#EF605D; font-weight:900;">건강정보</strong> 페이지</h3>
		        <div class="row my-5" id="video-channel"></div>
		        <br>
		        <hr>
		        <br>
		        <h1 class="display-4 text-center">youtube video</h1>
		        <div class="row my-5" id="video-container"></div>
		    </div>
		    
	        <div class="list">
		        <div class="tsmg"><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>" style="width:50px;height:50px"></a></div>
	            <div class="tsmg"><a href="<c:url value="/magazine.do?no=02"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>" style="width:50px;height:50px"></a></div>
	            <div class="tsmg"><a href="<c:url value="/magazine.do?no=03"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Hia.jpg"/>"  style="width:50px;height:50px"></a></div>
	            <div class="tsmg"><a href="<c:url value="/magazine.do?no=04"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Pro.jpg"/>"  style="width:50px;height:50px"></a></div>
	            <div class="tsmg"><a href="<c:url value="/magazine.do?no=05"/>"><img src="<c:url value="/resources/images/thumbnail_img/YellowM_Mus.jpg"/>"  style="width:50px;height:50px"></a></div>
	        </div>
		    
	     </article>
	     
	     <!-- 오른쪽 슬라이드 -->
		<aside class="tsidebar fixedsticky">
			<!--  로그인 목록 창 -->
			<div class="login-section justify-content-center">
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
                           <!-- <img src="<c:url value="/resources/images/tsimages/destination-1.jpg"/>" alt="*"> -->
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
                          <!--  <img src="<c:url value="/resources/images/tsimages/destination-2.jpg"/>" alt="*"> -->
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
                            <!-- <img src="<c:url value="/resources/images/tsimages/destination-3.jpg"/>" alt="*"> -->
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
                 </ul>
			</div>
		</aside>
	</section>

</div>

<script>
$(document).ready(function(){
    $('.slider1').bxSlider({
        slideWidth: 1100,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 1,
        auto : true,
        stopAutoOnClick : true,
        pager : true,
    });
});

</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>