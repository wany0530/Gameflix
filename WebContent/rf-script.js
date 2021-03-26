const gameObj = document.querySelector(".game");
const gametObj = document.querySelector(".gameTable");
const roottObj = document.querySelector(".rootTable");
const btnscore = document.querySelector(".showscore");
const btnstart = document.querySelector(".gamestart");
const btninfo = document.querySelector(".gameinfo");
const btnhint = document.querySelector(".gamehint");
const foximg = document.querySelector("#fox");
const inscore= document.querySelector("#inscore");
const status = document.querySelector("#status");

var isPlaying = false;
var isHint = false;
var isInfo = false;

var gtC=9;
var gtR=9;

var root=[];

var score;
var anss=[];
var anss2=[];
var anscnt=0;

// 게임 초기화
function gameReset(){
	for(var i in anss){	
			document.getElementById(anss[i]).style.backgroundColor="transparent";
	}
	anss=[];
	anss2=[];
	root=[];
	anscnt=0;
	status.value="";
	foximg.classList.remove("endingfox");
	score=2000;
	btnscore.innerText=score;
}

// 게임 테이블 만들기
function makegameTable(){
	gameReset();
	var gameTableCode="<tr>";
	for(var i=0; i<gtC*gtR; i++){
		if(i>0&&i%gtC==0){
			gameTableCode+="</tr><tr>";
		}
		gameTableCode+="<td id='rt"+i+"' ></td>";
	}
	gameTableCode+="</tr>";
	gametObj.innerHTML=gameTableCode;
}
window.onload = makegameTable();

// 정답만들기
function makeARoot(){
    var output= [];
    var comoutput=[];
    var r = Math.floor(Math.random()*gtC)*gtC;
    output.push('rt'+r); // 첫번째 답
    output.push('rt'+(++r)); // 두번째 답
    do {
        var ran = Math.floor(Math.random()*2-1); // -1(-9), 0(+1), 1(+9)
        var tmp = r;
        var cA = 0; 
        var cB = 0;
        if(ran==0) {
            tmp++;
            if(tmp-10>0) cB = tmp-10;
            if(tmp+8<81) cA = tmp+8;
        } else { // 1 or -1
            if(tmp<gtC) { // 무조건 +9 만 가능 
                tmp += gtC;
                ran = 1;
            } else if(tmp>gtC*(gtR-1)){ // 무조건 -9만 가능
                tmp -= gtC;
                ran = -1;
            } else { // -1(-9), 1(+9)
                tmp += ran*gtC;
            }
        }
        cA = tmp-8*ran;
        cB = tmp-10*ran;
        if(comoutput.includes('rt'+tmp)) continue;
        r=tmp;
        output.push('rt'+r);
        comoutput.push('rt'+r);
        comoutput.push('rt'+cA);
        comoutput.push('rt'+cB);
    } while(r%gtC!=(gtC-1));
    return output;  
}

// 정답테이블만들기
function makeRootTable() {
	var rootTableCode = "<tr>";
	for (var i = 0; i < gtC * gtR; i++) {
		if (i > 0 && i % gtC == 0) {
			rootTableCode += "</tr><tr>";
		}
		rootTableCode += "<td id='rt" + i + "'></td>";
	}
	rootTableCode += "</tr>";
	roottObj.innerHTML = rootTableCode;
	root = makeARoot();
}

// 게임시작
function gameStart(){
		gameReset();
		isPlaying = true;
		makeRootTable();
		btnstart.innerText="다시시작";
}
btnstart.addEventListener('click', gameStart);

// 게임안내
btninfo.addEventListener('click', function(){
	//if(isPlaying) return;
	if(!isInfo){
		isInfo = !isInfo;
		btninfo.innerText='닫기';
		var gameInfo = document.createElement('img');
		gameInfo.classList.add('gameInfoImg');
		gameInfo.src = 'img/rf-gameinfo.png';
		gameObj.appendChild(gameInfo);
	}else {
		isInfo=!isInfo;
		btninfo.innerText='게임안내';
		gameObj.removeChild(document.querySelector('.gameInfoImg'));
	}
});

// 힌트보기
function showRoot(){
	if(!isPlaying) return;
	isHint=true;
	anss=[];
	for(var i in root){
		document.getElementById(root[i]).style.backgroundColor="#AB8212";
	}
	var rtObj = document.querySelector(".rootTable");
	rtObj.style.zIndex="0";
	scoreChange(-1000);
	var timer=setTimeout(function (){
		rtObj.style.zIndex="-1";
		isHint=false;
		for(var i in root){
			document.getElementById(root[i]).style.backgroundColor="transparent";
		}
		clearTimeout(timer);
	},500);
}
btnhint.addEventListener('click', showRoot);

// 점수 변경
function scoreChange(state){
	score+=state;
	btnscore.innerText=score;
}


// 게임 플레이
function gameplay(e){
	if(!isPlaying) return;
	if(isHint) return;

	if(root.includes(e.target.id)){ // 정답 클릭 시
		if(anss.includes(e.target.id)) return; // 클릭 된 정답인지 확인
		e.target.style.backgroundColor="#AB8212";
		anss.push(e.target.id);
		if(!anss2.includes(e.target.id)) { // 이미 맞췄던 정답인지 확인
			anscnt++;
			anss2.push(e.target.id);
			scoreChange(75*anscnt);
		}
	} else { //오답 클릭 시
		for(var i in anss){	
			document.getElementById(anss[i]).style.backgroundColor="transparent";
		}
		anscnt=0;
		anss=[]; // 그동안 맞춘 정답 초기화
		scoreChange(-450);
	}
	if(anss.length==root.length){ // 모든 정답 맞췄는지 확인
			foximg.classList.add("endingfox");
			var timer = setTimeout(function (){
				gameEnd();
				clearTimeout(timer);
			}, 6000);
	}
}
gametObj.addEventListener('click', gameplay);

// 게임종료
function gameEnd(){
	alert('게임종료! 총 '+score+'점 수고하셨습니다!');
	isPlaying = false;
	btnstart.innerText='게임시작';
	// 플레이로그 insert 위한 부분
	inscore.value = score;
	status.value="end";
	console.log(score);
	document.querySelector("#rootform").submit();
}