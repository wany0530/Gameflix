<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="gameflix.web.entity.Game"%>
<%@page import="gameflix.web.service.GameService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	// request
	String g_name = request.getParameter("g_name"); if(g_name == null) g_name="";
	String g_imgPath = request.getParameter("g_imgPath"); if(g_imgPath == null) g_imgPath="";
	String g_link = request.getParameter("g_link"); if(g_link == null) g_link="";

	// DB
	GameService service = new GameService();
	ArrayList<Game> gameList = service.getGameList();
	
	// 게임등록
	if(g_name != null && g_imgPath != null && g_link != null &&
	   !g_name.equals("") && !g_imgPath.equals("") && !g_link.equals("")) {
		String dafaultImgPath = "img/game/";
		service.insertGame(new Game(g_name, dafaultImgPath+g_imgPath, g_link));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임등록</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/gameNotice.css">

<style>

/* game list */
#container #pageList { margin-bottom: 20px; text-align: center; }
#container .align-center { text-align: center; }
#container #inputName { border: 1px solid #e9e9e9; border-radius: 3px; box-sizing: border-box; width: 538px; height: 24px; }

/* button */
#list-control { width: 100%; height: 30px; text-align: center; }
#list-control input { 
	width: 71px; height: 23px; background: #963D2A; border-radius: 3px;
	color: white; border: none; padding: 3px 8px; margin-left: 5px; font-size: 11px; font-weight: bold;}
#list-control input:hover { text-decoration: underline; background: #AC3D2A; }

</style>
<script type="text/javascript">	
	var g_name = "<%=g_name%>";
	var g_imgPath = "<%=g_imgPath%>";
	var g_link = "<%=g_link%>";
	
	if(g_name != "" && g_imgPath != "" && g_link != "") {
		if(confirm("등록성공\n조회페이지로이동")){
			location.href="gameManager.jsp";
		}
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>

	<div id="container">
	
	<!-- ------------------- <게임등록> --------------------------------------- -->
	
		<h3>게임등록</h3>
		<form method="post">
		<div id="pageList">
		<table class="list">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
				<th>게임명</th>
				<td><input id="inputName" type="text" name="g_name" value="<%=g_name%>"></td>
			</tr>
			<tr>
				<th>이미지파일</th>
				<td><input id="inputImgPath" type="file" name="g_imgPath"></td>
			</tr>
			<tr>
				<th>게임링크</th><td><input id="inputLink" type="file" name="g_link"></td>
			</tr>
		</table>
		</div>
		
		<!-- button -->
		
		<div id="list-control">
			<input class="button" type="submit" value="등록"/>
			<input class="button" type="button" value="취소" onclick="location.href='gameManager.jsp'"/>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>