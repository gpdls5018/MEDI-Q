<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    /*
    .mpsidebar {
        display: inline-block;
        width: 20%;
        height: 780px;
        position: relative;
        background-color: white;
        box-shadow: 2px black;
        border-radius: 10px;
    }
    .mpcontainer {
        display: inline-block;
        width: 75%;
        height: 780px;
        background-color: white;
        position: relative;
        box-shadow: 2px black;
        border-radius: 10px;
    }
    테두리 점박이 형태
    .bookdot {
        border-radius: 10px;
        border: 2px dashed rgb(236, 236, 236);
        width: 1200px;
        height: 800px;
        position: absolute;
        top: 95px;
        left: 350px;
    }*/
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
        background-color:  #FDC3A5;
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
        font-size: 20px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
    }
    .profilemenu {
        display: flex;
        flex-direction: column;
        list-style: none;
        align-items: center;
        margin: 150px 40px 30px 0px;
    }
    .profilemenu  li {
        margin: 10px 0px;
        text-align: center;
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
        width: 400px;
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
        text-align: start;
        margin: 5px 30px;
        border-bottom: 2px solid #FDCDBC;
        max-width: 900px;
    }
    .fontinfotap {
        display:inline;
        margin: 50px;
    }
    .fontinfotap a {
        color: #EF605D;
        text-decoration: none;
        font-weight: bold;
        font-size: 20px;
        text-align: end;
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
    }
    .news .board {
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
    }
    .secnews {
        margin-left: 20px;
    }
    .secnews .board{
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
        width: 530px;
        height: 580px;
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
}
</style>
<!-- 메인 바디 부분 -->
<div id="tsmain">
    <div class="mpmain"><!--큰틀 다이브-->
        <div class="bookdot"><!-- 점박이 다이브-->
            <div class="page"><!--몸통 다이브-->
                <div class="left-container"><!--왼쪽 다이브-->
                    <div class="profile_box">
                        <img src="img/team-1.jpg" class="img" width="180" height="180">
                        <span>$내이름$</span>
                        <ul class="profilemenu">
                            <li><a href="#" class="sidenava1" >
                                프로필 이미지수정</a></li>
                            <li><a class="sidenava2" href="#">
                                회원정보 수정</a></li>
                            <li><a class="sidenava3" href="#">
                                회원탈퇴</a></li>

                        </ul>
                        <div>
                            <span style="position: absolute; top:700px; left: 140px; font-size: 30px;" >로고</span>
                        </div>
                    </div>
                </div>
                <!--왼쪽 다이브 끝-->
                <div class="right-container"><!--오른쪽다이브-->
                    <div class="layout_box">
                        <span class="fontinfo">My page
                            <div class="tab-menu fontinfotap">
                                <a href="#" class="tab-button">복용알림</a>
                                <a href="#" class="tab-button">건강 다이어리</a>
                                <a href="#" class="tab-button">건강분석</a>
                                <a href="#" class="tab-button">약장&리뷰관리</a>
                            </div>
                        </span>
                        <div class="body_box">
                            <div class="update_box">
                                <div class="news">
                                    <div class="update_font">
                                        My Health Report
                                    </div>
                                    <div class="board recently" style="flex:1;">
                                        <div class="second circle">
                                            <strong></strong>
                                            <span>건강기록 <br> 수행률</span>
                                        </div>
                                        <div class="health"style="font-size: 18px; font-weight: bold; ">
                                            <a>글자 1</a>
                                            <a>글자 2</a>
                                        </div>
                                    </div>  
                                    
                                    <div class="update_font" style="margin-top: 20px;">
                                        달력
                                    </div>
                                    <div class="board num" style="flex:1;  min-height: 310px;">
                                        <div class="line1" >
                                            달력넣기
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="secnews">
                                <div class="miniroom_font">건강기록</div>
                                <div class="board">
                                    <span>포스티지 넣어주세요~~</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://rawgit.com/kottenator/jquery-circle-progress/1.2.2/dist/circle-progress.js"></script>
<script>
//벨류 값이 원테두리에 들어가는 수치 math.round는 안에 들어가는 확률 값
 $('.second.circle').circleProgress({
    value: 0.9
  }).on('circle-animation-progress', function(event, progress) {
    $(this).find('strong').html(Math.round(90 * progress) + '<i>%</i>');
  });
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>