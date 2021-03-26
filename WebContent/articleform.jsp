<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="gameflix.web.service.*" 
    import="gameflix.web.entity.*"
%>
<% request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameflix 글작성</title>
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

/* 글작성 관련 추가 css */
#inTitle { width:505px; }
#inContent { resize:none; }
label { margin-right: 15px; }
.button { cursor: pointer; }
.list td { padding-left:15px;}
</style>
<%
	String info = request.getParameter("cate"); if(info==null) info="";
	String cate = request.getParameter("art_cate"); if(cate==null) cate="";
	String title = request.getParameter("title"); if(title==null) title="";
	String content = request.getParameter("content"); if(content==null) content="";
	if(!title.equals("")&&!content.equals("")&&!cate.equals("")){
		ArticleService as = new ArticleService();
		as.insertArticle(new Article(0, cate, title, content, null));
	}
%>

</head>
<body>
	<%@ include file="header.jsp" %>

	<div id="container">
	<!-- 글작성 -->
		<h3>글작성</h3>
		<form method="post">
			<div id="pageList">
				<table class="list">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>분류</th>
						<td>
							<input type="radio" name="art_cate" id="QnA" value="QnA"/>
							<label for="qna">QnA</label>
							<input type="radio" name="art_cate" id="notice" value="notice"/>
							<label for="notice">공지사항</label>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input id="inTitle" type="text" name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="70" rows="25" id="inContent" name="content"></textarea></td>
					</tr>
				</table>
			</div>
			
			<!-- button -->
			
			<div id="list-control">
				<input class="button" type="submit" id="subbtn" value="등록"/>
				<input class="button" type="button" value="취소" onclick="location.href='<%=info%>.jsp'"/>
			</div>
		</form>
	</div>
	
	<%@ include file="footer.jsp" %>
	<script>
		const cateObj = document.getElementById('<%=info%>');
		cateObj.setAttribute('checked', 'true');
		var cate = "<%=cate%>";
		var title = "<%=title%>";
		<%--var content ="<%=content%>";--%>
		//content.replace("\r\n","<br>");
		if(cate!="" && title!=""){
			if(confirm("등록성공\n조회페이지로 이동하시겠습니까 ?")) {
				location.href=cate+".jsp";
			}
		}
		
	</script>
</body>
</html>