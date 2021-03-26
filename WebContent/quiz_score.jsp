
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" 
	import="gameflix.web.service.*"
	import="gameflix.web.entity.*"
	import="gameflix.web.service.GamequizService"
	%>
	<%
	request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<link rel="stylesheet" href="css/default.css">
<%@ include file="header.jsp"%>


<style>
body {
	background-image: url(img/01.jpg);
}

.quiz_content {
	margin: 0 auto;
	background: white;
	width: 1024px;
	height: 900px;
	
}

.box {
	width: 1024px;
	height: 700px;
	text-align: center;
	margin: 0 auto;
	background-color: white;
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
</head>

<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"/>
<%
   
    String scoreS=request.getParameter("score"); 
   
    if(scoreS==null) scoreS="0";
	int score =Integer.parseInt(scoreS);
	GamequizService dao=new GamequizService();
    String g_name=dao.selectGname("a.quiz_main.jsp");
    dao.PlaylogInsert(m.getM_no(),g_name,score);
   	%>


<body>
<script>

</script>
	<div class="box">
		<div class="content">
			<div class="text-box">
             
				<h1>
					<strong> - 점수 확인 페이지 - </strong><br><br><br>
				  총 점수 : <%=score%>점</h1>
				<br><br>
			    <a class="btn pink" href="a.quiz_main.jsp">메인화면으로 이동</a>
			</div>
		
		</div>
	</div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>
