<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import="gameflix.web.entity.*"
    import = "gameflix.web.service.*"
   %>
<% request.setCharacterEncoding("UTF-8"); 
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta meta http-equiv="Content-Type" charset="UTF-8">
<title>Gameflex</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
<style>
	
	body{
	background : black;
	margin : 0px;
	padding : 0px;
	height : 750px;
	}
	
   .contents-wrap {
   min-height:100%;
   position:relative;
   }
	
	#title{
	color : #F23005;
	position : absolute;
	font-size : 35px;
	font-weight : bold;	
	left : 50%;
	margin-left : -80px; 
	margin-top : 70px;
	
	}
	
	#gameBtn{
	   position : absolute;
	   top : 150px;
	   left : 50%;
	   margin-left : -350px;
	
	}
	
	#gameBtn input{
	   background-color: #000;
	   border: none;
 	   color: #fff;
 	   opacity : 0.7;
 	   padding: 10px 24px;
 	   cursor: pointer;
	}

	#gameBtn input:hover{
	   background-color: #F23005;
  	   color: #fff;
  	   opacity : 1.0;
  	   font-weight : bold;
	}		

   #game1_rank{
   	  display:block;    
   	  position :absolute; 
	  top : 220px; 
	  left : 50%; 
	  border-collapse :collapse;	  	  
	  margin-left :-330px; 
	  text-align :center;
	  font-size :12px; 
	  color :#fff;  
   }
   
   #game2_rank, #game3_rank, #game4_rank, #game5_rank, #game6_rank{
   	  display:none;    
   	  position :absolute; 
	  top : 220px; 
	  left : 50%; 
	  border-collapse :collapse;	  	  
	  margin-left :-330px; 
	  text-align :center;
	  font-size :12px; 
	  color :#fff;  
   }
    th {
   	  background-color : #F23005;
   	  width : 220px;
   	  height : 30px;
   	}
   	td{
   	  height :40px; 
   	  border-bottom : 0.5px solid #fff;
   	}
  
</style>
<script>
	window.onload = function(){
	};
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class = "contents-wrap">

	    <div id="title">RANKING</div>      
	     
		<div>
	      <form id="gameBtn">
	         <!-- 클릭 시 게임별 랭킹 테이블 보이기 -->
	         <input type="button" value="카드게임" onclick="game1()">
	         <input type="button" value="퀴즈게임" onclick="game2()">
	         <input type="button" value="2048게임" onclick="game3()">
	         <input type="button" value="테트리스게임" onclick="game4()">
	         <input type="button" value="음료통합게임" onclick="game5()">
	         <input type="button" value="길찾기게임" onclick="game6()">         
	      </form>
	   </div>
	   <jsp:useBean id="r" class="gameflix.web.entity.Ranking" scope="session"/>
	   <jsp:setProperty property="*" name="r"/> 
			    
	   <div id="game_rank">
	     	 <table id="game1_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<% 	     		
	     		RankingService dao = new RankingService();
	     		ArrayList<Ranking> rlist1 = dao.rankList1();
	     		int cnt1=1;
	     		for(Ranking rk : rlist1){ 
	     		%>	     		
	     		<tr>
		     		<td><%=cnt1++ %></td>
		   			<td><%= rk.getM_nickname() %></td>
		   			<td><%= rk.getP_score() %></td> 
	   			</tr>
	   			<%} %>		
	     	 </table> 
	    	 
	     	 <table id="game2_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>	
	     		<% 	     		
	     		ArrayList<Ranking> rlist2 = dao.rankList2();
	     		int cnt2=1;
	     		%>	     		
	     		
	     			<% for(Ranking rk : rlist2){ %>
	     			<tr>
		     			<td><%=cnt2++ %></td>
		     			<td><%= rk.getM_nickname() %></td>
		     			<td><%= rk.getP_score() %></td> 
	     			</tr>
	     			<%} %>
	     			
	     	 </table> 	     	
			
	     	 <table id="game3_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		
	     		<% 	     		
	     		ArrayList<Ranking> rlist3 = dao.rankList3();
	     		int cnt3=1;
	     		%>	     		
	     		
	     			<% for(Ranking rk : rlist3){ %>
	     			<tr>
		     			<td><%=cnt3++ %></td>
		     			<td><%= rk.getM_nickname() %></td>
		     			<td><%= rk.getP_score() %></td> 
	     			</tr>
	     			<%} %>
	     			
	     	 	
	     	 </table> 
	     	 
	     	 <table id="game4_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr> 	
	     		<% 	     		
	     		ArrayList<Ranking> rlist4 = dao.rankList4();
	     		int cnt4=1;
	     		%>	     		
	     		
	     			<% for(Ranking rk : rlist4){ %>
	     			<tr>
		     			<td><%=cnt4++ %></td>
		     			<td><%= rk.getM_nickname() %></td>
		     			<td><%= rk.getP_score() %></td> 
	     			</tr>
	     			<%} %>
	     			
	     	 </table> 
	     	 
	     	 <table id="game5_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>  	
	     		<% 	     		
	     		ArrayList<Ranking> rlist5 = dao.rankList5();
	     		int cnt5=1;
	     		%>	     		
	     		
	     			<% for(Ranking rk : rlist5){ %>
	     			<tr>
		     			<td><%=cnt5++ %></td>
		     			<td><%= rk.getM_nickname() %></td>
		     			<td><%= rk.getP_score() %></td> 
	     			</tr>
	     			<%} %>
	     			
	     	 </table> 
	     	 
	     	 
	     	 <table id="game6_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<% 	     		
	     		ArrayList<Ranking> rlist6 = dao.rankList6();
	     		int cnt6=1;
	     		%>	     		
	     		
	     			<% for(Ranking rk : rlist6){ %>
	     			<tr>
		     			<td><%=cnt6++ %></td>
		     			<td><%= rk.getM_nickname() %></td>
		     			<td><%= rk.getP_score() %></td> 
	     			</tr>
	     			<%} %>
	     		
	     	 </table> 
	     </div>   
     </div>    
	
	<%@ include file="footer.jsp" %> 
</body>
<script type="text/javascript">

	function game1() {
		var show = document.getElementById("game1_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}	
	function game2() {
		var show = document.getElementById("game2_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game3() {
		var show = document.getElementById("game3_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game4() {
		var show = document.getElementById("game4_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game5() {
		var show = document.getElementById("game5_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game6() {
		var show = document.getElementById("game6_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}	
</script>
</html>