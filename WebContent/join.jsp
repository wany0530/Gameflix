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
	.join_content{
		margin:0px;
		width:1024px;
		height:1700px;
	}

	.content_join{
		position:absolute;
		display:block;
		top:400px;
		left:27%;
		width:800px;
		height:1400px;
	}
	.content_join h2{
		text-align:center;
		color:white;
		font-size:20px;
		margin-bottom:20px;
	}
	#join_table{
		background:white;
		width:500px;
		border-top:3px solid red;
		border-bottom:3px solid red;
		font-size:14px;
		margin:0 auto;
		padding:0;
	}	
	#join_table tr{
		height:50px;
	}
	#join_table th{
		border-bottom:1px solid #E1E1E1;
		border-right:1px solid #E1E1E1;
		text-align:left;
		padding-left:20px;
	}
	#join_table td{
		border-bottom:1px solid #E1E1E1;
	}
	.input{
		box-shadow:0px;
		border:1px solid #E1E1E1;
		margin-left:20px;
		font-size:13px;
	}
	.input_op{
		font-size:11px;
		color:#8C8C8C;
	}
	.agreement{
		margin-top:200px;
	}
	#agree_table{
		background:white;
		width:800px;
		border-top:3px solid red;
		border-bottom:3px solid red;
		font-size:14px;
		margin:0;
		padding:0;
	}
	#agree_table th{
		text-align:left;
		margin-left:20px;
		height:40px;
		border-bottom:1px solid #E1E1E1;
	}
	#agree_table td{
		border-bottom:1px solid #E1E1E1;
		border-right:1px solid #E1E1E1;
		border-left:1px solid #E1E1E1;
	}
	.agree_text{
		height:120px;
		overflow-y:scroll;
		padding:5px 10px;
	}
	.agree_check{
		text-align:right;
		padding-right:10px;
		height:40px;
		line-height:40px;
		background:#F5F5F5;
	}
	#join_button {
		margin-top:30px;
		text-align:center;		
	}
	#join_button2 {
		color:white;
		width:100px;
		height:35px;
		border-radius:0px;
		border-color:red;
		background:red;
	}
	#logo {
		position:absolute;
		top:200px;
		left:38%;
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
	<div class="join_content">
		<!-- 로고 이미지 -->
		<img src="img/logo.png" id="logo">
  		<!-- 회원가입 페이지 --> 
		<div class="content_join">
			<h2>회원가입</h2>
			<form method="post"> 
				<table id="join_table">
					<col width="30%"><col width="70%">
					<tr><th>아이디</th><td><input type="text" name="id" class="input">&nbsp;&nbsp;<span class="input_op">(4~16자)</span></td></tr>
					<tr><th>비밀번호</th>
						<td><input type="password" name="pass1" class="input">&nbsp;&nbsp;<span class="input_op">(8자~16자)</span></td></tr>
					<tr><th>비밀번호 확인</th><td><input type="password" name="pass2" class="input"></td></tr>
					<tr><th>이름<td><input type="text" name="name" class="input"></td></tr>
					<tr><th>이메일</th><td><input type="email" name="email" class="input"></td></tr>
					<tr><th>닉네임</th><td><input type="text" name="nickname" class="input"></td></tr>
				</table>
			</form>	
				
			<h2 class="agreement">이용약관</h2>
			<table id="agree_table">
				<tr><th>&nbsp;- [필수] 이용약관 동의</th></tr>
				<tr><td>
					<div class="agree_text">제 1장 총 칙<br>제1조(목적)<br>이 약관은 게임플릭스(이하 "회사")가 운영하는 인터넷 사이트를 통하여 제공하는 전자상거래 관련 서비스(이하 "서비스")를 
					이용함에 있어 회사와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.<br>※ PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.<br>
					제2조(정의)<br>1. "이용자"란 "회사"에 접속하여 이 약관에 따라 "회사"가 제공하는 서비스를 받는 회원을 말합니다.<br>
					3. 회원이라 함은 "회사"에 개인정보를 제공하여 회원 등록을 한 자로서, "회사"의 정보를 지속적으로 제공받으며, "회사"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
					4. 이외에 이 약관에서 사용하는 용어의 정의는 관계 법령 및 서비스 별 안내에서 정하는 바에 의합니다.
					</div></td></tr>
					<tr><td class="agree_check">이용약관에 동의하십니까? <input type="checkbox" id="chbx"> 동의함</td></tr>	
					<tr><th>&nbsp;- [필수] 개인정보 수집 및 이용 동의</th></tr>
					<tr><td><div class="agree_text">게임플릭스는 (이하 "회사"는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br>
					회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br><br>
					1. 수집하는 개인정보 항목 및 수집방법<br>
					가. 수집하는 개인정보의 항목<br>o 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
					- 회원가입시 : 이름 , 로그인ID , 비밀번호 , 이메일<br>
					o 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다.<br>
					<br>
					2. 개인정보의 수집 및 이용목적<br>
					<br>
					회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
					o 회원 관리<br>
					회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달<br>
					</div></td></tr>
				<tr><td class="agree_check">개인정보 수집 및 이용에 동의하십니까? <input type="checkbox" id="chbx"> 동의함</td></tr>	
			</table>
				
			<div id="join_button">
				<input type="button" value="JOIN" id="join_button2" onclick="join_check()">
			</div>
		</div> 
	</div>
	<%@ include file="footer.jsp"  %>
	
</body>
<script>
<%
String id=request.getParameter("id"); if(id==null) id=""; log("#id:"+id);
String pw=request.getParameter("pass1"); if(pw==null) pw=""; log("#pw:"+pw);
String name=request.getParameter("name"); if(name==null) name=""; log("#name:"+name);
String email=request.getParameter("email"); if(email==null) email=""; log("#email:"+email);
String nickname=request.getParameter("nickname"); if(nickname==null) nickname=""; log("#nickname:"+nickname);
loginService dao=new loginService();
if(!id.equals("")){
	Member ins=new Member(0, id, pw, name, email, nickname);
	dao.join(ins);
}
ArrayList<Member> mlist=dao.memList();
%>


	function join_check(){
		var idObj=document.querySelector("[name=id]");
		var pass1Obj=document.querySelector("[name=pass1]");
		var pass2Obj=document.querySelector("[name=pass2]");
		var nameObj=document.querySelector("[name=name]");
		var emailObj=document.querySelector("[name=email]");
		var nicknameObj=document.querySelector("[name=nickname]");
		var checkboxObj=document.querySelectorAll("#chbx");
		if(idObj.value==""){
			alert("id를 입력하세요.");
			idObj.focus();
			return false;
		} else{
	        if(idObj.value.length<4 || idObj.value.length>16){
	       		alert("4~16글자로 입력하세요.");
	       		idObj.value="";
	       		idObj.focus();
	            return false;
	        }else{
	        	<%
	        	for(Member m:mlist){
	        	%>
	        		if(idObj.value=='<%=m.getM_id()%>'){
	        			alert("이미 존재하는 id입니다.");
	        			idObj.value="";
	        			idObj.focus();
	    	            return false;
	        		}
	        	<%
	        	}
	        	%>
	        }
	    }
		if(pass1Obj.value==""){
			alert("password를 입력하세요.");
			pass1Obj.focus();
			return;
		} else{
	        if(pass1Obj.value.length<8 || pass1Obj.value.length>16  ){
	       		alert("8~16글자로 입력하세요.");
	       		pass1Obj.value="";
	       		pass1Obj.focus();
	       		return false;
	        }
	    }
		if(pass2Obj.value==""){
			alert("password를 입력하세요.");
			pass2Obj.focus();
			return false;
		} else{
	        if(pass2Obj.value.length<8 || pass2Obj.value.length>16  ){
	       		alert("8~16글자로 입력하세요.");
	       		pass2Obj.value="";
				return false;
	        }
	    }
		if(!(pass1Obj.value==pass2Obj.value)){
			alert("비밀번호를 동일하게 입력해주세요");
			pass1Obj.focus();
			return false;
		}
		if(nameObj.value==""){
			alert("이름을 입력하세요.");
			nameObj.focus();
			return false;
		} 
		if(emailObj.value==""){
			alert("이메일을 입력하세요.");
			emailObj.focus();
			return false;
		} 
		if(nicknameObj.value==""){
			alert("닉네임을 입력하세요.");
			nicknameObj.focus();
			return false;
		}else{
        	<%
        	for(Member m:mlist){
        	%>
        	if(nicknameObj.value=='<%=m.getM_nickname()%>'){
        			alert("이미 존재하는 닉네임입니다.");
        			nicknameObj.value="";
        			nicknameObj.focus();
    	            return false;
        		}
        	<%
        	}
        	%>
        }	
		if(!checkboxObj[0].checked){
			alert("이용약관을 동의해주세요");
			checkboxObj[0].focus();
            return false;
		}
		if(!checkboxObj[1].checked){
			alert("개인정보 수집 및 이용동의를 해주세요");
			checkboxObj[1].focus();
            return false;
		}
		document.querySelector("form").submit();
		
	}
	
	var id="<%=id%>";
	if(id!=""){
		alert("회원가입을 축하드립니다.\n로그인 페이지로 이동합니다.");
		location.href="login.jsp";
	}

</script>
</html>