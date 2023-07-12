<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
        .line{
            border: rgb(241, 79, 106) 1px solid;
            margin-top: 1.5rem;
        }
        body{
        	font-size: 1rem;
        }
        [type='radio']{
            margin-left: 1.5rem;
        }
        .topBtn{
            margin-top: 24px;
            margin-left: 20px;
            width: 50px;
            height: 50px;
            cursor: pointer;
        }
</style>
<body>
	
	<div class="container" style="margin-top: 100px">
		<!-- tap 화면 -->
		<div>
			<ul class="nav nav-tabs nav-justified">
				<li class="nav-item">
			    	<a class="nav-link" href='<c:url value="/project/MentalTest1.do"/>'>심리적 스트레스</a>
			    </li>
			    <li class="nav-item">
			      	<a class="nav-link" href='<c:url value="/project/MentalTest2.do"/>'>흡연 유형 평가</a>
			    </li>
			    <li class="nav-item">
			      	<a class="nav-link active" href='#'>알코올 의존(AUDIT-K)</a>
			    </li>
			    <li class="nav-item">
			      	<a class="nav-link" href='<c:url value="/project/MentalTest4.do"/>'>우울증(CES-D)</a>
			    </li>
			</ul>
		</div>
	
        <h2 class="text-primary font-weight-bold mt-5">알코올 사용장애 평가(AUDIT-K)</h2>
        <small><strong class="small font-weight-bold text-black-50">평가도구원문 : Alcohol Use Disorder Identification Test-Korea(AUDIT-K)</strong></small>
        <p class="mt-2" style="font-size: 1rem">
            다음 문항은 알코올 의존 정도를 파악하기 위한 것입니다.<br/>
            각 문항을 읽고, 자신의 현재 상태를 가장 잘 나타내는 것에 표시해주시기 바랍니다.
        </p>
        <div class="line"></div>
	    <div>
	        <table>
	            <tbody>
	            	<tr class="trTitle">
	                    <th class="pt-4"><span class="text-primary">Q</span> 성별을 선택해주세요</th>
	                </tr>
	                <tr class="border-bottom tr-content">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q00" id="alc_q00_01" value="m"/>
	                        <label for="alc_q00_01">남성</label>
	                        <input type="radio" name="alc_q00" id="alc_q00_02" value="f"/>
	                        <label for="alc_q00_02">여성</label>
	                    </td>
	                </tr>
	                <tr>
	                    <th class="pt-4"><span class="text-primary">01</span> 얼마나 자주 술을 마십니까?</th>
	                </tr>
	                <tr class="border-bottom tr-content">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q01" id="alc_q01_01" value="0"/>
	                        <label for="alc_q01_01">전혀 안마심</label>
	                        <input type="radio" name="alc_q01" id="alc_q01_02" value="1"/>
	                        <label for="alc_q01_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q01" id="alc_q01_03" value="2"/>
	                        <label for="alc_q01_03">월 2~4회</label>
	                        <input type="radio" name="alc_q01" id="alc_q01_04" value="3"/>
	                        <label for="alc_q01_04">주 2~3회</label>
	                        <input type="radio" name="alc_q01" id="alc_q01_05" value="4"/>
	                        <label for="alc_q01_05">주 4회 이상</label>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><span class="text-primary">02</span> 술을 마시면 한 번에 몇 잔 정도 마십니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q02" id="alc_q02_01" value="0"/>
	                        <label for="alc_q02_01">한두 잔</label>
	                        <input type="radio" name="alc_q02" id="alc_q02_02" value="1"/>
	                        <label for="alc_q02_02">3~4 잔</label>
	                        <input type="radio" name="alc_q02" id="alc_q02_03" value="2"/>
	                        <label for="alc_q02_03">5~6 잔</label>
	                        <input type="radio" name="alc_q02" id="alc_q02_04" value="3"/>
	                        <label for="alc_q02_04">7~9 잔</label>
	                        <input type="radio" name="alc_q02" id="alc_q02_05" value="4"/>
	                        <label for="alc_q02_05">10잔 이상</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">03</span> 한 번에 소주 1병 또는 맥주 4병 이상 마시는 경우는 얼마나 자주 있습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q03" id="alc_q03_01" value="0"/>
	                        <label for="alc_q03_01">전혀 없다</label>
	                        <input type="radio" name="alc_q03" id="alc_q03_02" value="1"/>
	                        <label for="alc_q03_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q03" id="alc_q03_03" value="2"/>
	                        <label for="alc_q03_03">월 1회</label>
	                        <input type="radio" name="alc_q03" id="alc_q03_04" value="3"/>
	                        <label for="alc_q03_04">주 1회</label>
	                        <input type="radio" name="alc_q03" id="alc_q03_05" value="4"/>
	                        <label for="alc_q03_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">04</span> 지난 1년간 한번 술을 마시기 시작하면 멈출 수 없었던 때가 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q04" id="alc_q04_01" value="0"/>
	                        <label for="alc_q04_01">전혀 없다</label>
	                        <input type="radio" name="alc_q04" id="alc_q04_02" value="1"/>
	                        <label for="alc_q04_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q04" id="alc_q04_03" value="2"/>
	                        <label for="alc_q04_03">월 1회</label>
	                        <input type="radio" name="alc_q04" id="alc_q04_04" value="3"/>
	                        <label for="alc_q04_04">주 1회</label>
	                        <input type="radio" name="alc_q04" id="alc_q04_05" value="4"/>
	                        <label for="alc_q04_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">05</span> 지난 1년간 평소 같으면 할 수 있었던 일을 술 때문에 하지 못한적이 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q05" id="alc_q05_01" value="0"/>
	                        <label for="alc_q05_01">전혀 없다</label>
	                        <input type="radio" name="alc_q05" id="alc_q05_02" value="1"/>
	                        <label for="alc_q05_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q05" id="alc_q05_03" value="2"/>
	                        <label for="alc_q05_03">월 1회</label>
	                        <input type="radio" name="alc_q05" id="alc_q05_04" value="3"/>
	                        <label for="alc_q05_04">주 1회</label>
	                        <input type="radio" name="alc_q05" id="alc_q05_05" value="4"/>
	                        <label for="alc_q05_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">06</span> 지난 1년간 술 마신 다음 날 해장술을 마신 적은 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q06" id="alc_q06_01" value="0"/>
	                        <label for="alc_q06_01">전혀 없다</label>
	                        <input type="radio" name="alc_q06" id="alc_q06_02" value="1"/>
	                        <label for="alc_q06_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q06" id="alc_q06_03" value="2"/>
	                        <label for="alc_q06_03">월 1회</label>
	                        <input type="radio" name="alc_q06" id="alc_q06_04" value="3"/>
	                        <label for="alc_q06_04">주 1회</label>
	                        <input type="radio" name="alc_q06" id="alc_q06_05" value="4"/>
	                        <label for="alc_q06_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">07</span> 지난 1년간 술 마신 후에 죄책감이 들거나 후회를 한 적이 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q07" id="alc_q07_01" value="0"/>
	                        <label for="alc_q07_01">전혀 없다</label>
	                        <input type="radio" name="alc_q07" id="alc_q07_02" value="1"/>
	                        <label for="alc_q07_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q07" id="alc_q07_03" value="2"/>
	                        <label for="alc_q07_03">월 1회</label>
	                        <input type="radio" name="alc_q07" id="alc_q07_04" value="3"/>
	                        <label for="alc_q07_04">주 1회</label>
	                        <input type="radio" name="alc_q07" id="alc_q07_05" value="4"/>
	                        <label for="alc_q07_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">08</span> 지난 1년간 음주 때문에 전날 밤 일이 기억나지 않았던 적이 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q08" id="alc_q08_01" value="0"/>
	                        <label for="alc_q08_01">전혀 없다</label>
	                        <input type="radio" name="alc_q08" id="alc_q08_02" value="1"/>
	                        <label for="alc_q08_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q08" id="alc_q08_03" value="2"/>
	                        <label for="alc_q08_03">월 1회</label>
	                        <input type="radio" name="alc_q08" id="alc_q08_04" value="3"/>
	                        <label for="alc_q08_04">주 1회</label>
	                        <input type="radio" name="alc_q08" id="alc_q08_05" value="4"/>
	                        <label for="alc_q08_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">09</span> 음주로 인해 자신이나 다른 사람이 다친적이 있습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q09" id="alc_q09_01" value="0"/>
	                        <label for="alc_q09_01">없었다</label>
	                        <input type="radio" name="alc_q09" id="alc_q09_02" value="2"/>
	                        <label for="alc_q09_02">있지만, 지난 1년간에는 없었다</label>
	                        <input type="radio" name="alc_q09" id="alc_q09_03" value="4"/>
	                        <label for="alc_q09_03">지난 1년간 있었다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">10</span> 가족이나 친구, 혹은 건강 전문가나 의사가 당신이 술 마시는 것을 걱정하거나 술 끊기를 권유한 적이 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q10" id="alc_q10_01" value="0"/>
	                        <label for="alc_q10_01">없었다</label>
	                        <input type="radio" name="alc_q10" id="alc_q10_02" value="2"/>
	                        <label for="alc_q10_02">있지만, 지난 1년간에는 없었다</label>
	                        <input type="radio" name="alc_q10" id="alc_q10_03" value="4"/>
	                        <label for="alc_q10_03">지난 1년간 있었다</label>
	                    </td>
	                </tr>
	
	            </tbody>
	        </table>
	
	        <div class="d-inline-flex">
	            <button id="resultM" class="btn btn-lg btn-primary my-4" data-toggle="modal" data-target="#result" data-backdrop="static" >알코올 사용장애 검사결과 보기</button>
	            <!--
	            <img class="topBtn" src="./img/top-btn.png" alt="top-button"/>
	            -->
	            <img class="topBtn" src='<c:url value="/resources/images/basic/top-btn2.png"/>' alt="top-button"/>
	        </div>
        </div>
    </div><!--container-->
    <!-- The Modal -->
    <div class="modal fade" id="result" style="display: none">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header justify-content-between">
                    <h4 class="modal-title my-3">알코올 사용장애 검사결과 보기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="d-flex flex-wrap">
                        <h5 id="resultT" class="text-danger font-weight-bold mb-3">스트레스 고위험군입니다</h5>
                        <p id="resultC">
                            현재 스트레스를 매우 많이 경험하고 있습니다.<br/>
                            심리적으로 불현감이 높고, 직장 및 일상생활 또는 신체에 부정적인 영향이 있을 수 있습니다.<br/>
                            혼자서 고민하고 힘들어 하기보다, 전문가의 상담을 받는다면 심리적이나 신체적인 어려움을 극복하는데 도움이 됩니다.<br/>
                            의사 또는 상담심리사와 상담을 권유합니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div><!--container-->
</body>
<script>
	//버튼 클릭 시 맨 위로 이동
    var topBtn = document.querySelector(".topBtn");
    topBtn.onclick = (()=>{
    	window.scrollTo({ top: 0, behavior: "smooth" });  
    })
 /*
 알콜중독이 의심되지 않습니다
 알코올 의존 가능성
이미 알코올 사용장애, 특히 알코올 의존 상태입니다 전문의의 진찰을 받고 전문화된 치료를 시작하는 것이 좋습니다
 */
    //알코올 사용장애 결과 뿌리기
	$('#resultM').click(function(){
		var sum=0;
		if($(':radio:checked').length != 11){
			alert('모든 항목을 체크해주세요');
			$(this).attr('data-toggle','');
		}
		else if($('[name=alc_q00]:checked').val()=='m'){
			$(':radio:checked').slice(1).each(function(){
				sum += parseInt($(this).val());
				console.log('sum:',sum)
				if(sum <= 10){
					
				}
			});
		}
		else{
			$(':radio:checked').each(function(){

				sum += parseInt($(this).val());
				//console.log('sum:',sum,$(this).val())
				if(sum >= 27){//고위험군
					$('#resultT').html('스트레스 고위험군입니다');
					$('#resultC').html(`현재 스트레스를 매우 많이 경험하고 있습니다.<br/>
						    심리적으로 불현감이 높고, 직장 및 일상생활 또는 신체에 부정적인 영향이 있을 수 있습니다.<br/>
						    혼자서 고민하고 힘들어 하기보다, 전문가의 상담을 받는다면 심리적이나 신체적인 어려움을 극복하는데 도움이 됩니다.<br/>
						    의사 또는 상담심리사와 상담을 권유합니다.`);
				}
				else if(sum <= 8){//잠재적 스트레스군
					$('#resultT').html('스트레스 건강군입니다.');
					$('#resultC').html(`현재 스트레스를 경험하지 않고 있으며, 심리적으로 건강하게 생활하고 있습니다.<br/>
						    평소의 스트레스 관리방법을 꾸준히 유지하시기 바랍니다.`);
				}
				else{//건강군
					$('#resultT').html('스트레스 잠재군입니다.');
					$('#resultC').html(`현재 스트레스를 많이 경험하지는 않고 있습니다.<br/>
						    그러나 상황의 변화에 따라 스트레스 고위험군으로 변경될 가능성이 있습니다.<br/>
						    스트레스 상황에서 대처하는 방법을 미리 준비해 둔다면, 스트레스를 받더라도 쉽게 좌절하지 않고 문제를 해결해 나갈 수 있을 것입니다.<br/>
						    스트레스 대처 방법에 대해서 궁금하시다면 상담심리사와 상담하시길 바랍니다.`);
				}
			});
			
		}
	});

</script>
</html>