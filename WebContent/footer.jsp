<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

<style>
#main-footer { background-color: rgba(0,0,0,0.4); width: 1024px; margin: 0 auto; }
#main-footer > #footer-container {margin: 0 auto; width: 1024px; padding: 40px; font-size: 12px; color: rgb(180, 180, 180);}
#main-footer > #footer-container { display: flex; line-height: 1.5; justify-content: space-between;}
#main-footer > #footer-container > #left-info .title{ margin-bottom: 20px; }
#main-footer > #footer-container > #right-info { margin-left: 100px; }
#main-footer > #footer-container > #right-info > .tel { font-size: 30px; font-weight: 500; margin-right: 5px;}
#main-footer > #footer-container > #right-info > a {
		text-align: center; line-height: 40px;
		color: rgb(180, 180, 180); border: 1px solid gray; margin: 20px 10px 0 0; width: 100px; height: 40px;}
#main-footer > #footer-container > #right-info > a:hover { color: white; border-color: white;}
</style>
<!-- footer -->
<footer id="main-footer">
	<div id="footer-container">
		<div id="left-info" class="footer-info">
			<h1 class="title">GAMEFLIX</h1>
			<div class="content">
				(주)게임플릭스 서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터 대표이사 1조<br>
				사업자등록번호 111-12-1234567 | 통신판매신고번호2018-서울용산-111 | 게임문의: 할수없음<br>
				이메일주소 ecoeco@naver.com | 비즈니스제휴/입점문의 ecoeco@naver.com<br>
				이메일 무단 수집 거부 | 개인정보보호책임자 양현수 | 호스팅 서비스 제공자(주)게임플렉스<br>
				<br>
				(주)게임플릭스 저희 게임 사이트 고객님은 안전한 진행을 위해 안전한 서비스를 적용하고 있습니다.<br>
				<br>
				Copyright ⓒGAMEFLIX Inc. All rights reserved.
			</div>
		</div>
		<div id="right-info" class="footer-info">
			<h2>고객 서비스 센터 이용안내</h2>
			<span class="tel">080-333-3333</span> (수신자 요금 부담)
			<div>
				운영시간 AM 09:00 ~ PM 18:00(주말 및 공휴일 휴무)<br>
				점심시간 PM 12:00 ~ PM 13:00
			</div>
			<a href="notice.jsp">공지사항 ></a>
			<a href="QnA.jsp">Q&A</a>
		</div>
	</div>
</footer>