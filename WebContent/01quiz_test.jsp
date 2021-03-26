
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"%>
	<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<%@ include file="header.jsp"%>



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

<link rel="stylesheet" href="css/default.css">
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

		alert("축하합니다! 정답입니다. ")

	}
	function click02() {
		alert("땡 틀렸습니다. 답은 가시화 언어입니다.")
	}
	
</script>

</head>
<%
    String scoreS=request.getParameter("score"); 
    if(scoreS==null) scoreS="0";
	int score =Integer.parseInt(scoreS);
    score=0;
    
%>


<body>

	<div class="quiz_content">
		<div class="box">
			<div class="content">
				<div class="text-box">
                    <br>
					<h1>
						<strong> - Q1 - </strong>
					</h1>
					<br> 아래 시계를 클릭해주세요.
					<h1 onclick="time()">
						<strong><img src="img/time.PNG" width="50" height="50"></strong>
					</h1>
					<h3 id="cntdown"></h3>
					<h3>
						<br> <br> 1. 소프트웨어 설계 <br> <br>
					</h3>
					<h1>
						개념 모델 작성 시 오류가 적고 의사소통이 용이한 언어는?<br> <br>
					</h1>
				</div>
				<br> <a class="btn blue" href="02quiz.jsp?score=<%=score+600 %>"
					onclick="click01()"> 가시화 언어 </a>
				<!-- "location.href='a16_0210.jsp'"
  location.href="a19_0210_detail.jsp?pno="+pno; -->

				<a class="btn red" href="02quiz.jsp?score=<%=score %>" onclick="click02()"> 구축 언어
				</a> <a class="btn pink" href="02quiz.jsp?score=<%=score %>" onclick="click02()"> 명세화
					언어 </a>


			</div>
			<!-- content -->
		</div>
		<!-- box -->
	</div>
	<!-- quiz_content -->
	<h2></h2>
</body>
<%@ include file="footer.jsp"%>
