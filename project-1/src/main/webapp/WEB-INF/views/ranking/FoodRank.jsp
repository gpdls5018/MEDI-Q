<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
    
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/template/SelectFoodListStyleScript.jsp"/>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div class="all-wrap">
	<div class="all-wrap-in all-wrap-in-070">
		<div class="ingredient-search-top">
			<div class="content" style="padding-bottom: 20px;">
			<!-- 건기식 또는 회사이름을 적었을 경우 -->
			<c:if test="${not empty foodname}">
				<div class="top-wrap-070">
					<h1 class="txt2 text-center" style="margin-bottom: 30px; font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<span>💡 ${foodname}</span>에 대한 <br class="u680">제품 검색 결과 <span>${listData.size() + listData2.size()}</span>건</h1>
				</div>
				<div class="ipt-main-wrap">
				<form action="/functionfood/select.do">
					<div class="ipt-main-wrap-in">
						<input id="searchProduct" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
						<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct()"></button>
					</div>
				</form>
				</div><!-- ipt-main-wrap : 끝 -->
				<div class="search-etc">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
							<a tabindex="0" class="search-keyword" data-keyword="홍삼" href="/functionfood/select.do?foodname=홍삼">홍삼</a>
							<a tabindex="0" class="search-keyword" data-keyword="비타민C" href="/functionfood/select.do?foodname=비타민C">비타민C</a>
							<a tabindex="0" class="search-keyword" data-keyword="콜라겐" href="/functionfood/select.do?foodname=콜라겐">콜라겐</a>
							<a tabindex="0" class="search-keyword" data-keyword="오메가3" href="/functionfood/select.do?foodname=오메가3">오메가3</a>
							<a tabindex="0" class="search-keyword" data-keyword="고려은단" href="/functionfood/select.do?foodname=고려은단">고려은단</a>
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
					<c:forEach items="${listData}" var="item">
						<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
						<c:if test="${not empty item.imgURL}">
							<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
						</c:if>
          				<c:if test="${empty item.imgURL}">	
							<img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
						</c:if>
							<span class="txt1">${item.company}</span>
							<span class="txt2">${item.productName}</span>
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
						<img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
					</c:if>
						<span class="txt1">${item.company}</span>
						<span class="txt2">${item.productName}</span>
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
				
			</c:if>
				
				
				
				<!-- 화면을 처음들어 갔을 경우 건기식 또는 회사이름을 안적었을 경우 -->
				<c:if test="${empty foodname}">
				<div class="top-wrap-070">
					<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b>💊 현재 인기있는 <span> 건강기능식품</span></b></h1>
				</div>
				<div class="ipt-main-wrap">
				<form action="/functionfood/select.do">
					<div class="ipt-main-wrap-in">
						<input id="searchProduct" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
						<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct()"></button>
					</div>
				</form>
				</div><!-- ipt-main-wrap : 끝 -->
				<div class="search-etc">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
							<a tabindex="0" class="search-keyword" data-keyword="홍삼" href="/functionfood/select.do?foodname=홍삼">홍삼</a>
							<a tabindex="0" class="search-keyword" data-keyword="비타민C" href="/functionfood/select.do?foodname=비타민C">비타민C</a>
							<a tabindex="0" class="search-keyword" data-keyword="콜라겐" href="/functionfood/select.do?foodname=콜라겐">콜라겐</a>
							<a tabindex="0" class="search-keyword" data-keyword="오메가3" href="/functionfood/select.do?foodname=오메가3">오메가3</a>
							<a tabindex="0" class="search-keyword" data-keyword="고려은단" href="/functionfood/select.do?foodname=고려은단">고려은단</a>
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
					<c:forEach items="${listData}" var="item">
						<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
						<c:if test="${not empty item.imgURL}">
							<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
						</c:if>
          				<c:if test="${empty item.imgURL}">	
							<img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
						</c:if>
							<span class="txt1">${item.company}</span>
							<span class="txt2">${item.productName}</span>
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
				</div><!-- item-cards의 끝 -->
				</c:if>
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