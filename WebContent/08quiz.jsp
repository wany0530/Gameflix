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
				<strong> - Q8 Hint - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>

			<h3>
				3. 데이터베이스 구축<br> 트랜잭션의 특징<br>
				
			</h3>
			<br>
			<br>
			<p>
			<h3>
				원자성 : 분해가 불가능한 작업의 최소단위, 하나라도 실패할 경우 전체 취소
			</h3>
			
			<h3>일관성 : 트랜잭션이 실행 성공 후 항상 일관된 데이터베이스 상태를 보존해야 함</h3>
			
			<h3>격리성 : 트랜잭션 실행 중 생성하는 연산의 중간 결과를 다른 트랜잭션이 접근 불가
			</h3>
			
			<h3>영속성 : 성공이 완료된 트랜잭션의 결과는 영속적으로 데이터베이스에 저장</h3>
			



		</div>
		<!-- text-box -->

		<a class="btn blue" href="08quiz_test.jsp"> 상단의 시계를 클릭해주세요</a> <a
			class="btn blue2" href="08quiz_test.jsp?score=<%=score %>" onclick="btnalert()">퀴즈
			바로 시작 </a>

		<!-- box -->
	</div>
	<br>
  </div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>
