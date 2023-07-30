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
				<!-- 화면을 처음들어 갔을 경우 건기식 또는 회사이름을 안적었을 경우 -->
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b><span> ${healthissue}</span>에 좋은 제품 검색결과</b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/healthissue.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct1" type="text" name="healthissue" class="ipt-main" autocomplete="off" title="건강고민을 적으세요" value="${foodname}" required minlength="1" placeholder="건강고민을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct1()"></button>
						</div>
					</form>
					</div>
					<div class="ipt-main-wrap"></div><!-- ipt-main-wrap : 끝 -->
					<div class="new-wide-wrap new-wide-wrap-070">
						<div class="left-wing  ">
						    <ul class="sm-menu-wrap">
						    </ul>
						</div>
						<div class="new-wide-main new-wide-main-070 product-result">
							<div id="itemList" class="item-cards">
								<c:forEach items="${listData}" var="item">
									<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
									<c:if test="${not empty item.imgURL}">
										<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
									</c:if>
			          				<c:if test="${empty item.imgURL}">	
										<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
									</c:if>
										<span class="txt1">${item.company}</span>
										<span class="txt2" style="max-width: 260px;">${item.productName}</span>
										<div class="review">
											<span class="star-point">&nbsp;<fmt:formatNumber value="${item.AVG_Score }" pattern=".00"  var="AVG"/>${AVG }</span>
											<span class="txt3">(${item.REVIEW_Count }개)</span>
										</div>
										<div class="card-tags">
											<c:set var="materialList" value="${fn:split(item.material, '$')}" />
											<c:forEach items="${materialList}" var="mater">
												<div class="card-tag">${mater }</div>
											</c:forEach>
										</div>
									</a>
								</c:forEach>
								<c:forEach items="${listData2}" var="item">
									<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
									<c:if test="${not empty item.imgURL}">
										<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
									</c:if>
				         			<c:if test="${empty item.imgURL}">	
										<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
									</c:if>
										<span class="txt1">${item.company}</span>
										<span class="txt2" style="max-width: 260px;">${item.productName}</span>
										<div class="review">
											<span class="star-point">&nbsp;0</span>
											<span class="txt3">(0개)</span>
										</div>
										<div class="card-tags">
										<c:set var="materialList" value="${fn:split(item.material, '$')}" />
											<c:forEach items="${materialList}" var="mater">
												<div class="card-tag">${mater }</div>
											</c:forEach>
										</div>
									</a>
								</c:forEach>
							</div><!-- item-cards의 끝 -->
						</div>
					</div>
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