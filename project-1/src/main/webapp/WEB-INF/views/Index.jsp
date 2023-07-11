<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!-- jQuery를 위한 CDN
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
 -->
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
    
    #hashtaglink .btn {
        
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
		margin: 1em 0em 1em 1em;
	}
	.tsidebar {
		padding: 16px 1.5em;
		margin-bottom:10px;
	}
	.tsidebar .unlist li {
	    position: relative;
	    display: flex;
	    width: 100%;
	    height: 80px;
	    margin: 0 0 20px 0;
	    padding: 
	    background-color: #ffffff;
	    border-radius: 8px;
	    box-shadow: 0px 0px 2px #444;
	    align-items: center;
	}

	.tsidebar .unlist li img{
	    width: 50px;
	    height: 35px;
	    text-align: center;
	}
	
	@media (min-width:30em) {
		.tscontainer {
			max-width: 100%;
			margin: 0 auto;
			position: relative;
		}
		.maints {
			display: inline-block;
			width: 70%;
			vertical-align: top;
			margin: 0px 20px 0px 20px;
		}
		.tsidebar {
			display: inline-block;
			width: 16%;
			vertical-align: top;
			margin: 0px 20px 0px 20px;
		}
		.fixedsticky {
			margin-top: 00px;
		}
	}
	aside > div {
	  border: 2px solid #ccc;
	  border-radius: 10px;
	  padding: 20px;
	  background-color: white;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  margin-bottom: 20px;
    }
	.gCSEJp {
        display: flex;
        flex-direction: column;
        position: relative;
        padding: 40px 20px;
    }
    .gCSEJp > h1 {
        color: gray;
        font-weight: 900;
        margin-bottom: 24px;
    }
    .ktaGqG {
        display: inline-block;
        width: calc(100% - 10px);
        transform: translateX(10px);
        height: 139px;
        background-color: #EF605D;
        border-radius: 20px;
        margin-bottom: 20px;
        list-style-type: none;
        position: relative;
    }
    .jZuajW {
        position: absolute;
        left: -10px;
        z-index: 5;
        display: flex;
        flex-direction: column;
        top: 50%;
        transform: translateY(-50%);
        height: 110px;
        width: 25px;
        -webkit-box-align: center;
        align-items: center;
        justify-content: space-around;
    }
    .hBxOSS {
        cursor: pointer;
        border-radius: 20px;
        height: 139px;
        box-shadow: rgba(101, 101, 101, 0.3) 2px 2px 4px 4px;
    }
    .iJGurJ {
        position: relative;
        height: 100%;
        border-bottom: none;
        background-color: white;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        width: 92%;
        padding: 22px 0px 22px 30px;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .enbDhJ {
        font-weight: bold;
        height: 22px;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: start;
        justify-content: flex-start;
        border-radius: 10px;
        color: black;
    }
    .ZyIFk {
        display: flex;
        gap: 8px;
    }
    .maints > div{
		background-color:white;
 		border: 2px solid #eaeaea;
 		border-radius:15px;

    }
    section {
	  background: linear-gradient(to bottom, #ffffff, #FFFAFA);
	}

    .section .content {
        width: 90%;
        margin: 30px;
        text-align: center;
        position: relative;
    }
    .section1-2b .txt1 {
        font-weight: 700;
        font-size: 20px;
        color: #101219;
    }
    .section1-2b .ingredient-wrap {
 		display:flex;
 		flex-wrap: wrap;
        width: calc(100% + 20px);
        margin-top: 10px;
        justify-content:center; 
        align-items: center
        
    }
    .section1-2b .txt1 span {
        color: #EF605D;
    }
    .section1-2b .ingredient-wrap .ingredient-one .txt-fix {
	    display: table-cell;
	    vertical-align: middle;
	    height: 120px;
	    font-weight: bold;
	    font-size: 16px;
	    line-height: 20px;
	    color: #101219;
	    text-align: center;
	    width: 100%;
	}
    .section1-2b .ingredient-wrap .ingredient-one {
        width: calc(20% - 35px);
        height: 80px;
        margin: 15px 15px 0px 0px;
        float: left;
        border-radius: 20px;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        text-align: center;
        background: #FFFFFF;
        display: table;
        border: 1px solid #E6E9ED;
    }

    .section1-2b .more-pop-ingredient {
        float: right;
        font-weight: bold;
        font-size: 16px;
        line-height: 1;
        text-align: right;
        margin: 10px 0px 0px 20px;
        text-decoration: underline;
        color: #9BA1AA;
        cursor: pointer;
    }
    .ingredient-wrap a{
  		flex-basis: 16%;
    	text-align: center;
        text-decoration:none; 
    }
    /*3번째 div 목록*/
    .section1-2e {
		margin: 30px;
        width: 95%;
    }
    .section .content {
        margin: 0px auto;
        text-align: center;
        position: relative;
    }
    .section1-2e .txt1 {
        display: block;
        color: #9BA1AA;
        text-align: center;
        font-weight: 700;
        font-size: 20px;
        line-height: 1;
    }
    .section1-2e .txt2 {
        display: block;
        font-weight: 700;
        color: #101219;
        font-size: 26px;
        text-align: center;
        line-height: 34px;
        margin: 10px 0px 28px;
    }
    .section1-2e .txt2 span {
        color: #EF605D;
    }
    .section1-2e .swiper-container2 {
        overflow: hidden;
        width: calc(100% + 20px);
        padding: 0px 0px 80px;
        transform: translateX(-10px);
    }
    .u510{
        display: none;
    }
    .slideriview {
    	border-radius: 20px;
    	box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    }

     .mainMap {
         position: relative;
         z-index: 10;
         height: 340px;
         border: 1px solid #ccc;
     }
      .mainMap button{
       	   display: block;
           z-index: 99;
           background-color: white;
           width: 180px;
       	   height: 60px;
           position: absolute;
           cursor: pointer;
           border: 1px solid #ccc;
           border-radius: 20px; 
           text-align: center;
           top: 20px;
           right: 10px;
       }
      .mainMap button:hover {
      		background-color: #FDCDBC;
          	color: black;
          	font-weight: bold;
      }
      
      .mainMap button span {
      	 vertical-align:middle;
      	 color: #EF605D;
      	 font-weight: bold;
      	 text-align: center;
      	  font-size: 14px;
      }
      /* 맵에 레이어 부분 css*/
      .mainMap .mapLayer {
      		display: block;
            margin-inline-start: 20px;
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 10;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
        }
        .mapLayer h2 {
            color: #EF605D;
            overflow: hidden;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .mainMap a {
            display: block;
            width: 300px;
            height: 48px;
            margin-top: 10px;
            border: 1px solid #ccc;
            font-size: 18px;
            text-align: center;
            line-height: 48px;
            border-radius:15px;
            vertical-align: middle;
            text-decoration: none;
            font-weight:bold;
            color:#EF605D;
        }
          .mainMap a:hover {
          	background-color: #FDCDBC;
          	color: black;
          	font-weight: bold;
          }

        .closeLayerButton {
            position: absolute;
            top: 15px;
            right: 15px;
            cursor: pointer;

            border-radius: 30px; 
        }
     
   /*지도 모달 css */
   .modal-content {
   	align-content: center;
   	vertical-align: middle;
   }

.map_wrap, .menu_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:600px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:30%;margin:10px 0 10px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

/*여기는 하단 부분 css 적용 부분 */
.section1-2c {
	margin: 20px 0px 20px;
}
.section1-2c .content {
    padding: 0px 0px 80px;
    width: 938px;
    margin: 0px auto;
    text-align: center;
    position: relative;
    display: block;
}
.section1-2c .txt1 {
    display: block;
    width: 100%;
    margin-top: 20px;
}
.section1-2c .txt1 .lottie1 {
    width: 36px;
    height: 36px;
    float: left;
    display: block;
    overflow: hidden;
    transform: translate3d(0,0,0);
    text-align: center;
    opacity: 1;
}
.section1-2c .txt1 span {
    display: block;
    color: #000;
    text-align: left;
    font-weight: 700;
    font-size: 26px;
    line-height: 1;
    float: left;
    padding: 7px 0px 0px 5px;
}
.section1-2c .txt2 {
    display: block;
    color: #9BA1AA;
    font-weight: 500;
    font-size: 18px;
    line-height: 1;
    margin-top: 10px;
    text-align: left;
}
.section1-2c .banner-wrap {
    background: #FDCDBC;
    border-radius: 20px;
    height: 180px;
    display: block;
    margin: 20px 0px 0px;
    position: relative;
}
.section1-2c .banner-wrap .banner-txt1 {
    font-weight: bold;
    text-align: center;
    font-size: 16px;
    color: #535968;
    padding: 20px 0px 0px;
}
.section1-2c .banner-wrap .banner-txt2 {
    font-weight: 800;
    text-align: center;
    font-size: 34px;
    color: #535968;
    padding: 0px 0px 0px;
    line-height: 42px;
}
.section1-2c .banner-wrap .banner-txt2 span {
    background: linear-gradient(60deg, #EF605D 0%, #f38056  85.29%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}
.section1-2c .banner-wrap .banner-bg {
    position: absolute;
    width: 397px;
    height: 204px;
    left: calc(50% - 198px);
    z-index: 40;
    top: 9px;
}
.section1-3 {
    background: #F8F8FA;
}
.section1-3 .content {
    padding: 80px 0px;
}
.section1-3 .txt1 {
    display: block;
    color: #9BA1AA;
    font-weight: 700;
    font-size: 26px;
    line-height:1;
}
.section1-3 .txt2 {
    display: block;
    color: #535968;
    font-weight: 700;
    font-size: 26px;
    line-height: 1;
    margin-top: 20px;
}
.section1-3 .txt3 {
    display: block;
    color: #101219;
    font-weight: 700;
    font-size: 26px;
    line-height: 1;
    margin-top: 20px;
}
.section1-3 .txt3 span {
    color: #EF605D;
}
.section1-5 {
    background: #F8F8FA;
}
.section1-5 .content {
    padding: 50px 0px 60px;
}
.section1-5 .txt1 {
    display: block;
    color: #101219;
    font-weight: 700;
    font-size: 48px;
    line-height: 1;
}
.section1-5 .txt2 {
    display: block;
    color: #101219;
    font-weight: 500;
    font-size: 20px;
    line-height: 30px;
    margin-top: 40px;
    position: relative;
}
.section1-5 .rl-companies {
    margin: 30px auto 0px;
    display: inline-block;
}
.section1-5 .rl-companies .rl-company {
    float: left;
    width: 186px;
    margin: 0px 0px 40px 40px;
    height: 186px;
    box-shadow: 2px 2px 8px rgba(70, 56, 147, 0.1);
    border-radius: 93px;
    font-size: 0;
}
.section1-5 .rl-company.rl-company1 {
    background: #fff url(https://cdn.pillyze.io/web/img/c-logo1.webp) center no-repeat;
    background-size: 155px 88px;
}
.section1-5 .rl-company.rl-company2 {
    background: #fff url(https://cdn.pillyze.io/web/img/c-logo2.webp) center no-repeat;
    background-size: 158px 89px;
}
.section1-5 .rl-company.rl-company3 {
    background: #fff url(https://cdn.pillyze.io/web/img/c-logo3.webp) center no-repeat;
    background-size: 161px 91px;
}
.section1-5 .rl-company.rl-company4 {
    background: #fff url(https://cdn.pillyze.io/web/img/c-logo4.webp) center no-repeat;
    background-size: 155px 100px;
}
.section1-5 .rl-company.rl-company5 {
    background: #fff url(https://cdn.pillyze.io/web/img/c-logo5.webp) center no-repeat;
    background-size: 143px 106px;
}
.section1-5 .rl-company.rl-company6 {
    background: #fff url(https://cdn.pillyze.io/web/img/c-logo6.webp) center no-repeat;
    background-size: 141px 104px;
}


/*5번째 다이브 스타일*/
.section20-2-home{
	margin-top: 20px;
}
.section20-2-home .content {
    width: 100% !important;
    max-width: 1200px !important;
    margin: 30px 0px 0px 30px;
    padding: 0px 20px;
    text-align: center;
    position: relative;
}
.qna-mark-home {
    display: block;
    font-size: 0;
    background: url(https://cdn.pillyze.io/web/img/qna-txt2.webp) left no-repeat;
    width: 50px;
    height: 20px;
    background-size: 50px 20px;
}
.section20-2-home .get-20-2 {
    text-align: left;
    margin: 10px 0px 0px;
    font-size: 26px;
}
.get-20-2 {
    font-weight: 700;
    color: rgba(39, 39, 39, 0.952);
    line-height: 1;
    font-size: 20px;
    margin: 30px 0px 0px;
    display: block;
}
.get-20-2-home-txt2 {
    font-weight: 600;
    text-align: left;
    margin: 10px 0px 0px;
    font-size: 16px;
    line-height: 24px;
    color: #787E8B;
}
.qna-list-wrap {
    width: 100%;
    display: block;
}
.qna-card {
    width: 90%;
    height: 250px;
    display: block;
    padding: 25px 40px 20px;
    background: #FFFFFF;
    border: 1px solid #E6E9ED;
    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    border-radius: 20px;
    margin: 20px 0px 0px;
    text-align: left;
}
.qna-card .ingredient-tags {
    display: block;
    width: 100%;
    margin: 0px 0px 10px;
}
.qna-card .ingredient-tags .ingredient-tag {
    background: #FDCDBC;
    height: 22px;
    line-height: 22px;
    text-align: center;
    color: #EF605D;
    font-weight: 500;
    display: inline-block;
    padding: 0px 5px;
    border-radius: 5px;
    font-size: 12px;
    float: left;
    margin: 0px 10px 0px 0px;
}
.qna-main {
    display: block;
    width: 100%;
    text-decoration: none;
}
.qna-card .qna-main .txt1 {
    font-weight: 700;
    display: block;
    font-size: 18px;
    line-height: 20px;
    text-align: left;
    color: #101219;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}
.qna-card .qna-main .txt1 .qmark {
    color: #EF605D;
}
.qna-card .qna-main .txt2 {
    font-weight: 600;
    display: block;
    text-align: left;
    font-size: 16px;
    line-height: 24px;
    color: #787E8B;
    margin: 8px 0px 0px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}
.qna-card .qna-user-wrap {
    display: block;
    width: 100%;
    margin: 20px 0px 0px;
}
.qna-card .qna-user-wrap .qna-user-icon.qna-user-icon-1 {
    border-radius: 50%;
    background: url(https://cdn.pillyze.io/web/img/user-s-1.webp) center no-repeat;
    background-size: contain !important;
}
.qna-card .qna-user-wrap .qna-user-icon {
    width: 30px;
    height: 30px;
    float: left;
}
.qna-card .qna-user-wrap .qna-user-txt {
    float: right;
    width: calc(100% - 40px);
    font-weight: 600;
    color: #282a35;
    text-align: left;
    line-height: 24px;
    font-size: 16px;
    overflow: hidden;
    padding: 3px 0px 0px;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}
.qna-card .qna-user-wrap .user-info-row {
    display: block;
    width: 100%;
    margin: 20px 0px 0px;
    float: left;
}
.qna-card .qna-user-wrap .user-info-row .user-name {
    color: #787E8B;
    font-weight: 700;
    font-size: 14px;
    line-height: 22px;
}
.qna-card .qna-user-wrap .user-info-row .user-agesex {
    color: #9BA1AA;
    font-weight: 500;
    font-size: 14px;
    line-height: 22px;
}
.clearfix {
    display: block;
}
.more-qna {
    float: right;
    font-weight: 500;
    font-size: 16px;
    line-height: 1;
    text-align: right;
    margin: 20px 0px 0px;
    text-decoration: underline;
    color: #9BA1AA;
}
</style>

 	<!-- 처음 인덱스 킬때 전체화면 비디오 출력 -->
			<div id="tsvideo-container">
			    <video id="video" autoplay muted>
	                <source src="<c:url value="/resources/video/intro1_.mp4"/>" type="video/mp4">
			    </video>
			    <div class="videologo">
			    	<img class="px-2"src="<c:url value="/resources/images/mainicon.png"/>" loading="lazy" width="50" height="25">
	           		<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="100" height="25">
			    </div>
			    <div id="video-controls">
			      <button class="btn btn-warning" onclick="closeVideo()">Home<br/>가기</button>
			    </div>
			    <div id="video-label">
		    	  <label for="stop-video-checkbox">
			        동영상 오늘 하루 그만 보기
			        <input type="checkbox" id="stop-video-checkbox">
			      </label>
			    </div>
			</div>

<!-- 메인 바디 부분 -->
<div id="tsmain" style="margin-top: 10px;">
	 
  <section id="section-119">
        <div class="content-slider">
          <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
          <input type="radio" id="banner2" class="sec-1-input" name="banner">
          <input type="radio" id="banner3" class="sec-1-input" name="banner">
          <input type="radio" id="banner4" class="sec-1-input" name="banner">
          <div class="slider">
            <div id="top-banner-1" class="banner">
              <div class="banner-inner-wrapper" >
                <h1>글자입력</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">홈으로</a></div>
              </div>
            </div>
            <div id="top-banner-2" class="banner">
              <div class="banner-inner-wrapper" id="tsbaimg2">
                 <h1>글자</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">건강 및 분석하기</a></div>
              </div>
            </div>
            <div id="top-banner-3" class="banner" id="tsbaimg3">
              <div class="banner-inner-wrapper">
                 <h1>글자</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">사진으로 약 검색하기</a></div>
              </div>
            </div>
            <div id="top-banner-4" class="banner" id="tsbaimg4">
              <div class="banner-inner-wrapper">
                 <h1>졸리닭</h1>
                <div class="line"></div>
                <div class="learn-more-button"><a href="#">건강검진</a></div>
              </div>
            </div>
          </div>
          <nav>
            <div class="controls">
              <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><p>홈페이지</p></label>
              <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><p>건강 및 분석</p></label>
              <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><p>사진으로 약 검색하기</p></label>
              <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><p>건강검진</p></label>
            </div>
          </nav>
        </div>
    </section>
		  

              
        <!-- ocr 들어가면 사진 검색용 -->
		<div class="ml-5 mt-2 ">
	        <i class="bi bi-camera" hidden><a href="/modelOCR.do"> 사진으로 검색할래요 !!!</a></i>
	    </div>
	
		<!-- 검색창 밑 검색 태그용 버튼  -->
		<div class="row justify-content-center mt-5 pt-5">
	        <div class="col-lg-10 text-center">
	            <h1 class="mb-5" style="font-weight:bold; color:black;"><span style="color: #EF605D;">제품명,영양성분</span>을 검색해보세요.</h1>
	            <form class="position-relative w-75 mx-auto animated slideInDown d-flex input-wrapper" action="/hashtag.do" method="post" style="box-shadow: 0px 0px 5px gray; border-radius: 20px;">
	                <input class="border-0 rounded-pill w-100 px-5 py-3 ps-4 pe-5 flex-grow-1" type="text" name="postTag" 
	                placeholder="제품명 및 영양성분을 입력하세요" value="${not empty searchTags ? fn:replace(searchTags,'#',',#') : ''}">
	                <input name="searchTags" type="hidden" id="hiddenInput" value="">
	                <button type="submit" class="btn rounded-pill py-2 px-4 top-0 end-0 me-2" >
						<img src="<c:url value="/resources/images/tsimages/free-icon-magnifying-glass-4475396.png"/>" style="width:30px; height:30px">
					</button>
	            </form>
	        </div>
	        <div id="hashtaglink" class="ml-1 py-3 row" >
	       	 	<button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-skin-protection-5228128.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: green;">#피부건강</lable></button>&nbsp;
	        	<button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-immunity-5106341.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: palevioletred;">#면역력 증진</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-male-gender-2404544.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: mediumpurple;">#전립선 건강</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-weight-scale-7984802.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: sandybrown;">#체지방 감소</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-vitamins-525955.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: salmon;">#비타민</lable></button>&nbsp;
                <button  href="#" class="btn btn-6 btn-6c">
                    <img src="<c:url value="/resources/images/tsimages/free-icon-glucose-meter-4228683.png"/>" loading="lazy" width="25" height="25">
                <lable style="font-weight: bold; color: lightskyblue;">#혈당</lable></button>&nbsp;
		    </div >
	    </div>
	    
<!-- 검색창 밑부분! 사이드바와 몸통 부분 -->
<section class="tscontainer mt-5" style="width:90%;  border-radius: 5px;">
	<!-- 왼쪽 몸통부분 -->
     <article class="maints justify-content-center px-3">
     <!-- 1번째 다이브 목록 -->
     	<div class="template__Wrapper-sc-5bsqyv-0 gCSEJp">
	        <h1>$이태성$님의 최근 분석 리포트</h1>
	        <div class="DefaultReportItem__ReportBook-sc-rysw89-0 ibNwmg">
	            <a style="text-decoration:none;" data-gtm-id="report-home-recent-blank" class="DefaultReportItem__ItemWrapper-sc-rysw89-1 ktaGqG" href="/analyzeMyFood.do">
	                <div class="DefaultReportItem__Springs-sc-rysw89-8 jZuajW">
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                    <div class="DefaultReportItem__Spring-sc-rysw89-9 inPQJp"></div>
	                </div>
	                <article class="DefaultReportItem__InnerContents-sc-rysw89-2 hBxOSS" style="display: block;">
	                    <div class="DefaultReportItem__BackgroundWrapper-sc-rysw89-3 iJGurJ">
	                        <div>
	                            <div class="DefaultReportItem__ScoreDate-sc-rysw89-5 enbDhJ">분석한 기록이 없습니다.</div>
	                            <p class="DefaultReportItem__Score-sc-rysw89-6 jeiOCr">??<span>점</span></p>
	                        </div>
	                        <div class="DefaultReportItem__Purpose-sc-rysw89-7 ZyIFk">
	                            <p>먹고 있는 영양제를 분석해 보세요!</p>
	                        </div>
	                    </div>
	                </article>
	             </a>
	          </div>
	     </div>
	     
	  <!-- 2번째 다이브 목록 -->
	  <div class="section section1-2b py-4 my-2">
	        <div class="content">
	            <span class="txt1"><span>인기 성분</span>이에요</span>
	            <div class="ingredient-wrap">
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">포스트<br/>바이오틱스</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">오메가3</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">프로바이오틱스<br/>(유산균)</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">비타민C</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">가르시니아<br/>캄보지아</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">레시틴</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">코엔자임Q10</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">비타민B1</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">비타민A</div></a>
	                        <a tabindex="0" class="ingredient-one" href="#"><div class="txt-fix">칼슘</div></a>
	            </div>
	            <div class="clearfix">
	                <a tabindex="0" class="more-pop-ingredient pt-4 mr-5" href="#">인기성분 더보기</a>
	            </div>
	        </div>
	    </div>
	    
	  <!--  3번째 다이브 목록 -->
		<div class="section section1-2c">
	       <a href="#" style="text-decoration: none;">
	           <div class="content">
	               <span class="txt1"><div id="lottie" class="lottie1"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="512" height="512" preserveAspectRatio="xMidYMid meet" style="width: 100%; height: 100%; transform: translate3d(0px, 0px, 0px);"><defs><clipPath id="__lottie_element_2"><rect width="512" height="512" x="0" y="0"></rect></clipPath><linearGradient id="__lottie_element_6" spreadMethod="pad" gradientUnits="userSpaceOnUse" x1="-90.30999755859375" y1="-143.55599975585938" x2="83.70600128173828" y2="98.05699920654297"><stop offset="0%" stop-color="rgb(255,224,3)"></stop><stop offset="42%" stop-color="rgb(255,194,20)"></stop><stop offset="100%" stop-color="rgb(255,165,37)"></stop></linearGradient><linearGradient id="__lottie_element_10" spreadMethod="pad" gradientUnits="userSpaceOnUse" x1="-74.84400177001953" y1="83.3030014038086" x2="0.8429999947547913" y2="13.440999984741211"><stop offset="0%" stop-color="rgb(255,224,3)"></stop><stop offset="42%" stop-color="rgb(255,197,27)"></stop><stop offset="100%" stop-color="rgb(255,170,50)"></stop></linearGradient><mask id="__lottie_element_11" mask-type="alpha"><g transform="matrix(1,0,0,1,0,0)" opacity="1" style="display: block;"><g opacity="1" transform="matrix(1,0,0,1,256.04998779296875,256)"><path fill="url(#__lottie_element_14)" fill-opacity="1" d=" M-155.59231567382812,-250.01922607421875 C-171.59231567382812,-250.01922607421875 -183.59231567382812,-236.01922607421875 -183.59231567382812,-220.01922607421875 C-183.59231567382812,-220.01922607421875 -184.0931396484375,-4.029144287109375 -184.0931396484375,-4.029144287109375 C-184.0931396484375,-4.029144287109375 -184.61026000976562,218.775634765625 -184.61026000976562,218.775634765625 C-184.61026000976562,234.775634765625 -175.61026000976562,246.275634765625 -159.61026000976562,246.275634765625 C-159.61026000976562,246.275634765625 -112.62041473388672,240.7335205078125 -45.100677490234375,245.04156494140625 C94.62254333496094,253.97262573242188 153.75,254 153.75,254 C169.85000610351562,254 184.85000610351562,236.5 184.85000610351562,220.5 C184.85000610351562,220.5 186.26100158691406,32.999000549316406 186.26100158691406,32.999000549316406 C186.26100158691406,32.999000549316406 187.35000610351562,-111.5999984741211 187.35000610351562,-111.5999984741211 C187.35000610351562,-111.5999984741211 49.5,-245.75 49.5,-245.75 C49.5,-245.75 -7.127154350280762,-239.82662963867188 -53.55015563964844,-242.65863037109375 C-100.54615783691406,-245.525634765625 -155.59231567382812,-250.01922607421875 -155.59231567382812,-250.01922607421875z"></path></g></g></mask><linearGradient id="__lottie_element_14" spreadMethod="pad" gradientUnits="userSpaceOnUse" x1="-45.07500076293945" y1="-55.81100082397461" x2="167.75799560546875" y2="245.73699951171875"><stop offset="0%" stop-color="rgb(255,224,3)"></stop><stop offset="42%" stop-color="rgb(255,197,27)"></stop><stop offset="100%" stop-color="rgb(255,170,50)"></stop></linearGradient><filter id="__lottie_element_17" x="-100%" y="-100%" width="300%" height="300%"><feGaussianBlur stdDeviation="36 36" edgeMode="wrap"></feGaussianBlur></filter><linearGradient id="__lottie_element_24" spreadMethod="pad" gradientUnits="userSpaceOnUse" x1="-45.07500076293945" y1="-55.81100082397461" x2="167.75799560546875" y2="245.73699951171875"><stop offset="0%" stop-color="rgb(255,224,3)"></stop><stop offset="42%" stop-color="rgb(255,197,27)"></stop><stop offset="100%" stop-color="rgb(255,170,50)"></stop></linearGradient></defs><g clip-path="url(#__lottie_element_2)"><g transform="matrix(1,0,0,1,0,0)" opacity="1" style="display: block;"><g opacity="1" transform="matrix(1,0,0,1,256.04998779296875,256)"><path fill="url(#__lottie_element_24)" fill-opacity="1" d=" M-155.59231567382812,-250.01922607421875 C-171.59231567382812,-250.01922607421875 -183.59231567382812,-236.01922607421875 -183.59231567382812,-220.01922607421875 C-183.59231567382812,-220.01922607421875 -184.0931396484375,-4.029144287109375 -184.0931396484375,-4.029144287109375 C-184.0931396484375,-4.029144287109375 -184.61026000976562,218.775634765625 -184.61026000976562,218.775634765625 C-184.61026000976562,234.775634765625 -175.61026000976562,246.275634765625 -159.61026000976562,246.275634765625 C-159.61026000976562,246.275634765625 -112.62041473388672,240.7335205078125 -45.100677490234375,245.04156494140625 C94.62254333496094,253.97262573242188 153.75,254 153.75,254 C169.85000610351562,254 184.85000610351562,236.5 184.85000610351562,220.5 C184.85000610351562,220.5 186.26100158691406,32.999000549316406 186.26100158691406,32.999000549316406 C186.26100158691406,32.999000549316406 187.35000610351562,-111.5999984741211 187.35000610351562,-111.5999984741211 C187.35000610351562,-111.5999984741211 49.5,-245.75 49.5,-245.75 C49.5,-245.75 -7.127154350280762,-239.82662963867188 -53.55015563964844,-242.65863037109375 C-100.54615783691406,-245.525634765625 -155.59231567382812,-250.01922607421875 -155.59231567382812,-250.01922607421875z"></path></g></g><g transform="matrix(1,0,0,1,256,256)" opacity="1" style="display: block;"></g><g mask="url(#__lottie_element_11)" style="display: block;"><g filter="url(#__lottie_element_17)" transform="matrix(1.0543633699417114,-0.7382732033729553,0.7370228171348572,1.0525776147842407,262.1727294921875,285.4595642089844)" opacity="1"><g opacity="1" transform="matrix(1,0,0,1,-2.2880001068115234,-117.94599914550781)"><path fill="rgb(255,245,136)" fill-opacity="1" d=" M259.4909973144531,-54.839500427246094 C259.4909973144531,-54.839500427246094 259.4909973144531,54.839500427246094 259.4909973144531,54.839500427246094 C259.4909973144531,54.839500427246094 -259.4909973144531,54.839500427246094 -259.4909973144531,54.839500427246094 C-259.4909973144531,54.839500427246094 -259.4909973144531,-54.839500427246094 -259.4909973144531,-54.839500427246094 C-259.4909973144531,-54.839500427246094 259.4909973144531,-54.839500427246094 259.4909973144531,-54.839500427246094z"></path></g></g></g><g transform="matrix(1,0,0,1,0,0)" opacity="1" style="display: block;"><g opacity="1" transform="matrix(1,0,0,1,373.79998779296875,77.8499984741211)"><path fill="url(#__lottie_element_10)" fill-opacity="1" d=" M-67.67926788330078,37.35064697265625 C-67.67926788330078,53.25064468383789 -55.06709671020508,66.61580657958984 -39.16709518432617,66.61580657958984 C-39.16709518432617,66.61580657958984 69.76773834228516,67.79359436035156 69.76773834228516,67.79359436035156 C69.76773834228516,67.79359436035156 31.86774253845215,26.28290367126465 10.608914375305176,4.395442485809326 C-4.720612525939941,-11.299712181091309 -67.26302337646484,-67.34209442138672 -67.26302337646484,-67.34209442138672 C-67.26302337646484,-67.34209442138672 -67.67926788330078,37.35064697265625 -67.67926788330078,37.35064697265625z"></path></g></g><g transform="matrix(1,0,0,1,0,0)" opacity="1" style="display: block;"><g opacity="1" transform="matrix(1,0,0,1,256,280.79998779296875)"><path fill="url(#__lottie_element_6)" fill-opacity="1" d=" M98.00357055664062,-34.64583969116211 C98.00357055664062,-34.64583969116211 31.892309188842773,-33.636539459228516 31.892309188842773,-33.636539459228516 C31.892309188842773,-33.636539459228516 30.036678314208984,-95.96062469482422 30.036678314208984,-95.96062469482422 C30.036678314208984,-95.96062469482422 -31.763320922851562,-95.96062469482422 -31.763320922851562,-95.96062469482422 C-31.763320922851562,-95.96062469482422 -30.413145065307617,-30.774173736572266 -30.413145065307617,-30.774173736572266 C-30.413145065307617,-30.774173736572266 -98.3067398071289,-27.283145904541016 -98.3067398071289,-27.283145904541016 C-98.3067398071289,-27.283145904541016 -95.81314849853516,31.02582550048828 -95.81314849853516,31.02582550048828 C-95.81314849853516,31.02582550048828 -29.914426803588867,28.03351593017578 -29.914426803588867,28.03351593017578 C-29.914426803588867,28.03351593017578 -28.058795928955078,92.11274719238281 -28.058795928955078,92.11274719238281 C-28.058795928955078,92.11274719238281 33.55043411254883,89.0580062866211 33.55043411254883,89.0580062866211 C33.55043411254883,89.0580062866211 33.393592834472656,24.915382385253906 33.393592834472656,24.915382385253906 C33.393592834472656,24.915382385253906 99.25421142578125,27.143905639648438 99.25421142578125,27.143905639648438 C99.25421142578125,27.143905639648438 98.00357055664062,-34.64583969116211 98.00357055664062,-34.64583969116211z"></path></g></g></g></svg></div><span>건강검진으로 영양제 &amp; 식단 추천받기</span></span>
	               <br/>
	               <span class="txt2">10년치 국가 건강검진 데이터를 바탕으로 영양제를 추천해드려요!</span>
	               <div class="banner-wrap">
	                   <div class="banner-txt1">내 건강검진 불러오고</div>
	                   <div class="banner-txt2"><span>영양제 &amp; 식단 추천</span> 받으세요</div>
	                   <img src="https://cdn.pillyze.io/web/img/s12c-bg.webp" class="banner-bg" alt="두 손으로 알약을 떠 받드는 그림">
	               </div>
	           </div>
	       </a>
	   </div>
	    
	    
  	  <!--  4번째 다이브 목록 -->
      <div class="mainInner">
            <h3 style="text-align: center; margin-top: 20px; font-weight: bold;">우리 동네에 있는<span style="color: #EF605D"> 🩺병원 & 💊약국</span>찾기</h3>
            <div class="container-xxl py-4">
                <div class="container">
                    <div class="mainMap" id="map" >
                        <button type="button" class="btn" id="tsBtn">
                        	<span>🩺병원 & 💊약국찾기</span>
                        </button>
                        <div class="mapLayer">
                            <div class="closeLayerButton" onclick="closeMapLayer()">&times;</div>
                            	<h2>주소</h2>
      	                     	<p style="font-size:15px; color:gray;">가산디지털단지역<br/>(서울특별시 금천구 벚꽃로 309)</p>
                           		<a href="https://naver.me/GEAidP59" target="_blank">
                           		<img src="<c:url value="/resources/images/tsimages/img_naver.png"/>" alt="NAVER">  지도로 보기</a>
                           		<a href="https://map.kakao.com/?urlX=473869&urlY=1105992&urlLevel=3&itemId=18761502&q=%EB%B2%84%EA%B1%B0%ED%82%B9%20%EA%B0%80%EC%82%B0%EB%94%94%EC%A7%80%ED%84%B8%EC%A0%90&srcid=18761502&map_type=TYPE_MAP#none" target="_blank"> 
                           		<img src="<c:url value="/resources/images/tsimages/img_daum.png"/>" alt="다음지도 보기">  지도로 보기</a>
                        </div>          
                    </div>
                </div>
            </div>
        </div>
        <!--  병원찾기 지도 모달 누르면 나오는 부분 -->
	       <div class="modal fade align-items-center" id="tsModal" role="dialog" style="background-color: rgba(0, 0, 0, 0.5);">
			 <div class="modal-dialog modal-dialog-centered" style="align-content :center; width: 100%; height: 60%; max-width: 1400px;">
			   <!-- Modal content-->
			   <div class="modal-content" style="width: 100%; height: 100%;">
			     <div class="modal-header" >
			       <h4 class="modal-title">우리동네 병원&약국 찾기</h4>
			       <button type="button" class="close" data-dismiss="modal">&times;</button>
			     </div>
			     <div class="modal-body">
			       <h3 style="text-align: center;">병원 & 약국정보</h3>
			       <p style="text-align: center;">병원&약국에 대한 위치 찾기</p>
			       <div class="container-xxl py-5">
			         <div class="map_wrap">
			           <div id="modalmap" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			           <div id="menu_wrap" class="bg_white">
			             <div class="option">
			               <div>
			                 <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="가산동 병원" placeholder="ㅇㅇ동 병원을 입력" id="keyword" size="15">
			                    <button type="submit">검색하기</button>
			                  </form>
			                </div>
			              </div>
			              <hr>
			              <ul id="placesList"></ul>
			              <div id="pagination"></div>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
       
      
      <!--  5번째 다이브 목록 -->
      <div class="section section20-2 section20-2-home">
	        <div class="content">
	            <div class="qna-mark-home">Q&amp;A</div>
	            <span class="ge-title get-20-2">지금 인기있는 질문</span>
	            <div class="get-20-2-home-txt2">전문가가 직접 답해드려요!</div>
	
	            <div class="qna-list-wrap">
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                성분 정보
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>epa높은 오메가3 구미나 츄어블 있을까요?</span>
	                            <span class="txt2">알약을 아예 못먹어서 여태 키즈 제품을 먹었습니다. 중성지방 콜레스테롤때문에 epa가 높은 제품을 먹고싶은데..<br/> 추천해주시면 너무 감사해요ㅠㅠ</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">액체형(리퀴드) 오메가3 제품을 선택하거나, 일반 캡슐 제품을 잘라서 내용물만 섭취하시는 것을 추천해요!</div>
	                            <div class="user-info-row">
	                                <span class="user-name">김**</span>
	                                <span class="user-agesex">20대 / 여</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝 -->
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                영양제 조합
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>혈압약 처방 받았습니다.</span>
	                            <span class="txt2">누보로젯 40/2.5/5/10 처방 받았습니다. 현재 영양제와의 점수가 안맞네요. 멀 빼야하고 대신해서 멀 넣어야하는지<br/> 알려주세요. 혈압약을 먹기 전에는 96점이였습니다.</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">혈압약을 드시면서 피해야 하는 것과 계속 섭취해도 괜찮은 영양제를 알려드릴게요.</div>
	                            <div class="user-info-row">
	                                <span class="user-name">김**</span>
	                                <span class="user-agesex">30대 / 남</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝 -->
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                영양제 조합
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>흡연자 영양제 정리 부탁드립니다</span>
	                            <span class="txt2">흡연자여서 전에 Q&amp;A로 추천을 받은 영양제는 어려울거 같아서요 B6는 20 B12는 55까지 최대로 잡고 알려주시면<br/> 감사하겠습니다 마그네슘도 50정도가 부족해서 같이 부탁드릴게요</span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">영양제 선택은 건강에 대해 가장 중요하게 생각하는 가치에 따라 달라질 수 있어요.</div>
	                            <div class="user-info-row">
	                                <span class="user-name">루**</span>
	                                <span class="user-agesex">20대 / 남</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝 -->
	                    <div class="qna-card">
	                        <div class="ingredient-tags">
	                            <div class="ingredient-tag">
	                                기타
	                            </div>
	                        </div>
	                        <br/>
	                        <a tabindex="0" class="qna-main" title="이 Q&amp;A의 상세정보 보기" href="#">
	                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>코로나 걸렸을 때 영양제</span>
	                            <span class="txt2">코로나 확진 4일차에요. 혹시 같이 먹으면 좋은 영양제 있을까요? 궁금합니다. </span>
	                        </a>
	                        <a tabindex="0" class="qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="#">
	                                <div class="qna-user-icon qna-user-icon-1"></div>
	                                <div class="qna-user-txt">코로나 감염을 예방하기 위해, 또는 코로나 후유증에서 빨리 벗어나기 위해서는 비타민 C, 비타민 D, 아연 등<br/> 면역에 관련된 영양제가 도움이 됩니다. </div>
	                            <div class="user-info-row">
	                                <span class="user-name">물**</span>
	                                <span class="user-agesex">30대 / 여</span>
	                            </div>
	                        </a>
	                    </div><!-- qna-card의 끝 -->
	            </div>
	            <div class="clearfix">
	                <a tabindex="0" class="more-qna" href="#">Q&amp;A 더보기</a>
	            </div>
	        </div>
	    </div>
	    
	   <!--  *번째 다이브 목록 -->
		<div class="m-5 " style="display:flex; justify-content: center;">
	        <div class="slider1 ">
	            <div class="slide"><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Arg.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=02"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Col.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=03"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Hia.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=04"/>"><img src="<c:url value="/resources/images/thumbnail_img/RedM_Pro.jpg"/>"></a></div>
	            <div class="slide"><a href="<c:url value="/magazine.do?no=05"/>"><img src="<c:url value="/resources/images/thumbnail_img/YellowM_Mus.jpg"/>"></a></div>
	        </div>
	    </div>
	</article>
		<!-- 오른쪽 슬라이드 -->
		<aside class="tsidebar fixedsticky pr-3">
			<!--  로그인 목록 창
			<div class="login-section justify-content-center">
		        <p style="text-align: center; font-weight:bold; font-size:13px;"><span style="color:#EF605D">Madi-Q</span>를 더 안전하고<br/> 편리하게 이용하세요</p>
		        <a href="<c:url value="/project/Login.do"/>" style="text-decoration:none;">
		        	<button class="btn btn-outline-success" type="button" style="display: flex; flex-wrap: wrap; align-content: center; text-align: center; justify-content: center; font-size:13px; border-radius: 12px; width:90%; height:50px; font-weight:bold; color:#EF605D;">
		        		<img src="<c:url value="/resources/images/maintitle.png"/>" loading="lazy" width="60" height="30"> 로그인
		        	</button>
		        </a>	    
		        <div class="social d-flex justify-content-center">
		        	<a href="<c:url value="/project/Join.do" />" class="px-2 py-2 mr-md-1 text-dark"><strong style="color:#606060; font-weight:bold; text-decoration: underline;">회원가입</strong></a>
		        </div>
		    </div>
		     -->
            <div class="sidebar-item pt-5 mt-5">
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
                            <img src="<c:url value="/resources/images/tsimages/destination-1.jpg"/>" alt="*">
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
                            <img src="<c:url value="/resources/images/tsimages/destination-2.jpg"/>" alt="*">
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
                            <img src="<c:url value="/resources/images/tsimages/destination-3.jpg"/>" alt="*">
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
                    <!--  랭킹 3개만 출력하기 위해서 잠시 주석
                    <li>
                        <div class="image d-flex">
                             <p style="position: relative; text-align:top; left:5px; width:30px; height:30px; color:gray; font-weight:bold;">4위</p>
                            <img src="<c:url value="/resources/images/tsimages/destination-4.jpg"/>" alt="*">
                        </div>
                         <div style="margin-top:20px; margin-left:10px; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:gray; font-size:8px; font-weight:bold;">얼라이브</p>
                        	<br/>
                        	<p style="color:black; font-size:10px; font-weight:bold; text-align: center;">원스데일리 포 맨</p>
                        	<br/>
                        	<p style="color:gray; font-size:8px; font-weight:bold;">
                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
                        	4.41(37)
                        	</p>
                        </div>
                    </li>
                    <li>
                        <div class="image d-flex">
                            <img src="<c:url value="/resources/images/tsimages/package-1.jpg"/>" alt="*">
                        </div>
                         <div style="margin-top:20px; margin-left:10px; text-align: start; line-height: 3px; font-weight:400;">
                        	<p style="color:gray; font-size:8px; font-weight:bold;">쏜 리서치</p>
                        	<br/>
                        	<p style="color:black; font-size:10px; font-weight:bold; text-align: center;">Basic B Complex </p>
                        	<br/>
                        	<p style="color:gray; font-size:8px; font-weight:bold;">
                        	<img src="<c:url value="/resources/images/tsimages/star_yellow_16.svg"/>" style="width:13px; height:13px;" alt="*">
                        	4.63(19)
                        	</p>
                        </div>
                    </li>
                     -->
                </ul>
            </div>
		</aside>
</section>
	<div class="section section1-3">
       <div class="content">
           <span class="txt1">건강한 영양제 &amp; 식단 관리를 위한 모든 것</span>
           <span class="txt2">걱정 없이, 쉽고 간편하게</span>
           <span class="txt3"><span>Medi-Q</span>로 시작하세요.</span>
       </div>
   </div>
    
	<div class="section section1-5">
        <div class="content">

            <span class="txt1"><span style="color: #EF605D"> Medi-Q</span>는 신뢰가 가득하여 믿을 수 있어요.</span>
            <span class="txt2"><span style="color: #EF605D"> Medi-Q</span>는 국내외 검증된 기관과<br>신뢰도 높은 연구 결과를 바탕으로 개인 맞춤형 분석 결과를 제공합니다.</span>

            <div class="rl-companies">
                <div class="rl-company rl-company1">식품의약품안전처</div>
                <div class="rl-company rl-company2">식품안전정보원</div>
                <div class="rl-company rl-company3">한국영양학회</div>
                <div class="rl-company rl-company4">EFSA</div>
                <div class="rl-company rl-company5">(사)대한약학회</div>
                <div class="rl-company rl-company6">NIH</div>
            </div>
        </div>
    </div>

<!-- 매인 배너 슬라이드 -->
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CSSRulePlugin3.min.js"></script>
<!-- 지도 스크립트 키 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=536a268ae501933d1ccf30618f1b4258&libraries=services"></script> 

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
////////////////////슬라이드 로직///////////////////////////////////
$(document).ready(function(){
    $('.slider1').bxSlider({
        slideWidth: 800,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 1,
        auto : true,
        stopAutoOnClick : true,
        pager : true,
    });
    
    /* 처음 배너할 때 코드
    $('.ba1').bxSlider({
    	 slideWidth: 800,
         minSlides: 2,
         maxSlides: 2,
         slideMargin: 1,
         auto : true,
         stopAutoOnClick : true,
         pager : true,
    }); */
});


//////////////////////비디오 히든 로직////////////////////////////
document.addEventListener("DOMContentLoaded", function() {
	  var checkbox = document.getElementById("stop-video-checkbox");
	  var videoContainer = document.getElementById("tsvideo-container");

	  // 저장된 값 가져오기
	  var hideUntilDate = localStorage.getItem("hideUntilDate");

	  // 저장된 값이 있고, 현재 날짜보다 크면 동영상 숨김
	  if (hideUntilDate && hideUntilDate >= getCurrentDate()) {
	    videoContainer.style.display = "none";
	    checkbox.checked = true;
	  }

	  checkbox.addEventListener("change", function() {
	    if (checkbox.checked) {
	      // 하루 동안 동영상 숨기기
	      var nextDay = new Date();
	      nextDay.setDate(nextDay.getDate() + 1);
	      var hideUntilDate = formatDate(nextDay);
	      localStorage.setItem("hideUntilDate", hideUntilDate);
	      videoContainer.style.display = "none";
	    } else {
	      // 체크 해제 시 동영상 표시
	      localStorage.removeItem("hideUntilDate");
	      videoContainer.style.display = "block";
	    }
	  });

	  // 현재 날짜 반환하는 함수
	  function getCurrentDate() {
	    var now = new Date();
	    return formatDate(now);
	  }

	  // 날짜를 "YYYY-MM-DD" 형식으로 변환하는 함수
	  function formatDate(date) {
	    var year = date.getFullYear();
	    var month = ("0" + (date.getMonth() + 1)).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    return year + "-" + month + "-" + day;
	  }
	});
	
/////////////////////////////////지도 함수//////////////////////////////////////////////////////
// 닫기 버튼 클릭 시 mapLayer 숨김
    var mapLayer = document.querySelector('.mapLayer');
        function closeMapLayer() {
            mapLayer.style.display = 'none';
        }
        
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.481242, 126.883970), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
  //지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
  
/////////////////////////지도 모달 버튼 함수////////////////////////////////
    $(document).ready(function() {
      $("#tsBtn").click(function() {
        $("#tsModal").modal({ backdrop: false});
        setTimeout(function(){ map.relayout(); }, 0);
        initMap(); // 모달 열릴 때 지도 초기화 호출
      });
    });

//지도 모달로 띄우기 
    function initMap() {
    	var markers = [];
    	
    	var mapContainer2 = document.getElementById('modalmap'), // 지도를 표시할 div 
    	mapOption2 = {
		   	center: new kakao.maps.LatLng(37.481387, 126.882676), // 지도의 중심좌표
		   	level: 3 // 지도의 확대 레벨
    	};  

    	// 지도를 생성합니다    
    	var map2 = new kakao.maps.Map(mapContainer2, mapOption2); 
    	
        setTimeout(function(){ map2.relayout(); }, 0);

    	//장소 검색 객체를 생성합니다
    	var ps = new kakao.maps.services.Places();  

    	//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    	//키워드로 장소를 검색합니다
    	searchPlaces();

    	//키워드 검색을 요청하는 함수입니다
    	function searchPlaces() {
    	var keyword = document.getElementById('keyword').value;

    	if (!keyword.replace(/^\s+|\s+$/g, '')) {
    	alert('키워드를 입력해주세요!');
    	return false;
    	}

    	// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    	ps.keywordSearch( keyword, placesSearchCB); 
    	}

    	//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    	function placesSearchCB(data, status, pagination) {
    	if (status === kakao.maps.services.Status.OK) {

    	// 정상적으로 검색이 완료됐으면
    	// 검색 목록과 마커를 표출합니다
    	displayPlaces(data);

    	// 페이지 번호를 표출합니다
    	displayPagination(pagination);

    	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

    	alert('검색 결과가 존재하지 않습니다.');
    	return;

    	} else if (status === kakao.maps.services.Status.ERROR) {

    	alert('검색 결과 중 오류가 발생했습니다.');
    	return;

    	}
    	}

    	//검색 결과 목록과 마커를 표출하는 함수입니다
    	function displayPlaces(places) {

    	var listEl = document.getElementById('placesList'), 
    	menuEl = document.getElementById('menu_wrap'),
    	fragment = document.createDocumentFragment(), 
    	bounds = new kakao.maps.LatLngBounds(), 
    	listStr = '';

    	// 검색 결과 목록에 추가된 항목들을 제거합니다
    	removeAllChildNods(listEl);

    	// 지도에 표시되고 있는 마커를 제거합니다
    	removeMarker();

    	for ( var i=0; i<places.length; i++ ) {

    	// 마커를 생성하고 지도에 표시합니다
    	var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
    	    marker = addMarker(placePosition, i), 
    	    itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

    	// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
    	// LatLngBounds 객체에 좌표를 추가합니다
    	bounds.extend(placePosition);

    	// 마커와 검색결과 항목에 mouseover 했을때
    	// 해당 장소에 인포윈도우에 장소명을 표시합니다
    	// mouseout 했을 때는 인포윈도우를 닫습니다
    	(function(marker, title) {
    	    kakao.maps.event.addListener(marker, 'mouseover', function() {
    	        displayInfowindow(marker, title);
    	    });

    	    kakao.maps.event.addListener(marker, 'mouseout', function() {
    	        infowindow.close();
    	    });

    	    itemEl.onmouseover =  function () {
    	        displayInfowindow(marker, title);
    	    };

    	    itemEl.onmouseout =  function () {
    	        infowindow.close();
    	    };
    	})(marker, places[i].place_name);

    	fragment.appendChild(itemEl);
    	}

    	// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    	listEl.appendChild(fragment);
    	menuEl.scrollTop = 0;

    	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    	map2.setBounds(bounds);
    	}

    	//검색결과 항목을 Element로 반환하는 함수입니다
    	function getListItem(index, places) {

    	var el = document.createElement('li'),
    	itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
    	        '<div class="info">' +
    	        '   <h5>' + places.place_name + '</h5>';

    	if (places.road_address_name) {
    	itemStr += '    <span>' + places.road_address_name + '</span>' +
    	            '   <span class="jibun gray">' +  places.address_name  + '</span>';
    	} else {
    	itemStr += '    <span>' +  places.address_name  + '</span>'; 
    	}
    	         
    	itemStr += '  <span class="tel">' + places.phone  + '</span>' +
    	        '</div>';           

    	el.innerHTML = itemStr;
    	el.className = 'item';

    	return el;
    	}

    	//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    	function addMarker(position, idx, title) {
    	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    	imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
    	imgOptions =  {
    	    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
    	    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
    	    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    	},
    	markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
    	    marker = new kakao.maps.Marker({
    	    position: position, // 마커의 위치
    	    image: markerImage 
    	});

    	marker.setMap(map2); // 지도 위에 마커를 표출합니다
    	markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    	return marker;
    	}

    	//지도 위에 표시되고 있는 마커를 모두 제거합니다
    	function removeMarker() {
    	for ( var i = 0; i < markers.length; i++ ) {
    	markers[i].setMap(null);
    	}   
    	markers = [];
    	}

    	//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    	function displayPagination(pagination) {
    	var paginationEl = document.getElementById('pagination'),
    	fragment = document.createDocumentFragment(),
    	i; 

    	// 기존에 추가된 페이지번호를 삭제합니다
    	while (paginationEl.hasChildNodes()) {
    	paginationEl.removeChild (paginationEl.lastChild);
    	}

    	for (i=1; i<=pagination.last; i++) {
    	var el = document.createElement('a');
    	el.href = "#";
    	el.innerHTML = i;

    	if (i===pagination.current) {
    	    el.className = 'on';
    	} else {
    	    el.onclick = (function(i) {
    	        return function() {
    	            pagination.gotoPage(i);
    	        }
    	    })(i);
    	}

    	fragment.appendChild(el);
    	}
    	paginationEl.appendChild(fragment);
    	}
    	//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    	//인포윈도우에 장소명을 표시합니다
    	function displayInfowindow(marker, title) {
    	var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    	infowindow.setContent(content);
    	infowindow.open(map2, marker);
    	}

    	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
    	function removeAllChildNods(el) {   
	    	while (el.hasChildNodes()) {
	    	 el.removeChild (el.lastChild);
	    	}
    	}
    	
  }


/////////////////////////상단 메인 배너///////////////////////////////////////////////
/*배너 영상돌리기*/
function bannerSwitcher() {
    next = $('.sec-1-input').filter(':checked').next('.sec-1-input');
    if (next.length) next.prop('checked', true);
    else $('.sec-1-input').first().prop('checked', true);
  }

  var bannerTimer = setInterval(bannerSwitcher, 5000);

  $('.controls label').click(function() {
    clearInterval(bannerTimer);
    bannerTimer = setInterval(bannerSwitcher, 5000)
  });



/////////////////////////////////사이드바 함수 적용 라이브러리 적용///////////////////////
$(document).ready(function() {
  $('.tsidebar').stick_in_parent();
});
</script>
</div><!-- id=main  -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
    