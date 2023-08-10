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
.food-box {
    border: 1px solid #ccc;
    padding: 15px;
    margin: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
  }
  
  .food-info {
    font-weight: bold;
    margin-bottom: 10px;
  }
  
  .label-value-container {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
  }
  
  .label {
    color: #888;
    font-size: 12px;
    flex: 1;
  }
  
  .value {
    color: #333;
    font-size: 14px;
    flex: 2;
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
					<div class="ipt-main-wrap">
					<form action="/food/foodsearch.do">
							<input id="searchProduct3" type="text" name="food" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${takefood}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
					</form>
					</div>
				</div>
			</div>
		</div>
<!-- ----------------------여기부터 시작----------------------------------- -->
	<style>
/*여기부터는 승훈이 css꺼임. 지우는거 안되*/
 #chatMessage{
 	height:550px;
 	border:1px gray solid;
 	overflow:auto;
 }
 .bottom.black {
   color: #333;
   border-top: 1px solid #dbdbdb;
}
	</style>
		<div class="container">
			<fieldset>
				<legend>실시간 채팅(웹소켓)</legend>
				
				<form>
					<div>
						<label><kbd>닉네임 설정</kbd></label>
						<input  type="text" class="form-control" id="chatnickname" placeholder="닉네임을 입력하세요">
						<input class="btn btn-primary" type="button" id="enterBtn" value="입장">
						<input class="btn btn-danger" type="button" id="exitBtn" value="퇴장">
						<!-- 여기가 채팅방시작 -->
						<div>
							<h4>오픈 채팅창 내용입니다</h4>
							<div>
								<div id="chatMessage"></div>
							</div>
						</div>
						<!-- 메세지 등록버튼 -->
						<div>
							<label><kbd>메시지input 버튼임</kbd></label>
							<div>
								<input type="text" class="form-control" id="openessage" placeholder="메세지를 입력해주세요">
							</div>
							
						</div>
						
					</div>
				</form>
				
			</fieldset>
		</div>
<script>
	//오픈채팅웹소켓 저장용
	var ocwsocket;
	//닉네임 저장용
	var nickname;
	//내가 닉네임을 적어서 오픈채팅창 방에 들어오는 걸로 확정!
	$('')
</script>
		<!-- 
		<div class="bottom black" style="background-color: rgb(255, 255, 255);"><div class="bottom_plus"><div class="my_info"><span>Guest_ccb84</span></div><button class="call_admin"><img src="//coktv24.1.inde.biz/plugin/indeSet/img/alarm.png">관리자호출</button></div>
					<table>
						<tbody><tr>
							<td class="inputWrap group">
								<div class="plus hoverOpacity"></div>
								<div class="whisperWrap"></div>
								<div class="emoticon hoverOpacity"></div>
								<div class="inputContent">
									<div class="chatInput" contenteditable="true" onclick="this.contentEditable='true'; this.focus(); return false;" placeholder="채팅 입력." tabindex="0"></div>
								</div>
							</td>
						</tr>
					</tbody></table>
					<div class="menuBar" style="display: none;"><div title="스크롤 고정" class="menu-style menubar-scroll" style="background-image: url(&quot;//coktv24.1.inde.biz/skin/basic/img/scroll.png&quot;); background-position: 0px -4px; float: right; margin: 0px;"></div><div title="이모티콘" class="menu-style menubar-emoticon hoverOpacity" style="background-image: url(&quot;//coktv24.1.inde.biz/skin/basic/img/black/emoticon.png&quot;);"></div><div title="관리자 호출" class="menu-style menubar-call_admin" style="background-image: url(&quot;//coktv24.1.inde.biz/skin/basic/img/alarm.png&quot;);"></div></div>
				</div>
		 -->
<!-- -----------------------------여기가 웹소캣 실시간 채팅 끝------------------------------------- -->
		<div class="new-wide-wrap new-wide-wrap-070">
			<div class="left-wing  ">
			    <ul class="sm-menu-wrap">
			        
			    </ul>
			</div>
			<c:forEach items="${foodlist }" var="foodlist">
				<div class="food-box">
				<form action="/food/intakefood.do">
				<input name="no" value="${foodlist.no }" type="hidden">
					<div class="food-info">음식 정보</div>
				  
				  <div class="label-value-container">
				    <div class="label">음식 번호:</div>
				    <div class="input value">${foodlist.no}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">음식 이름:</div>
				    <div class="value">${foodlist.foodname}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">제조사:</div>
				    <div class="value">${foodlist.company}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">1회 섭취량:</div>
				    <div class="value">${foodlist.oneprovide}${foodlist.capacity}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">칼로리:</div>
				    <div class="value">${foodlist.calorie}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">단백질:</div>
				    <div class="value">${foodlist.protein}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">지방:</div>
				    <div class="value">${foodlist.fat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">포화 지방:</div>
				    <div class="value">${foodlist.saturatedfat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">불포화 지방:</div>
				    <div class="value">${foodlist.unsaturatedfat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">트랜스 지방:</div>
				    <div class="value">${foodlist.transfat}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">탄수화물:</div>
				    <div class="value">${foodlist.carbohydrate}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">총 당류:</div>
				    <div class="value">${foodlist.sugar}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">식이섬유:</div>
				    <div class="value">${foodlist.dietaryfiber}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">콜레스테롤:</div>
				    <div class="value">${foodlist.cholesterol}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">나트륨:</div>
				    <div class="value">${foodlist.sodium}</div>
				  </div>
				  <button id="ingestionbtn" style="border: 1px solid black">섭취</button>
				</form>
				</div>
			</c:forEach>
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