<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="gameflix.web.entity.*"
    %>
<% 
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameflix</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/game_intergrate.css">
</head>
<body>
	<%@ include file="header.jsp" %>

	<div id="game-container">
		<div id="game-area">
			<div id="game-info">
				<strong>음료 통합 게임</strong><br>
				랜덤으로 담긴 음료를 같은 색상의 음료로 통합해 보세요.<br>
				왼쪽 마우스 클릭(이벤트)를 통해 음료를 이동할 수 있습니다.<br>
			</div>
			<input type="button" value="게임시작"
			onclick="location.href='c02_integrate_Game.jsp?game=start&time=60&point=0&gname=${param.gname}'"/>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
</body>
</html>