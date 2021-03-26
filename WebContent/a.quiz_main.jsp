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
	background-color: white;
	border-radius: 100px;
}

.img2 {
	width: 800px;
	height: 500px;
	border-radius: 50px;
	margin: 50px;
}

.btn {
	text-decoration: none;
	color: white;
	padding: 10px 20px 10px 20px;
	margin: 20px;
	/*display: block;*/
	border-radius: 10px;
}

.btn.blue {
	background-color: red;
}
</style>
</head>
<body>
<div class="quiz_content">
	<div class="box">

		<img src="img/main.pic.jpg" class="img2"> <a class="btn blue"
			href="01quiz.jsp">퀴즈 게임 시작 <br> Quiz Game Start
		</a>

	</div>
	<!-- box -->
</div><!-- quiz_content -->

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>

