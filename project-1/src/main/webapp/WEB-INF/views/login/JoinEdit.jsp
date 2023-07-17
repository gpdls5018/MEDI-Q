<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
	input[type='date']::before {
	  content: attr(data-placeholder);
	  width: 100%;
	}
</style>
<div class="container" style="margin-top: 80px">
	<div class="container">
		<div class="row d-flex justify-content-center align-items-center vh-100">
			<div class="col-md-6 mb-4">
				<h3 class="heading mb-4">내 정보 수정하기</h3>
				<p>
				<span class="text-info" style="font-size: 1.3rem">${empty info.id ? info.email : info.id }</span>님 안녕하세요!<br/>
				회원정보 수정 양식을 입력해주세요
				</p>
				<p>
					<img src="<c:url value="/resources/images/basic/joinEdit.jpg"/>" alt="Image" class="img-fluid"/>
				</p>
			</div>
			<div class="col-md-6 d-flex align-items-center mt-3">
				<form class="mb-5 needs-validation" action="<c:url value="/project/JoinEditOk.do" />" method="post" id="contactForm" novalidate>
					<input type="hidden" name="mode" value="edit"/>
					<div class="row"><!-- 소셜 멤버일 경우 아이디랑 이메일 막아야함!!!!!! -->
						<div class="col-md-12 form-group">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="d-flex">
								<input style="max-width: 300px;" type="text" class="form-control" placeholder="아이디" id="id" name="id" value="${member.id }" readonly/> 
							</div>
							<input style="max-width: 300px;" type="password" class="form-control my-1" id="password" placeholder="비밀번호" name="password" required/>
							<input style="max-width: 300px;" type="password" class="form-control" id="pwd" placeholder="확인용 비밀번호" name="pwd" required/>							
							<input style="max-width: 300px;" type="text" class="form-control my-1" id="email" placeholder="이메일" name="email" value="${member.email }" readonly/>
							
							<!-- 글자색 빨간색, bold 주기 -->
							<div id="idOK" style="display:none">아이디 6~12자의 영문(소문자),숫자만 입력하세요</div>
							<div id="passwordOK" style="display:none">비밀번호 8~16자의 영문(대/소문자),숫자,특수문자를 입력하세요</div>
							<div id="pwdOK" style="display:none">동일한 비밀번호가 아닙니다</div>
							<div id="emailOK" style="display:none">잘못된 이메일 형식입니다</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group"> 
							<input style="max-width: 300px;" type="text" class="form-control" id="name" placeholder="이름" name="name" value="${member.name }" required/>
							<!-- 정규표현식에 맞게 문구변경 -->
							<c:set var="userBirth" value="${fn:split(member.birth,' ')[0] }"/>
							<input style="max-width: 300px;" type="date" class="form-control my-1" id="birth" name="birth" value="${userBirth }" data-placeholder="${userBirth }" required aria-required="true"/>
							<div class="d-flex align-items-center">
								<div class="custom-control custom-radio"><!-- radio box도 무조건 required??? -->
									<input type="radio" class="custom-control-input" name="gender" id="male" value="M" ${member.gender eq "M" ? "checked" :"" } required/>
									<label class="custom-control-label mr-3" for="male">남자</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="gender" id="female" value="F" ${member.gender eq "F" ? "checked" :"" }/> 
									<label class="custom-control-label" for="female">여자</label>
								</div>
							</div>
							
							<div id="nameOK" style="display:none">한글이름 2글자 이상 입력해주세요</div>
							<div id="birthOK" style="display:none">생년월일을 선택해주세요</div>
							<div id="genderOK" style="display:none">성별을 선택해주세요</div>
						</div>
					</div>
					<button type="submit" class="btn btn-outline-primary">확인</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
<script>
	//캘린더 값이 변경될 때 바로 변하도록(data-placeholder 때문)
	var birth = document.querySelector('input[type=date]');
	birth.onchange = function(){
		if(birth.value != '생년월일'){
			console.log(birth.value)
			birth.dataset.placeholder = birth.value;
		}
	}
	
	//change로 유효성 확인하기
	var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#\$%\^&\*\(\)\+\|\=\-])[A-Za-z\d~!@#\$%\^&\*\(\)\+\|\=\-]{8,16}$/;
	var reg_email = /^(?=.*[A-Za-z])(?=.*\d)[a-z][a-z0-9]{5,11}@[a-z]{3,8}\.(com|net|co\.kr)$/;
	var reg_name = /^(?=.*[가-힣])[가-힣]{2,}/;
	
	var passwordFlag = false;
	$('#password').on('input',function(){
		if($(this).val()==undefined || !$(this).val().length){
			passwordFlag = false;
		}
		if(!reg_pwd.test($(this).val())){
			passwordFlag = false;
			$('#passwordOK').html('비밀번호 8~16자의 영문(대/소문자),숫자,특수문자를 입력하세요').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
		}
		else{
			passwordFlag = true;
			$('#passwordOK').html('사용가능한 비밀번호입니다').css({'display':'','color':'blue','font-size':'small','font-weight':'bold'});
		}
	})////////////
	
	var pwdFlag = false;
	$('#pwd').on('input',function(){
		if($('#password').val() !== $(this).val()){
			pwdFlag = false;
			$('#pwdOK').html('입력한 비밀번호와 다릅니다').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
		}
		else{
			pwdFlag = true;
			$('#pwdOK').html('입력한 비밀번호와 동일합니다').css({'display':'','color':'blue','font-size':'small','font-weight':'bold'});
		}
	})//////////////////
	
	var emailFlag = false;
	$('#email').on('input',function(){
		if($(this).val()==undefined || !$(this).val().length){
			emailFlag = false;
		}
		if(!reg_email.test($(this).val())){
			emailFlag = false;
			$('#emailOK').html('잘못된 이메일 형식입니다').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
		}
		else{
			emailFlag = true;
			$('#emailOK').html('사용가능한 이메일입니다').css({'display':'','color':'blue','font-size':'small','font-weight':'bold'});
		}
	})////////////
	
	var nameFlag = false;
	$('#name').on('input',function(){
		if($(this).val()==undefined || !$(this).val().length){
			nameFlag = false;
		}
		if(!reg_name.test($(this).val())){
			nameFlag = false;
			$('#nameOK').html('한글이름 2글자 이상 입력해주세요').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
		}
		else{
			nameFlag = true;
			$('#nameOK').html('사용가능한 이름입니다').css({'display':'','color':'blue','font-size':'small','font-weight':'bold'});
		}
	})/////////////
	
	//자바스크립트 유효성 검사
	document.forms[0].onsubmit = function(e){
		
		var isValidate = false;
		if(!this.checkValidity()){
            this.classList.add('was-validated'); //div에 지정한 valid/invalid 메시지 뿌리기 위해
            
            if(!$('#password').val()){
            	$('#passwordOK').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#passwordOK').css('display','none');
            	isValidate = true;
            }
            if(!$('#pwd').val()){
            	$('#pwdOK').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#pwdOK').css('display','none');
            	isValidate = true;
            }
            if(!$('#email').val()){
            	$('#emailOK').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#emailOK').css('display','none');
            	isValidate = true;
            }
            if(!$('#name').val()){
            	$('#nameOK').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#nameOK').css('display','none');
            	isValidate = true;
            }
            if(!$('#birth').val()){
            	$('#birthOK').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#birthOK').css('display','none');
            	isValidate = true;
            }
            //성별 선택시 오류 내용 뜨지않도록 수정
            var isGender = false;
            //console.log($('input[name=gender]:checked').val())
            if(!$('input[name=gender]:checked').val()){
            	$('#genderOK').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#genderOK').css('display','none');
            	isValidate = true;
            }
        	
            
            if(!isValidate){
            	return false; //submit 이벤트 취소
            }
            else{
            	return false;
            }
            return true;
        }        
	};
	
</script>
</html>