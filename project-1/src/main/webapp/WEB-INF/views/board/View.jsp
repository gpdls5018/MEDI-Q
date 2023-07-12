<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
figure{
    width: 100%;
    height: 400px;
    background:linear-gradient(0deg,#ffa585,#fedacd);
    position: relative;
    overflow: hidden;
    padding-top: 250px;
    border-bottom-right-radius: 30px;
    border-bottom-left-radius: 30px;            
}

figure img {
    position: absolute;
    top: 0px;
    right: 200px;
    width: 20%;
}

figure .inner {
    width: 100%;
    top: -220px;
    left: 200px;
    position: relative;
}

figure .inner h1 {
    font-size: 150px;
    color: #fff;
}
figure .inner h3 {
    font-size: 50px;
    color: #fff;
}
.card{
    box-shadow: 2px 2px 10px rgb(165, 165, 165) ;
}
.text1{
    font-family:'Dongle',sans-serif;
    font-size: 20px;
}
.text2{
    font-family:'Dongle',sans-serif;
    font-size: 17px;
}
.text3{
    font-family:'Dongle',sans-serif;
    font-size: 30px;
}
.text4{
    font-family:'Dongle',sans-serif;
    color: black;
    font-size: 40px;
}
.text4:hover{
    color: gray;
    cursor: pointer;
}
h1 {
    font-family:'Dongle',sans-serif;
    font-size: 5rem;
}
h2 {
    font-family:'Dongle',sans-serif;
    font-size: 4.5rem;
}
h3 {
    font-family:'Dongle',sans-serif;
    font-size: 4rem;
}
h4 {
    font-family:'Dongle',sans-serif;
    font-size: 3rem;
}
h5 {
    font-family:'Dongle',sans-serif;
    font-size: 2.25rem;
}
h6 {
    font-family:'Dongle',sans-serif;
    font-size: 2rem;
}
</style>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
	<title>MEDI Q</title>
</head>
<style>
	figure{
         width: 100%;
         height: 400px;
         background:linear-gradient(0deg,#ffa585,#fedacd);
         position: relative;
         overflow: hidden;
         padding-top: 250px;
         border-bottom-right-radius: 30px;
         border-bottom-left-radius: 30px;            
     }

     figure img {
         position: absolute;
         top: 0px;
         right: 200px;
         width: 20%;
     }

     figure .inner {
         width: 100%;
         top: -220px;
         left: 200px;
         position: relative;
     }

     figure .inner h1 {
         font-size: 150px;
         color: #fff;
     }
     figure .inner h3 {
         font-size: 50px;
         color: #fff;
     }
     .card{
         box-shadow: 2px 2px 10px rgb(165, 165, 165) ;
     }
     .text1{
         font-family:'Dongle',sans-serif;
         font-size: 20px;
     }
     .text2{
         font-family:'Dongle',sans-serif;
         font-size: 17px;
     }
     .text3{
         font-family:'Dongle',sans-serif;
         font-size: 30px;
     }
     .text4{
         font-family:'Dongle',sans-serif;
         color: black;
         font-size: 40px;
     }
     .text4:hover{
         color: gray;
         cursor: pointer;
     }
     h1 {
         font-family:'Dongle',sans-serif;
         font-size: 5rem;
     }
     h2 {
         font-family:'Dongle',sans-serif;
         font-size: 4.5rem;
     }
     h3 {
         font-family:'Dongle',sans-serif;
         font-size: 4rem;
     }
     h4 {
         font-family:'Dongle',sans-serif;
         font-size: 3rem;
     }
     h5 {
         font-family:'Dongle',sans-serif;
         font-size: 2.25rem;
     }
     h6 {
         font-family:'Dongle',sans-serif;
         font-size: 2rem;
     }
</style>
<body>
	<header class="p-3 bg-danger" alt="메뉴 부분">
	    <div class="container">
	        <div class="row">
	            <h1 class="col-6 text-center"><a class="text-light text-decoration-none" href="#">Logo Position(Top)</a></h1>
	            <ul class="list-unstyled d-flex align-items-center p-1">
	                <li class="col"><a class="text-light text-decoration-none" href="#">MENU1</a></li>
	                <li class="col"><a class="text-light text-decoration-none" href="#">MENU2</a></li>
	                <li class="col"><a class="text-light text-decoration-none" href="#">MENU3</a></li>
	                <li class="col"><a class="text-light text-decoration-none" href="#">MENU4</a></li>
	                <li class="col"><a class="text-light text-decoration-none" href="#">MENU5</a></li>
	            </ul>
	        </div>
	    </div>
	</header>
	<main>
	    <div class="container-fluid">
	        <figure>
	            <img src="pharm.png">
	            <div class="inner">
	                <h1>Q & A</h1>
	                <h3>답답했던 영양제의 모든 것!</h3>
	                <h3>전문가에게 물어보세요</h3>
	            </div>
	        </figure>
	    </div>
	    <div class="container-fluid pt-3 mt-3">
	        <div class="row d-flex flex-wrap align-content-stretch">
	            <div class="d-flex col-2">
	            </div>
	            
	            <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
	                <div class="col">
	                    <h2 class="m-3 font-weight-bold font-weight-bold">답변 게시판</h2>
	                    <div class="row justify-content-center">
	                    	<!--여기부터 답변출력  -->
	                    	<c:if test="${! empty FAILURE}">
								<div class="alert alert-success alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Failure!</strong> ${FAILURE }
								</div>
							</c:if>
							<!-- 출력 부분 -->
	                        <div class="card col-12 m-2 p-1">
	                            <div class="card-body text-dark text-decoration-none p-2">
	                                <p class="card-title font-weight-bold m-2"><h4>${result.TITLE }</h4></p>
	                                <p class="card-text"><h6>${result.CONTENT }</h6></p>
	                                <br/>
	                                <hr style="border: 1px solid gray;"/>
	                                <br/>
	                                <p class="card-text"><h6 class="font-weight-bold">${result.ID } 30대/여</h6></p>
	                                <p class="card-text"><h6 class="font-weight-bold">${result.POSTDATE }</h6></p>
	                            </div>
	                        </div>
	                        <!-- 임시위치 버튼 -->
	                        <div class="text-center mt-auto" id="content_footer">
					<a href='<c:url value="/board/Edit.do?no=${result.NO}"/>' class="btn btn_write">
						<span class="btn_text">수정</span>
					</a> 
					<!-- <a href="javascript:deleteArticle();" class="btn btn_write"> -->
					<a href="javascript:isDelete();" class="btn btn_write">
						<span class="btn_text">삭제</span>
					</a> 
					<a href='<c:url value="/board/List.do"/>' class="btn btn_write">
						<span class="btn_text">목록</span>
					</a>
					<!-- 여기는 관리자만 보이는 버튼 -->
					<a href='<c:url value="/Reply.do"/>' class="btn btn_write">
						<span class="btn_text">답글</span>
					</a>
				</div>
	                        
	                    </div>
	                </div>
	                <br/>
	                <!-- 답변 게시판(관리자) -->
	                <div class="card col-12 m-2 mt-5 p-1">
	                    <div class="card-body text-dark text-decoration-none p-2">
	                        <p class="card-title text1 font-weight-bold m-2"><h4> <i class="bi bi-person-square"></i> 메디큐 약사님의 답변</h4></p>
	                        
	                    </div>
	                    <div class="card-footer align-items-center">
	                        <button class="btn btn-light text-light text3" style="background: linear-gradient(180deg,#fd9068,#fbc1ab);">도움이 돼요</button>
	                        &nbsp;&nbsp;24명에게 도움이 됐습니다.
	                    </div>
	                </div>
	                <div class="d-flex col flex-wrap flex-direction justify-content-between mt-3">
	                    <a class="text4 text-decoration-none">이전 질문</a>
	                    <a class="text4 text-decoration-none">질문 목록</a>
	                    <a class="text4 text-decoration-none" >다음 질문</a>
	                </div>
	                <br/>
	            </div>
	            <div class="d-flex col-2 flex-wrap align-content-stretch">
	            </div>
	        </div>
	    </div>
	    <br/>
	</main>
	<footer class="d-flex flex-wrap justify-content-between align-items-center pt-3 mt-4 border-top" style="background-color:#FDCDBC;">
        <p class="col-md-4 mb-0 text-muted" style="font-weight:bold; color:black;">
        © 2023 (주)한국소프트웨어아이엔씨 (153-759)<br/> 서울시 금천구 가산동 426-5 월드메르디앙 2차 413호 <br/> <a href="#"> ikosmo.co.kr</a></p>
    
        <ul class="nav col-md-4 justify-content-end mr-4">
            <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Home</a></li>
        </ul>
    </footer>
</body>
<script>
	function isDelete(){
		if(confirm("삭제하시겠습니까?")){
			location.replace("<c:url value="/board/Delete.do?no=${result.NO}"/>");
		}
	}
</script>