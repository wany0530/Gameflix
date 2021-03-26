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
	.passfindresult_content{
		width:1024px;
		height:1200px;
	}
	
	.content_pass2{
		background:white;
		position:absolute;
		top:400px;
		left:34%;
		width:600px;
		height:380px;
		border-top:3px solid red;
   	    border-bottom:3px solid red;
	}

	
	#passfind_result_tab {
		margin:40px auto;
		width:400px;
		height:300px;
	}

	#passfind_result_tab tr{
		height:60px;
	}

	#passfind_result_tab th{
		font-size:30px;
		color:black;
		font-weight:200px;;
		padding-bottom:25px;
	}
	
	#passfind_result_tab input[type=password]{
		width:95%;
		height:50px;
		border-color:#f2f2f2;
		font-size:15px;
		border-radius:10px;
		padding-left:10px;
	}
	
	#passfind_button{
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
	
	.pass_td{
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
<script type="text/javascript">
	
	window.onload=function(){
    	document.querySelector("form").onsubmit=function(){
    		var pass1=document.querySelector("[name=pass1]").value;
			var pass2=document.querySelector("[name=pass2]").value;
			if(pass1==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			else if(pass2==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			if(pass1.length<8 || pass1.length>16){
				alert("8~16글자로 입력하세요.");
				return false;
			}
			if(pass1!=pass2){
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				return false;
			}
			document.querySelector("[name=proc]").value="upt";
			
    	}
	};

	
</script>
</head>
<body>
	<div class="passfindresult_content"> 
		<!-- 로고 이미지 -->
		<img src="img/logo.png" id="logo">
	    <!-- 비밀번호 찾기 결과창 --> 
     	<div class="content_pass2">
      		<form method="post"> 
      			<input type="hidden" name="proc" value=""/>
				<table id="passfind_result_tab">
					<col width="35%"><col width="65%">
					<tr><th colspan="2">비밀번호 재설정</th></tr>
					<tr><td class="pass_td">새 비밀번호</td><td><input type="password" name="pass1" placeholder="새 비밀번호를 입력하세요"></td></tr>
					<tr><td class="pass_td">새 비밀번호 확인</td><td><input type="password" name="pass2" placeholder="위와 동일하게 입력하세요"></td></tr>
					<tr><td colspan="2"><input type="submit" value="확인" id="passfind_button"></td></tr>
				</table>		
			</form>    
		</div>
	</div>
	<%@ include file="footer.jsp"  %>   
	<%
	String proc=request.getParameter("proc");
	String pass1=request.getParameter("pass1");
	String id=request.getParameter("id");
	loginService dao=new loginService();
	if(proc!=null && id!=null){
		if(proc.equals("upt")){
			dao.updatePass(id,pass1);
		}
	}
	%>
</body>
<script type="text/javascript">
	var proc="<%=proc%>";
	var id="<%=id%>";
	if(proc=="upt" && id!="null" ){
		alert("비밀번호가 변경되었습니다.\n로그인 페이지로 이동합니다.");
		location.href="login.jsp";
	}
</script>
</html>