<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="gameflix.web.entity.*"
    import = "gameflix.web.service.Game2048Service"
    %>
<%
	request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"/>

<%
	String scoreS = request.getParameter("score");
	if(scoreS == null) scoreS="0";
	int score = Integer.parseInt(scoreS);
	
	Game2048Service dao = new Game2048Service();
	String g_name = dao.selectGname("2048.jsp");
	dao.insertPlayLog(m.getM_no(), g_name, score);
	String badge = dao.selectbadge(m.getM_no());
%>
<!DOCTYPE html>
<html>
<head>
<meta meta http-equiv="Content-Type" charset="UTF-8">
<title>Gameflex</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
<style>

	body{
		background-image: url(img/01.jpg);
	}
	#game-container { 
		height: 850px; 	width: 1024px;	left : 50%;	margin-left : -512px;	background: whitesmoke;	position: absolute;
	}

	#content{
	color : #F23005; position : absolute;font-size : 35px;font-weight : bold;	left : 50%;
	margin-left : -200px; 	margin-top : 120px;	text-align : center;
	}
	h3{
	color : #000;
	}
	#btn{
	   position : absolute; top : 320px; left : 50%; margin-left : -125px;
	}
	
	#btn input{
	   background-color: #000; border: none; color: #fff; opacity : 0.7; padding: 10px 24px; cursor: pointer;
	}

	#btn input:hover{
	   background-color: #F23005; color: #fff; opacity : 1.0; font-weight : bold;
	}	
		
	
</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>

</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="game-container">
	   	<div id="content">
			<h2>Congraturation!</h2>
			<h3>2048게임 CLEAR!</h3>
			<h3>SCORE : <%=score %></h3>
		</div>
		<div id="btn">
			<input type="button" value="다시시작" onclick="location.href='2048.jsp'"/>
			<input type="button" value="메인화면으로" onclick="location.href='main.jsp'"/>			
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>

</html>