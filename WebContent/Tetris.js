//addEventListener 이벤트를 등록하는 가장 권장되는 방식.

    const div01 = "<div></div>"
    // taken은 마지막 줄을 의미.
    const div02 = "<div class='taken'></div>"
    const grid1 = document.querySelector('.grid');
    for (let mainC=0; mainC<200; mainC++){
    grid1.innerHTML+= div01;
}
    for (let lastline =0; lastline<10; lastline++){
    grid1.innerHTML+= div02;
}
    for (let miniC=0; miniC<16; miniC++){
    document.querySelector('.mini-grid').innerHTML+= div01;
}

    //DOMContentLoaded는 초기 HTML 문서를 완전히 불러오고 분석했을 때 발생합니다.
    document.addEventListener('DOMContentLoaded', () => {
        
        const grid = document.querySelector('.grid');
        //200개의 div 각각을 얕게 복사해서 squares에 넣는다.
        let squares = Array.from(document.querySelectorAll('.grid div'))
        const scoreDisplay = document.querySelector('#score');
        const startBtn = document.querySelector('#stop-button');
        const width = 10
        let nextRandom = 0;
        var timerId;
        let score = 0;
        const colors = [
            'url(img/blue_block.png)',
            'url(img/pink_block.png)',
            'url(img/purple_block.png)',
            'url(img/peach_block.png)',
            'url(img/yellow_block.png)'
        ]
        
        
        //테트리스 모양 
        // ┌ 모양의 4가지
        const lTetromino=[
            [1, width+1, width*2+1, 2],
            [width, width+1, width+2, width*2+2],
            [1, width+1, width*2+1, width*2],
            [width, width*2, width*2+1, width*2+2]
        ];
        // 번개모양 4가지
        const zTetromino = [
            [0, width, width+1, width*2+1],
            [width+1, width+2, width*2, width*2+1],
            [0, width, width+1, width*2+1],
            [width+1, width+2, width*2, width*2+1]
        ];
        //ㅗ모양 4가지
        const tTetromino = [
            [1, width, width+1, width+2],
            [1, width+1, width+2, width*2+1],
            [width, width+1, width+2, width*2+1],
            [1, width, width+1, width*2+1]
        ];
        // ㅁ모양
        const oTetromino = [
            [0, 1, width, width+1],
            [0, 1, width, width+1],
            [0, 1, width, width+1],
            [0, 1, width, width+1]
        ];
        // ㅣ 모양
        const iTetromino = [
            [1, width+1, width*2+1, width*3+1],
            [width, width+1, width+2, width+3],
            [1, width+1, width*2+1, width*3+1],
            [width, width+1, width+2, width+3]
        ];

        // 랜덤으로 나오게하기위해 theTetrominos라는 배열에 넣는다.
        const theTetrominoes = [lTetromino, zTetromino, tTetromino, oTetromino, iTetromino];
        
        //내려오는 블록들의 시작 위치
        let currentPosition = 4;
        // 블록들의 표현4가지 중 하나를 위한 변수.
        let currentRotation = 0;
        //테트리스 시작시 나오는 모양 랜덤하게 처리.
        let random = Math.floor(Math.random()*theTetrominoes.length);
        console.log(random);
        //[모양을 랜덤하게 선택 첫번째 배열][각 모양의 4가지 표현중 하나의 표현] 
        let current = theTetrominoes[random][currentRotation];

        //테트리스 모양 그리기.
        //모양의 인덱스를 200개의 div에 표현.
        function draw(){
            current.forEach(index => {
                //색깔입히기.(css파일에 존재하는 tetromino클래스(.tetromino)를 입힐때 사용.)
                //classList는 엘리먼트(요소)에 클래스 값을 추가한다.
                //squares[currentPosition+index].classList.add('tetromino');
                squares[currentPosition+index].style.backgroundImage = colors[random];
            })
            displayShape();
        }
        

        //테트리스 모양 지우기(한칸씩 내려오는것을 위해 지우는기능 필수)
        // 색깔 x
        function undraw(){
            current.forEach(index => {
                //squares[currentPosition+index].classList.remove('tetromino');
                squares[currentPosition+index].style.backgroundImage = '';
            })
        }

        //블록들이 내려오게하는 하는 기능
        function moveDown(){
            undraw();
            currentPosition += width;
            draw();
            freeze();
        }

        // 1초마다 moveDown을 하기위해 설정.
        timerId = setInterval(moveDown, 1000)

        // 시작에 정지시키는법.
        if(timerId){
            clearInterval(timerId);
            timerId = null;
        }
        
        //방향키를 누를때 발생할 함수.
        function control(e){
            if(e.keyCode === 65){
                moveLeft();
            }else if (e.keyCode === 87){
                rotate()
            }else if(e.keyCode === 68){
                moveRight()
            }else if (e.keyCode === 83){
                //↓를 누르면 빠르게 내려오기
                moveDown()
            }
        }
        //event.keyup을 
        document.addEventListener('keyup', control)

        //쌓이는 기능.
        function freeze(){
            //블럭이 210개의 div중에 taken(마지막줄 10개div)에 존재하는지 확인한 후.
            if(current.some(index => squares[currentPosition + index + width].classList.contains('taken'))){
                //고정시켜준다.
                current.forEach(index => squares[currentPosition+index].classList.add('taken'));
                // 다음 블럭이 나오게하기위해 random을 0으로 초기화
                random = nextRandom;
                // 다음블럭의 모양을 랜덤하게 추출하고 설정.
                nextRandom = Math.floor(Math.random() * theTetrominoes.length)
                current = theTetrominoes[random][currentRotation];
                // keyup의 이벤트로인해 currentPosition의 값이 변동되었기 땜누에 다시 맨윗줄 index(4)로 설정.
                currentPosition = 4;
                displayShape();
                addScore();
                gameOver();
                draw();
            }
        }
        //←클릭시 이동.
        function moveLeft(){
            undraw();
            //현재 모양의 index위치를 정수형 0 과 비교해서 false면 이동가능 true이면 이동 불가능.
            const isAtLeftEdge = current.some(index => (currentPosition + index) % width === 0);
            if(!isAtLeftEdge) currentPosition -= 1;
            // 만약 왼쪽으로 이동할때 쌓인 블록이 이미 존재해있으면 이동X
            if(current.some(index => squares[currentPosition + index].classList.contains('taken'))){
                currentPosition += 1;
            }
            draw();
        }
        //→클릭시 이동.
        function moveRight(){
            undraw()
            const isAtRightEdge = current.some(index => (currentPosition + index) % width === width -1);
            if(!isAtRightEdge) currentPosition += 1;
            if(current.some(index => squares[currentPosition+index].classList.contains('taken'))){
                currentPosition -= 1;
            }
            draw();
        }
        
        //↑ 클릭시 모양 변경.
        function rotate(){
            undraw()
            currentRotation ++;
            //모양표현이 4개까지이기때문에 4개가 넘어가면 표현[0]으로 다시 초기화
            if(currentRotation === current.length){ // 
                currentRotation = 0;
            }
            current = theTetrominoes[random][currentRotation];
            
            draw();
        }

        //다음에 나올 블럭들을 표시.
        const displaySquares = document.querySelectorAll('.mini-grid div');
        const displayWidth = 4;
        let displayIndex = 0;
        
        //각 모양을 첫번쨰 표현들을 배열로 집어넣는다.
        const upNextTetrominoes = [
            [1,displayWidth+1, displayWidth*2+1, 2], //Ltetromino
            [0,displayWidth,displayWidth+1,displayWidth*2+1], // ztetromino
            [1,displayWidth,displayWidth+1,displayWidth+2], // tTetromino
            [displayWidth+1,displayWidth+2,displayWidth*2+1,displayWidth*2+2], // otetromino
            [1,displayWidth+1, displayWidth*2+1, displayWidth*3+1] // Itetromino
        ]

        // 미니 맵을 통해 다음에 나올 모양들을 표현.
        function displayShape(){
            displaySquares.forEach(square => {
                //square.classList.remove('tetromino')
                square.style.backgroundImage = '';
            });
            upNextTetrominoes[nextRandom].forEach(index =>{
                //displaySquares[displayIndex + index].classList.add('tetromino');
                displaySquares[displayIndex + index].style.backgroundImage = colors[nextRandom];
            })
        }

        //일시정지 및 재시작.
        startBtn.addEventListener('click', () =>{
            if(timerId){
                clearInterval(timerId);
                timerId = null;
                
            } else {
                draw()
                timerId = setInterval(moveDown, 1000);
                nextRandom = Math.floor(Math.random()*theTetrominoes.length);
                displayShape();
                
            }
        })

        function addScore(){
            for(let i =0; i<199; i += width){
                const row = [i, i+1, i+2, i+3, i+4, i+5, i+6, i+7, i+8, i+9];

                if(row.every(index => squares[index].classList.contains('taken'))) {
                    score += 100;
                    scoreDisplay.innerHTML = score;
                    row.forEach(index => {
                        squares[index].classList.remove('taken');
                        squares[index].classList.remove('tetromino');
                        squares[index].style.backgroundImage = '';
                    })
                    const squaresRemoved = squares.splice(i, width);
                    squares = squaresRemoved.concat(squares);
                    squares.forEach(cell => grid.appendChild(cell));
                } 
            }
        }

        //game over
        function gameOver(){
        if(current.some(index => squares[currentPosition+index].classList.contains('taken'))){
            clearInterval(timerId);
            if(score > 0){
                const a = document.querySelector("[name=score]");
                const b = document.querySelector("[name=g_title]");
                a.value = score;
                b.value = "테트리스게임";
                document.querySelector("#scoreResult").submit();
            }else{
                scoreDisplay.innerHTML = "0";
            }
        }
    }
    })