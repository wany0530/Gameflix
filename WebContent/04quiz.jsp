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
				<strong> - Q4 Hint - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>
			<h3>
				4. 프로그래밍 언어 활용<br> < 메모리 관리 기본 사항 > <br> 메모리 관리는 중앙 처리 장치,
				메모리, 스토리지, 주변 기기 등을 관리하는 기법이다.
			</h3>
			<br>
			<br>
			<p>
			<h3>가상메모리(Virtual Memory) 각 프로그램에 실제 메모리 주소가 아닌 가상의 메모리 주소를 부여하는
				방식</h3>
			</p>
			<p>
			<h3>메모리 관리 장치 (MMU) : CPU가 메모리에 접근하는 것을 관리하는 컴퓨터 하드웨어 부품</h3>
			</p>
			<p>
			<h3>
				메모리 관리자 : 기억 장치의 어느 부분이 사용 중인지 또는 아닌지를 조사하여 <br> 프로세스에게 필요할 때마다
				기억장치를 할당 후 회수하는 작업 수행
			</h3>
			</p>
		</div>
		<!-- text-box -->

		<a class="btn blue" href="04quiz_test.jsp">상단의 시계를 클릭해주세요</a> <a
			class="btn blue2" href="04quiz_test.jsp?score=<%=score %>" onclick="btnalert()">퀴즈
			바로 시작 </a>

		<!-- box -->
	</div>
	<br>
  </div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>

