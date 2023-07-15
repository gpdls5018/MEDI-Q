<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <title>MEDI Q</title>
    <style>
        figure{
            width: 100%;
            height: 400px;
            background: #FDCDBC;
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
            font-size: 20px;
        }
        .text2{
            font-size: 17px;
        }
        .text3{
            font-size: 30px;
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
</head>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<body>
    <main>
        <div class="container-fluid">
            <figure>
                <img src="<c:url value="/resources/images/qna/pharm.png"/>">
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
                <c:if test="${! empty InputError}">
					<div class="alert alert-success alert-dismissible fade show">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>Failure!</strong> ${InputError}
					</div>
				</c:if>
                <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="col">
                        <form method="post" action="/board/EditProcess.do">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="form-group">
                                <label><kbd class="lead bg-success text3" style="background:linear-gradient(0deg,#ffa585,#fedacd);">제목</kbd></label>
                                <input type="hidden" name="no" value="${empty record.NO ? param.NO :record.NO}" />
                                <input type="text"  value='${record.TITLE}${param.TITLE}' class="form-control" placeholder="제목을 입력하세요" name="title">
                            </div>
                            <div class="form-group">
                                <label><kbd class="lead bg-success text3" style="background:linear-gradient(0deg,#ffa585,#fedacd);">내용</kbd></label>
                                <textarea class="form-control" rows="15" name="content">${record.CONTENT}${param.CONTENT }</textarea>
                            </div>
                            <button type="submit" class="btn btn-light text-light text1"style="background:linear-gradient(0deg,#ffa585,#fedacd);">수정</button>
                        </form>
                    </div>
                </div>
                <div class="d-flex col-2 flex-wrap align-content-stretch">
                </div>
            </div>
        </div>
    </main>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>