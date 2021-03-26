<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="gameflix.web.service.CardgameService"
%>
<%
	request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<style>
	body{background-image: url(img/01.jpg);}  
	
	.card_res_content{
		margin:0 auto;
		background:white;
		width:1024px;
		height:800px;
	}
	
	#card_tab_content{
		width:460px;
		height:350px;
		margin:0 auto;
		position:relative;
		top:200px;
		border:5px solid red;
		border-radius:10px;
	}

	#card_tab{
		margin:0 auto;
		position:relative;
		top:25px;
		width:300px;
		height:300px;
		text-align:center;
	}

	#card_tab td{
		font-size:40px;
	}

	#card_tab td span{
		font-size:70px;
	}
	
	#c_re_button{
		border-color:red;
		background:red;
		color:white;
		font-weight:bold;
		font-size:30px;
		border-radius:10px;
		padding:5px 20px;
	}

</style>
<script>

	
</script>
</head>
<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"/>
<%
	String countS=request.getParameter("count");
	if(countS==null) countS="0";
	int count=Integer.parseInt(countS);
	CardgameService dao=new CardgameService();
	String g_name=dao.selectGname("cardgame.jsp");
	dao.CardPlayLog(m.getM_no(),g_name,count);
	String badge=dao.selectbadge(m.getM_no(),g_name); 
%>
<body>
	<%@ include file="header.jsp" %>
	<div class="card_res_content">
		<div id="card_tab_content">
			<table id="card_tab">
				<tr><td><span><%=count%></span> point!</td></tr>
				<tr><td><input type="button" id="c_re_button" value="Restart" onclick="location.href='cardgame.jsp'"></td></tr>
			</table>
		</div>
	</div>
	<%@ include file="footer.jsp"  %>

</body>
</html>