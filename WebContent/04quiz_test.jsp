
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
		alert("땡 틀렸습니다. 답은 메모리 관리자 입니다.")
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
				<strong> - Q4 - </strong>
			</h1>
			아래 시계를 클릭해주세요.
			<h1 onclick="time()">
				<strong><img src="img/time.PNG" width="50" height="50"></strong>
			</h1>
			<h3 id="cntdown"></h3>
			<h3>
				<br>
				<br> 4. 프로그래밍 언어 활용 <br>
				<br>
			</h3>
			<h1>
				기억 장치의 어느 부분이 사용 중인지 또는 아닌지를 조사하여 <br> 프로세스에게 필요할 때마다 기억장치를 할당
				후 <br>회수하는 작업 수행을 하는 메모리 기본 사항은? <br>
				<br>
			</h1>
		</div>
		<br> <a class="btn blue" href="05quiz.jsp?score=<%=score+600 %>" onclick="click01()">
			메모리 관리자 </a> <a class="btn red" href="05quiz.jsp?score=<%=score %>"
			onclick="click02()"> 메모리 관리 장치 </a> <a class="btn pink"
			href="05quiz.jsp?score=<%=score %>" onclick="click02()"> 가상메모리 </a>



	</div>
	</div>

	<h2></h2>
</body>


<%@include file="footer.jsp"%>