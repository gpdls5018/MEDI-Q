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
    <title>MEDI Q</title>
    <style>
    	.qna_banner{
        	width:75%;
        	height:280px;
        	background-color:#FDCDBC;
            border-radius: 30px;
		}
		.qna_title{
			position:relative;
        	top:calc(100vh - 96vh);
        	left:10%;
        	color:white;
        	margin:0px;
        }
        .qna_img{
            position:absolute;
            width: 200px;
            top:calc(100vh - 85vh);
            right:20%;
        }
		.text_1{
			font-size:70px;
			font-weight:bold;
		}
		.text_2{
			font-size:30px;
			font-weight:bold;
		}
		.btn_deco{
			background: linear-gradient(180deg,#fd9068,#fbc1ab);
		}
    </style>
</head>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<body>
    <main>
		<div class="d-flex justify-content-center" style="padding-top:120px;">
	        <div class="qna_banner">
	            <div class="qna_title">
	                <p class="text_1 m-0">Q &amp; A</p>
	                <span class="text_2 m-0">답답했던 영양제의 모든 것!</span>
	            	<p class="text_2">전문가에게 물어보세요</p>
	            </div>
	            <img src="<c:url value="/resources/images/qna/pharm.png"/>" class="qna_img">
			</div>
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
                                <label><kbd class="lead text_2 btn_deco">제목</kbd></label>
                                <input type="hidden" name="no" value="${empty record.NO ? param.NO :record.NO}" />
                                <input type="text"  value='${record.TITLE}${param.TITLE}' class="form-control" placeholder="제목을 입력하세요" name="title">
                            </div>
                            <div class="form-group">
                                <label><kbd class="lead text_2 btn_deco">내용</kbd></label>
                                <textarea class="form-control" rows="15" name="content">${record.CONTENT}${param.CONTENT }</textarea>
                            </div>
                            <button type="submit" class="btn btn-light text-light text_2 btn_deco">수정</button>
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