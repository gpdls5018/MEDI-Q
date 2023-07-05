<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!-- jQuery를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<!-- 슬라이더를 위한 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<!-- 해시태그를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<!-- 슬라이드 반응형 jqery -->
<script src="resources/tsfolder/js/jquery.sticky-kit.min.js"></script>

<style>

 .btn-6c img {
        margin-bottom: 10px;
    }

    .btn-6c lable {
        display: block;
        white-space: nowrap;
        font-size: 12px;
    }

    .btn-6c {
        display: flex;
        color: #ffffff;
        background: #ffffff;
        position: relative;
        flex-direction: column;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        border: 1px solid var(--color-bs-gray-300);
        width: 100px;
        height: 100px;
        padding: 10px;
        border-radius: 12px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        line-height: 24px;
    }
    
    .btn {
        
        font-size: 16px;
        cursor: pointer;
        padding: 40px 40px;
        margin: 10px 10px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        position: relative;
        text-align: center;
        color: black;
    }
    .tagify {
   		width: 80%;
    }
    /*사이드 랭킹바 만든 css*/
    .tsbutton {
		display: block;
		border-radius: 4px;
		text-decoration: none;
		text-align: center;
		color: #fff;
		background-color: #0071fc;
		padding: .5em
	}
	.maints {
		padding: 0em 0em 1em 1em;
	}
	.tsidebar {
		padding: 2em 1.5em;
		background-color: white;
		margin-bottom:10px;
	}
	.tsidebar .list li {
	    position: relative;
	    display: flex;
	    width: 100%;
	    height: 80px;
	    margin: 0 0 20px 0;
	    background-color: #ffffff;
	    box-shadow: 2px 2px 4px #ccc;
	    align-items: center;
	}
	.tsidebar .list li img{
	    width: 50px;
	    height: 60px;
	    text-align: center;
	}
	
	@media (min-width:43.75em) {
		.tscontainer {
			max-width: 100%;
			margin: 0 auto;
			position: relative;
		}
		.maints {
			display: inline-block;
			width: 70%;
			vertical-align: top;
		}
		.tsidebar {
			display: inline-block;
			width: 20%;
			vertical-align: top;
		}
		.fixedsticky {
			margin-top: 100px;
			top: 0px;
		}
	}

</style>

		<div class="container-fluid  mb-1 hero-header" style="margin-top:100px;">
	        <div class="ba1">
	            <div class="slided"><img src="resources/images/tsimages/ba1.jpg" width="800" height="340" ></div>
	            <div class="slided"><img src="resources/images/tsimages/ba2.jpg" width="800" height="340" ></div>
	        </div>
		</div>
        
		<div class="ml-5 mt-2 ">
	        <i class="bi bi-camera" hidden><a href="/modelOCR.do"> 사진으로 검색할래요 !!!</a></i>
	    </div>

		<div class="row justify-content-center">
	        <div class="col-lg-10 text-center">
	            <h1 class="mb-5" style="font-weight:bold;"><span style="color: #EF605D;">제품명,영양성분</span>을 검색해보세요.</h1>
	            <form class="position-relative w-75 mx-auto animated slideInDown d-flex input-wrapper" action="/hashtag.do" method="post" style="box-shadow: 0px 0px 5px gray; border-radius: 20px;">
	                <input class="border-0 rounded-pill w-100 px-5 py-3 ps-4 pe-5 flex-grow-1" type="text" name="postTag" 
	                placeholder="제품명 및 영양성분을 입력하세요" value="${not empty searchTags ? fn:replace(searchTags,'#',',#') : ''}">
	                <input name="searchTags" type="hidden" id="hiddenInput" value="">
	                <button type="submit" class="btn rounded-pill py-2 px-4 top-0 end-0 me-2" >
						<img src="resources/images/tsimages/free-icon-magnifying-glass-4475396.png" style="width:30px; height:30px">
					</button>
	            </form>
	        </div>
	        <div id="hashtaglink" class="ml-1 py-3 row" >
	       	 	<button  href="#" class="btn btn-6 btn-6c">
                    <img src="resources/images/tsimages/free-icon-skin-protection-5228128.png" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: green;">#피부건강</lable></button>&nbsp;
	        	<button  href="#" class="btn btn-6 btn-6c">
                    <img src="resources/images/tsimages/free-icon-immunity-5106341.png" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: palevioletred;">#면역력 증진</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="resources/images/tsimages/free-icon-male-gender-2404544.png" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: mediumpurple;">#전립선 건강</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="resources/images/tsimages/free-icon-weight-scale-7984802.png" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: sandybrown;">#체지방 감소</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="resources/images/tsimages/free-icon-vitamins-525955.png" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: salmon;">#비타민</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="resources/images/tsimages/free-icon-glucose-meter-4228683.png" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: lightskyblue;">#혈당</lable></button>&nbsp;
		    </div >
	    </div>
	    
		
<section class="tscontainer mt-5">
     <article class="maints">
	    <div class="m-5">
	        <div class="slider1">
	            <div class="slide"><a href="<c:url value="/magazine.do?no=01"/>"><img src="resources/images/thumbnail_img/RedM_Arg.jpg"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=02"/>"><img src="resources/images/thumbnail_img/RedM_Col.jpg"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=03"/>"><img src="resources/images/thumbnail_img/RedM_Hia.jpg"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=04"/>"><img src="resources/images/thumbnail_img/RedM_Pro.jpg"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=05"/>"><img src="resources/images/thumbnail_img/YellowM_Mus.jpg"></a></div>
	        </div>
	    </div>
    <jsp:include page="/WEB-INF/views/ListTable.jsp"/>
	</article>
		<aside class="tsidebar fixedsticky">
			<div class="login-section justify-content-center">
		        <p>Madi-Q를 더 안전하고 편리하게 이용하세요</p>
		        <button class="btn btn-warning" type="button" style="width:90%; height:50px font-weight:800; color:#EF605D;">Madi-Q<br/> 로그인</button>
		        
		    </div>
			<p style="margin-bottom:40px; font-size:24px; font-weight:bold;">Q-Ranking</p>
                         <div class="sidebar-item">
                             <ul class="list">
                                 <li>
                                     <div class="image mx-2">
                                         <img src="resources/images/tsimages/destination-1.jpg" alt="*">
                                     </div>
                                     <p class="text mx-2">약 이름1</p>
                                 </li>
                                 <li>
                                     <div class="image mx-2">
                                         <img src="resources/images/tsimages/destination-2.jpg" alt="*">
                                     </div>
                                     <p class="text mx-2">약 이름2</p>
                                 </li>
                                 <li>
                                     <div class="image mx-2">
                                         <img src="resources/images/tsimages/destination-3.jpg" alt="*">
                                     </div>
                                     <p class="text mx-2">약 이름3</p>
                                 </li>
                                 <li>
                                     <div class="image mx-2">
                                         <img src="resources/images/tsimages/destination-4.jpg" alt="*">
                                     </div>
                                     <p class="text mx-2">약 이름4</p>
                                 </li>
                                 <li>
                                     <div class="image mx-2">
                                         <img src="resources/images/tsimages/package-1.jpg" alt="*">
                                     </div>
                                     <p class="text mx-2">약 이름5</p>
                                 </li>
                             </ul>
                         </div>
		</aside>
</section>

<script>
// The DOM element you wish to replace with Tagify
var input = document.querySelector('input[name=postTag]');
var whitelist = ["#혈압","#당뇨","#면역력 증진","#전립선 건강","#체지방 감소","#피로개선","#혈당","#비타민","#오메가","#피부건강"];
// initialize Tagify on the above input node reference
var tagify = new Tagify(input,{
    enforceWhitelist: true,
    whitelist : whitelist
})
$('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
tagify.on('input', e => console.log(e.detail));
$('#hashtaglink button lable').click(function() {
    tagify.addTags([{value:$(this).html(), style:"--tag-bg:"+$(this).css('color')}]);
});
tagify.on('add', e=> {
    $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
});
tagify.on('remove', e=> {
    $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
});

$(document).ready(function(){
    $('.slider1').bxSlider({
        slideWidth: 900,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 1,
        auto : true,
        stopAutoOnClick : true,
        pager : true,
    });
});

$(document).ready(function(){
    $('.ba1').bxSlider({
        slideWidth: 800,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 1,
        auto : true,
    });
});


//사이드바 함수 적용
$(document).ready(function() {
  $('.tsidebar').stick_in_parent();
});
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
    