<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.min.js"></script>
<script src="https://unpkg.com/three"></script>
<script src="https://unpkg.com/three-spritetext"></script>
<script src="https://unpkg.com/3d-force-graph"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<c:set value="${totalReviewDto.starScore.COUNT_1 + totalReviewDto.starScore.COUNT_2 + totalReviewDto.starScore.COUNT_3 + totalReviewDto.starScore.COUNT_4 + totalReviewDto.starScore.COUNT_5}" var="totalStarCount"/>
<c:set value="${totalReviewDto.effectList[0].COUNT + totalReviewDto.effectList[1].COUNT + totalReviewDto.effectList[2].COUNT + totalReviewDto.effectList[3].COUNT}" var="totalEffectCount"/>
<c:set value="${totalReviewDto.noEffectList[0].COUNT + totalReviewDto.noEffectList[1].COUNT + totalReviewDto.noEffectList[2].COUNT + totalReviewDto.noEffectList[3].COUNT}" var="totalNoEffectCount"/>
<style>
    table.type09 {
        border-collapse: collapse;
        text-align: left;
        line-height: 1.5;
        width:100%;
		
    }
    table.type09 thead th {
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        color: #369;
        border-bottom: 3px solid #036;
    }
    table.type09 tbody th {
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
        background: #f3f6f7;
    }
    table.type09 td {
        width: 600px;
        padding: 15px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }

    .content-link {
    	width: 40%;
    	background-color : #9fcaff;
    	border-radius : 5%;
    }
    
    
    
    
    .bi-star-fill{
        font-size: 30px;
        line-height: 30px;
        color: #dfc230;
        
    }
    .bi-star {
      font-size: 30px;
      line-height: 30px;
    }

    .progress {
      width: 15px;
      height: 150px;
      background-color: rgb(233, 133, 52);
    }
    .progress-bar {
      width: 15px;
      height: 20%;
      background-color: #c0c0c0;
    }
    
    
    
    .effect-custom-font {
     font-family : Noto Sans KR, sans-serif;
     text-align: center;
    }
    
    .review-panel {
      width:100%;
      
      border-bottom: 3px solid #ccc;
      border-top: 3px solid #ccc;
    }
    .v-line {
      border-right : 2px solid #cfcfcf;
    }

    .skeleton-card {
      height: 150px;
      width: 100%;
      margin: 8px;
      border-radius: 3px;
      transition: all 200ms ease-in-out;
      position: relative;
      background-color: #eaeaea;
    }

.bubble
{
position: relative;
width: 800px;
height: 120px;
padding: 7px;
background: #FFFFFF;
-webkit-border-radius: 80px;
-moz-border-radius: 80px;
border-radius: 80px;
border: #E17613 solid 5px;
margin-top :20px;
}

.bubble:after
{
content: '';
position: absolute;
border-style: solid;
border-width: 16px 12px 0;
border-color: #FFFFFF transparent;
display: block;
width: 0;
z-index: 1;
bottom: -16px;
left: 150px;
}

.bubble:before
{
content: '';
position: absolute;
border-style: solid;
border-width: 20px 16px 0;
border-color: #E3AB7F transparent;
display: block;
width: 0;
z-index: 0;
bottom: -25px;
left: 146px;
}
.back-img{
	width: 1300px;
	height: 230px;
	display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    font-size:44px;
}
.background-top{
	margin-top: 150px;
	margin-left: 300px;
}
.review-custom{
	width: 150px;
    background: #87CEEB;
    padding: 10px;
    border-radius: 5px;
    color: #FFFFFF;
    text-align: center;
    font-size: 17px;
}
.write-review{
	margin-top: 50px;
	display: flex;
  	justify-content: flex-end;
}
.review-custom:hover {
	background-color: #006AFF;
	color: #fff;
}
.img-custom{
	display: flex;
    align-items: center;
    justify-content: center;
}
body{
	background-color: #fdfbf6;
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
                <span><span style="color:#EF605D;">MEDI-Q</span> 영양제</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">실제 섭취하는 유저들의 리뷰와 피드백으로 만든<br/> 가장 믿을만한 영양제</p>
            </h3>
        </div>
    </aside>
    

<div class="background-top">
	<p class="display-4 back-img" style="border-radius:10px; background-image: url('<c:url value="/images/nutrient_img/bg_bl.png"/>');">${listOne.productName}</p>
</div>
<div class="container">
<div class="empty-space" style="height:32px;"></div>
<div style="display: flex; align-items: center;" class="img-custom">    
    <h1 class="display-4" style="width:450px;">
    <c:if test="${empty listOne.imgURL}" var="emptyIMG">
    	<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" width="400px;" height="300px;" style="border-radius:20px;"/>
    </c:if>
    <c:if test="${not emptyIMG}">
    	<img src="${listOne.imgURL}" width="400px;" height="300px;" style="border-radius:20px;"/>
   	</c:if>
   	</h1>
   	<div style="display: flex; flex-direction: column; margin-left: 20px;">
   		<c:if test="${heartcount eq '0' }">
	   		<button data-initialtext="🤍 미복용중" id="heartButton" data-foodname="${listOne.productName}" style="margin-bottom:20px; background-color: darkorange; color: white; border: none; padding: 10px 20px; border-radius: 5px; font-size: 16px;">
			   🤍 찜하기
			</button>
		</c:if>
		<c:if test="${heartcount eq '1' }">
	   		<button data-initialtext="❤ 복용중" id="heartButton" data-foodname="${listOne.productName}" style="margin-bottom:20px; background-color: darkorange; color: white; border: none; padding: 10px 20px; border-radius: 5px; font-size: 16px;">
			   🧡 찜하기 취소
			</button>
		</c:if>
        <button onclick="window.open('https://search.shopping.naver.com/search/all?query=${listOne.productName}')" style="background-color: darkorange; color: white; border: none; padding: 10px 20px; border-radius: 5px; font-size: 16px;">
        <img src="<c:url value="/images/magazine_images/basic/basket.png"/>" class="img-fluid mr-1 mb-1" style="width:20px">
        구매하러 가기</button>
        <button onclick="window.location.href = '/ranking/selectfood.do'" style="background-color: darkorange; color: white; border: none; padding: 10px 20px; border-radius: 5px; font-size: 16px; margin-top: 20px;">
        <img src="<c:url value="/images/magazine_images/basic/search_2.png"/>" class="img-fluid mr-1 mb-1" style="width:20px">
        다른 제품 검색하러 가기</button>
    </div>
</div>    
	<!-- 탭 -->
	<div class="tab-content mt-5 mb-5">
	  	<div class="effect-custom-font mt-5" style="font-size:40px;">제품의 상세정보 내용이에요! </div>
	  	<div class="" id="detailTable"><!-- 탭 1 시작 -->
           	<table class="type09 mt-3">
                <thead>
	                <tr>
	                    <th scope="cols">타이틀</th>
	                    <th scope="cols">내용</th>
	                </tr>
                </thead>
                <tbody>
                	<c:if test="${not empty listOne.postNo }">
	                <tr>
	                    <th scope="row">등록번호</th>
	                    <td>${listOne.postNo}</td>
	                </tr>
	                </c:if>
	                <c:if test="${not empty listOne.company }">
	                <tr>
	                    <th scope="row">회사명</th>
	                    <td>${listOne.company}</td>
	                </tr>
	                </c:if>
	                <c:if test="${not empty listOne.expiration }">
	                <tr>
	                    <th scope="row">유통기한</th>
	                    <td>${listOne.expiration}</td>
	                </tr>
	                </c:if>
	                <c:if test="${not empty listOne.shape }">
	                <tr>
	                    <th scope="row">형태</th>
	                    <td>
	                        <c:choose>
	                            <c:when test="${listOne.shape eq '정'}">
	                                <img src="<c:url value="/images/shape/정제.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">정</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '과립'}">
	                                <img src="<c:url value="/images/shape/과립.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">과립</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '바'}">
	                                <img src="<c:url value="/images/shape/바.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">바</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '분말'}">
	                                <img src="<c:url value="/images/shape/분말.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">분말</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '시럽'}">
	                                <img src="<c:url value="/images/shape/시럽.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">시럽</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '캡슐'}">
	                                <img src="<c:url value="/images/shape/캡슐.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">캡슐</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '환'}">
	                                <img src="<c:url value="/images/shape/환.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">환</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '젤리'}">
	                                <img src="<c:url value="/images/shape/젤리.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">젤리</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '액상'}">
	                                <img src="<c:url value="/images/shape/액상.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">액상</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '겔'}">
	                                <img src="<c:url value="/images/shape/겔.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">겔</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '페이스트상'}">
	                                <img src="<c:url value="/images/shape/페이스트.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 20px;">페이스트</span>
	                            </c:when>
	                            <c:when test="${listOne.shape eq '편상' or listOne.shape eq '기타'}">
	                                <img src="<c:url value="/images/shape/기타.png"/>" style="width:100px;height:100px;"/><br>
	                                <span style="font-weight: bold; padding-left: 35px;">기타</span>
	                            </c:when>
	                        </c:choose>
	                    </td>
	                </tr>
	                </c:if>
	                <c:if test="${not empty listOne.intake }">
	                <tr>
	                    <th scope="row">복용방법</th>
	                    <td>${fn:replace(listOne.intake,'$',',')}</td>
	                </tr>
	                </c:if>
	                
	                
	                <c:if test="${not empty listOne.standard }">
	                <tr>
	                    <th scope="row">규격</th>
	                    <td>
	                    <c:forEach items="${Sgroups}" var="group">
	                    ${fn:replace(group,'$',',')}<br/>
	                    </c:forEach>
	                    <c:if test="${empty Sgroups }">
	                    	${fn:replace(listOne.standard,'$',',')}
	                    </c:if>
	                    </td>
	                </tr>
	                </c:if>
	                
	                <c:if test="${not empty listOne.caution }">
	                <tr>
	                    <th scope="row">주의사항</th>
	                    <td>
	                    <c:if test="${not empty Cgroups }">
		                    <c:forEach items="${Cgroups}" var="group">
		                    	${fn:replace(group,'$',',')}<br/>
		                    </c:forEach>
	                    </c:if>
	                    <c:if test="${empty Cgroups }">
	                    	${fn:replace(listOne.caution,'$',',')}
	                    </c:if>
	                    </td>
	                </tr>
	                </c:if>
	                <c:if test="${not empty listOne.nutrient }">
	                <tr>
	                    <th scope="row">성분</th>
	                    <c:set var="nutrientList" value="${fn:split(listOne.nutrient, '$')}" />
	                    <td>
	                        <c:forEach items="${nutrientList}" var="item">
	                    	<c:set var="item" value="${fn:replace(item, ' ', '')}" />
		                        <a href="/NutrientDetail.do?name=${item}" style="text-decoration:none;">
		                            <span class="badge badge-warning" style="font-size: 15px;">${item}</span>&nbsp;&nbsp;
		                        </a>
	                        </c:forEach>
	                    </td>
	                </tr>
	                </c:if>
	                <c:if test="${not empty listOne.material }">
	                <tr>
	                    <th scope="row">기능성 정보</th>
	                    <c:set var="materialList" value="${fn:split(listOne.material, '$')}" />
	                    <td>
	                        <c:forEach items="${materialList}" var="item">
	                            <span class="badge badge-danger" style="font-size: 15px;">${item}</span><br/>
	                        </c:forEach>
	                    </td>
	                </tr>
	                </c:if>
                </tbody>
            </table>
       	</div><!-- 탭 1 끝 -->
	 	<div class="empty-space" style="height:50px;"></div>
	  	<div class="effect-custom-font mt-5" style="font-size:40px;">구매전 사용자들의 솔직 리뷰를 꼭 확인해 보세요! </div>
	  	<div class="bubble p-4 effect-custom-font" style="font-size:17px;">
		  	아래는 구매자들의 리뷰를 분석한 키워드 입니다.^^
		  	<br>가운데 <span style="background-color:#ffdcdc;color:#ff4b4b">제품명</span>을 바탕으로
		  	<span style="background-color:#f0ffd1;color:#86B817">부정 키워드</span>, <span style="background-color:#cfebff;color:blue">긍정 키워드</span>를 확인해보세요!
	  	 </div>
	    <div class="review-scroll" id="review"><!-- 탭 2 시작 -->
   			<div class="jumbotron mt-1 row pt-3" style="background-color:#f5f5f5">
   				<div class="col-7" style="background-color:white;border-radius:15px;">
   					<div id="3d-graph" style="width:300px;height:300px;"></div>
   				</div>
   				    <script>
				      let Graph = ForceGraph3D()
				        (document.getElementById('3d-graph'))
				          .jsonUrl('http://192.168.0.16/review/${listOne.no}')
				          .nodeAutoColorBy('group')
				          .width("600")
				          .height("380")
				          .linkWidth(0.2)
				          .linkAutoColorBy("value")
				          .backgroundColor("white")
				          .nodeThreeObject(node => {
				            const sprite = new SpriteText(node.id);
				            sprite.material.depthWrite = false; // make sprite background transparent
				            if(node.group==3) {
				              sprite.color = "#2803ff";
				              if(node.val <=5) {
				                sprite.textHeight = node.val;
				              }
				              else if(node.val <= 10 && node.val > 5) {
				                sprite.textHeight = node.val/3;
				              }
				              else if(node.val > 15) {
				                sprite.textHeight = node.val/5;
				              }
				              
				            }
				            else if(node.group==1) {
				              sprite.color = "#ff3d3d";
				              if(node.val <=5) {
				                sprite.textHeight = node.val+5;
				              }
				              else if(node.val <= 10 && node.val > 5) {
				                sprite.textHeight = node.val/2;
				              }
				              else if(node.val > 15) {
				                sprite.textHeight = node.val/3;
				              }
				            }
				            else {
				              sprite.color = "#335504";
				              sprite.textHeight = 10;
				            }
				            return sprite;
				          });
				  
				      // Spread nodes a little wider
				      Graph.d3Force('charge').strength(-80);
				    </script>
	   			<div class="review-board col-5">
	   				<div class="ml-5 effect-custom-font" style="font-size:35px;">별점을 확인해보세요!</div>
		      		<div class="star-board ml-5">
		        		<div class="star-rating mt-2 ml-5">
		          			<i class="bi bi-star rating"></i>
		          			<i class="bi bi-star rating"></i>
		          			<i class="bi bi-star rating"></i>
		          			<i class="bi bi-star rating"></i>
		          			<i class="bi bi-star rating"></i>
		        		</div>
		        		<div class="print-score mt-3 ml-5 pl-5">
		          			<span style="font-family: 'Noto Sans KR', sans-serif;font-size:40px;">${totalReviewDto.starScoreTotal}점</span>
		        		</div>
		      		</div>
		      		<div class="progress-board ml-5">
		        		<div class="bar-rating mt-5 d-flex ml-4">
	            			<div class="mr-4">
	              				<div class="progress rounded-pill">
	              				<fmt:formatNumber var="totalStarCount" value="${totalStarCount}" />
	              				<fmt:formatNumber var="COUNT_5" value="${totalReviewDto.starScore.COUNT_5}" />
	              				<fmt:formatNumber value="${1-(COUNT_5 div totalStarCount)}" type="percent" var="count_5"/>
	                				<div class="progress-bar" style="height: ${count_5};"></div>
	              				</div>
	              				<span style="font-family: 'Noto Sans KR', sans-serif;">5점</span>
	            			</div>
	            			<div class="mr-4">
	              				<div class="progress rounded-pill">
	              				<fmt:formatNumber var="COUNT_4" value="${totalReviewDto.starScore.COUNT_4}" />
	              				<fmt:formatNumber value="${1-(COUNT_4 div totalStarCount)}" type="percent" var="count_4"/>
	                				<div class="progress-bar" style="height:${count_4};">
	                				</div>
	              				</div>
	              				<span style="font-family: 'Noto Sans KR', sans-serif;">4점</span>
	            			</div>
	            			<div class="mr-4">
	              				<div class="progress rounded-pill">
	              				<fmt:formatNumber var="COUNT_3" value="${totalReviewDto.starScore.COUNT_3}" />
	              				<fmt:formatNumber value="${1-(COUNT_3 div totalStarCount)}" type="percent" var="count_3"/>
	                				<div class="progress-bar" style="height:${count_3};"></div>
	             					</div>
	              				<span style="font-family: 'Noto Sans KR', sans-serif;">3점</span>
	            			</div>
	            			<div class="mr-4">
	              				<div class="progress rounded-pill">
	              				<fmt:formatNumber var="COUNT_2" value="${totalReviewDto.starScore.COUNT_2}" />
	              				<fmt:formatNumber value="${1-(COUNT_2 div totalStarCount)}" type="percent" var="count_2"/>
	                				<div class="progress-bar" style="height: ${count_2};"></div>
	              				</div>
	              				<span style="font-family: 'Noto Sans KR', sans-serif;">2점</span>
	            			</div>
	            			<div class="mr-4">
	              				<div class="progress rounded-pill">
	              				<fmt:formatNumber var="COUNT_1" value="${totalReviewDto.starScore.COUNT_1}" />
	              				<fmt:formatNumber value="${1-(COUNT_1 div totalStarCount)}" type="percent" var="count_1"/>
	                				<div class="progress-bar" style="height: ${count_1};"></div>
	              				</div>
	              				<span class="effect-custom-font">1점</span>
	            			</div>
		          			
		        		</div><!-- <div class="bar-rating mt-5"> -->
	      			</div><!-- <div class="progress-board"> -->
      			</div>
   			</div><!-- <div class="row"> -->
   			<div class="effect-board effect-custom-font mt-3 row ">
   				<div class="col-6">
		   			<div class="effect-board-title">
		   				<span style="font-size:30px;">&#x1F601;효과</span>
		   			</div>
		   			<br>
		   			<ul class="list-unstyled p-2">
		   			<c:forEach items="${totalReviewDto.effectList}" var="effectOne">
	   					<li class="m-2" style="line-height: 25px;width:80%;">
	   						<div class="d-flex justify-content-between" style="width:100%;">
		   						<div class="p-1" style="color:#25a6fe;background-color:#d1ecff;border-radius: 15px;font-size:15px;">${effectOne.VALUE}</div>
		   						<div style="border-bottom:dashed 3px #ccc;width:50%;font-size:1px;"></div>
		   						<fmt:formatNumber var="totalEffectCount" value="${totalEffectCount}" />
		   						<fmt:formatNumber var="effectCOUNT" value="${effectOne.COUNT}" />
              					<fmt:formatNumber value="${effectCOUNT div totalEffectCount}" type="percent" var="effectpercent"/>
		   						<div class="p-1" style="color:#25a6fe;border-radius: 15px;font-size=25px;">${effectpercent}</div>
	   						</div>
	 					</li>
	 				</c:forEach>
	   				</ul>
				</div><!-- 효과 부분 끝-->
				<div class="col-6"><!-- 부작용 부분 시작 -->
		   			<div class="noeffect-board-title">
		   				<span style="font-size:30px;">&#128552;부작용</span>
		   			</div>
		   			<br>
		   			<ul class="list-unstyled p-2">
		   			<c:forEach items="${totalReviewDto.noEffectList}" var="noEffectOne">
	   					<li class="m-2" style="line-height: 25px;width:80%;">
	   						<div class="d-flex justify-content-between" style="width:100%;">
		   						<div class="p-1" style="color:#ff4b4b;background-color:#ffdcdc;border-radius: 15px;font-size:15px;">${noEffectOne.VALUE}</div>
		   						<div style="border-bottom:dashed 3px #ccc;width:50%;font-size:1px;"></div>
		   						<fmt:formatNumber var="totalNoEffectCount" value="${totalNoEffectCount}" />
		   						<fmt:formatNumber var="noEffectCount" value="${noEffectOne.COUNT}" />
              					<fmt:formatNumber value="${noEffectCount div totalNoEffectCount}" type="percent" var="noEffectpercent"/>
		   						<div class="p-1" style="color:#ff4b4b;border-radius: 15px;font-size=25px;">${noEffectpercent}</div>
	   						</div>
	 					</li>
	 				</c:forEach>
	   				</ul>
				</div><!-- 부작용 부분 끝-->
   			</div><!-- effected Board 끝 -->
   			<div class="write-review"><a class="link review-custom" href="<c:url value="/Review.do?no=${listOne.no}"/>" style="text-decoration : none;">리뷰 글쓰기</a></div>
   			<!-- 리뷰 페이지 삽입 위치 -->
   			<div class="container effect-custom-font" >
			    <ul class="list-unstyled mt-5" id="review-ul">
			      	<li class="review-li" style="display: none;">
			        	<div class="review-panel p-3">
			          		<div class="review-title d-flex">
			              		<div class="review-name">김**</div>
					              	<div class="review-title-sub d-flex ml-2" style="font-size: 12px;color: #7c7b7b;">
					                	<div class="review-ages p-1">30대</div><span class="v-line"></span>
					                	<div class="review-gender p-1">여성</div><span class="v-line"></span>
					                	<div class="review-period p-1"></div>
				            		</div>
			              		<div class="post-date ml-auto" style="font-size: 15px;color: #a0a0a0;">2023-03-02</div>
			            	</div>
			            	<div class="star-count d-flex m-2">
			              		<i class="bi bi-star rating" style="font-size:20px;"></i>
			              		<i class="bi bi-star rating" style="font-size:20px;"></i>
			              		<i class="bi bi-star rating" style="font-size:20px;"></i>
			              		<i class="bi bi-star rating" style="font-size:20px;"></i>
			              		<i class="bi bi-star rating" style="font-size:20px;"></i>
			            	</div>
			            	<div class="review-effect mt-4">
			              		<h6>효과</h6>
			              		<div class="review-content-effect m-2" >
			              		</div>
			              		<h6>부작용</h6>
			              		<div class="review-content-noEffect m-2">
			              		</div>
			            	</div>
			            	<div class="review-content m-2 row">
				              	<p class="mt-3" style="font-size:15px;">
				              	</p>
			          		</div>
			        	</div>
			      	</li>
			    </ul>
			    <div id="loader">
			      	<div class="skeleton-card p-3" style="text-align:center">
				      	<div class="spinner-border text-secondary" role="status">
						</div>
						<span class="visually-hidden">Loading...</span>
			      	</div>
			    </div>
		    	<div class="card-actions">
			      	<span>Showing 
			        	<span id="card-count"></span> of 
			        	<span id="card-total"></span> cards      
			      	</span>
			    </div>
	  		</div><!-- 리뷰 페이지 끝 -->
  		</div><!-- 탭 2 끝 -->
   	</div><!-- 탭 끝 -->
</div>

<input type="hidden" value="${listOne.no}" id="productNo">
<script>



//리뷰 정보 출력(총 별점 평균 등, 효과들)
  var totalStarScore = document.querySelectorAll("div.star-rating.mt-2 > i");
  for(var i=0; i<${totalReviewDto.starScoreTotal}; i++) {
	  totalStarScore[i].className = totalStarScore[i].className.replace("bi-star","bi-star-fill");
  }
  
  
  
  
  
//무한 스크롤 
  const cardContainer = document.getElementById("review-ul");
  const cardCountElem = document.getElementById("card-count");
  const cardTotalElem = document.getElementById("card-total");
  const loader = document.getElementById("loader");

  const cardLimit = 99;
  const cardIncrease = 3;
  const pageCount = Math.ceil(cardLimit / cardIncrease);
  let currentPage = 1;

  cardTotalElem.innerHTML = cardLimit;

  var throttleTimer;
  const throttle = (callback, time) => {
    if (throttleTimer) return;

    throttleTimer = true;

    setTimeout(() => {
      callback();
      throttleTimer = false;
    }, time);
  };



  const createCard = (index) => {
    
    $.ajax({
      url : "<c:url value='/SelectReview.do'/>?no="+$('#productNo').val()+"&current="+index,
      dataType : "json",
    })
    .done(function(reviewData) {
      var card = document.querySelector(".review-li").cloneNode(true);
      if(reviewData.length == 0) {
        removeInfiniteScroll();
        return;
      }
      console.log(reviewData);
      card.querySelector(".review-name").innerHTML = reviewData[0]['r_id'] === null ? 'Unknown' : reviewData[0]['r_id'];
      card.querySelector(".review-period").innerHTML = reviewData[0]['takeTime'];
      var starScore = parseInt(reviewData[0]['starScore']);

      for(var i=0;i<starScore;i++) {
        card.querySelectorAll(".star-count > i")[i].className = card.querySelectorAll(".star-count > i")[i].className.replace("bi-star","bi-star-fill");
      }

      var effect = reviewData[0]['effect'];
      var effectValues = effect.match(/\[(.*?)\]/)[1];
      var effectValues = effectValues.split(", ");
      for(var effectValue of effectValues) {
        card.querySelector(".review-content-effect").innerHTML += '<span class="p-1 mr-2" style="color:#25a6fe;background-color:#d1ecff;border-radius: 15px;font-size:10px;">'+effectValue+'</span>';
      }

      var noEffect = reviewData[0]['noEffect'];
      var noEffectValues = noEffect.match(/\[(.*?)\]/)[1];
      var noEffectValues = noEffectValues.split(", ");
      for(var noEffectValue of noEffectValues) {
        card.querySelector(".review-content-noEffect").innerHTML += '<span class="p-1 mr-2" style="color:#ff4b4b;background-color:#ffdcdc;border-radius: 15px;font-size:10px;">'+noEffectValue+'</span>';
      }
      
      reviewData[0]['noEffect'];
      card.querySelector(".review-content p").innerHTML = reviewData[0]['content'];
      //값 세팅

      card.style.display = '';
      cardContainer.appendChild(card);
    })
    .fail(function() {
      console.log('로드 실패');
    });
    
  };

  const addCards = (pageIndex) => {
    currentPage = pageIndex;

    const startRange = (pageIndex - 1) * cardIncrease;
    const endRange = currentPage == pageCount ? cardLimit : pageIndex * cardIncrease;

    cardCountElem.innerHTML = endRange;

    for (let i = startRange + 1; i <= endRange; i++) {
      createCard(i);
    }
  };

  const handleInfiniteScroll = () => {
    throttle(() => {
      const endOfPage =
        window.innerHeight + window.pageYOffset >= document.body.offsetHeight;

      if (endOfPage) {
        addCards(currentPage + 1);
      }

      if (currentPage === pageCount) {
        removeInfiniteScroll();
      }
    }, 2000);
  };

  const removeInfiniteScroll = () => {
    loader.remove();
    window.removeEventListener("scroll", handleInfiniteScroll);
  };

  window.onload = function () {
    addCards(currentPage);
  };

  window.addEventListener("scroll", handleInfiniteScroll);

	//좋아요 버튼 초기 텍스트 설정
	var heartButton = document.getElementById('heartButton');
	var initialText = heartButton.getAttribute('data-initialtext');
	heartButton.innerText = initialText;
	
	// 버튼 클릭 이벤트 핸들러 등록
	heartButton.addEventListener('click', function() {
	    var foodname = this.getAttribute('data-foodname');
	    var xhr = new XMLHttpRequest();
	    
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE) {
	            if (xhr.status === 200) {
	                // AJAX 요청이 성공한 경우
	                var response = JSON.parse(xhr.responseText);
	                var heart = response.heart;
	                
	                // 버튼 텍스트 변경
	                if (heart === "1") {
	                    heartButton.innerText = '🤍 미복용중';
	                } else {
	                    heartButton.innerText = '❤ 복용중';
	                }
	            } else {
	                // AJAX 요청이 실패한 경우에 대한 처리
	                console.error('AJAX 요청 실패:', xhr.status, xhr.statusText);
	            }
	        }
	    };
	    
	    // AJAX 요청 설정
	    xhr.open('GET', '/Heart.do?foodname=' + encodeURIComponent(foodname), true);
	    xhr.send();
	});

  
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
   			