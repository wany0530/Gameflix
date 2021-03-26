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
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	if(name==null) name="";
	if(email==null) email="";
	
	loginService dao=new loginService();
	Member m=dao.idfind(name,email);
	boolean isIdFind=false;
	if(m!=null){
		String id=m.getM_id();
		response.sendRedirect("idfindresult.jsp?id="+id+"&email="+email);
	}
	else {
		isIdFind=true;
		response.sendRedirect("idfind.jsp?isIdFind="+isIdFind);
	}
	%>
<body>
</body>
<script>

</script>
</html>