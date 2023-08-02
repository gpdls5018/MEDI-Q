<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!--  유튜브 자스 
<script src="<c:url value="/tsfolder/js/TSmain.js"/>" crossorigin="anonymous"></script>
-->
<!-- 유튜브용 부트스트랩 자스 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- 슬라이더를 위한 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<!-- 슬라이드 반응형 jqery -->
<script src="/tsfolder/js/jquery.sticky-kit.min.js"></script>
<script src="https://kit.fontawesome.com/c724cc2b3e.js" crossorigin="anonymous"></script>
<script src="<c:url value="/images/thumbnail_img/isotope.pkgd.min.js"/>"></script>
<style>
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
		margin-top: 30px;
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
	.custom-footer{
		margin-bottom: 100px;
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
	    font-size: 42px;
	    font-weight: 700;
	    line-height: 1.36;
	    letter-spacing: -0.02em;
	    margin-top: 37px;
	}
	.visual-img-con {
		position:absolute;
		width:100%;
		height:100%;
	    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_pr.jpg") no-repeat;
	    background-color: #fff;
	    z-index: 1;
	    top:70px;
		border:none;
	}
	.tsarea {
		position: absolute;
		width: 1000px;
		height: 250px;
		top:170px;
		left:50px;
		border:none;
		z-index: 2;
		text-align: center;
		box-shadow: 0px 0px 0px white;
		align-items: center;
	}
	.tsnava2:after {
		display: none;
	}
	/* 매거진 CSS */
	/* 매거진 버튼 CSS */
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
	/* 매거진 이미지 CSS */
	.mag_box{
		width:380px;
		box-shadow: 0 2px 4px rgba(255,255,255, 0.1);
		border-radius: 20px;
		float: left;
		box-sizing: border-box;
		padding: 12px;
	}
    .mag_img{
    	border-radius: 20px;
    	padding: 5px;
    	margin: 10px 5px 0 5px;
    	width: 370px;
    	height: 220px;
    }
    /* 매거진 내부 CSS */
    .main{
    	min-height:500px;
	    box-sizing: border-box;
		padding: 20px;
	}
	.sec_body{
		width:1200px;
		position:relative;
		left:350px;
	}
	.sec_body::after{
		content: "";
		display: block;
		clear: both;
	}
	.carousel-inner img {
	    width: 100%;
	    height: 100%;
  	}
</style>
<script>
	window.addEventListener("DOMContentLoaded", function() {
		const grid = new Isotope(".sec_body", { //배치할 요소를 감싸고 있는 부모 요소명
			itemSelector: "#mag_content", //배치할 요소명
			columnWidth: "#mag_content", //넓이값을 구할 요소명
			transitionDuration: "0.5s" //화면 재배치시 요소가 움직이는 속도
		});
		console.log('grid:',grid);
		

		//클릭할 모든 버튼 요소 변수에 저장
		const btns = document.querySelectorAll(".mag_btn");
		console.log('btns.length:',btns.length);
		console.log("btns:",btns);
		console.log("btns.values:",btns.values);
		//버튼의 갯수만큼 반복을 돌면서
		for(let el of btns){
			console.log('반복용 el:',el);
			//각 버튼에 클릭 이벤트 연결
			el.addEventListener("click", e=>{
				console.log('e:',e);
				e.preventDefault();

				//변수 sort에 클릭한 대상의 자식인 a요소의 href 속성값 저장
				const sort = e.currentTarget.querySelector("a").getAttribute("href");
				console.log('sort:',sort);
				//grid에 저장된 결과값을 불러와 재정렬 기능 연결
				grid.arrange({
					//옵션값으로 sort변수값 지정
					filter : sort
				});

				//다시 모든 버튼의 갯수만큼 반복을 돌면서
				for(let el of btns){
					//각 버튼의 클래스명 "on"을 제거해 비활성화
					console.log('제거용 el:',el);
					el.classList.remove("on");
				}
				
				//클릭한 대상만 선택해서 클래스명 "on"을 추가해 활성화
				e.currentTarget.classList.add("on");
			})
		}
	});
</script>
	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span>영양제와 건강에 대한 모든 것,<br/><span style="color:#EF605D;">MEDI-Q</span>에서 확인하세요!</span>
            </h3>
        </div>
    </aside>
	
    <div style="padding-top:100px;">
		<!-- 왼쪽 몸통부분 -->
	     <div class="justify-content-center custom-footer">
	     	<div class="container">
	     		<!-- 
		        <h3 class="display-4 text-center first-text" style="color: #2E8B57;"><strong><span style="color:#EF605D; font-weight:900;">
		        <img src="<c:url value="/images/magazine_images/medi/healthcare.png"/>" class="img-fluid medi-imgs" style="width:110px">
		        건강정보</span> 페이지</strong></h3>
		         -->
		        <!--
		        <div class="row my-1" id="video-channel"></div>
		        <br>
		        -->
		        <!-- 
		        <div>
			        <h2 class="text-center " style="font-weight:bold; color: #00ACE5;">
				        <img src="<c:url value="/images/magazine_images/medi/advice.png"/>" class="img-fluid medi-img" style="width:140px">
				        현직 약사가 쉽게 알려주는 <strong style="color:#FF4500; font-weight:900;">건강정보</strong>
			        </h2>
		        </div>
		         -->
		       <div id="banner" class="carousel slide mt-2 mb-4" data-ride="carousel">
				  <ul class="carousel-indicators">
				    <li data-target="#banner" data-slide-to="0" class="active"></li>
				    <li data-target="#banner" data-slide-to="1"></li>
				    <li data-target="#banner" data-slide-to="2"></li>
				    <li data-target="#banner" data-slide-to="3"></li>
				    <li data-target="#banner" data-slide-to="4"></li>
				  </ul>
				  
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <a href="<c:url value="/magazine.do?no=14"/>">
				      	<img src="<c:url value="/images/magazine_images/banner/Commons_2.jpg"/>" width="1100" height="500">
				      </a>
				    </div>
				    <div class="carousel-item">
				      <a href="<c:url value="/magazine.do?no=15"/>">
				      	<img src="<c:url value="/images/magazine_images/banner/Commons.jpg"/>" width="1100" height="500">
				   	  </a>
				    </div>
				    <div class="carousel-item">
					  <a href="<c:url value="/magazine.do?no=08"/>">
					     <img src="<c:url value="/images/magazine_images/banner/Factcheck.jpg"/>" width="1100" height="500">
					  </a>
				    </div>
				    <div class="carousel-item">
				       <a href="<c:url value="/magazine.do?no=10"/>">
				      	  <img src="<c:url value="/images/magazine_images/banner/HealthLife.jpg"/>" width="1100" height="500">
				   	   </a>
				    </div>
				    <div class="carousel-item">
				    	<a href="<c:url value="/magazine.do?no=17"/>">
				      	   <img src="<c:url value="/images/magazine_images/banner/Recipe.jpg"/>" width="1100" height="500">
				    	</a>
				    </div>
				  </div>
				</div>
			</div>
			<!-- test -->
	        <div class="container">
				<ul class="nav nav-pills">
					<li class="nav-item mag_btn on">
				      <a class="nav-link active" data-toggle="pill" href="*">전체</a>
				    </li>
				    <li class="nav-item mag_btn">
				      <a class="nav-link" data-toggle="pill" href=".commons">영양제 상식</a>
				    </li>
				    <li class="nav-item mag_btn">
				      <a class="nav-link" data-toggle="pill" href=".atoz">영양소 A to Z</a>
				    </li>
				    <li class="nav-item mag_btn">
				        <a class="nav-link" data-toggle="pill" href=".recipe">영양제 레시피</a>
				    </li>
				    <li class="nav-item mag_btn">
				        <a class="nav-link" data-toggle="pill" href=".factcheck">영양제 팩트체크</a>
				    </li>
				    <li class="nav-item mag_btn">
				        <a class="nav-link" data-toggle="pill" href=".healnlife">Health & Life</a>
				    </li>
				</ul>
			</div>

			
			<div class="container">	
		        <h3 class="display-4 text-center first-text" style="color: #2E8B57;"><strong><span style="color:#EF605D; font-weight:900;">
		        <img src="<c:url value="/images/magazine_images/medi/healthcare.png"/>" class="img-fluid medi-imgs" style="width:110px">
		        건강정보</span> 페이지</strong></h3>
			</div>

			<div class="main">
				<div class="sec_body">
					<div class="commons" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=06"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/SkyM_Yoo.jpg"/>">
							</a>
						</div>
					</div>
					<div class="atoz" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=04"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/RedM_Pro.jpg"/>">
							</a>
						</div>
					</div>
					<div class="recipe" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=05"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/YellowM_Mus.jpg"/>">
							</a>
						</div>
					</div>
					<div class="recipe" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=16"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/YellowM_Sleep.jpg"/>">
							</a>
						</div>
					</div>
					<div class="recipe" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=18"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/YellowM_Mois.jpg"/>">
							</a>
						</div>
					</div>
					
					<div class="atoz" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=02"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/RedM_Col.jpg"/>">
							</a>
						</div>
					</div>
					
					<div class="atoz" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=01"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/RedM_Arg.jpg"/>">
							</a>
						</div>
					</div>
					
					<div class="atoz" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=03"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/RedM_Hia.jpg"/>">
							</a>
						</div>
					</div>
					<div class="recipe" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=17"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/YellowM_Depre.jpg"/>">
							</a>
						</div>
					</div>
					<div class="recipe" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=19"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/YellowM_Diet.jpg"/>">
							</a>
						</div>
					</div>
					
					<div class="healnlife" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=10"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/GreenM_Depre.jpg"/>">
							</a>
						</div>
					</div>
					<div class="healnlife" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=13"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/GreenM_Sleep.jpg"/>">
							</a>
						</div>
					</div>
					<div class="commons" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=14"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/SkyM_Yoo_2.jpg"/>">
							</a>
						</div>
					</div>
					<div class="commons" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=15"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/SkyM_Vita.jpg"/>">
							</a>
						</div>
					</div>
					<div class="healnlife" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=11"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/GreenM_Yoo.jpg"/>">
							</a>
						</div>
					</div>
					<div class="healnlife" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=12"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/GreenM_Wat.jpg"/>">
							</a>
						</div>
					</div>
					
					<div class="factcheck" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=07"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/PurpleM_Ten.jpg"/>">
							</a>
						</div>
					</div>
					<div class="factcheck" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=09"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/PurpleM_Heal.jpg"/>">
							</a>
						</div>
					</div>
					<div class="factcheck" id="mag_content">
						<div class="mag_box">
							<a href="<c:url value="/magazine.do?no=08"/>">
								<img class="mag_img" src="<c:url value="/images/thumbnail_img/PurpleM_Hei.jpg"/>">
							</a>
						</div>
					</div>
					
					
				</div>
			</div>
					<!--
			        <div class="magimg d-flex py-3 justify-content-center">
				        <div class="tsmg"><a href="<c:url value="/magazine.do?no=06"/>"><img src="<c:url value="/images/thumbnail_img/SkyM_Yoo.jpg"/>"></a></div>
			            <div class="tsmg"><a href="<c:url value="/magazine.do?no=02"/>"><img src="<c:url value="/images/thumbnail_img/RedM_Col.jpg"/>"></a></div>
			            <div class="tsmg"><a href="<c:url value="/magazine.do?no=03"/>"><img src="<c:url value="/images/thumbnail_img/RedM_Hia.jpg"/>"></a></div>
			        </div>
			        <div class="magimg d-flex justify-content-center mb-5">
			            <div class="tsmg"><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/images/thumbnail_img/RedM_Arg.jpg"/>"></a></div>
			            <div class="tsmg"><a href="<c:url value="/magazine.do?no=05"/>"><img src="<c:url value="/images/thumbnail_img/YellowM_Mus.jpg"/>"></a></div>
		        		<div class="tsmg"><a href="<c:url value="/magazine.do?no=04"/>"><img src="<c:url value="/images/thumbnail_img/RedM_Pro.jpg"/>"></a></div>
		        	</div>
		        	
				</section>
				-->
			</div>
	     </div>
	     
	     <!-- 오른쪽 슬라이드
	     
		<aside class="tsidebar fixedsticky">
			-- 로그인 목록 창 --
			<div class="login-section" style="width: 230px; height: 1045px;">
			<div class="custom-sidebar">
				<img src="<c:url value="/images/mainicon.png"/>" loading="lazy" width="25" height="25">
            	<img src="<c:url value="/images/maintitle.png"/>" loading="lazy" width="95" height="25">
            </div>

            	<p class="custom-sidebarS" style="margin-bottom:20px; color:#191970; font-size:13px; font-weight:500; ">
            		영양제와 건강에 대한 모든 것,<br/>
					<span style="color:#1E90FF">MEDI-Q</span>에서 확인하세요!</p>
                <ul class="sidemgrg mt-3" style=" list-style:none; padding-inline-start: 0px;">
                    <a href="<c:url value="/magazine.do?no=01"/>" >
                        <div class="image d-flex">
                        
                        	<img src="<c:url value="/images/tsimages/rank_crown_gold_48.svg"/>" style=" position: absolute; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                       	
                        	<img src="<c:url value="/images/thumbnail_img/RedM_Arg.jpg"/>" alt="*" style="width:300px; height:150px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#FF4500; font-size:14px; font-weight:bold;">영양소 A to Z</p>
                        	<p style="flex-wrap:wrap; color:#191970; line-height:18px; font-size:13px; font-weight:bold;  text-align: center;"><span class="badge bg-warning">1</span>&nbsp;&nbsp;운동러들의 필수 보충제,<br/> 아르기닌의 부작용</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.77
                        	</p>
                        </div>
                    </a>
                     <a href="<c:url value="/magazine.do?no=05"/>" >
                        <div class="image d-flex sidebar-title">
                        
                             <img src="<c:url value="/images/tsimages/rank_crown_bronze_48.svg"/>" style=" position: absolute; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                         
                        	 <img src="<c:url value="/images/thumbnail_img/YellowM_Mus.jpg"/>" alt="*" style="width:300px; height:150px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#FF4500; font-size:13px; font-weight:bold;">떠먹여 주는 영양제 레시피</p>
                        	<p style="flex-wrap:wrap; color:#191970; line-height:18px; font-size:13px; font-weight:bold;  text-align: center;"><span class="badge bg-warning">2</span>&nbsp;&nbsp;운동 전후 보충제로 멸치 탈출!<br/> 운동 영양제 레시피</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.22
                        	</p>
                        </div>
                    </a>
                    
                    <a href="<c:url value="/magazine.do?no=02"/>" >
                        <div class="image d-flex sidebar-title">
                        
	                        <img src="<c:url value="/images/tsimages/rank_crown_silver_48.svg"/>" style=" position: absolute; left:40px; width:50px; height:40px; z-index:20; " alt="*">
                       	 
                        	<img src="<c:url value="/images/thumbnail_img/RedM_Col.jpg"/>" alt="*" style="width:300px; height:150px;">
                        </div>
                        <div style="align-items: center; margin-top:20px; margin-left:10px; justify-content: center; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:#FF4500; font-size:14px; font-weight:bold;">영양소 A to Z</p>
                        	<p style="flex-wrap:wrap; color:#191970; line-height:18px; font-size:13px; font-weight:bold;  text-align: center;"><span class="badge bg-warning">3</span>&nbsp;&nbsp;진짜 효과 있는 콜라겐을<br/> 고르는법</p>
                        	<p style="color:gray; font-size:13px; font-weight:bold;">
								<img src="<c:url value="/images/tsimages/star_yellow_16.svg"/>" style="width:15px; height:13px;" alt="*">
                        		4.34
                        	</p>
                        </div>
                    </a>
                   
                 </ul>
			</div>
		</aside>
		-->
	</div>

<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
