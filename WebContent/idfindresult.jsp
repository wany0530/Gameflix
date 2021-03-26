<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="gameflix.web.entity.Member"
    import="gameflix.web.service.loginService"
%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="default.css">
<style>
	body{
		background-image: url(img/01.jpg);
	}
	
	.idfindresult_content{
		width:1024px;
		height:1200px;
	}
	
	.content_idfind2{
		background:white;
		position:absolute;
		top:400px;
		left:33%;
		width:600px;
		height:340px;
		border-top:3px solid red;
   	    border-bottom:3px solid red;
	}
	
	#idfind_result_tab{
		margin:40px auto;
		width:400px;
		height:260px;
		text-align:center;
	}

	#idfind_result_tab tr{
		height:55px;
	}

	#idfind_result_tab th{
		font-size:30px;
		color:black;
		font-weight:200px;;
		padding-bottom:25px;
	}
	
	#idfind_result_tab td{
		font-size:17px;
		font-weight:bold;
	}
	

	#idfind_result_tab [type=button]{
		background-color:red;
		border-color: red;
		font-size:16px;
		font-weight:bold;
		color:white;
		width:160px;
		height:50px;
		border-radius:10px;
		padding:0px;
		margin-top:30px;
		
	}	
	#logo {
		position:absolute;
		top:200px;
		left:39%;
		width:400px;
		height:100px;
	}

</style>
<script>
	window.onload=function(){
      
	};

</script>
</head>
<body>
	<%
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	if(id==null) id="";
	if(email==null) email="";
	
	%>
	
	<div class="idfindresult_content">
		<!-- 로고 이미지 -->
		<img src="img/logo.png" id="logo">
		<!-- 아이디 찾기 결과창 --> 
     	<div class="content_idfind2">
			<table id="idfind_result_tab">
				<col width="50%"><col width="50%">
				<tr><th colspan="2">아이디 찾기 결과</th></tr>
				<tr><td>아이디</td><td><span><%=id %></span></td></tr>
				<tr><td>이메일</td><td><span><%=email %></span></td></tr>
				<tr><td><a href="login.jsp"><input type="button" value="LOGIN"></a></td>
					<td><a href="passfind.jsp"><input type="button" value="비밀번호 찾기"></a></td></tr>
			</table>
		</div>
	</div>
 	<%@ include file="footer.jsp"  %>    
</body>
</html>