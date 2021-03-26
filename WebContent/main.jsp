<%@page import="gameflix.web.entity.Game"%>
<%@page import="gameflix.web.service.GameService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	request.setCharacterEncoding("UTF-8");

	// request
	String gamePage_ = request.getParameter("p");
	int gamePage = 1;
	if(gamePage_ != null && !gamePage_.equals("")) gamePage = Integer.parseInt(gamePage_);

	// DB 테이블 및 뷰 생성
	GameService service = new GameService();
// 	service.createTable("G_MEMBER");
// 	service.createTable("G_GAME");
// 	service.createTable("G_BADGE");
// 	service.createTable("G_PLAYLOG");
	
	// 리스트 읽어오기
	ArrayList<Game> hotGame = service.getHotGameList();
	ArrayList<Game> newGame = service.getNewGameList();
	ArrayList<Game> allGame = service.getGameList(gamePage, 3);
	ArrayList<Member> top5User = service.getRangking();
	
	// 페이지 계산
	int dbCnt = service.getCount();
	int pageNum = (dbCnt%3 == 0) ? (dbCnt/3) : (dbCnt/3)+1;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameflix</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>

<script type="text/javascript">
	window.onload = function() {
		var floatPosition = parseInt($("#ranking-box").css('top'))
		console.log(floatPosition);
		
		$(window).scroll(function(){
			
			var currentTop = $(window).scrollTop();
			var bannerTop = currentTop + floatPosition + "px";
			
			$("#ranking-box").stop().animate({
				"top" : bannerTop
			},500);
		}).scroll();
		
		// 페이지색상 지정
		var pageObj = document.querySelector("#p<%=gamePage %>");
		pageObj.style.backgroundColor="#FDAFAB";
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div id="container">
		<c:if test="${m.m_id == 'admin'}">
		<div id="gameInsert-link">
			<a href="gameManager.jsp">게임관리</a>
		</div>
		</c:if>

		<!-- ------------------- <HOT GAME LIST> --------------------------------------- -->
			
		<section id="main-content">		
			<h2 class="hidden">인기 게임 리스트</h2>
			<div id="hotGameList" class="gameList">
				<h3>인기게임</h3>
				<ul class="item">
					<%for (Game g : hotGame) { %>
					<li>
						<a href="<%=g.getG_link()%>?gname=<%=g.getG_name()%>"> <img src="<%=g.getG_imgPath()%>" onerror="this.src='img/default.png'">
							<div class="gameInfo">
								<%=g.getG_name()%><span>플레이횟수 : <%=g.getG_cnt()%></span>
							</div>
						</a>
					</li>
					<%} %>
				</ul>
			</div>

		<!-- ------------------- <NEW GAME LIST> --------------------------------------- -->
			<h2 class="hidden">최신 등록 게임 리스트</h2>
			<div id="newGameList" class="gameList">
				<h3>최신게임</h3>
				<ul class="item">
					<%for(Game g : newGame) { %>
					<li>
						<a href="<%=g.getG_link()%>?gname=<%=g.getG_name()%>">
							<img src="<%=g.getG_imgPath() %>" onerror="this.src='img/default.png'">
							<div class="gameInfo">
								<%=g.getG_name() %><span>등록일 : <%=g.getG_date() %></span>
							</div>
						</a>
					</li>
					<%} %>
				</ul>
			</div>
			
		<!-- ------------------- <ALL GAME LIST> --------------------------------------- -->
			
			<h2 class="hidden">전체 게임 리스트</h2>
			<div id="totalGameList" class="gameList">
				<h3>전체게임(<%=dbCnt %>)</h3>
				<ul class="item">
					<%for(Game g : allGame) { %>
					<li>
						<a href="<%=g.getG_link()%>?gname=<%=g.getG_name()%>">
							<img src="<%=g.getG_imgPath() %>" onerror="this.src='img/default.png'">
							<div class="gameInfo">
								<%=g.getG_name() %><span>등록일 : <%=g.getG_date() %></span>
							</div>
						</a>
					</li>
					<%} %>
				</ul>
			</div>
			
			<ul class="page-btn">
			<%for(int i=0; i<pageNum; i++) {%>
				<li><a id="p<%=1+i %>" href="?p=<%=1+i %>#totalGameList">
						<%=1+i %>
					</a>
				</li>
			<%} %>
			</ul>
			
		</section>
		
		<!-- ------------------- <User Ranking> --------------------------------------- -->
		
		<aside id="side-banner">
			<div id="ranking-box">
				<h2>유저랭킹 TOP5</h2>
				<a href="ranking.jsp">랭킹게시판</a>
				<table>
					<colgroup>
						<col style="width: 50%"/>
						<col style="width: 30%"/>
					</colgroup>
					<tr><th>아이디</th><th>점수</th></tr>
					<%
					if(top5User != null) {
						for(Member m : top5User) { %>
						<tr><td><%=m.getM_name() %></td><td><%=m.getScore() %></td></tr>
					<%}
					} %>
				</table>
			</div>
		</aside>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>