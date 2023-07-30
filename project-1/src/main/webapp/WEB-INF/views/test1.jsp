<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<jsp:include page="/WEB-INF/views/template/SelectFoodListStyleScript.jsp"/>

     <style>
body{
	background-color: white;
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
    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_company.jpg") no-repeat;
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
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span><span style="color:#EF605D;">MEDI-Q</span> 영양제 인기순위</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">실제 섭취하는 유저들의 리뷰와 피드백으로 만든<br/> 가장 믿을만한 영양제 랭킹을 만나보세요</p>
            </h3>
        </div>
    </aside>
    
<!-- ------------------------------------------------------------------------------- -->    
<div class="all-wrap">
	<div class="all-wrap-in all-wrap-in-070">
		<div class="ingredient-search-top">
			<div class="content" style="background-color:#fdfbf6; padding-bottom: 20px;">
			<!-- 건기식 또는 회사이름을 적었을 경우 -->
				<div class="top-wrap-070">
					<h1 class="txt2 text-center" style="margin-bottom: 30px; font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<span>건강 고민</span></h1>
				</div>
				<div class="ipt-main-wrap"></div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
					<span class="s-txt1">인기 검색어</span>
					<form action="/diet.do">
							<input id="searchProduct3" type="text" name="takefood" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${takefood}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
					</form>
					<div class="search-keywords">
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=장 건강">장 건강</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=눈 건강">눈 건강</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=관절">관절/뼈 건강</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=피부">피부 건강</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=혈압">혈압 조절</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=체지방">체지방 감소</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=중성지방">혈중 중성지방 감소</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=콜레스테롤">혈중 콜레스테롤 감소</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=면역기능">면역기능개선</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=간 건강">간 건강</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=칼슘 흡수">칼슘 흡수 촉진</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=피로개선">피로개선</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=기억력">기억력 개선</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=혈행">혈행개선</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=위 건강">위 건강</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=어린이">어린이 성장 발육</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=구강">구강 건강</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=혈당">혈당 조절</a>
						<a tabindex="0" class="search-keyword" href="/functionfood/healthissue.do?healthissue=수면">수면질 개선</a>
					</div>
					<c:forEach items="${foodlist}" var="onefooddiet">
					    <p>Food Name: ${onefooddiet.foodname}</p>
					    <p>One Time Serving Weight: ${onefooddiet.onetime}</p>
					    <p>Calories: ${onefooddiet.calory}</p>
					    <p>Carbohydrate: ${onefooddiet.Carbohydrate}</p>
					    <p>Protein: ${onefooddiet.Protein}</p>
					    <p>Fat: ${onefooddiet.fat}</p>
					    <p>Sugar: ${onefooddiet.sugar}</p>
					    <p>Sodium: ${onefooddiet.Sodium}</p>
					    <p>Cholesterol: ${onefooddiet.Cholesterol}</p>
					    <p>Saturated: ${onefooddiet.saturated}</p>
					    <p>Trans Fat: ${onefooddiet["Trans "]}</p>
					</c:forEach>
					<div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=장 건강">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/장 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">장 건강</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=눈 건강">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/눈 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">눈 건강</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=관절">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/뼈 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">관절/뼈 건강</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=피부">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/피부 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">피부 건강</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=콜레스테롤">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈중 콜레스테롤.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">혈중 콜레스트롤 관리</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=혈압"">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈압.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">혈압 조절</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=체지방">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/체지방.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">체지방 관리</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=중성지방">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/체지방.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">혈중 중성지방 감소</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=면역기능">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/면역 기능.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">면역기능 개선</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=간 건강">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/간 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">간 건강</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=칼슘 흡수">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/칼슘.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">칼슘 흡수 촉진</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=피로개선">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/피로 개선.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">피로 개선</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=기억력">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/기억력.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">기억력 개선</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=혈행">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈액 순환.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">혈행 개선</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=위 건강">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/위 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">위 건강</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=어린이">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/어린이 성장.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">어린이 성장 촉진</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=구강">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/구강 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">구강 건강</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=혈당">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈액 순환.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">혈당 조절</h5>
				            </div>
			            </a>
			          </div>
			          <div class="card" style="width: 8rem;height:10rem;">
			          	<a href="/functionfood/healthissue.do?healthissue=수면">
				            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/수면질 개선.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
				            <div class="card-body m-auto">
				              <h5 class="card-title">수면질 개선</h5>
				            </div>
			            </a>
			          </div>
			        </div>
				</div>
			</div>
		</div>
		<div class="new-wide-wrap new-wide-wrap-070">
			<div class="left-wing  ">
			    <ul class="sm-menu-wrap">
			        
			    </ul>
			</div>
			<div class="new-wide-main new-wide-main-070 product-result">
				<div id="itemList" class="item-cards">
					
				</div><!-- item-cards의 끝 -->
				
				
				
				<!--<button id="moreBtn" tabindex="0" class="item-more" onclick="searchMore()">30개 더 보기</button>  -->
			</div>
		</div>
	</div>
	<a id="goto_top" href="#" title="맨 위로"></a><!-- 위로가기 -->
</div><!-- all-wrap의 끝 -->
<script>
        if ($(this).scrollTop() > 20) {
            $('#goto_top').fadeIn();
            $('.f-footer-row1').addClass('active');
            $('.h-header').addClass('scroll');
            $('.all-wrap-in').addClass('scroll');
        } else {
            $('#goto_top').fadeOut();
            $('.h-header').removeClass('scroll');
            $('.all-wrap-in').removeClass('scroll');
        }

        /*화면 스크롤에 따른 조건부 노출 : 최하단 고정 행, 위로가기 버튼 */
        $(window).scroll(function() {
            if ($(this).scrollTop() > 20) {
                $('#goto_top').fadeIn();
                $('.f-footer-row1').addClass('active');
                $('.h-header').addClass('scroll');
                $('.all-wrap-in').addClass('scroll');
            } else {
                $('#goto_top').fadeOut();
                $('.h-header').removeClass('scroll');
                $('.all-wrap-in').removeClass('scroll');
            }

            /*우측 플로팅 영역관련*/
            var height1 = $(window).scrollTop();
            /*var rfixed = $('.r-fixed-area');
            var section1 = rfixed.offset().top;*/

            if(height1 > 200){
                $('.height1.active').addClass('fixed');
            }else{
                $('.height1.active').removeClass('fixed');
            }

            if(height1 > 6){
                $('.height2.active').addClass('fixed');
            }else{
                $('.height2.active').removeClass('fixed');
            }
        });

        $('#goto_top').click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
</script>
</body>
</html>