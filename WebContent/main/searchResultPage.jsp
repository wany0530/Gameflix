<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=path%>/jquery/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="css/default.css">
</head>
<style>
body { background-image: url(img/01.jpg); }
#container { width: 1024px; margin: 0 auto; background: white; padding: 20px; 	color: #979797;}
#container > #searchList a { color: rgb(14, 14, 14);}
#container > #searchList img { width: 80px; height: 80px; padding: 10px;}
#container > #searchList h2:before {  content: "● "; color: #963D2A; }
#container > #searchList h2 { color: #963D2A; margin-bottom: 30px; margin-left: 130px; margin-top: 20px; }
#container > #searchList .orange { color: orange; }
#container > #searchList .bold { font-weight: bold; }
#container > #searchList table { 
	border-collapse: collapse; width: 70%; text-align: center;
	font-size: 14px; margin: 0 auto; margin-bottom: 30px; border-top: 2px solid #963D2A;}
#container > #searchList tr:hover { background-color: lightgray; }
#container > #searchList th { background-color: #f5f5f5; height: 30px; }
#container > #searchList td { border-bottom: 1px solid #e9e9e9; }
#container > #searchList > #page-control { text-align: center; margin-bottom: 20px; color: black; bold; }
#container > #searchList > #page-control a { margin: 0 10px; }
</style>
<body>
	<%@ include file="/../header.jsp" %>
	<div id="container">
		<div id="searchList">
			<h2>검색결과</h2>
			<table border>
				<col width="10%"><col width="20%"><col width="20%">
				<col width="20%">
				<tr>
					<th>번호</th><th>이미지<th>게임명</th><th>등록일</th>
				</tr>
				<c:if test="${!empty list}">
				<c:forEach var="g" items="${list}">
				<tr onclick="location.href='${g.g_link}?pname=${g.g_name }'">
					<td>${g.g_num}</td>
					<td><img src="${g.g_imgPath}" onerror="this.src='img/default.png'"/></td>
					<td>${g.g_name}</td>
					<td>${g.g_date}</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty list}">
					<tr><td colspan="4" rowspan="2">검색 결과가 존재하지 않습니다.</td></tr>
				</c:if>
			</table>
			<div id="page-control">
				<c:set var="page" value="${(empty param.p)?1:param.p}"/>
				<c:set var="startNum" value="${page-(page-1)%5}"/>
				<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/5), '.')}"/>
				<c:if test="${startNum > 1}">
					<a href="?p=${startNum-1}">이전</a>
				</c:if>
				<c:if test="${startNum <= 1}">
					<span onclick = "alert('이전 페이지가 없습니다.')">이전</span>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
				<c:if test="${startNum + i <= lastNum}">
					<a href="?p=${startNum + i}&q=${param.q}" 
						class="${(page == (startNum + i))?'orange':''} blod">
						${startNum + i}
					</a>
				</c:if>
				</c:forEach>
				<c:if test="${lastNum > startNum+4}">
					<a href="?p=${startNum+5}">다음</a>
				</c:if>
				<c:if test="${lastNum <= startNum+4}">
					<span onclick = "alert('다음 페이지가 없습니다.')">다음</span>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/../footer.jsp" %>
</body>
</html>