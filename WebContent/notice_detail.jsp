<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="gameflix.web.qna.*" import="gameflix.web.entity.*"
	%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameflix 공지사항</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<style>
body { background-image: url(img/01.jpg); }
/* 페이지 규격 */
.wrapper { width:1024px; background-color:whitesmoke; margin:0 auto; padding:0 150px; }
.main-title { text-align:center; color:#963D2A; padding:25px 0; }
/* Q&A 테이블 */
#QnA { border-collapse: collapse; width: 100%; font-size: 15px; background-color:white; }
#QnA th { background-color: #963D2A; color: #fff; height: 45px; }
.credte { padding:10px; text-align:right; border-bottom:1px dashed darkgray; }
.artcontent { padding:15px; }
/* 페이지버튼 */
#btn_group { height: 75px; padding-top:15px; position:relative; }
.detailbtn { width:80px; height:25px; background:#963D2A; border-radius:3px;
		color:white; border:none; font-size:14px; font-weight:bold; cursor:pointer; }
.detailbtn:hover { text-decoration:underline; background:#AC3D2A; }
.listbtn { position:absolute; right:0; }
</style>
</head>
<%
String noS = request.getParameter("no");
if (noS == null)
	noS = "1";
int no = Integer.parseInt(noS);

A01_Dao dao = new A01_Dao();
Board board = dao.getBoard(no);
board.setContent(board.getContent().replace("\r\n","<br>"));

String proc = request.getParameter("proc");
if(proc!=null){
	if(proc.equals("del")){
		log("삭제준비 : "+no);
		dao.deleteBoard(no);
	}
}
%>
<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"/>
<body>
	<!-- 헤더 -->
	<%@ include file="header.jsp"%>
	<div class="wrapper">
		<h2 class="main-title">공지사항</h2>
		<table id="QnA">
			<tr><th><%=board.getTitle() %></th></tr>
			<tr><td class="credte"><strong>작성일</strong> : <%=board.getCredte()%></td></tr>
			<tr><td class="artcontent"><%=board.getContent() %></td></tr>		
		</table>
		<!-- 페이지 버튼 -->
		<div id="btn_group">
			<%if(m.getM_id().equals("admin")){ %>
			<button class="detailbtn" onclick="location.href='articleUpdateForm.jsp?cate=notice&no=<%=board.getNo()%>'">수정</button>
			<button class="detailbtn" id="delbtn">삭제</button>
			<%} %>
			<button class="detailbtn listbtn" onclick="location.href='notice.jsp'">목록보기</button>
		</div>
	</div>
	<!-- 하단사이트정보 -->
	<%@ include file="footer.jsp"%>
	<script>
		var delbtn = document.querySelector("#delbtn");
		var wrapper = document.querySelector(".wrapper");
		delbtn.onclick = function(){
			if(confirm("삭제하시겠습니까?")){
				var formCode = "<form id='delform' method='post'><input type='hidden' name='proc' value='del'/></form>";
				wrapper.innerHTML+=formCode;
				document.querySelector("#delform").submit();
			}
		}
		var proc="<%=proc%>";
		if(proc=="del"){
		   alert("삭제 성공");
		   location.href='notice.jsp';
		}
	</script>
</body>
</html>