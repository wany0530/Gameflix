
<%@page import="gameflix.web.entity.PlayLog"%>
<%@page import="gameflix.web.service.Gameflix_DAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="style.css"/>
</head>
<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"></jsp:useBean>
<%
	String scoreS = request.getParameter("score");
	String g_title = request.getParameter("g_title");
	int score = 0;
	if(scoreS != null){
		score = Integer.parseInt(scoreS);
	}
	if(score>0){
		Gameflix_DAO dao = new Gameflix_DAO();
		PlayLog pl = new PlayLog(0, m.getM_no(), g_title, score);
		dao.playlogInsert(pl);
	}
%>

<body onload="showImage()">
	<%@ include file="header.jsp" %>
	<%-- 마이페이지 메인 --%>
	<section class="container">
		<div class="row" id="section_size">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row" style="height:33%;"></div>
				<div class="row" style="height:33%;">
					<div class="col-2"></div>
					<div class="col">
						<div class="card text-center">
							  <div class="card-header">최종 점수</div>
							  <div class="card-body">
							    <h5 class="card-title"><%=scoreS %></h5>
							    <button type="button" class="btn btn-outline-danger" onclick="reStart()">재시작</button>
							    <button type="button" class="btn btn-outline-danger" id="record">나가기</button>
							  </div>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row" style="height:33%;"></div>
			</div>
			<div class="col-2"></div>
		</div>
	</section>
	<script type="text/javascript">
	function reStart(){
		location.href="Tetris.jsp";
	}
	const records = document.getElementById("record");
	records.onclick = function(){
		location.href="main.jsp";
	}
	</script>
	<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
</html>