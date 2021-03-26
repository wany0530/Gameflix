<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="gameflix.web.entity.Game"%>
<%@page import="gameflix.web.service.GameService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%	
	request.setCharacterEncoding("UTF-8");

	// request
	String[] checkArry = request.getParameterValues("check");
	String g_name = request.getParameter("g_name");
	String g_imgPath = request.getParameter("g_imgPath");
	String g_link = request.getParameter("g_link");	
	String gamePage_ = request.getParameter("p");
	
	
	int gamePage = 1;
	if(gamePage_ != null && !gamePage_.equals("")) gamePage = Integer.parseInt(gamePage_);
	
	// db
	GameService service = new GameService();
	ArrayList<Game> pageGame = service.getGameList(gamePage, 10);
	ArrayList<Game> hotGame = service.getHotGameList();
	
	int dbCnt = service.getCount();
	int pageNum = (dbCnt%10 == 0) ?  (dbCnt/10) : (dbCnt/10)+1;
	
	
	// 삭제	
	if(checkArry != null) {
		for(String s : checkArry){
			service.deleteGame(s);
		}
		response.sendRedirect("gameManager.jsp");
	}
	
	// 삽입
	if(g_name != null && g_imgPath != null && g_link != null &&
	   !g_name.equals("") && !g_imgPath.equals("") && !g_link.equals("")) {
		service.insertGame(new Game(g_name, g_imgPath, g_link));
		response.sendRedirect("gameManager.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임관리</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/gameNotice.css">

<script type="text/javascript" src="js/gameManager.js"></script>
<script type="text/javascript">
	window.onload = function() {
		// 페이지색상 지정
		var pageObj = document.querySelector("#p<%=gamePage %>");
		pageObj.style.color="#963D2A";
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>

	<div id="container">
	
	<!-- ------------------- <GAME LIST> --------------------------------------- -->
	
		<h3>게임 리스트</h3>
		<form method="get">
		<div class="pageList">
		<table class="list">
			<colgroup>
				<col width="15%">
				<col width="25%">
				<col width="25%">
				<col width="11%">
				<col width="5%">
			</colgroup>
			<thead>
				<tr>
					<th>게임명</th>
					<th>이미지경로</th>
					<th>게임링크</th>
					<th>등록일</th>
					<th><input type="checkbox" name="all_check" onclick="allSelect()"></th>
				</tr>
			</thead>
			
			<tbody>
				<%for(Game g : pageGame) { %>
				<tr>
					<td class="align-center"><%=g.getG_name() %></td>
					<td><%=g.getG_imgPath() %></td>
					<td><%=g.getG_link() %></td>
					<td class="align-center"><%=g.getG_date() %></td>
					<td class="align-center">
						<input class="checkBox" type="checkbox" name="check" value="<%=g.getG_name() %>" />
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		</div>
		<!-- button -->
		
		<div class="list-control">
			<input class="button" type="submit" value="게임삭제"/>
			<input class="button" type="button" value="게임등록" onclick="location.href='insertGame.jsp'"/>
		</div>
		
		</form>
		
		<!-- pager -->
		
		<ul class="page-btn">
		<%for(int i=0; i<pageNum; i++) {%>
			<li><a id="p<%=1+i %>" href="?p=<%=1+i %>">
					<%=1+i %>
				</a>
			</li>
		<%} %>
		</ul>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>