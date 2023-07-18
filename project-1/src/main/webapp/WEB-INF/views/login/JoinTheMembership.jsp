<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
	input[type='date']::before {
	  content: attr(data-placeholder);
	  width: 100%;
	}
	
	/* 약관동의 */
	.register__step__wr {
	    align-items: center;
	    margin-bottom: 50px;
	    margin-top: 120px;
	}
	
	.register__step__wr .step__wr {
	    display: flex;
	    justify-content: space-around;
	    position: relative;
	}
	.register__step__wr .step__wr .line01 {
	    left: 33.5%;
	    transform: translateX(-50%);
	}
	.register__step__wr .step__wr .line02 {
	    right: 33.5%;
	    transform: translateX(50%);
	}
	.register__step__wr .step__wr .line03 {
	    right: 33.5%;
	    transform: translateX(50%);
	}
	.register__step__wr .step__wr .line04 {
	    right: 33.5%;
	    transform: translateX(50%);
	}
	.register__step__wr .step__wr .line00 {
	    position: absolute;
	    top: 16px;
	    m
	}
	.register__step__wr .step__wr .step00 {
	    text-align: center;
	}
	.register__step__wr .step__wr .step00.on .step__check {
	    opacity: 1;
	}
	.register__step__wr .step__wr .step00 .step__check {
	    display: inline-block;
	    width: 75px;
	    height: 75px;
	    border-radius: 50%;
	    background-color: #EF605D;
	    position: relative;
	    margin-bottom: 18px;
	    opacity: 0.09;
	}
	.register__step__wr .step__wr .step00 .step__check img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    opacity: 0;
	}
	.register__step__wr .step__wr .on .step__check img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    opacity: 1;
	    width: 20px;
	}
	
	.register__step__wr .step__wr .step00 .step {
	    color: #152358;
	    font-size: 14px;
	    font-weight: 700;
	    color: #BEBED5;
	}
	.register__step__wr .step__wr .step00.on .step__info {
	    color: #152358;
	}
	.register__step__wr .step__wr .step00 .step__info {
	    font-size: 20px;
	    font-weight: 700;
	    color: #BEBED5;
	}
	.line00{
		margin-top: 20px;
	}
	.first-line{
		padding-right: 106px;
	}
	.second-line{
		padding-right: 580px;
	}
	.third-line {
		padding-left: 136px;
	}
	.left-center{
		margin-left: 70px;
	}
	.right-center{
		margin-left: 120px;
	}
	.bottom-button{
		margin-bottom: 140px;
		border-color :#EF605D;
		background-color: #EF605D; 
		color: #fff; 
		width: 120px;
		height: 45px;
	}
</style>
<div class="container" style="margin-top: 40px">
	<div class="container">
		<div class="register__step__wr hidden1024" style="width: 100%;">
	        <div class="step__wr d-flex">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line01 first-line">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line02 second-line">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line03 first-line">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line04 third-line">
	            <div class="step00 step01 on">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 01</p>
	                <p class="step__info">약관동의</p>
	            </div>
	            <div class="step00 step02">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 02</p>
	                <p class="step__info">정보입력</p>
	            </div>
	            <div class="step00 step03">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 03</p>
	                <p class="step__info">가입완료</p>
	            </div>
	        </div>
	    </div>
		<div class="row d-flex justify-content-center align-items-center">
			<div class="col-md-6 mb-4">
				<h3 class="heading mb-4 left-center">회원가입</h3>
				<p class="left-center">
				반갑습니다!<br/>
				회원가입을 위한 양식을 입력해주세요
				</p>
				<p>
					<img src="<c:url value="/resources/images/basic/join.jpg"/>" alt="Image" class="img-fluid left-center"/>
				</p>
			</div>
			<div class="col-md-6 d-flex align-items-center mt-3">
				<form class="mb-5 needs-validation right-center" action="<c:url value="/project/Join.do" />" method="post" id="contactForm" novalidate>
					<div class="row">
						<div class="col-md-12 form-group">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="d-flex">
								<input style="max-width: 300px;" type="text" class="form-control" placeholder="아이디" id="id" name="id" required/> 
								<input type="button" id="idCheck" value="중복 체크" class="btn btn-outline-info ml-2"/>
							</div>
							<input style="max-width: 300px;" type="password" class="form-control my-1" id="password" placeholder="비밀번호" name="password" required/>
							<input style="max-width: 300px;" type="password" class="form-control" id="pwd" placeholder="확인용 비밀번호" name="pwd" required/>
							
							<!-- 글자색 빨간색, bold 주기 -->
							<div id="idOK" style="display:none">아이디 6~12자의 영문(소문자),숫자만 입력하세요</div>
							<div id="passwordOK" style="display:none">비밀번호 8~16자의 영문(대/소문자),숫자,특수문자를 입력하세요</div>
							<div id="pwdOK" style="display:none">입력한 비밀번호와 다릅니다</div>
							<div id="idCheckOK" style="display:none">사용 가능한 아이디입니다</div>
							<div id="idCheckFail" style="display:none">중복된 아이디입니다</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<div class="d-flex">
								<input style="max-width: 300px;" type="text" class="form-control" placeholder="이메일" id="email" name="email" required/> 
								<input type="button" id="mailNumBtn" value="인증번호 전송" class="btn btn-outline-info ml-2"/>
							</div>
							<input style="max-width: 300px;" type="text" class="form-control my-1" id="mailNum" placeholder="인증번호" name="mailNum" required/>
						
							<div id="emailOK" style="display:none">잘못된 이메일 형식입니다</div>
							<div id="mailNumOK" style="display:none">인증번호를 입력해주세요</div>
							<div id="mailNumCheckOK" style="display:none">인증번호가 확인되었습니다</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group"> 
							<input style="max-width: 300px;" type="text" class="form-control" id="name" placeholder="이름" name="name" required/>
							<!-- 정규표현식에 맞게 문구변경 -->
							<input style="max-width: 300px;" type="date" class="form-control my-1" id="birth" name="birth" data-placeholder="생년월일" required aria-required="true"/>
							<div class="d-flex align-items-center">
								<div class="custom-control custom-radio"><!-- radio box도 무조건 required??? -->
									<input type="radio" class="custom-control-input" name="gender" id="male" value="M" required/>
									<label class="custom-control-label mr-3" for="male">남자</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="gender" id="female" value="F"/> 
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
				<button type="submit" class="btn bottom-button mr-3">이전</button>
				<button type="submit" class="btn bottom-button ml-3">다음</button>
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
	
	//아이디 중복 체크
	$('#idCheck').click(function(){
		//var id = $('#id').val();
		console.log($('#id').val());
		$.ajax({
			url:'<c:url value="/project/IdCheck.do"/>',//요청을 보낼 URL
			method:'post',//요청에 사용할 HTTP 메서드
			data:{id:$('#id').val()},//요청과 함께 전송할 데이터 //자스에서는 반드시 문자열로 바꿔서 전송해야함!!
			dataType:'json' //응답받을 데이터 타입
			
		}).done(data=>{
			console.log('중복체크 성공',data);
			console.log('isDuplicate',data.isDuplicate);
			if(data.isDuplicate){//id 중복
				$('#idOK').html('중복된 아이디입니다').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
			}
			else{
				$('#idOK').html('사용가능한 아이디입니다').css({'display':'','color':'blue','font-size':'small','font-weight':'bold'});
			}
		}).fail(error=>{
			console.log('중복체크 실패');
		});
	});
	
	//이메일 인증번호 전송
	$('#mailNumBtn').click(function(){
		//console.log('click')
		$.ajax({
			url:'<c:url value="/project/mailConfirm.do"/>',//요청을 보낼 URL
			method:'post',//요청에 사용할 HTTP 메서드
			data:{email:$('#email').val()},//요청과 함께 전송할 데이터 //자스에서는 반드시 문자열로 바꿔서 전송해야함!!
			dataType:'json' //응답받을 데이터 타입
		}).done(function(data){
			console.log('success',data.code);
			alert('해당 이메일로 인증코드를 발송했습니다\r\n인증코드를 입력해주세요');
			mailNumCheck(data.code);
		}).fail(function(){
			console.log('error');
			alert('이메일 입력 후 클릭해주세요');
		});
	});
	
	function mailNumCheck(code){
		console.log('입장')
		$('#mailNum').on('input',function(){
			if($('#mailNum').val()==code){//인증코드 입력 시
				isValidate = true;
				$('#mailNumCheckOK').html('인증번호가 확인되었습니다').css({'display':'','color':'blue','font-size':'small','font-weight':'bold'});
			}
			else{
				isValidate = false;
				$('#mailNumCheckOK').html('동일한 인증번호가 아닙니다').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
			}
		})
	};
	
	//change로 유효성 확인하기
	var reg_id = /^(?=.*[A-Za-z])(?=.*\d)[a-z][a-z0-9]{5,11}$/;
	var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#\$%\^&\*\(\)\+\|\=\-])[A-Za-z\d~!@#\$%\^&\*\(\)\+\|\=\-]{8,16}$/;
	var reg_email = /^(?=.*[A-Za-z])(?=.*\d)[a-z][a-z0-9]{5,11}@[a-z]{3,8}\.(com|net|co\.kr)$/;
	var reg_name = /[가-힣]{2,}/;
	
	var idFlag = false;
	$('#id').on('input',function(){
		if($(this).val()==undefined || !$(this).val().length){
			idFlag = false;
		}
		if(!reg_id.test($('#id').val())){
			idFlag = false;
			$('#idOK').html('아이디 6~12자의 영문(소문자),숫자만 입력하세요').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
		}
		else{
			idFlag = true;
			$('#idOK').html('사용가능한 아이디형식입니다').css({'display':'','color':'blue','font-size':'small','font-weight':'bold'});
		}
	})////////////
	
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
			$('#nameOK').html('');
		}
	})/////////////
	
	var isValidate = false;//유효성 검사
	//자바스크립트 유효성 검사
	document.forms[0].onsubmit = function(e){
		
		if(!this.checkValidity()){
            this.classList.add('was-validated'); //div에 지정한 valid/invalid 메시지 뿌리기 위해
            
            if(!$('#id').val()){
            	$('#idOK').html('아이디 6~12자의 영문(소문자),숫자만 입력하세요').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#idOK').css('display','none');
            	isValidate = true;
            }
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
            if(!$('#mailNum').val()){
            	$('#mailNumOK').css({'display':'','color':'red','font-size':'small','font-weight':'bold'});
            	isValidate = false;
            }
            else{
            	$('#mailNumOK').css('display','none');
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