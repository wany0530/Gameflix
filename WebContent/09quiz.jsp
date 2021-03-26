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
				<strong> - Q9 Hint - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>

			<h3>
				4. 프로그래밍 언어 활용 <br> TCP의 특징<br>
				TCP는 인터넷 프로토콜 스위트(IP)의 핵심 프로토콜 중 하나로, IP와 함께 TCP/IP라는 명칭으로 사용된다.
			</h3>
			<br>
			<p>
			<h3>
				신뢰성 보장 : 패킷 손실, 중복, 순서 바뀜 등이 없도록 보장
			</h3>
			
			<h3>연결 지향적 특징 : 신뢰성 있는 연결 지향형 전달 서비스</h3>
			
			<h3>흐름 제어 : 흐름 제어 기능을 활용하여 송신 및 수신 속도를 일치시킴
			</h3>
			
			<h3>혼잡 제어 : 네트워크가 혼잡하다고 판단될 때는 혼잡 제어 기법을 사용하여 송신율을 감속함</h3>
			
		</div>
		<!-- text-box -->

		<a class="btn blue" href="09quiz_test.jsp"> 상단의 시계를 클릭해주세요</a> <a
			class="btn blue2" href="09quiz_test.jsp?score=<%=score %>" onclick="btnalert()">퀴즈
			바로 시작 </a>

		<!-- box -->
	</div>
	<br>
  </div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>
