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
    .tss {
        display: flex;
        flex-direction: row;
        font-size: 16px;
        align-items: center;
       
    }
    .form-check {
    	 margin-right: 30px;
    }
    strong {
    	font-size: 24px;
    	font-weight: 500;
		vertical-align: middle;
    }

</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1100px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px;">인공지능을 통한<br/> <span style="color:#EF605D;">질병 예측 예방 시스템 구축</span></div>
		</div>

		<div class="container effect-custom-font" >
		    <div class="mx-5 mt-1 mb-5 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7);">심장질환 수치 예측하기</div>
			<div class="model-score m-4" style="width:80%;height:80px;background-color:">※현재 머신러닝의 예측 정확도는 약 <kbd>70%</kbd> 입니다</div>
		    <div class="row">
		        <div class="col-6">
		            <form id="personInfoForm" class="validation-form" novalidate>
	                    <strong style="margin:20px;">성별</strong>
	                    <div class="tss col ">
		                    <div class="form-check">
							  <input class="form-check-input" type="radio" name="gender" id="gender_Man" value="2">
							  <label class="form-check-label" for="gender_Man">
							    남성
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="gender" id="gender_Woman" value="1">
							  <label class="form-check-label" for="gender_Woman">
							    여성
							  </label>
							</div>
		                    <div class="invalid-feedback">
		                        성별을 체크해 주세요
		                    </div>
	                	</div>
		                <div class="col ">
		                    <strong>신장</strong>
		                    <div class="row" style="font-size: 24px;">
		                    	<input type="text" class="form-control m-2 w-50" style="text-align: right;" id="height" name="height" placeholder="신장을 입력해주세요" value="${healthInfoDto.height}" required>cm
		                    </div>
		                    <div class="invalid-feedback">
		                        신장을 입력해주세요
		                    </div>
		                </div>
		                <div class="col ">
		                    <strong>몸무게</strong>
		                    <div class="row" style="font-size: 24px;">
		                    	<input type="text" class="form-control  m-2 w-50" style="text-align: right;" id="weight" name="weight" placeholder="몸무게를 입력해주세요" value="${healthInfoDto.weight}" required>kg
		                    </div>
		                    <div class="invalid-feedback">
		                        몸무게를 입력해주세요
		                    </div>
		                </div>
		                <div class="col ">
		                    <strong>혈압(최저/최고)</strong>
		                    <div class="d-flex" style="font-size: 24px; margin-top:10px; align-items: center;">
		                    	<input type="text" class="form-control m-2 w-25" style="text-align: right;" id="bloodpress_low" name="bloodpress_low"  placeholder="최저혈압" value="${healthInfoDto.bloodPressure_low}" required> / 
			                    <input type="text" class="form-control m-2 w-25" style="text-align: right;" id="bloodpress_high" name="bloodpress_high"  placeholder="최고혈압" value="${healthInfoDto.bloodPressure_high}" required> 
		                    </div>
		                    <div class="invalid-feedback">
		                        혈압수치를 입력해주세요
		                    </div>
		                </div>
		                <div class="col ">
		                    <strong>콜레스테롤</strong>
		                    <div class="d-flex" style="font-size: 24px; margin-top:10px; align-items: center;">
		                    	<input type="text" class="form-control m-2 w-50" style="text-align: right;" id="total_cholesterol" name="total_cholesterol" placeholder="총 콜레스테롤 수치 입력" value="${healthInfoDto.total_cholesterol}" required>mg/dL
		                    </div>
		                    <div class="invalid-feedback">
		                        콜레스테롤 수치를 입력해주세요
		                    </div>
		                </div>
		                <div class="col ">
		                    <strong>포도당</strong>
		                    <div class="d-flex" style="font-size: 24px; margin-top:10px; align-items: center;">
		                    	<input type="text" class="form-control  m-2 w-50" style="text-align: right;" id="glucose" name="glucose" placeholder="포도당 수치를 입력해주세요" value="${healthInfoDto.bloodSugar}" required>mg/dL
		                    </div>
		                    <div class="invalid-feedback">
		                        포도당 수치를 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col my-3">
		                	<strong>흡연</strong>
		                	 <div class="tss col ">
				                <div class="form-check">
							  		<input class="form-check-input" type="radio" name="smoke_check" value="0">
								  	<label class="form-check-label" for="smoke_check">
									    흡연자입니다
								  	</label>
								</div>
								<div class="form-check">
							    	<input class="form-check-input" type="radio" name="smoke_check" value="1" >
								  	<label class="form-check-label" for="smoke_check">
									    비흡연자입니다
								  	</label>
								</div>
							</div>
			                <div class="invalid-feedback">
			                       흡연 유무를 체크해주세요
			                </div>
		                </div>
		                <div class="tss col my-3">
		                	<strong>음주</strong>
		                	 <div class="tss col ">
				                <div class="form-check">
							  		<input class="form-check-input" type="radio" name="alco_check" value="0">
								  	<label class="form-check-label" for="alco_check">
									    음주를 합니다
								  	</label>
								</div>
								<div class="form-check">
							    	<input class="form-check-input" type="radio" name="alco_check" value="1" >
								  	<label class="form-check-label" for="alco_check">
									    음주를 하지 않습니다
								  	</label>
								</div>
							</div>
			                <div class="invalid-feedback">
			                       음주 유무를 체크해주세요
			                </div>
		                </div>
		                <div class="col ">
		                    <strong>연령</strong>
		                    <div class="d-flex" style="font-size: 24px; margin-top:10px; align-items: center;">
		                    	<input type="text" class="form-control m-2 w-50" style="text-align: right;" id="age" name="age" placeholder="연령을 입력해주세요" value="" required> 세
		                    </div>
		                    <div class="invalid-feedback">
		                        연령을 입력해주세요
		                    </div>
		                </div>
		                <hr class="mb-4">
		                <div class="mb-4"></div>
		                <button class="btn btn-primary btn-lg btn-block" type="submit"  data-bs-toggle="modal" data-bs-target="#predictionModal">예측해보기</button>
		            </form>
		        </div>
		
		        <div class="col-6" style="position:relative; overflow: hidden; height: 100%; ">
		            <!--<canvas id="drawing_canvas"></canvas>-->
		            <div style="position:absolute;  background-color: white;  width:130px; z-index:2;  height: 100px; right: 40px; top:600px;"></div>
		            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA2MTZfNSAg%2FMDAxNjIzODE0NTc5OTAw.RztFNGolk64BQoDJpv4M3t0-lT1cKVQtU-Urf1bcORUg.fWYlmH_wG1OmHkQJsW9ywq8ooe8V2nYpvkEZHOsheuIg.PNG.leeheartwell%2F%25C8%25A4%25BD%25C3_%25B3%25AA%25B5%25B5_%25BD%25C9%25C7%25F7%25B0%25FC%25C1%25FA%25C8%25AF_%25C0%25DA%25B0%25A1%25C1%25F8%25B4%25DC%25B9%25FD_1.png&type=sc960_832" id="machineImage" style="display: block; margin: auto; position: relative; bottom:-20%; width:100%;height:700px; border-radius:12px;"/>
		        </div>
		    </div>
		    <hr class="mt-5">
		    <div class="effect-custom-font m-5 py-5">
		    	<div class="title mb-5" style="font-size:30px;">
		    		<img src="<c:url value="/images/mainicon.png"/>" style="width:30px;height:30px;">
		    		<img src="<c:url value="/images/maintitle.png"/>" style="height:30px;">
												와 다른 질병을 예측해 보아요!</div>
		    		<div class="p-2" style="cursor:pointer;border-radius:40px;font-size:20px;background-color:#ff9558; font-weight: bold; text-align: center;" onclick="redirectToPrediction()">다른 질병 예측하러 가기</div>
		    </div>
		</div>
	</div>
	
	<div class="modal fade" id="predictionModal" tabindex="-1" aria-labelledby="predictionModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" style="max-width:800px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="predictionModalLabel" style="">심혈관질환 예측 결과</h5>
	      </div>
	      <div class="modal-body">
		      <div class="row" style="flex-grow: 1; display: flex;">
		        <div  class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; text-align:center; align-items: center; justify-content: center; font-size: 40px; font-weight: bold;" id="predictionResultText">
		        	<canvas id="drawing_canvas"></canvas>
		        </div>
		        <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
					<ul class="pakinul">
                		<li class="text-center" style="font-weight:bold; font-size: 25px; margin-bottom: 40px; margin-top: 0px;"><b>심장질환 진단과정</b></li>
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
                	var gender = document.querySelector("input[name=gender]:checked").value;
                    var height = $('#height').val();
                    var weight = $('#weight').val();
                    var bloodpress_high = $('#bloodpress_high').val();
                    var bloodpress_low = $('#bloodpress_low').val();
                    var total_cholesterol = $('#total_cholesterol').val();
                    total_cholesterol = total_cholesterol <= 200 ? 1 : (total_cholesterol <= 240 ? 2 : 3);
                    var glucose = $('#glucose').val();
                    glucose = glucose <= 100 ? 1 : (glucose <= 125 ? 2 : 3);
                    var smoke = document.querySelector("input[name=smoke_check]:checked").value;
                    var alco = document.querySelector("input[name=alco_check]:checked").value;
                    var age = $('#age').val();
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
	                            "gender": gender,
	                            "height": height,
	                            "weight": weight,
	                            "bloodpress_high": bloodpress_high,
	                            "bloodpress_low": bloodpress_low,
	                            "total_cholesterol": total_cholesterol,
	                            "glucose": glucose,
	                            "smoke": smoke,
	                            "alco": alco,
	                            "age": age
	                        }
                    	
                        $.ajax({
                            type: 'POST',
                            url: 'http://192.168.0.16/cardiovascular',
                            contentType : "application/json",
                            dataType: 'json',
                            data: JSON.stringify(data),
                            success: function (response) {
                            	var predictionResult =  (response[0][1]*100).toFixed(1);
                            	var predictionResultText = document.getElementById('predictionResultText');
                                predictionResultText.textContent ='발병확률 '+ predictionResult+' %';
                     
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
    
    /* 
    console.log('%o',response);
    console.log(response[0])
    initDrawingCanvas((response[0][1]*100).toFixed(1));
    requestAnimationFrame(loop);
    $('#machineImage').hide();
                                
    const TWO_PI = Math.PI * 2;
    const HALF_PI = Math.PI * 0.5;

    // canvas settings
    var viewWidth = 512,
        viewHeight = 350,
        drawingCanvas = document.getElementById("drawing_canvas"),
        ctx,
        timeStep = (1/60),
        textValue;

    Point = function(x, y) {
        this.x = x || 0;
        this.y = y || 0;
    };

    Particle = function(p0, p1, p2, p3) {
        this.p0 = p0;
        this.p1 = p1;
        this.p2 = p2;
        this.p3 = p3;

        this.time = 0;
        this.duration = 3 + Math.random() * 2;
        this.color =  '#' + Math.floor((Math.random() * 0xffffff)).toString(16);

        this.w = 8;
        this.h = 6;

        this.complete = false;
    };

    Particle.prototype = {
        update:function() {
            this.time = Math.min(this.duration, this.time + timeStep);

            var f = Ease.outCubic(this.time, 0, 1, this.duration);
            var p = cubeBezier(this.p0, this.p1, this.p2, this.p3, f);

            var dx = p.x - this.x;
            var dy = p.y - this.y;

            this.r =  Math.atan2(dy, dx) + HALF_PI;
            this.sy = Math.sin(Math.PI * f * 10);
            this.x = p.x;
            this.y = p.y;

            this.complete = this.time === this.duration;
        },
        draw:function() {
            ctx.save();
            ctx.translate(this.x, this.y);
            ctx.rotate(this.r);
            ctx.scale(1, this.sy);

            ctx.fillStyle = this.color;
            ctx.fillRect(-this.w * 0.5, -this.h * 0.5, this.w, this.h);

            ctx.restore();
        }
    };

    Loader = function(x, y) {
        this.x = x;
        this.y = y;

        this.r = 24;
        this._progress = 0;

        this.complete = false;
    };

    Loader.prototype = {
        reset:function() {
            this._progress = 0;
            this.complete = false;
        },
        set progress(p) {
            this._progress = p < 0 ? 0 : (p > 1 ? 1 : p);

            this.complete = this._progress === 1;
        },
        get progress() {
            return this._progress;
        },
        draw:function() {
            ctx.fillStyle = '#000';
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.r, -HALF_PI, TWO_PI * this._progress - HALF_PI);
            ctx.lineTo(this.x, this.y);
            ctx.closePath();
            ctx.fill();
        }
    };

    // pun intended
    Exploader = function(x, y) {
        this.x = x;
        this.y = y;

        this.startRadius = 24;

        this.time = 0;
        this.duration = 0.4;
        this.progress = 0;

        this.complete = false;
    };

    Exploader.prototype = {
        reset:function() {
            this.time = 0;
            this.progress = 0;
            this.complete = false;
        },
        update:function() {
            this.time = Math.min(this.duration, this.time + timeStep);
            this.progress = Ease.inBack(this.time, 0, 1, this.duration);

            this.complete = this.time === this.duration;
        },
        draw:function() {
            ctx.fillStyle = '#000';
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.startRadius * (1 - this.progress), 0, TWO_PI);
            ctx.fill();
        }
    };

    var particles = [],
        loader,
        exploader,
        phase = 0;

    function initDrawingCanvas(data) {
        drawingCanvas.width = viewWidth;
        drawingCanvas.height = viewHeight;
        ctx = drawingCanvas.getContext('2d');
        textValue = data;
        createLoader();
        createExploader();
        createParticles();
    }

    function createLoader() {
        loader = new Loader(viewWidth * 0.5, viewHeight * 0.5);
    }

    function createExploader() {
        exploader = new Exploader(viewWidth * 0.5, viewHeight * 0.5);
    }

    function createParticles() {
        for (var i = 0; i < 128; i++) {
            var p0 = new Point(viewWidth * 0.5, viewHeight * 0.5);
            var p1 = new Point(Math.random() * viewWidth, Math.random() * viewHeight);
            var p2 = new Point(Math.random() * viewWidth, Math.random() * viewHeight);
            var p3 = new Point(Math.random() * viewWidth, viewHeight + 64);

            particles.push(new Particle(p0, p1, p2, p3));
        }
    }

    function update() {

        switch (phase) {
            case 0:
                loader.progress += (1/45);
                break;
            case 1:
                exploader.update();
                break;
            case 2:
                particles.forEach(function(p) {
                    p.update();
                });
                break;
        }
    }

    function draw() {
        ctx.clearRect(0, 0, viewWidth, viewHeight);

        switch (phase) {
            case 0:
                loader.draw();
                break;
            case 1:
                exploader.draw();
                break;
            case 2:
                particles.forEach(function(p) {
                    p.draw();
                });
                ctx.font = "bold 40px sans-serif";
                ctx.fillText('발병 확률은 : '+textValue+'%', viewWidth/4, viewHeight/2);
                console.log("asd");
                break;
        }
    }



    function loop() {
        update();
        draw();

        if (phase === 0 && loader.complete) {
            phase = 1;
        }
        else if (phase === 1 && exploader.complete) {
            phase = 2;
        }
        else if (phase === 2 && checkParticlesComplete()) {
            // reset
            //phase = 0;
            //loader.reset();
            //exploader.reset();
            //particles.length = 0;
            //createParticles();
            return;
        }

        requestAnimationFrame(loop);
    }

    function checkParticlesComplete() {
        for (var i = 0; i < particles.length; i++) {
            if (particles[i].complete === false) return false;
        }
        return true;
    }

    // math and stuff
    var Ease = {
        inCubic:function (t, b, c, d) {
            t /= d;
            return c*t*t*t + b;
        },
        outCubic:function(t, b, c, d) {
            t /= d;
            t--;
            return c*(t*t*t + 1) + b;
        },
        inOutCubic:function(t, b, c, d) {
            t /= d/2;
            if (t < 1) return c/2*t*t*t + b;
            t -= 2;
            return c/2*(t*t*t + 2) + b;
        },
        inBack: function (t, b, c, d, s) {
            s = s || 1.70158;
            return c*(t/=d)*t*((s+1)*t - s) + b;
        }
    };

    function cubeBezier(p0, c0, c1, p1, t) {
        var p = new Point();
        var nt = (1 - t);

        p.x = nt * nt * nt * p0.x + 3 * nt * nt * t * c0.x + 3 * nt * t * t * c1.x + t * t * t * p1.x;
        p.y = nt * nt * nt * p0.y + 3 * nt * nt * t * c0.y + 3 * nt * t * t * c1.y + t * t * t * p1.y;

        return p;
    } */
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>