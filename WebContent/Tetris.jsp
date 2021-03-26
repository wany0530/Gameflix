<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="Tetris.css"/>
<script type="text/javascript" src="/jspexp/a00_com/jquery-3.5.1.js"></script>
</head>
<body onload="showImage()">
	<%@ include file="header.jsp" %>
	<%-- 마이페이지 메인 --%>
	<section class="container">
		<div class="row" id="section_size">
			<div class="col-2"></div>
			<div class="col-8" style="margin-top:20px">
				<div class="row">
					<div class="col-8">
						<!-- 메인 박스 (게임플레이) -->
						<div class="container2">
		            		<div class="grid"></div>
		        		</div>
					</div>
					<div class="col-4">				
						<div class="row">
							<!-- 다음에 나올 모양 박스-->
							<div class="col">
								<div class="mini-grid"></div>
							</div>
						</div>		
						<div class="row">
							<!-- 점수판 -->
							<div class="col" style="margin-top: 50px;">
								<button type="button" class="btn btn-danger" disabled style="width:160px;">Score 
									<span class="badge bg-secondary" id="score" ></span>
								</button>
								 <form method="get" action="scoreResult.jsp" id="scoreResult">
        							<input type="hidden" name="score"/>
        							<input type="hidden" name="g_title"/>
        						</form>
							</div>
						</div>
						<div class="row">
							<!-- 일시정지 / 계속 -->
							<div class="col" style="margin-top: 50px;">
								<button id="stop-button" class="btn btn-danger" style="width:160px;">시작 / 중지</button>
							</div>
						</div>		
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
<script src="Tetris.js" charset="utf-8"></script>
</html>