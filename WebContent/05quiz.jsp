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
				<strong> - Q5 Hint - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>
			<h3>
				5. 정보시스템 구축관리<br> < 클라우드 컴퓨팅 분류 ><br> 클라우드 컴퓨팅은 인터넷을 통해
				가상화된 컴퓨터 시스템 리소스(IT 리소스)를 제공하고, <br> 정보를 자신의 컴퓨터가 아닌 클라우드(인터넷)에
				연결된 다른 컴퓨터로 처리하는 기술이다.
			</h3>
			<br>
			<br>
			
			<h3>사설 클라우드 (Private Cloud): 자체 컴퓨팅 자원으로 모든 하드웨어, 소프트웨어, 데이터를 수용</h3>
			
			<h3>
				공용 클라우드 (Public Cloud): 클라우드 서비스 제공 업체에서 다중 사용자를 위한 <br> 컴퓨팅 자원
				서비스를 제공하는 클라우드
			</h3>
		
			
			<h3>하이브리드 클라우드 (Hybrid Cloud): 기업 또는 조직 내부 자원을 이용한 <br>사설 클라우드와 공용
				클라우드를 모두 사용하는 클라우드</h3>
			
		</div>
		<!-- text-box -->

		<a class="btn blue" href="05quiz_test.jsp"> 상단의 시계를 클릭해주세요</a> <a
			class="btn blue2" href="05quiz_test.jsp?score=<%=score %>"onclick="btnalert()">퀴즈
			바로 시작 </a>

		<!-- box -->
	</div>
	</div>
	
</body>
<%@ include file="footer.jsp"%>


