<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/default.css">

<style>
body {
	background-image: url(img/01.jpg);
}

.quiz_content {
	margin: 0 auto;
	background: white;
	width: 1024px;
	height: 1200px;
	
}

.box {
	width: 1024px;
	height: 800px;
	text-align: center;
	margin: 0 auto;
	background-color: black;
	border-radius: 50px;
}

.text-box {
	width: 1024px;
	height: 650px;
	text-align: center;
	background-color: white;
	border-radius: 100px;
	border: 2px;
	float: center;
}

.btn {
	text-decoration: none;
	color: white;
	padding: 10px 20px 10px 20px;
	margin: 20px;
	display: inling-block;
	border-radius: 10px;
}

.btn.blue {
	background-color: #1f75d9;
	float: center;
}

.btn.blue2 {
	background-color: #1f75d9;
	text-color: white;
	float: center;
}
</style>
<script>
	function time() {
		var cnt = 10;
		var cntdown = document.querySelector("#cntdown");
		var set = setInterval(function() {
			cntdown.innerHTML = cnt;
			cnt--;
			if (cnt < 0) {
				alert("퀴즈 바로 시작 버튼을 눌러주세요");
				clearInterval(set);
			}
		}, 1000);
	}

	function btnalert() {

		alert("퀴즈를 시작합니다.");
	}
	
</script>
</head>
<%
    String scoreS=request.getParameter("score"); 
    if(scoreS==null) scoreS="0";
	int score =Integer.parseInt(scoreS);
   
    
%>

<body>
  <div class="quiz_content">
	<div class="box">
		<div class="text-box">
            <br>
			<h1>
				<strong> - Q1 Hint - </strong>
			</h1>
			<br> 아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>
			<h3>
				1. 소프트웨어 설계 <br> UML(Unified Modeling Language)의 개념<br>
				UML은 객체지향 소프트웨어 개발 과정에서 산출물을 명세화, 시각화, 문서화할 때 사용되는 <br> 모델링 기술과
				방법론을 통합해서 만든 <strong>표준화된 범용 모델링 언어이다.</strong><br>
				<br>
			</h3>

			<p>
			<h3>가시화 언어 : 개념 모델 작성 시 오류가 적고 의사소통이 용이</h3>
			
			<p>
			<h3>구축 언어 : 다양한 프로그래밍 언어로 실행 시스템의 예측 가능</h3>
			
			<p>
			<h3>명세화 언어 : 정확한 모델 제시, 완전한 모델 작성 가능</h3>
		
			<p>
			<h3>문서화 언어 : 시스템에 대한 평가 및 의사소통의 문서</h3>
			



		</div>
		<!-- text-box -->
   
		<a class="btn blue" href=""> 상단의 시계를 클릭해주세요</a> <a class="btn blue2"
			href="01quiz_test.jsp?score=<%=score %>"  onclick="btnalert()">퀴즈 바로 시작 </a>

		<!-- box -->
	</div>
	<br>
    </div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>

