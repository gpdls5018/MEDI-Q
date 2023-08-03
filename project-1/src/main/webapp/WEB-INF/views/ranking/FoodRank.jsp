<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<jsp:include page="/WEB-INF/views/template/SelectFoodListStyleScript.jsp"/>

<script src="https://kit.fontawesome.com/0b4621b427.js" crossorigin="anonymous"></script>
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
/*
.loading{      
  display: inline-flex;    
  width:150px;
  justify-content:center;
  align-items: center;
}
.item{
  width:20px;
  height:20px;
  background-color: rgb(247, 40, 4);
  border-radius: 50%;
  animation: loading 2s infinite;
}
@keyframes loading {
    50%{
        transform: scale(0.5);
        background-color: rgb(203, 138, 127);
    }
    100%{
        transform: scale(1);
        background-color: rgb(247, 40, 4);
    }
}
.item:nth-child(2){
    animation-delay: 0.2s;
}
.item:nth-child(3){
    animation-delay: 0.4s;
}
.item:nth-child(4){
    animation-delay: 0.6s;
}
.item:nth-child(5){
    animation-delay: 0.8s;
}
.item:nth-child(6){
    animation-delay: 1s;
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
    
<div class="all-wrap">
	<div class="all-wrap-in all-wrap-in-070">
		<div class="ingredient-search-top">
			<div class="content" style="background-color:#fdfbf6; padding-bottom: 20px;">
			<!-- 건기식 또는 회사이름을 적었을 경우 -->
			<c:if test="${not empty foodname}">
				<div class="top-wrap-070">
					<h1 class="txt2 text-center" style="margin-bottom: 30px; font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<span>💡 ${foodname}</span>에 대한 <br class="u680">제품 검색 결과 <span>${listData.size() + listData2.size()}</span>건</h1>
				</div>
				<div class="ipt-main-wrap">
				<c:if test="${casesel == 1 }">
					<form action="/functionfood/select.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct1" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct1()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/select.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 2}">
					<form action="/functionfood/selectnutrient.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct2" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct2()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectnutrient.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 3}">
					<form action="/functionfood/selectcompany.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct3" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
				<div class="search-etc">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
						<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<a tabindex="0" class="search-keyword" href="/functionfood/selectcompany.do?foodname=${Keyword }">${Keyword }</a>
						</c:forEach>
					</div>
				</div>
				</c:if>
				
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
							<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
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
						<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
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
<!-- 여기서 ttt테스트 시작 -->
<!-- 				
				<div class="container">
			        <h3 class="text-dark">텍스트 챗봇<small class="text-secondary">ChatGPT API</small></h3>          
			        <div class="form-group mt-1">                    
			            <label for="chat-gpt">여기에 응답이 표시됩니다</label>  
			            <textarea placeholder="여기에 응답이 표시됩니다" class="form-control mb-1" rows="4" id="chat-gpt"></textarea>
			        </div>    
			            
			        <div class="form-group "> 
			            <label for="result">질의어를 입력하세요</label>  
			            <input type="text" class="form-control" id="result" placeholder="질의어를 입력하세요">
			        </div>
			    </div> -->
				<!-- 로딩 모달 -->
<!-- 			    <div id="loadingModal" class="modal fade" tabindex="-1" role="dialog" >
			        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
			                <div class="modal-content">
			                    <div class="modal-body text-center">
			                        <div class="loading">
			                            <div class="font-weight-bolder text-black-50 mx-2">
			                            LOADING
			                            </div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
<!-- 테스트 끝 -->
<!-- stt시작 -->
				<div class="container">
			        <h3 class="text-dark">음성 챗봇 <small class="text-secondary">CCH 1.0</small></h3>          
			            
			            
		                <div class="form-group "> 
		                    <label for="result"><i class='fas fa-microphone' style='font-size:24px;color:red'></i> <span id="stt-msg"></span></label>  
		                    <input type="text" class="form-control my-2" id="result" placeholder="아래 버튼 클릭후 말씀해 주세요">
		                </div>
		                <button id="startBtn" class="btn-lg btn-dark">SpeechToText Start <i class='fas fa-microphone' id='icon' style="color:red"></i></button>     
		                
		                <div class="form-group mt-1">
		                    
		                    <label for="chat-gpt"><i class='fas fa-microphone-alt' style='font-size:24px;color:red'></i> <span id="tts-msg"></span></label>  
		                    <textarea placeholder="여기에 응답이 표시됩니다" class="form-control mb-1" rows="4" id="chat-gpt"></textarea>
		                </div>
		                <div class="form-group">
		                    <label for="voice">음성을 선택하세요</label>
		                    <select class="form-control" id="voice">                   
		                    </select>
		                </div>
		                <button id="startTtsBtn" class="btn-lg btn-dark mb-1" style="width:250px">TextToSpeech Start <i class='fas fa-microphone-alt' style="color:red"></i></button>
		                <button id="stopTtsBtn" class="btn-lg btn-dark mb-1" style="width:250px">TextToSpeech Stop <i class='fas fa-microphone-alt-slash' style="color:red"></i></button>    
			    </div>
				<!-- 로딩 모달 -->
			    <div id="loadingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="loadingModalLabel" aria-hidden="true">
			        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
			        <div class="modal-content">
			            <div class="modal-body text-center">
			                <div class="loading">
			                    <div class="font-weight-bolder text-black-50 mx-2">
			                    LOADING
			                    </div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                </div>
			            </div>
			        </div>
			        </div>
			    </div>
<!-- stt끝 -->		
				<!-- 화면을 처음들어 갔을 경우 건기식 또는 회사이름을 안적었을 경우 -->
				<c:if test="${empty foodname}">
				<c:if test="${casesel == 1 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b>💊 현재 인기있는 <span> 건강기능식품</span></b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/select.do">
						<!-- 
<!-- 임시마이크버튼          <button id="startBtn" class="btn-lg btn-dark"><i class='fas fa-microphone' id='icon' style="color:red"></i></button>
	  					<div class="form-group mt-1">
		                   <label for="chat-gpt"><i class='fas fa-microphone-alt' style='font-size:24px;color:red'></i> <span id="tts-msg"></span></label>  
		                   <textarea placeholder="여기에 응답이 표시됩니다" class="form-control mb-1" rows="4" id="chat-gpt"></textarea>
<!-- 여기까지              </div> -->

						<div class="ipt-main-wrap-in">
							<input id="searchProduct1" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct1()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/select.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 2 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b>💊 현재 인기있는 <span> 영양소</span>로 검색해 보세요</b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/selectnutrient.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct2" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct2()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectnutrient.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 3 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b><span> 제품명</span>과<span> 회사명</span>으로 검색해 보세요</b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/selectcompany.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct3" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectcompany.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
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
							<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
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
        /*ttt*/
        /*
        $(document).ready(function(){
            var chatgpt = document.querySelector('#chat-gpt');
            var modal = document.querySelector('#loadingModal');

            // AJAX를 사용하여 API 키 가져오기
            $.get("/config/apiKey", function(data) {
                // data is the apiKey
                var apiKey = data;
                console.log('API Key:', apiKey);
             	// API 키를 가져온 후에 이벤트 리스너를 설정합니다.
                document.querySelector('#result').onkeypress=function(e){
                    if(e.keyCode === 13){
                    	console.log('api는 들어와?:',apiKey);
                        console.log(e.target.value);
                        $('#loadingModal').modal('show');
                        sendToChatGPT(e.target.value);
                    }
                };
                function sendToChatGPT(content){
                    console.log('chatGPT에 전송한 content:',content);
                    console.log('apikey체크:',apiKey);//키값 맞음
                    fetch('https://api.openai.com/v1/chat/completions', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': 'Bearer ' + apiKey
                        },
                        body: JSON.stringify({
                            model: 'gpt-3.5-turbo',
                            messages: [{ role: 'user', content: content }],
                            temperature: 0
                        })
                    })
                    .then(response => {
                        if (!response.ok) {
                            return response.text().then(text => Promise.reject(text));
                        }
                        return response.json();
                    })
                    .then(data => {
                        // Handle the response data
                        console.log('Response:', data); // Add this line
                        console.log(data["choices"][0]["message"]["content"]);
                        //ChatGPT 응답결과 텍스트 에리어에 뿌려주기
                        chatgpt.value=data["choices"][0]["message"]["content"];
                        //ChatGPT응답받기 완료
                        $('#loadingModal').modal('hide');
                    })
                    .catch(error => {
                        // Handle any errors
                        console.error(error);
                    });
                }

                
            });
        });
		*/
        /*stt,tts시작  */
        $(document).ready(function () {
        	
		    var startBtn = document.querySelector('#startBtn');
		    var startTtsBtn = document.querySelector('#startTtsBtn');
		    var stopTtsBtn = document.querySelector('#stopTtsBtn');
		
		    var sttMsg = document.querySelector('#stt-msg');
		    var ttsMsg = document.querySelector('#tts-msg');
		    var result = document.querySelector('#result');
		    var chatGpt = document.querySelector('#chat-gpt');
		    var voiceSelect = document.querySelector('#voice');
		
		    var isRecognizing = false;
		    var recognition;
		
		    $.get("/config/apiKey", function (data) {
		    	
		        var apiKey = data;
		        
		        if (!('webkitSpeechRecognition' in window)) {
		            sttMsg.innerHTML = '당신의 브라우저는 <strong>STT</strong>를 지원하지 않습니다.';
		            startBtn.disabled = true;
		            result.placeholder = '음성인식이 안되는 브라우저입니다.아래 버튼이 비활성화 되었습니다'
		        } else {
		            sttMsg.innerHTML = '당신의 브라우저는 <strong>STT</strong>를 지원합니다.';
		            startBtn.addEventListener('click', startRecognition);
		            initRecognition();
		        }//////else
		
		        if ('speechSynthesis' in window) {
		            ttsMsg.innerHTML = '당신의 브라우저는 <strong>TTS</strong>를 지원합니다.';
		            loadVoices();
		            window.speechSynthesis.onvoiceschanged = function (e) {
		                loadVoices();
		            };
		            startTtsBtn.addEventListener('click', startSynthesis);
		            stopTtsBtn.addEventListener('click', stopSynthesis);
		        } else {
		            ttsMsg.innerHTML = '당신의 브라우저는 <strong>TTS</strong>를 지원하지 않습니다.<br/><a href="http://www.google.co.uk/intl/en/chrome/browser/canary.html">다운로드</a>.';
		        }///////else
		        	
		        
		        function sendToChatGPT(content) {
		            fetch('https://api.openai.com/v1/chat/completions', {
		                method: 'POST',
		                headers: {
		                    'Content-Type': 'application/json',
		                    'Authorization': 'Bearer ' + apiKey
		                },
		                body: JSON.stringify({
		                    model: 'gpt-3.5-turbo',
		                    messages: [{ role: 'user', content: content }],
		                    temperature: 0
		                })
		            })
		                .then(response => {
		                    if (!response.ok) return response.text().then(text => Promise.reject(text));
		                    return response.json();
		                })
		                .then(data => chatGpt.value = data["choices"][0]["message"]["content"])
		                .catch(error => console.error(error));
		        }///////////sendToChatGPT(content)
		        
		        function initRecognition() {
		            recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition || window.mozSpeechRecognition || window.msSpeechRecognition)();
		            recognition.lang = 'ko-KR';
		            recognition.maxAlternatives = 30000;
		            recognition.interimResults = true;
		            recognition.onspeechstart = () => console.log('Recognition Start!');
		            recognition.onspeechend = stopRecognition;
		            recognition.onresult = function (event) {
		                var transcript = Array.from(event.results).map(results => results[0].transcript).join("");
		                result.value = transcript;
		                for (let i = event.resultIndex; i < event.results.length; ++i) {
		                    if (event.results[i].isFinal) sendToChatGPT(transcript);//sendToChatGPT땜에 들어가야됨 자스는 동기
		                }
		            };
		            recognition.onerror = function (event) {
		                console.error('음성 인식 오류가 발생했습니다: ' + event.error);
		            };
		        }////////initRecognition()
		        
		        
		    });/////$.get("/config/apiKey", function (data)
		
		    function startRecognition() {
		    	console.log('음성인식 중1')
		        startBtn.innerHTML = "음성인식 중입니다. <i class='fas fa-microphone' style='color:red'></i>";
		        result.value = '';
		        recognition.start();
		        isRecognizing = true;
		    }//////startRecognition()
		
		    function stopRecognition() {
		    	console.log("음성인식 멈춤")
		        startBtn.innerHTML = "SpeechToText Start <i class='fas fa-microphone' style='color:red'></i>"
		        recognition.stop();
		        isRecognizing = false;
		    }//////stopRecognition()
		
		    function startSynthesis() {
		    	
		        var utterance = new SpeechSynthesisUtterance(chatGpt.value);
		        
		        if (voiceSelect.value) {
		            var selectedVoice = speechSynthesis.getVoices().filter(function (voice) {
		                return voice.voiceURI == voiceSelect.value;
		            })[0];
		            utterance.voiceURI = selectedVoice.voiceURI;
		            utterance.lang = selectedVoice.lang;
		        }
		        window.speechSynthesis.speak(utterance);////////
		    }/////startSynthesis()
		
		    function stopSynthesis() {
		        if (window.speechSynthesis.speaking) window.speechSynthesis.cancel();
		    }////stopSynthesis()
		
		    function loadVoices() {
		        var voices = window.speechSynthesis.getVoices();
		        voices.forEach(function (voice, i) {
		            var option = document.createElement('option');
		            option.value = voice.voiceURI;
		            option.dataset.lang = voice.lang;
		            option.innerHTML = voice.name;
		            voiceSelect.appendChild(option);
		        });
		    }//////loadVoices()
		    
		    
		
		});/////////$(document).ready(function ()

</script>
</body>
</html>