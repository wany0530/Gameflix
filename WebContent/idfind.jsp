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
	
	.idfind_content{
		margin:0;
		width:1024px;
		height:1200px;
	}
	
	.content_id{
		background:white;
		position:absolute;
		top:400px;
		left:34%;
		width:600px;
		height:380px;
		border-top:3px solid red;
   	    border-bottom:3px solid red;
	}

	
	#idfind_tab {
		margin:40px auto;
		width:400px;
		height:300px;
	}

	#idfind_tab tr{
		height:60px;
	}

	#idfind_tab th{
		font-size:30px;
		color:black;
		font-weight:200px;;
		padding-bottom:25px;
	}
	
	#idfind_tab input[type=text]{
		width:95%;
		height:50px;
		border-color:#f2f2f2;
		font-size:15px;
		border-radius:10px;
		padding-left:10px;
	}
	
	#idfind_button{
		background-color:red;
		border-color: red;
		font-size:20px;
		font-weight:bold;
		color:white;
		width:500px;
		height:50px;
		border-radius:10px;
		padding:0px;
	}	
	
	.id_td{
		font-size:17px;
		font-weight:bold;
	}
	#logo {
		position:absolute;
		top:200px;
		left:40%;
		width:400px;
		height:100px;
	}

</style>
<script>
	window.onload=function(){
    	document.querySelector("form").onsubmit=function(){
    		var name=document.querySelector("[name=name]");
    		var email=document.querySelector("[name=email]");
    		if(name.value==""){
    			alert("이름을 입력하세요");
    			return false;
    		}
    		else if(email.value==""){
    			alert("이메일을 입력하세요");
    			return false;
    		}		
    	}
	};
</script>
</head>
<body>
	<div class="idfind_content">
		<!-- 로고 이미지 -->
		<img src="img/logo.png" id="logo">
     	<!-- 아이디 찾기 --> 
     	<div class="content_id">
      		<form method="post" action="idfind_pro.jsp"> 
				<table id="idfind_tab">
					<col width="20%"><col width="80%">
					<tr><th colspan="2">아이디 찾기</th></tr>
					<tr><td class="id_td">이름</td><td><input type="text" name="name" placeholder="이름을 입력하세요"></td></tr>
					<tr><td class="id_td">이메일</td><td><input type="text" name="email" placeholder="이메일을 입력하세요"></td></tr>
					<tr><td colspan="2"><input type="submit" value="아이디 찾기" id="idfind_button"></td></tr>
				</table>		
			</form>    
		</div>
     </div>
     <%@ include file="footer.jsp"  %>   
 	
</body>
<script type="text/javascript">
	
	var isIdFind=<%=request.getParameter("isIdFind")%>;
	if(isIdFind){
		alert("일치하는 회원이 없습니다\n다시 입력해주세요");
	}
</script>
</html>