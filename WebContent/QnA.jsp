<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.util.*" import="gameflix.web.service.*" import="gameflix.web.entity.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameflix 자주묻는질문</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<style>
body { background-image: url(img/01.jpg); }
.wrapper { width:1024px; background-color:whitesmoke; margin:0 auto; padding:20px 150px 40px; }
.main-title { text-align:center; color:#963D2A; padding:25px 0; }

/* 공지 테이블 */
#notice { border-collapse:collapse; text-align:center; font-size:15px; width:100%;
	padding-bottom:10px; background-color:white; border-bottom:2px solid darkgray; }
#notice #title { text-align:left; padding-left:10px; }
#notice th { background-color:#963D2A; color:#fff; }
#notice a:link { color:black; text-decoration:none; }
#notice a:visited { color:black; text-decoration:none; }
#notice a:hover { text-decoration:underline; }

/* 페이지버튼 */
.btn_group { height:50px; text-align:center; position:relative; padding-top:15px; }
.pbtnlist, .pbtnlist li { display:inline-block; }
.pbtn { width:30px; padding:5px; border-radius:50%; border:none; 
		color:darkgray; font-size: 15px; }
.pbtn:hover { background-color:#963D2A;	color:#fff; }
.active { background-color:#963D2A; color:#fff; pointer-events:none; cursor: default; }

/* 추가 css */
.button { width:80px; height:25px; background:#963D2A; border-radius:3px;
		color:white; border:none; font-size:14px; font-weight:bold;
		cursor:pointer; position:absolute; right:0px; }
.button:hover { text-decoration:underline; background:#AC3D2A; }
#notice tr { height:45px; }
#no-title { padding-left:15px; text-align:left; }
.btn { color:darkgray; }

</style>
</head>
<%
	int pageNum = 1;
	String pageNumS = request.getParameter("p");
	if(pageNumS!=null) pageNum = Integer.parseInt(pageNumS);
	ArticleService as = new ArticleService();
	ArrayList<Article> alist = as.getArticlePage("qna",pageNum);
	int pCnt = as.getPageCnt("qna") / 10+1;
	int pageBC = 0; // page 버튼 갯수 	
	if(pCnt%5==0){
		pageBC = 5;
	} else {
		pageBC = pageNum<=(pCnt/5)*5 ? 5 : pCnt%5;
	}
	int pageBS = 0; // page버튼 시작 번호
	if(pageNum%5==0){
		pageBS = pageNum-5;
	}else{
		pageBS = (pageNum/5)*5;
	}
%>
<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"/>
<body>
	<!-- 헤더 -->
	<%@ include file="header.jsp"%>
	<div class="wrapper">
		<h2 class="main-title">자주묻는질문</h2>
		<table id="notice">
			<col width="85%">
			<col width="15%">
			<tr>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<%for(Article a:alist) { %>
			<tr>
				<td id="no-title">
					<a href="QnA_detail.jsp?no=<%=a.getNo()%>"><%=a.getTitle() %></a>
				</td>
				<td><%=a.getCredte() %></td>
			</tr>
			<%} %>
		</table>
		<!-- 페이지 버튼 -->
		<div class="btn_group">
			<button class="btn" id="lbtn" type="button">〈</button>
			<ul class="pbtnlist">
			<%for(int i=1; i<=pCnt; i++) { %>
				<li><a class="pbtn" href="QnA.jsp?p=<%=i %>"><%=i %></a></li>
			<%} %>
			</ul>
			<button class="btn" id="rbtn" type="button">〉</button>
			<%if(m.getM_id().equals("admin")) {%>
			<input type="button" class="button" value="글작성" onclick="location.href='articleform.jsp?cate=QnA'"/>
			<%} %>
		</div>
	</div>
	<!-- 하단사이트정보 -->
	<%@ include file="footer.jsp"%>
	<script>
		const lbtn = document.querySelector("#lbtn");
		const rbtn = document.querySelector("#rbtn");
		const pbtns = document.querySelectorAll('.pbtn');
		
		var pcnt = <%=pCnt %>;
		var pNum = <%=pageNum%>;
		var pNext = 1+5*(Math.ceil(pNum/5));
		var pPre = 5*Math.ceil((pNum-5)/5);
		
		lbtn.addEventListener('click', function(){
			if(pPre<5) return;
			location.href="notice.jsp?p="+pPre;
		});
		rbtn.addEventListener('click', ()=>{
			if(pcnt<=pNext) return;
			location.href="notice.jsp?p="+pNext;
		}); 
		
		pbtns.forEach(function(item){
			if(item.innerText==pNum)
				item.classList.add('active');
		});
	</script>
</body>
</html>