<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
    .cRghKI {
        position: fixed;
        z-index: 99;
        width: 100%;
        background-color: rgb(255, 255, 255);
        transition: top 0.25s ease-in-out 0s;
        top: 0px;
        border-bottom: 0.8px solid var(--color-bs-gray-300);
    }

    .lmQXYu {
        padding: 0px;
        font: bold;
        height: 52px;
    }

    .ijXoMb {
        border-radius: 40px;
        background-color: orange;
        color: rgb(255, 255, 255);
        border: none;
    }
    .ibDLVm {
        position: relative;
        width: 100%;
        height: 52px;
        background-color: rgb(255, 255, 255);
        padding: 10px 20px;
        display: flex;
        -webkit-box-align: center;
        align-items: start;
        -webkit-box-pack: center;
        justify-content: start;
    }


    .btn-6c img {
        margin-bottom: 10px;
    }

    .btn-6c label {
        display: block;
        white-space: nowrap;
    }

    .btn-6c {
        display: flex;
        color: #ffffff;
        background: #ffffff;
        position: relative;
        flex-direction: column;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        border: 1px solid var(--color-bs-gray-300);
        width: 100px;
        height: 100px;
        padding: 10px;
        border-radius: 12px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        font-size: 16px;
        line-height: 24px;
    }


    .active{
        background: transparent;
        background-color: rgb(231, 193, 120);
        font-weight: bold;
        border: 5px solid orange;
    }

    section {
        margin: 0 auto;
        padding: 5em 3em;
        text-align: center;
        color: #fff;
    }
    section p {
        position: relative;
        margin: 0;
        padding: 1em;
        z-index: 1;
    }
    .color-6 {
        background: #f3f3f3;
    }


    /* General button style (reset) */
    .btn {
        
        font-size: 16px;
        cursor: pointer;
        padding: 70px 80px;
        display: inline-block;
        margin: 10px 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        position: relative;
        text-align: center;
        color: black;

    }
body{
	background-color: white;
}
#contentInfoCon {
    position: relative;
    height: 383px;
    display: flex;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
#contentInfoCon .content-sub-tit {
    font-size: 16px;
    color: #222;
    overflow: hidden;
}
#contentInfoCon .content-tit {
    color: #222;
    font-size: 45px;
    font-weight: 700;
    line-height: 1.36;
    letter-spacing: -0.02em;
    margin-top: 37px;
}
.visual-img-con {
	position:absolute;
	width:100%;
	height:100%;
    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_company.jpg") no-repeat;
    background-color: #fff;
    z-index: 1;
    top:70px;
	border:none;
} 
.tsarea {
	position: absolute;
	width: 1000px;
	height: 250px;
	top:170px;
	left:50px;
	border:none;
	z-index: 2;
	text-align: center;
	box-shadow: 0px 0px 0px white;
	align-items: center;
}
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span><span style="color:#EF605D;">MEDI-Q</span> 영양제 인기순위</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">실제 섭취하는 유저들의 리뷰와 피드백으로 만든<br/> 가장 믿을만한 영양제 랭킹을 만나보세요</p>
            </h3>
        </div>
    </aside>
    
	<div class="container" style="padding-bottom: 150px ;">
        <section class="color-6">
            <h3 style="font-weight: bold; color: black;">영양제를 먹는 이유가 무엇인가요?</h3>
            <p>
                <a href="/functionfood/healthissue.do?healthissue=피로개선">
	                <button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-fatigue-7959669.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>피로감</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=눈 건강">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-eye-care-2824810.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>눈 건강</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=피부 건강">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-skin-protection-5228128.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>피부 건강</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=체지방">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-weight-scale-7984802.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>체지방</label>
					</button>
				</a>
            </p>
            <p>
            	<a href="/functionfood/healthissue.do?healthissue=혈행개선">
	                <button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-blood-test-3127109.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>혈행개선</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=간 건강">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-liver-3390186.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>간 건강</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=장 건강">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-guts-4157759.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>장 건강</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=수면질 개선">
				<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
				    <img src="/images/tsimages/sleep.png" loading="lazy" width="48" height="48" style="color: transparent;">
				    <label>수면질 개선</label>
				</button>
				</a>
            </p>
            <p>
            	<a href="/functionfood/healthissue.do?healthissue=면역기능">
	                <button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-immunity-5106341.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>면역기능</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=혈중 콜레스테롤 개선">
				<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
				    <img src="/images/tsimages/free-icon-cholesterol-2738776.png" loading="lazy" width="48" height="48" style="color: transparent;">
				    <label>혈중 콜레스테롤</label>
				</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=뼈 건강">
				<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
				    <img src="/images/tsimages/free-icon-bones-4706841.png" loading="lazy" width="48" height="48" style="color: transparent;">
				    <label>뼈 건강</label>
				</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=항산화">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-aging-5684039.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>항산화</label>
					</button>
				</a>
            </p>
            <p>
            	<a href="/functionfood/healthissue.do?healthissue=월경전 상태 개선">
	                <button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/menstruation.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>월경전 상태 개선</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=위 건강/소화기능">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-gastroenterology-9340021.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>위 건강 &amp; 소화기능</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=전립선 건강">
				<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
				    <img src="/images/tsimages/prostate.png" loading="lazy" width="48" height="48" style="color: transparent;">
				    <label>전립선 건강</label>
				</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=갑상선 호르몬 합성">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-tiroid-1546181.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>갑상선 호르몬 합성</label>
					</button>
				</a>
            </p>
            <p>
            	<a href="/functionfood/healthissue.do?healthissue=어린이 성장">
	                <button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/children.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>어린이 성장</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=혈압">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-blood-pressure-2805677.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>혈압</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=운동수행 능력">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-exercise-1683155.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>운동수행 능력</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=기억력 개선">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src="/images/tsimages/free-icon-brainstorm-7778191.png" loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>기억력 개선</label>
					</button>
				</a>
            </p>
            <p>
            	<a href="/functionfood/healthissue.do?healthissue=혈당 조절">
	                <button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/free-icon-glucose-meter-4228683.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>혈당 조절</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=혈중 중성지방">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/free-icon-fat-1951542.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>혈중 중성지방</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=치아">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/free-icon-clean-tooth-2461581.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>치아</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=태아">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/free-icon-mother-6381743.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>태아 건강</label>
					</button>
				</a>
            </p>
            <p>
            	<a href="/functionfood/healthissue.do?healthissue=구강 건강">
	                <button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/mouth.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>구강 건강</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=관절">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/free-icon-knee-joint-6037860.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>관절 건강</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=갱년기 여성">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/free-icon-anti-aging-2117129.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>여성 갱년기</label>
					</button>
				</a>
				<a href="/functionfood/healthissue.do?healthissue=긴장완화">
					<button class="btn btn-6 btn-6c" onclick="toggleButton(this)">
					    <img src='/images/tsimages/anxiety.png' loading="lazy" width="48" height="48" style="color: transparent;">
					    <label>긴장 완화</label>
					</button>
				</a>
            </p>
          </section>
        </div>

	</body>
</html>