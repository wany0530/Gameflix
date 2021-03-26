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
				<strong> - Q2 Hint- </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>
			<h3>
				2. 소프트웨어 개발 <br> 알고리즘이란? 알고리즘은 어떤 문제를 해결하기 위해 정해진 일련의 절차나 방법을
				공식화한 형태로 표현한 기법이다.<br> 알고리즘 설계 기법으로는 분할과 정복(Divide and
				Conquer)<br> 동적 계획법(Dynamic Programming) <br> 탐욕법(Greedy)<br>
				백트래킹(Backtracking)이 있다.<br>
				<br>
			</h3>

			<p>
			<h3>분할과 정복 : 문제를 나눌 수 없을 때까지 나누고 각각을 풀고 다시 병합하여 문제의 답을 얻는 알고리즘</h3>
			</p>
			<p>
			<h3>동적계획법 : 어떤 문제를 풀기 위해 그 문제를 더 작은 문제의 연장선으로 생각하는 알고리즘</h3>
			</p>
			<p>
			<h3>탐욕법 : 결정을 해야할 때마다 가장 좋다고 생각하는 것을 해답으로 선택</h3>
			</p>
			<p>
			<h3>백트래킹 : 어떤 노드의 유망성 점검 후, 유망하지 않으면<br> 그 노드의 부모 노드로 되돌아간 후 다른
				자손노드를 검색하는 알고리즘</h3>
			</p>



		</div>
		<!-- text-box -->

		<a class="btn blue" href="02quiz_test.jsp"> 상단의 시계를 클릭해주세요</a> <a
			class="btn blue2" href="02quiz_test.jsp?score=<%=score %>" onclick="btnalert()" >퀴즈
			바로 시작</a>

		<!-- box -->
	</div>
	<br>
</div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>

