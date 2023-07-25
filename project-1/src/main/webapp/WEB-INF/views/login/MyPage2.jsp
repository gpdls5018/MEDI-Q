<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
body {
    display: block;
    background-color: white;
    background-size: 100px;
    position: fixed;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}

@media (min-width:700px) {
    .mpmain{
        width: 1500px;
        height: 800px;
        margin: 80px auto;
        padding: 30px 20px 0px 20px;
        position: absolute;
        left: 13%;
        background-color: white;
        border-radius: 10px;
    }
    .page {
    border-radius: 10px;
    width: 1400px;
    height: 770px;
    position: absolute;
    top: 15px;
    left: 10px;
    display: flex;
    }
    /*왼쪽 다이브 스타일*/
    .left-container {
        flex: 0.2;
        flex-direction: column;
        margin: 40px 0px 20px 40px;
        display: flex;
    }
    .profile_box {
        flex: 1;
        background-color: #fc79529f;
        border-radius:10px 0px 0px 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 2px 2px 4px gray;
    }
    .profile_box .img {
        margin: 80px 0px 10px 0px;
        border-radius: 50%;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과를 추가합니다 */
    }
    .profile_box span {
        font-weight: bold;
        color:white;
        font-size: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 적용 */
        padding: 5px 10px;
    }
    .profilemenu li a {
        text-decoration-line: none;
        color: white;
        font-weight: bold;
        font-size: 18px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
    }
    .profilemenu {
        display: flex;
        flex-direction: column;
        list-style: none;
        align-items: end;
        margin: 100px 40px 30px 0px;
    }
    .profilemenu  li {
        margin: 10px 0px;
    }

    .profilemenu a:hover {
        color:black;
    }

    /*오른쪽 다이브 스타일*/
    .right-container {
        flex: 0.76;
        flex-direction: column;
        margin: 40px 0px 20px 0px;
        display: flex;
    }

    .layout_box {
        flex: 1;
        border-radius: 0px 10px 10px 0px;
        background: linear-gradient(to bottom, #FFFFFF, #fceae4);
        box-shadow: 2px 2px 5px gray;
        display: flex;
        flex-direction: column;
    }
    .body_box {
        display: flex;
        flex-direction: row;
        margin: 0px 20px;
    }
    .topbtn {
        margin: 10px 0px 0px 20px;
    }
    .update_box {
        display: flex;
        flex-direction: column;
        width: 420px;
    }
    .update_font {
        font-size: 24px;
        color: #FDCDBC;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    }

    .fontinfo {
        color: #EF605D;
        font-weight: bold;
        font-size: 38px;
        margin: 5px 30px;
        border-bottom: 2px solid #FDCDBC;
        max-width: 100%;
    }
    .fontinfotap a {
        color: #EF605D;
        text-decoration: none;
        font-weight: bold;
        font-size: 20px;
        vertical-align: bottom;
        margin: 10px 0px 10px 40px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
    }
    .fontinfotap a:hover {
        color:black;
    }
    .recently {
        display: flex;
        flex-direction: row;
        min-height: 180px;
    }
    .health {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    .news {
        flex: 0.8;
        display: flex;
        flex-direction: column;
        font-size: 14px;
        height: 618px;
    }
    .news .board {
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
    }
    .board{
    	padding: 10px;
    }
    .secnews {
        margin-left: 20px;
    }
    .secnews .board{
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
        width: 550px;
        height: 570px;
    }
    .miniroom_box {
        flex: 0.8;
    }
    .miniroom_font {
        font-size: 24px;
        color: #FDCDBC;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    }
    .miniroom img {
        margin: 20px 0px 0px 20px;
    }
    /*써클로직*/
    .circle {
        width: 150px;
        margin: 20px 20px;
        display: inline-block;
        position: relative;
        text-align: center;
        line-height: 1.2;
    }
    .circle canvas {
        width: 120px;
        height: 120px;
    }
    .circle strong {
        position: absolute;
        top: 40px;
        left: 0px;
        width: 100%;
        text-align: center;
        line-height: 40px;
        font-size: 30px;
    }
    .circle span {
        display: block;
        color: #aaa;
        margin-top: 12px;
    }
    .lnMHMg {
        margin: 5px 0px;
        height: 560px;
    }
    .kriRoB {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px 10px;
        width: 380px;
        height: 540px;
        overflow: auto ;
    }
    .kriRoBreview {
        width: 500px;
        height: 540px;
    }
    .cqOzav {
        display: flex;
        position: relative;
        flex-direction: column;
        box-shadow: 0 0.2rem 0.5rem rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        margin-top: 5px;
        width: 170px;
        height: 250px;
    }
    .kzDdbX {
        position: relative;
        border-radius: 10px 10px 0 0;
        width: 100%;
        display: flex;
        justify-content: center;
    }
    .kzDdbXreview{
        width: 180px;
        display: block;
        margin-left: 10px;
    }
    .kCBLwp {
        margin: 10px 20px;
        color: gray;
        font-weight: 400;
        word-break: break-all;
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
    }
    .sdp {
        margin: 10px;
        color: white;
        font-weight: bold;
        background-color: #EF605D;
        border-radius: 10px;
        padding: 5px;
    }
    .snp {
        margin: 5px;
        font-weight: 700;
        word-break: break-all;
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        font-size: 20px;
    }
    .srp {
        margin: 0px 5px;
        font-weight: bold;
        font-size: 16px;
    }
    .srp span {
        font-size:14px;
        font-weight: 400;
        word-break: break-all;
        text-overflow: ellipsis;
        overflow: auto;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }
    .kWbUNE {
        margin: 5px 10px;
        color: black;
        font-weight: bold;
        word-break: break-all;
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }
    .detail {
        position: absolute;
        bottom: 5px;
        right: 10px;
        margin-right: 10px;
        color:gray;
        text-decoration: none;
    }
    .review {
        display: flex;
        position: relative;
        flex-direction: row;
        box-shadow: 0 0.2rem 0.5rem rgba(0, 0, 0, 0.5);
        border-radius: .5rem;
        width: 480px;
        height: 180px;
        margin: 10px 10px;
    }
    .reviewinfo {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        text-align: start;
    }
}
</style>
<!-- 메인 바디 부분 -->
<div id="tsmain">
    <div class="mpmain"><!--큰틀 다이브-->
        <div class="bookdot"><!-- 점박이 다이브-->
            <div class="page"><!--몸통 다이브-->
                <div class="left-container"><!--왼쪽 다이브-->
                    <div class="profile_box">
                        <c:if test="${info.prof_Img_Fl eq 'Y' }" var="isProfImg">
							<c:set var="uploadFolder" value="${fn:split(profImg.pi_Path,'\\\\')[fn:length(fn:split(profImg.pi_Path, '\\\\'))-1] }"/>
							<img class="img" alt="사용자 이미지" src="<c:url value="/images/${uploadFolder }/${profImg.pi_Filename }.${profImg.pi_Ext }" />" style="width: 180px; height: 180px">
						</c:if>
						<c:if test="${not isProfImg }">
							<img class="img" alt="기본 프로필" src="<c:url value="/images/basic/friend.png" />" style="width: 180px; height: 180px">
						</c:if>
                        <span>${info.id }</span>

                        <ul class="profilemenu ml-auto">
                        	<li><a href="" id="" class="sidenava1"  data-target="#modalView" data-backdrop="static">나의 건강 정보 등록</a></li>
                        	<li><a class="sidenava2" href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>">건강검진정보 불러오기</a></li>
                            <li><a href="" id="imgEdit" class="sidenava3"  data-target="#modalView" data-backdrop="static">프로필 이미지수정</a></li>
                            <c:if test='${info.social_Fl eq "Y"}' var="isSocial"><!-- 소셜용 -->
								<li><a href='<c:url value="/project/JoinEdit.do"/>' class="sidenava4">회원정보 수정</a></li>
							</c:if>
							<c:if test="${not isSocial }"><!-- 일반 회원용 -->
								<li><a href="" id="infoEdit" class="sidenava4" data-target="#modalView" data-backdrop="static">회원정보 수정</a></li>
							</c:if>
                            <li><a class="sidenava5" href="#">회원탈퇴</a></li>
                        </ul>
                        
                        <div>
                            <img alt="로고" src='<c:url value="/images/mainicon.png"/>' style="width: 30px"/>
                            <img alt="로고2" src='<c:url value="/images/maintitle.png"/>' style="width: 80px"/>
                        </div>
                    </div>
                </div>
                <!--왼쪽 다이브 끝-->
                <div class="right-container"><!--오른쪽다이브-->
                    <div class="layout_box">
                        <div class="fontinfo d-flex justify-content-between">
                        	<div>My page</div>
                            <div class="tab-menu fontinfotap mr-3">
                                <a href="#" class="tab-button">영양제 알리미</a>
                                <a href="<c:url value="/project/MyPage.do"/>" class="tab-button">건강 다이어리</a>
                                <a href='#' class="tab-button" style="color:#fa7a7ab9">약장&리뷰관리</a>
                            </div>
                        </div>
                        <div class="body_box">
                            <div class="update_box">
                                <div class="news">
                                    <div class="update_font">
                                        <img alt="pill" src='<c:url value="/images/basic/pills.png"/>' style="width: 20px"/> ${fn:substring(info.name,1,3) }님의 약장 
                                    </div>
                                    <div class="board recently" style="flex:1;">
                                        <article class="WishListMain__Body-sc-uykdsg-3 lnMHMg">
                                        	<!-- 정보 없으면 emptypills.jpg 이미지 띄우기 -->
                                            <c:if test="${empty food }" var="isEmptyFood">
                                               	<span class="d-block h-50 my-n5"></span>
                                    			<img alt="empty" src="/images/basic/emptypills.jpg" style="width: 100%"/>
                                            </c:if>
                                            <ul class="kriRoB" style="list-style: none; padding-inline-start: 10px;">
                                                <c:if test="${not isEmptyFood }">
                                                	<c:forEach var="f" items="${food }">
		                                                <li class="WishListMain__WishItem-sc-uykdsg-5 cqOzav">
		                                                    <section class="kzDdbX">
		                                                        <a class="pointer" data-gtm-id="link-product-detail" href="#">
		                                                            <section class="divimg">
		                                                                <img fetchpriority="high" width="150" height="150" src="${f.imgurl }" style="margin-top: 10px; border-radius: 10px;">
		                                                            </section>
		                                                        </a>
		                                                        <label for="wishBtn:rk0:" class="bPHVOx">
		                                                            <input id="wishBtn:rk0:" data-gtm-id="global-wish-button" data-event-type="true" type="checkbox" hidden="" checked="">
		                                                        </label>
		                                                    </section>
		                                                    <p class="kWbUNE">${f.foodname }</p>
		                                                    <p class="kCBLwp">${f.company }</p>
		                                                    <div class="clearfix">
		                                                        <a class="detail" href='#' >상세보기</a>
		                                                    </div>
		                                                </li>
	                                                </c:forEach>
    											</c:if>
    											<!-- 
                                                <li class="WishListMain__WishItem-sc-uykdsg-5 cqOzav">
                                                    <section class="   kzDdbX">
                                                        <a class="pointer" data-gtm-id="link-product-detail" href="#">
                                                            <section class="divimg">
                                                                <img fetchpriority="high" width="150" height="150" src="img/testimonial-2.jpg" style="color: transparent; margin-top: 10px; border-radius: 10px;">
                                                            </section>
                                                        </a>
                                                        <label for="wishBtn:rk0:" class="   bPHVOx">
                                                            <input id="wishBtn:rk0:" data-gtm-id="global-wish-button" data-event-type="true" type="checkbox" hidden="" checked="">
                                                        </label>
                                                    </section>
                                                    <p class="kCBLwp">회사명</p>
                                                    <p class="kWbUNE">약이름</p>
                                                    <div class="clearfix">
                                                        <a class="detail" href='#' >상세보기</a>
                                                    </div>
                                                </li>
    
                                                <li class="WishListMain__WishItem-sc-uykdsg-5 cqOzav">
                                                    <section class="kzDdbX">
                                                        <a class="pointer" data-gtm-id="link-product-detail" href="#">
                                                            <section class="divimg">
                                                                <img fetchpriority="high" width="150" height="150" src="img/testimonial-3.jpg" style="color: transparent; margin-top: 10px; border-radius: 10px;">
                                                            </section>
                                                        </a>
                                                        <label for="wishBtn:rk0:" class="bPHVOx">
                                                            <input id="wishBtn:rk0:" data-gtm-id="global-wish-button" data-event-type="true" type="checkbox" hidden="" checked="">
                                                        </label>
                                                    </section>
                                                    <p class="kCBLwp">회사명</p>
                                                    <p class="kWbUNE">약이름</p>
                                                    <div class="clearfix">
                                                        <a class="detail" href='#' >상세보기</a>
                                                    </div>
                                                </li>
                                                 -->
                                            </ul>
                                        </article>
                                    </div>
                                </div>
                            </div>
                            <div class="secnews">
                                <div class="miniroom_font">리뷰관리 페이지</div>
                                <div class="board">
                                    <ul class="kriRoBreview" style="list-style: none;">
                                    	<c:if test="${empty review }" var="isEmptyReview" >
                                    		<span class="d-block h-50 my-n4"></span>
                                    		<img alt="empty" src="/images/basic/empty_review.jpg" style="width: 100%"/>
                                    	</c:if>
                                    	<c:if test="${not isEmptyReview }">
	                                    	<c:forEach var="r" items="${review }">
		                                        <li class="review">
		                                            <section class="kzDdbXreview">
		                                                <section class="divimg" style="width: 180px;">
		                                                    <img fetchpriority="high" width="160" height="160" src="img/testimonial-3.jpg" style="color: transparent; margin-top: 10px; border-radius: 10px;">
		                                                </section>
		                                                <label for="wishBtn:rk0:" class="   bPHVOx">
		                                                    <input id="wishBtn:rk0:" data-gtm-id="global-wish-button" data-event-type="true" type="checkbox" hidden="" checked="">
		                                                </label>
		                                            </section>
		                                            <div class="reviewinfo">
		                                                <p class="sdp">${r.r_regidate }</p>
		                                                <p class="snp">${r.productname }</p>
		                                                <p class="srp">리뷰내용 :<br/><span>${r.content }</span></p>
		                                            </div>
		                                        </li>
	                                        </c:forEach>
                                        </c:if>
                                    </ul>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
