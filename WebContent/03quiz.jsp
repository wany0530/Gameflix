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
				<strong> - Q3 Hint - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>

			<h3>
				3. 데이터베이스 구축<br> 데이터 조작어(DML:Data Manipulation Language)의 유형<br>
				데이터 조작어(DML)의 유형에는 SELECT, INSERT, UPDATE, DELETE가 있다.
			</h3>
			<br>
			<br>
			<p>
			<h3>
				SELECT (데이터 조회) : 해당 테이블을 구성하는 튜플 중에서 전체 또는 조건을 <br>만족하는 튜플을
				검색하여 주기억장치 상에 임시 테이블로 구성하는 명령문
			</h3>
		
			<p>
			<h3>INSERT(데이터 생성) : 해당 테이블에 새로운 튜플을 삽입할 때 사용하는 명령문</h3>
			
			<p>
			<h3>UPDATE(데이터 변경) : 해당 테이블에 있는 튜플 중에서 특정 튜플의 내용을 변경할 때 사용하는 명령문
			</h3>
			
			<p>
			<h3>DELETE(데이터 삭제) : 해당 테이블에 있는 튜플 중에서 특정 튜플을 삭제할 때 사용하는 명령문</h3>
			



		</div>
		<!-- text-box -->

		<a class="btn blue" href="03quiz_test.jsp"> 상단의 시계를 클릭해주세요</a> <a
			class="btn blue2" href="03quiz_test.jsp?score=<%=score %>" onclick="btnalert()">퀴즈
			바로 시작 </a>

		<!-- box -->
	</div>
	<br>
  </div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>
