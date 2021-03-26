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
<style>

</style>
<script>
	window.onload=function(){
      
	};
</script>
</head>
	<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	if(id==null) id="";
	if(name==null) name="";
	if(email==null) email="";

	loginService dao=new loginService();
	Member m=dao.passfind(id,name,email);
	boolean isPassFind=false;
	if(m!=null){
		response.sendRedirect("passfindresult.jsp?id="+id);
	}
	else {
		isPassFind=true;
		response.sendRedirect("passfind.jsp?isPassFind="+isPassFind);
	}
	%>
<body>
</body>
<script>

</script>
</html>