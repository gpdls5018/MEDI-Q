<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">

<style>
	#drawing_canvas {
	        position: absolute;
	        margin: auto;
	        width: 512px;
	        height: 350px;
	        top: 0;
	        bottom: 0;
	        left: 0;
	        right: 0;
	    }
    .effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    
/*ts 스타일 공간*/
body {
	background-color: #fdfbf6;
}
.my-title {
	position: relative;
	background-image:
		url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	margin-top: 70px;
}

/* Custom CSS for horizontal radio buttons */
    .horizontal-radio {
        display: flex;
        flex-direction: row;
    }

    .horizontal-radio .form-check {
        margin-right: 10px; /* Adjust the spacing between radio buttons */
    }



</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1100px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px;">인공지능을 통한<br/> <span style="color:#EF605D;">질병 예측 예방 시스템 구축</span></div>
		</div>
		<div class="container effect-custom-font" >
		    <div class="mx-5 my-5 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7);">뇌졸중 수치 예측하기</div>
			<div class="model-score  mx-2 mt-4" style="width:80%;height:80px;background-color:">※현재 머신러닝의 예측 정확도는 약 <kbd>85%</kbd> 입니다</div>
		    <div class="row">
		        <div class="col-6">
		            <form id="personInfoForm" class="validation-form" method="post" novalidate>
		                <div class="col mb-3">
		                    <strong>연령</strong>
		                    <input type="text" class="form-control" id="age" name="age" pattern="[0-9]+" placeholder="나이를 입력해주세요" value="" required>
		                    <div class="invalid-feedback">
		                        나이을 입력해주세요.
		                    </div>
		                </div>
		                <div class="col mb-3">
		                    <strong>성별</strong>
		                    <div class="horizontal-radio">
			                    <div class="form-check">
								    <input class="form-check-input" type="radio" name="gender" id="gender_Man" value="Male">
								    <label class="form-check-label" for="gender_Man">
								    남성
								    </label>
								</div>
								<div class="form-check">
								    <input class="form-check-input" type="radio" name="gender" id="gender_Woman" value="Female">
								    <label class="form-check-label" for="gender_Woman">
								    여성
								    </label>
								</div>
							</div>
		                    <div class="invalid-feedback">
		                        성별을 체크해 주세요
		                    </div>
		                </div>
		                <div class="col mb-3">
		                    <strong>혈당</strong>
		                    <input type="text" class="form-control" id="glucose" name="glucose" placeholder="혈당 수치를 입력해주세요" value="${healthInfoDto.bloodSugar}" required>
		                    <div class="invalid-feedback">
		                        혈당 수치를 입력해주세요
		                    </div>
		                </div>
						<div class="col mb-3">
						    <strong>결혼 여부</strong>
						    <div class="horizontal-radio">
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="everMarried" id="everMarriedYes" value="Yes">
							        <label class="form-check-label" for="everMarriedYes">예</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="everMarried" id="everMarriedNo" value="No">
							        <label class="form-check-label" for="everMarriedNo">아니오</label>
							    </div>
							</div>
						</div>
						
						<div class="col mb-3">
						    <strong>직업 유형</strong>
						    <div class="horizontal-radio">
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypePrivate" value="Private">
							        <label class="form-check-label" for="workTypePrivate">사기업</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeSelfEmployed" value="Self-employed">
							        <label class="form-check-label" for="workTypeSelfEmployed">자영업</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeGovt" value="Govt_job">
							        <label class="form-check-label" for="workTypeGovt">공기업</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeChildren" value="children">
							        <label class="form-check-label" for="workTypeChildren">아동</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeNeverWorked" value="Never_worked">
							        <label class="form-check-label" for="workTypeNeverWorked">무직</label>
							    </div>
						    </div>
						</div>
						<div class="col mb-3">
						    <strong>거주 유형</strong>
						    <div class="horizontal-radio">
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="residenceType" id="residenceTypeRural" value="Urban">
							        <label class="form-check-label" for="residenceTypeRural">도시</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="residenceType" id="residenceTypeUrban" value="Rural">
							        <label class="form-check-label" for="residenceTypeUrban">시골</label>
							    </div>
						    </div>
						</div>
		                
		                <hr class="mb-4">
		                <div class="mb-4"></div>
		                <button class="btn btn-primary btn-lg btn-block" type="submit" data-bs-toggle="modal" data-bs-target="#predictionModal">예측해보기</button>
		            </form>
		        </div>
		
		        <div class="col-6">
		            <!--<canvas id="drawing_canvas"></canvas>-->
		            <img src="https://blog.kakaocdn.net/dn/bsaKv7/btqENswXzXV/4SrX3MKFb0dUvOICnKg0y0/img.gif" id="machineImage" style="width:100%;height:100%;border-radius:20px;padding: 0px 50px 0px 50px;"/>
		        </div>
		    </div>
		    <div class="effect-custom-font m-5 py-5">
		    	<div class="title mb-5" style="font-size:30px;">
		    		<img src="<c:url value="/images/mainicon.png"/>" style="width:30px;height:30px;">
		    		<img src="<c:url value="/images/maintitle.png"/>" style="height:30px;">
												와 다른 질병을 예측해 보아요!</div>
		    		<div class="p-2" style="cursor: pointer;border-radius:40px;font-size:20px;background-color:#ff9558; font-weight: bold; text-align: center;" onclick='redirectToPrediction()'>다른 질병 예측하러 가기</div>
		    </div>
		</div>
	</div>
	
	
	<div class="modal fade" id="predictionModal" tabindex="-1" aria-labelledby="predictionModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" style="max-width:800px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="predictionModalLabel" style="">뇌졸증 예측 결과</h5>
	      </div>
	      <div class="modal-body">
		      <div class="row" style="flex-grow: 1; display: flex;">
		        <div  class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; text-align:center; align-items: center; justify-content: center; font-size: 40px; font-weight: bold;" id="predictionResultText">
		        	<canvas id="drawing_canvas"></canvas>
		        </div>
		        <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
					<ul class="pakinul">
                		<li class="text-center" style="font-weight:bold; font-size: 25px; margin-bottom: 40px; margin-top: 0px;"><b>뇌졸증 진단과정</b></li>
                    	<li><span></span>MEDI-Q는 파킨슨병 진행시 발생하는 <b style="color: #EF605D">중추신경계 손상에 의한 떨림 증상을 기반으로</b> 머신러닝 알고리즘이 수집된 데이터를 분석하여 건강상태를 확인합니다.</li>
                    	<li><span></span>사용자의 손떨림을 모니터링하고, 그림판에 <b style="color: #EF605D">그린 나선을 분석하여 현재 파킨슨병 진행상황을 예측합니다.</b></li>
                    	<li><span></span>나선 그리기 진단시스템을 이용해 환자와 의료 전문가는 증상 변화를 빠르게 파악하고 치료 계획을 조정할 수 있습니다.</li>
                	</ul>		            
                </div>
		     </div>
		 </div>
		  <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
	function redirectToPrediction() {
	    // 여기에 이동할 URL을 설정합니다.
	    var url = "<c:url value='/MachineLearn.do'/>"; // 해당 부분에 실제 URL을 입력합니다.
	    window.location.href = url;
	}
	    $(document).ready(function() {
	    	$('#personInfoForm').submit(function (event) {
	            event.preventDefault();
	            event.stopImmediatePropagation();
	            
	            var forms = document.getElementsByClassName('validation-form');
	            Array.prototype.filter.call(forms, (form) => {
	                if (form.checkValidity() === false) {
	                    Swal.fire({
	                        icon: 'error',
	                        title: 'Oops...',
	                        text: '다시한번 확인해 주세요!',
	                    });
	                } else {
	                    var age = $('#age').val();
	                    var gender = $("input[name='gender']:checked").val();
	                    var glucose = $('#glucose').val();
	                    var everMarried = $("input[name='everMarried']:checked").val();
	                    var workType = $("input[name='workType']:checked").val();
	                    var residenceType = $("input[name='residenceType']:checked").val();
	                    $('.model-score').hide();
	                    const Toast = Swal.mixin({
	                        toast: true,
	                        position: 'center-center',
	                        showConfirmButton: false,
	                        timer: 1500,
	                        timerProgressBar: true,
	                        didOpen: (toast) => {
	                            toast.addEventListener('mouseenter', Swal.stopTimer)
	                            toast.addEventListener('mouseleave', Swal.resumeTimer)
	                        }
	                    });
	                    Toast.fire({
	                        icon: 'success',
	                        title: '모델이 예측 중입니다'
	                    });
	                    setTimeout(function () {
	                        var data = {
	                            "age": age,
	                            "avg_glucose_level": glucose,
	                            "gender" : gender,
	                            "ever_married": everMarried,
	                            "work_type": workType,
	                            "Residence_type": residenceType
	                        }
	                        console.log(data)
	                        $.ajax({
	                            type: 'POST',
	                            url: "http://localhost:5000/StrokeModel",
	                            //url: "http://192.168.0.16/stroke",
	                            contentType : "application/json",
	                            dataType: 'json',
	                            data: JSON.stringify(data),
	                            success: function (response) {
	                            	var predictionResult =  (response[0][1]*100).toFixed(1);
	                            	var predictionResultText = document.getElementById('predictionResultText');
	                                predictionResultText.textContent ='발병확률'+ predictionResult+' %';
	                     
	                            	var predictionModal = new bootstrap.Modal(document.getElementById('predictionModal'));
	                            	predictionModal.show();
	                            }
	                        });
	                    }, 1500);
                }
                form.classList.add('was-validated');
            });
        });
    });

	</script>
	</body>
</html>