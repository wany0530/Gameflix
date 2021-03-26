
<%@page import="gameflix.web.entity.PlayLog"%>
<%@page import="gameflix.web.service.Gameflix_DAO"%>
<%@page import="gameflix.web.entity.Member"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="UserInfo.css">
<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"></jsp:useBean>
<%
	String proc = request.getParameter("proc");
	Gameflix_DAO dao = new Gameflix_DAO();
	if(proc != null && !proc.equals("")){
		if(proc.equals("del")){
			dao.delUser(m);
			response.sendRedirect("login.jsp");
		}
	}
	ArrayList<PlayLog> bgilist = dao.bestGameInfo(m.getM_no());
	Boolean rankingPrint = false;
	if(bgilist.size()<6){
		rankingPrint = true;
	}
%>
<style>
	h5{
	color :white;
	}
</style>
</head>
<body onload="showImage()">
	<%@ include file="header.jsp" %>
	<%-- 마이페이지 메인 --%>
	<section class="container">
		<div class="row" id="section_size">
			<div class="col" id="section_size2">
				<!-- 마이페이지 배너 -->
				<div class="row" id="mypage_banner">
					<div class="col" style="margin-top:4%;">
						<h3>My Page</h3><br>
						<span>Home > My Page</span>
					</div>
				</div>
				<!-- 마이페이지 메뉴 -->
				<div class="row" style="background-color:black;">
					<div class="col-1"></div>
					<div class="col">
					<table class="table">
  						<tr>
  							<td style="width:20%"></td>
  							<td style="width:20%">
  								<button type="button" class="btn btn-outline-light" style="width:100%" onclick="user_page()">회원정보</button>
  							</td>
  							<td style="width:20%"></td>
  							<td style="width:20%">
  								<button type="button" class="btn btn-outline-light" style="width:100%" onclick="Rank_page()">랭킹</button>
  							</td>
  							<td style="width:20%"></td>
  						</tr>
					</table>
					<hr>
					</div>
					<div class="col-1"></div>
				</div>
				<!-- 내용컨테이너 -->
				<div class="row" style="background-color:black; height:70%;">
					<div class="col-1"></div>
					<div class="col"">
						<div class="row" style="height:12.5%; margin-top:25px; text-align:center;">
							<div class="col-3">
								<h4>회원정보</h4>
							</div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">이름</span>
							</div>
							<div class="col"><%=m.getM_name()%><hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">아이디</span>
							</div>
							<div class="col"><%=m.getM_id()%><hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">비밀번호</span>
							</div>
							<div class="col">●●●●<hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">이메일</span>
							</div>
							<div class="col"><%=m.getM_email()%><hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">닉네임</span>
							</div>
							<div class="col"><%=m.getM_nickname()%><hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col">
								<form method="post" id="delete">
									<input type="hidden" name="proc" value=""/>
									<input class="btn btn-secondary" type="button" value="회원탈퇴" id="delBtn">
								</form>
							</div>
							<div class="col"></div>							
							<div class="col" style="text-align:right;">
								<input class="btn btn-secondary" type="submit" value="회원수정" onclick="manage_page()">
							</div>
						</div>
						<div class="row" style="height:12.5%;"></div>
					</div>	
					<div class="col-1"></div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	function user_page(){
		location.href="UserInfo.jsp";
	};
	function Rank_page(){
		var rankingPrint = <%=rankingPrint%>;
		if(rankingPrint){
			alert("최소한 6개의 게임을 진행해주세요.");
		}else{
			location.href="Mypage_Ranking.jsp";	
		}
	};
	function manage_page(){
		location.href="UserManage.jsp";
	}
	var delBtn = document.querySelector("#delBtn");
	delBtn.onclick = function(){
		if(confirm("정말로 탈퇴하시겠습니까??")){
			document.querySelector("[name=proc]").value="del";
			document.querySelector("#delete").submit();
		}
	}
</script>
</html>