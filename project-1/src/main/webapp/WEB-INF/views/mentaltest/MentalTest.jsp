<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
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
        <!--심리적 스트레스-->
        <h2 class="text-primary font-weight-bold">심리적 스트레스</h2>
        <small><strong class="small font-weight-bold text-black-50">평가도구원문 : Psychosocial Wellbeing Index-short form(PWI-SF)</strong></small>
        <p class="mt-2" style="font-size: 1rem">
            다음 문항은 심리적인 스트레스의 정도를 파악하기 위한 것입니다.<br/>
            각 문항을 읽고, 자신의 현재 상태를 가장 잘 나타내는 것에 표시해주시기 바랍니다.
        </p>
        <div class="line"></div>
	    <form>
	        <table>
	            <tbody>
	                <tr class="trTitle">
	                    <th ><span class="text-primary">01</span> 현재 매우 편안하며 건강하다고 느낀다</th>
	                </tr>
	                <tr class="border-bottom tr-content">
	                    <td class="py-4">
	                        <input type="radio" name="str_q01" id="str_q01_01" value="3"/>
	                        <label for="str_q01_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q01" id="str_q01_02" value="2"/>
	                        <label for="str_q01_02">그렇지 않다</label>
	                        <input type="radio" name="str_q01" id="str_q01_03" value="1"/>
	                        <label for="str_q01_03">그렇다</label>
	                        <input type="radio" name="str_q01" id="str_q01_04" value="0"/>
	                        <label for="str_q01_04">매우 그렇다</label>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><span class="text-primary">02</span> 잠자고 난 후에도 개운하지 않다</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q02" id="str_q02_01" value="0"/>
	                        <label for="str_q02_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q02" id="str_q02_02" value="1"/>
	                        <label for="str_q02_02">그렇지 않다</label>
	                        <input type="radio" name="str_q02" id="str_q02_03" value="2"/>
	                        <label for="str_q02_03">그렇다</label>
	                        <input type="radio" name="str_q02" id="str_q02_04" value="3"/>
	                        <label for="str_q02_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">03</span> 매우 피곤하고 지쳐있어 먹는 것조차 힘들다고 느낀다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q03" id="str_q03_01" value="0"/>
	                        <label for="str_q03_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q03" id="str_q03_02" value="1"/>
	                        <label for="str_q03_02">그렇지 않다</label>
	                        <input type="radio" name="str_q03" id="str_q03_03" value="2"/>
	                        <label for="str_q03_03">그렇다</label>
	                        <input type="radio" name="str_q03" id="str_q03_04" value="3"/>
	                        <label for="str_q03_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">04</span> 근심 걱정 때문에 편안하게 잠을 자지 못한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q04" id="str_q04_01" value="0"/>
	                        <label for="str_q04_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q04" id="str_q04_02" value="1"/>
	                        <label for="str_q04_02">그렇지 않다</label>
	                        <input type="radio" name="str_q04" id="str_q04_03" value="2"/>
	                        <label for="str_q04_03">그렇다</label>
	                        <input type="radio" name="str_q04" id="str_q04_04" value="3"/>
	                        <label for="str_q04_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">05</span> 정신이 맑고 깨끗하다고 느낀다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q05" id="str_q05_01" value="3"/>
	                        <label for="str_q05_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q05" id="str_q05_02" value="2"/>
	                        <label for="str_q05_02">그렇지 않다</label>
	                        <input type="radio" name="str_q05" id="str_q05_03" value="1"/>
	                        <label for="str_q05_03">그렇다</label>
	                        <input type="radio" name="str_q05" id="str_q05_04" value="0"/>
	                        <label for="str_q05_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">06</span> 기력(원기)이 왕성하다고 느낀다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q06" id="str_q06_01" value="3"/>
	                        <label for="str_q06_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q06" id="str_q06_02" value="2"/>
	                        <label for="str_q06_02">그렇지 않다</label>
	                        <input type="radio" name="str_q06" id="str_q06_03" value="1"/>
	                        <label for="str_q06_03">그렇다</label>
	                        <input type="radio" name="str_q06" id="str_q06_04" value="0"/>
	                        <label for="str_q06_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">07</span> 밤이면 심란해지거나 불안해진다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q07" id="str_q07_01" value="0"/>
	                        <label for="str_q07_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q07" id="str_q07_02" value="1"/>
	                        <label for="str_q07_02">그렇지 않다</label>
	                        <input type="radio" name="str_q07" id="str_q07_03" value="2"/>
	                        <label for="str_q07_03">그렇다</label>
	                        <input type="radio" name="str_q07" id="str_q07_04" value="3"/>
	                        <label for="str_q07_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">08</span> 대다수의 사람들과 마찬가지로 나를 잘 관리해 나간다고 생각한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q08" id="str_q08_01" value="3"/>
	                        <label for="str_q08_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q08" id="str_q08_02" value="2"/>
	                        <label for="str_q08_02">그렇지 않다</label>
	                        <input type="radio" name="str_q08" id="str_q08_03" value="1"/>
	                        <label for="str_q08_03">그렇다</label>
	                        <input type="radio" name="str_q08" id="str_q08_04" value="0"/>
	                        <label for="str_q08_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">09</span> 전체적으로 현재 내가 하고 있는 일은 잘 되어가고 있다고 느낀다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q09" id="str_q09_01" value="3"/>
	                        <label for="str_q09_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q09" id="str_q09_02" value="2"/>
	                        <label for="str_q09_02">그렇지 않다</label>
	                        <input type="radio" name="str_q09" id="str_q09_03" value="1"/>
	                        <label for="str_q09_03">그렇다</label>
	                        <input type="radio" name="str_q09" id="str_q09_04" value="0"/>
	                        <label for="str_q09_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">10</span> 내가 행한 일의 방법이나 절차에 만족한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q10" id="str_q10_01" value="3"/>
	                        <label for="str_q10_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q10" id="str_q10_02" value="2"/>
	                        <label for="str_q10_02">그렇지 않다</label>
	                        <input type="radio" name="str_q10" id="str_q10_03" value="1"/>
	                        <label for="str_q10_03">그렇다</label>
	                        <input type="radio" name="str_q10" id="str_q10_04" value="0"/>
	                        <label for="str_q10_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">11</span> 어떤 일을 바로 착수(시작)할 수 있다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q11" id="str_q11_01" value="3"/>
	                        <label for="str_q11_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q11" id="str_q11_02" value="2"/>
	                        <label for="str_q11_02">그렇지 않다</label>
	                        <input type="radio" name="str_q11" id="str_q11_03" value="1"/>
	                        <label for="str_q11_03">그렇다</label>
	                        <input type="radio" name="str_q11" id="str_q11_04" value="0"/>
	                        <label for="str_q11_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">12</span> 정상적인 일상생활을 즐길 수 있다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q12" id="str_q12_01" value="3"/>
	                        <label for="str_q12_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q12" id="str_q12_02" value="2"/>
	                        <label for="str_q12_02">그렇지 않다</label>
	                        <input type="radio" name="str_q12" id="str_q12_03" value="1"/>
	                        <label for="str_q12_03">그렇다</label>
	                        <input type="radio" name="str_q12" id="str_q12_04" value="0"/>
	                        <label for="str_q12_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">13</span> 안절부절 못하거나 성질이 심술궂게 된다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q13" id="str_q13_01" value="0"/>
	                        <label for="str_q13_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q13" id="str_q13_02" value="1"/>
	                        <label for="str_q13_02">그렇지 않다</label>
	                        <input type="radio" name="str_q13" id="str_q13_03" value="2"/>
	                        <label for="str_q13_03">그렇다</label>
	                        <input type="radio" name="str_q13" id="str_q13_04" value="3"/>
	                        <label for="str_q13_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">14</span> 닥친 문제를 해결해 나갈 수 있다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q14" id="str_q14_01" value="3"/>
	                        <label for="str_q14_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q14" id="str_q14_02" value="2"/>
	                        <label for="str_q14_02">그렇지 않다</label>
	                        <input type="radio" name="str_q14" id="str_q14_03" value="1"/>
	                        <label for="str_q14_03">그렇다</label>
	                        <input type="radio" name="str_q14" id="str_q14_04" value="0"/>
	                        <label for="str_q14_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">15</span> 불행하고 우울하다고 느낀다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q15" id="str_q15_01" value="0"/>
	                        <label for="str_q15_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q15" id="str_q15_02" value="1"/>
	                        <label for="str_q15_02">그렇지 않다</label>
	                        <input type="radio" name="str_q15" id="str_q15_03" value="2"/>
	                        <label for="str_q15_03">그렇다</label>
	                        <input type="radio" name="str_q15" id="str_q15_04" value="3"/>
	                        <label for="str_q15_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">16</span> 자신에 대한 신뢰감이 없어진다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q16" id="str_q16_01" value="0"/>
	                        <label for="str_q16_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q16" id="str_q16_02" value="1"/>
	                        <label for="str_q16_02">그렇지 않다</label>
	                        <input type="radio" name="str_q16" id="str_q16_03" value="2"/>
	                        <label for="str_q16_03">그렇다</label>
	                        <input type="radio" name="str_q16" id="str_q16_04" value="3"/>
	                        <label for="str_q16_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">17</span> 모든 것을 고려해볼 때 행복감을 느낀다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q17" id="str_q17_01" value="3"/>
	                        <label for="str_q17_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q17" id="str_q17_02" value="2"/>
	                        <label for="str_q17_02">그렇지 않다</label>
	                        <input type="radio" name="str_q17" id="str_q17_03" value="1"/>
	                        <label for="str_q17_03">그렇다</label>
	                        <input type="radio" name="str_q17" id="str_q17_04" value="0"/>
	                        <label for="str_q17_04">매우 그렇다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">18</span> 삶을 살아갈 만한 가치가 있다고 느낀다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="str_q18" id="str_q18_01" value="3"/>
	                        <label for="str_q18_01">전혀 그렇지 않다</label>
	                        <input type="radio" name="str_q18" id="str_q18_02" value="2"/>
	                        <label for="str_q18_02">그렇지 않다</label>
	                        <input type="radio" name="str_q18" id="str_q18_03" value="1"/>
	                        <label for="str_q18_03">그렇다</label>
	                        <input type="radio" name="str_q18" id="str_q18_04" value="0"/>
	                        <label for="str_q18_04">매우 그렇다</label>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	
	        <div class="d-inline-flex">
	            <button id="resultM" class="btn btn-lg btn-primary my-4" data-toggle="modal" data-backdrop="static" >심리적 스트레스 검사결과 보기</button>
	            <!--
	            <img class="topBtn" src="./img/top-btn.png" alt="top-button"/>
	            -->
	            <img class="topBtn" src='<c:url value="/resources/images/basic/top-btn2.png"/>' alt="top-button"/>
	        </div>
        </form>
    </div><!--container-->
    <!-- The Modal -->
    <div class="modal fade" id="result">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header justify-content-between">
                    <h4 class="modal-title my-3">심리적 스트레스 검사결과 보기</h4>
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
 
    //심리적 스트레스 결과 뿌리기
	document.forms[0].onsubmit=function(){
		//console.log($('[name=str_q01]'))
		if($(':radio:checked').length != 18){
			alert('모든 항목을 체크해주세요');
			return false;
		}
		else{
			var sum=0;
			$(':radio:checked').each(function(){
				$('#resultM').attr('data-target','#result');
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
			return false;
		}
	};
</script>
</html>