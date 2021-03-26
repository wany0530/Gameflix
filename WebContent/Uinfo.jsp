<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	<%
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		String m_nickname = request.getParameter("m_nickname");
	%>
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form method="post">
		<table>
			<tr><th>아이디</th><td><input type="text" name="m_id"/></td></tr>
			<tr><th>아이디</th><td><input type="text" name="m_pw"/></td></tr>
			<tr><th>아이디</th><td><input type="text" name="m_name"/></td></tr>
			<tr><th>아이디</th><td><input type="text" name="m_email"/></td></tr>
			<tr><th>아이디</th><td><input type="text" name="m_nickname"/></td></tr>
		</table>
	</form>
</body>
</html>