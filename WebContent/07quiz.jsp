<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"%>
<%@ include file="header.jsp"%>
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
		alert("퀴즈를 바로 시작하시겠습니까?");

	}
</script>
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
	height: 600px;
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
				<strong> - Q7 Hint - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>

			<h3>
				2. 소프트웨어 개발<br> DRM의 특징<br>
				DRM은 디지털 콘텐츠에 대한 권리정보를 지정하고 암호화 기술을 이용하여 <br>허가된 사용자의 허가된 권한 범위 내에서
				콘텐츠의 이용이 가능하도록 통제하는 기술이다.
			</h3>
			<br>
			<br>
			<p>
			<h3>
				거래 투명성 : 저작권자와 콘텐츠 유통업자 사이의 거래구조 투명성 제공
			</h3>
			
			<p>
			<h3>사용규칙 제공 : 사용가능 횟수, 유효기간 사용 환경 등을 정의 가능</h3>
			
			<p>
			<h3>자유로운 상거래 제공 : 이메일, 디지털 미디어, 네트워크 등을 통한 자유로운 상거래 제공
			</h3>
			
		</div>
		<!-- text-box -->

		<a class="btn blue" href="07quiz_test.jsp"> 상단의 시계를 클릭해주세요</a> <a
			class="btn blue2" href="07quiz_test.jsp?score=<%=score %>" onclick="btnalert()">퀴즈
			바로 시작 </a>

		<!-- box -->
	</div>
	<br>
  </div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>
