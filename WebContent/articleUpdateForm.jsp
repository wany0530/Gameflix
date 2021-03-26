<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
    import="gameflix.web.service.*" 
    import="gameflix.web.entity.*"
    import="gameflix.web.qna.*"%>
<% request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameflix 글수정</title>
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
<script type="text/javascript">
</script>
<%
String proc = request.getParameter("proc");
String info = request.getParameter("cate"); if(info==null) info="";
if(info.equals("qna")) info="QnA";
String title = request.getParameter("title");
String content = request.getParameter("content");
String noS = request.getParameter("no");
if (noS == null)
	noS = "1";
int no = Integer.parseInt(noS);
A01_Dao dao = new A01_Dao();
Board board = dao.getBoard(no);
if(proc!=null) {
	if(proc.equals("upt")) {
	Board b = new Board(no, null, title, content, null);	
	dao.updateBoard(b);
	}
}
%>

</head>
<body>
	<%@ include file="header.jsp" %>

	<div id="container">
	<!-- 글수정 -->
		<h3>글수정</h3>
		<form method="post">
			<input type="hidden" name="proc" value=""/>
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
						<td><input id="inTitle" type="text" name="title" value="<%=board.getTitle()%>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="70" rows="25" id="inContent" name="content" ><%=board.getContent()%></textarea></td>
					</tr>
				</table>
			</div>
			
			<!-- button -->
			
			<div id="list-control">
				<input class="button" type="submit" id="uptbtn" value="수정"/>
				<input class="button" type="button" value="취소" onclick="location.href='<%=info%>.jsp'"/>
			</div>
		</form>
	</div>
	
	<%@ include file="footer.jsp" %>
	<script type="text/javascript">
	const cateObj = document.getElementById('<%=info%>');
	cateObj.setAttribute('checked', 'true');
	var uptbtn = document.querySelector("#uptbtn");
	uptbtn.onclick=function(){
		document.querySelector("[name=proc]").value="upt";
		// 각 값에 대한 유효성 check ..
		// form객체의 하위 값들 key=value형식으로 전송 
		document.querySelector("form").submit();
	}
	var proc="<%=proc%>";
	if(proc=="upt"){
		if(confirm("수정성공\n메인페이지로 이동하시겠습니까 ?")) {
			location.href="<%=info%>.jsp";
		}
	}
	</script>
</body>
</html>



