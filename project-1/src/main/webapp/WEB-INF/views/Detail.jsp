<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
    table.type09 {
        border-collapse: collapse;
        text-align: left;
        line-height: 1.5;

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
</style>

<div class="container">
    <div class="row no-gutters">
        <h1 class="display-4 mt-5" style="background-color: lightsteelblue;width:100%">${listOne.productName}</h1>
        <div class="col-8">
            <table class="type09 mt-3">
                <thead>
                <tr>
                    <th scope="cols">타이틀</th>
                    <th scope="cols">내용</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">등록번호</th>
                    <td>${listOne.postNo}</td>
                </tr>
                <tr>
                    <th scope="row">회사명</th>
                    <td>${listOne.company}</td>
                </tr>
                <tr>
                    <th scope="row">유통기한</th>
                    <td>${listOne.expiration}</td>
                </tr>
                <tr>
                    <th scope="row">형태</th>
                    <td>
                        <c:choose>
                            <c:when test="${listOne.shape eq '정제'}">
                                <img src="<c:url value="resources/images/shape/정제.png"/>" style="width:100px;height:100px;"/><br>
                                정제
                            </c:when>
                            <c:when test="${listOne.shape eq '과립'}">
                                <img src="<c:url value="resources/images/shape/과립.png"/>" style="width:100px;height:100px;"/><br>
                                과립
                            </c:when>
                            <c:when test="${listOne.shape eq '바'}">
                                <img src="<c:url value="resources/images/shape/바.png"/>" style="width:100px;height:100px;"/><br>
                                바
                            </c:when>
                            <c:when test="${listOne.shape eq '분말'}">
                                <img src="<c:url value="resources/images/shape/분말.png"/>" style="width:100px;height:100px;"/><br>
                                분말
                            </c:when>
                            <c:when test="${listOne.shape eq '시럽'}">
                                <img src="<c:url value="resources/images/shape/시럽.png"/>" style="width:100px;height:100px;"/><br>
                                시럽
                            </c:when>
                            <c:when test="${listOne.shape eq '캡슐'}">
                                <img src="<c:url value="resources/images/shape/캡슐.png"/>" style="width:100px;height:100px;"/><br>
                                캡슐
                            </c:when>
                            <c:when test="${listOne.shape eq '환'}">
                                <img src="<c:url value="resources/images/shape/환.png"/>" style="width:100px;height:100px;"/><br>
                                환
                            </c:when>
                            <c:when test="${listOne.shape eq '젤리'}">
                                <img src="<c:url value="resources/images/shape/젤리.png"/>" style="width:100px;height:100px;"/><br>
                                <span style="font-weight: bold;">젤리</span>
                            </c:when>
                            <c:when test="${listOne.shape eq '액상'}">
                                <img src="<c:url value="resources/images/shape/액상.png"/>" style="width:100px;height:100px;"/><br>
                                액상
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <th scope="row">복용방법</th>
                    <td>${fn:replace(listOne.intake,'$',',')}</td>
                </tr>
                <tr>
                    <th scope="row">규격</th>
                    <td>${fn:replace(listOne.standard,'$',',')}</td>
                </tr>
                <tr>
                    <th scope="row">주의사항</th>
                    <td>${listOne.caution}</td>
                </tr>
                <tr>
                    <th scope="row">성분</th>
                    <c:set var="nutrientList" value="${fn:split(listOne.nutrient, '$')}" />
                    <td>
                        <c:forEach items="${nutrientList}" var="item">
                            <span class="badge badge-warning">${item}</span>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th scope="row">기능성 정보</th>
                    <c:set var="materialList" value="${fn:split(listOne.material, '$')}" />
                    <td>
                        <c:forEach items="${materialList}" var="item">
                            <span class="badge badge-danger">${item}</span>
                        </c:forEach>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-2">
            <div class="container-fluid m-5">
                <div style="width:400px;height:400px;">
                    <canvas id="line-chart" width="200" height="250"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
   

</script>


<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
