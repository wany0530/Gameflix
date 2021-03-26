<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="gameflix.web.service.CardgameService"
%>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
%>
<jsp:useBean id="m" class="gameflix.web.entity.Member" scope="session"/>
<%
    CardgameService dao=new CardgameService();
 	String g_name=dao.selectGname("cardgame.jsp");
 	//dao.CardBadge(g_name);
	String badge=dao.selectbadge(m.getM_no(),g_name);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<style>
	body{background-image: url(img/01.jpg);}  
	
	.card_content{
		margin:0 auto;
		background:white;
		width:1024px;
		height:1200px;
	}
	
	#game_box{
		width:460px;
		height:670px;
		margin:0 auto;
		position:relative;
		top:200px;
	}
	
	#game_tab{
		position:relative;
		width:460px;
		background-color:black;
	}

	#game_bg{
		width:460px;
		height:220px;
		position:relative;
	}

	#game_img{
		width:460px;
		position:relative;
	}
	
	#game_tab img{
		border:0px;
		height:110px;
		width:150px;
	}
	
	#start{
		text-align:center;
		top:220px;
		position:relative;
	}
	
	#start_button{
		border: 1px solid green;
		background:green;
		color:white;
		font-size:20px;
		font-weight:bold;
		width:140px;
		height:40px;
	}
	
	#jb {
		position:relative;
		top:200px;
		display:block;
		width: 460px;
		height: 50px;
		margin:0 auto;
	}
</style>
<script>
	
	// 카드 이미지 배열
	var card=["img/card1.png","img/card2.png","img/card3.png","img/card4.png","img/card5.png","img/card6.png"
		,"img/card1.png","img/card2.png","img/card3.png","img/card4.png","img/card5.png","img/card6.png"];
	
	var openCard=0; // 몇번째로 클릭한 카드인지 0,1,2
	var firstIdx=0; // 첫번째 클릭한 카드 idx
	var secondIdx=0; // 두번째 클릭한 카드 idx
	var firstCard=""; // 첫번째 클릭한 카드 img
	var secondCard=""; // 두번째 클릭한 카드 img
	var count=0; // 점수
	var openedCard=[]; // 클릭하여 맞춘 카드 배열
	var clickopt=0; // 카드 클릭 여부 변수
	
	function start(){ // 게임 시작
		openCard=0;
		firstIdx=0;
		secondIdx=0;
		firstCard="";
		secondCard="";
		count=0;
		openedCard=[];
		arrangeCard(); // 카드 섞기 함수 호출
		clickopt=1; // 시작버튼 누르면 1로 바뀌어 카드 클릭 가능
		var timecnt=20;
		var set05=setInterval(function(){ // 1분 카운트 다운 진행바로 표시
			if(timecnt==0) { clearInterval(set05);}
			document.querySelector("#jb").value=--timecnt;
		},1000);
		
		var set00=setTimeout(function(){ // 1분후 게임 종료
			alert("게임 종료");
			clickopt=0;
		//	for(var i=0;i<card.length;i++){
		//		document.querySelectorAll("td")[i].innerHTML="<img src='img/card.PNG' >";
		//	}
			location.href="card_result.jsp?count="+count;
			clearTimeout(set00);
		},20000);
	}
	
	function arrangeCard(){ // 랜덤 카드 섞기 함수
		for(var i=0;i<card.length;i++){
			for(var j=0;j<50;j++){
				var rand=Math.floor(Math.random()*12);
				tmp=card[i];
				card[i]=card[rand];
				card[rand]=tmp;
			}
		}
		for(var i=0;i<card.length;i++){ // 섞은 카드 배열 이미지 표시
			document.querySelectorAll("td")[i].innerHTML="<img src='"+card[i]+"' >";
		}
		
		var set01=setTimeout(function(){ // 지정 시간 후 기본 이미지 표시
			for(var i=0;i<card.length;i++){
				document.querySelectorAll("td")[i].innerHTML="<img src='img/card.PNG' >";
				clearTimeout(set01);
			}
		},1200);
	}
	
	function changecard(i){ // 카드 클릭 변환
		if(clickopt==0){ // 시작 버튼을 누르지 않을경우
			return; // 클릭 불가
		}
		for(var idx=0;idx<openedCard.length;idx++){ // 카드를 중복으로 클릭한지 여부 검사
			if(i==openedCard[idx]){
				return;
			}
		}
		document.querySelectorAll("td")[i].innerHTML="<img src='"+card[i]+"'>";
		openCard++;	
		if(openCard==1){ // 첫번째 카드 클릭
			firstCard="<img src='"+card[i]+"'>";
			firstIdx=i;
			openedCard.push(firstIdx);
		} else if(openCard==2){ // 두번째 카드 클릭
			secondIdx=i;
			openedCard.push(secondIdx);
			secondCard="<img src='"+card[i]+"'>";
			if(firstCard==secondCard){ // 첫번째와 두번째 카드 이미지가 같으면 
				count+=100; // 점수 추가
				// console.log(count);
			}else{ // 다르다면
				var set02=setTimeout(function(){ // 지정 시간후 기본 이미지로 다시 변환
					document.querySelectorAll("td")[firstIdx].innerHTML="<img src='img/card.PNG' >";
					document.querySelectorAll("td")[secondIdx].innerHTML="<img src='img/card.PNG' >";
					clearTimeout(set02);
				},300);
				openedCard.pop(); // 다르다면 맞춘 카드 배열에서 제거
				openedCard.pop();
			}
			openCard=0;
			if(openedCard.length==card.length){ // 카드가 모두 뒤집어진경우
				openedCard=[];
				arrangeCard();
			}
		}
	}
	
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="card_content">
		<div id="game_box">
			<div id="game_img"><img src="img/cardgame_bg.png" id="game_bg"></div>
			<table id="game_tab">
				<tr><td onclick="changecard(0)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(1)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(2)"><img src="img/card.PNG" class="card"></td></tr>
				<tr><td onclick="changecard(3)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(4)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(5)"><img src="img/card.PNG" class="card"></td></tr>					
				<tr><td onclick="changecard(6)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(7)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(8)"><img src="img/card.PNG" class="card"></td></tr>
				<tr><td onclick="changecard(9)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(10)"><img src="img/card.PNG" class="card"></td><td onclick="changecard(11)"><img src="img/card.PNG" class="card"></td></tr>
			</table>
	
		</div>
		<div>
			<progress value="60" max="60" id="jb"></progress>
		</div>
		<div id="start">
			<input type="button" value="게임 시작" onclick="start()" id="start_button">
		</div>
	</div>
	
	<%@ include file="footer.jsp"  %>
</body>
</html>