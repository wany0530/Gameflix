
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
	block;
}

.btn.red {
	background-color: red;
	float: center;
}

.btn.pink {
	background-color: orange;
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
			alert("정답을 선택해주세요.");
			clearInterval(set);
		}
	}, 1000);
}

function click01() {
	alert("축하합니다! 정답입니다.")
}

function click02() {
	alert("땡 틀렸습니다. 답은 하이브리드 클라우드입니다.");
	
	
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
				<strong> - Q5 - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>
			<h3>5. 정보시스템 구축관리</h3>
			<br>
			<h1>기업 또는 조직 내부 자원을 이용한 사설 클라우드와 <br>공용 클라우드를 모두 사용하는 클라우드는?</h1>
		</div>
		<br> <a class="btn blue" href="06quiz.jsp?score=<%=score %>"
			onclick="click02()"> 사설 클라우드 </a> <a class="btn red"
			href="06quiz.jsp?score=<%=score %>" onclick="click02()"> 공용 클라우드 </a> <a
			class="btn pink"  href="06quiz.jsp?score=<%=score+600 %>" onclick="click01()">
			하이브리드 클라우드</a>




	</div>
	</div>

	<h2></h2>
</body>

<%@ include file="footer.jsp"%>
