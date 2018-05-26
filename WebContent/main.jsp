<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
<link href="https://fonts.googleapis.com/css?family=Fredoka+One|Racing+Sans+One" rel="stylesheet"><title>Insert title here</title>

<title>Insert title here</title>

<style type="text/css">
@-webkit-keyframes typing {
    from { width: 0 }
    to { width:30.3em }
}
@-moz-keyframes typing {
    from { width: 0 }
    to { width:30.3em }
}
@-webkit-keyframes blink-caret {
    from, to { border-color: transparent }
    50% { border-color: black }
}
@-moz-keyframes blink-caret {
    from, to { border-color: transparent }
    50% { border-color: black }
}

h1 {
	text-align : center;
    font-size:180%;
    font-family: 'Fredoka One', cursive;
    width:30.3em;
    white-space:nowrap;
    overflow:hidden;
    border-right: .1em solid black;
    -webkit-animation: typing 5s steps(30, end), /* # of steps = # of characters */
                        blink-caret 1s step-end infinite;
    -moz-animation: typing 5s steps(30, end), /* # of steps = # of characters */
                        blink-caret 1s step-end infinite;
}
</style>


</head>


<body>


<center><h1>Welcome to QuizLover Home! Meet JAVA and JSP With Us.</h1></center>

<br><br>
<center><h6>지아: 타이핑 효과 테스트해봅니다.</h6></center>

	<div class="tot">

		<div class="btns">

			<button onclick="back()">뒤로</button>
			<button onclick="next()">다음</button>
	
		</div>

		<div class="big">

			<div id="imgs">

				<script type="text/javascript">
			for(var i=0;i<12;i++){
		 		document.write("<img src='../../imgs/"+i+".jpg'>");

			}

		</script>

			</div>



		</div>

		<div class="aside">

			<script type="text/javascript">

			for(var i=0;i<12;i++){

		 		document.write("<div class='nav' onclick='moveImg("+i+")'></div>");

			}

		</script>

		</div>



	</div>





	<script type="text/javascript">

	var currIndex =0;

	

	function moveImg(pos){

		currIndex=pos;

		currIndex%=12;

		if(currIndex<0) currIndex=11;

		

		imgs = document.getElementById("imgs");

		imgs.style.left=-currIndex*100+"%";

		

		var navArr = document.getElementsByClassName("nav");

		for(k in navArr){

			navArr.item(k).style.background='#fff';

		}

		navArr.item(currIndex).style.background='#0f0';

	}

	

	function back(){

		moveImg(currIndex-1);

	}

	

	function next(){

		moveImg(currIndex+1);

	}

	var roll=setInterval(next, 1000);
	
	imgs.onmouseover=function(){
		clearInterval(roll);
	}
	
	imgs.onmouseout=function(){
		roll =setInterval(next,1000);
	}
	
	
	//슬라이드
		var pos = 0;
		function move(){
			m = setInterval(function(){
			pos--;
			imgs.style.left=pos*1+'%';
			}, 50);
		} 
		//슬라이드멈춤
		function movestop(){
			clearInterval(m)
		}
	
	
	
	moveImg(5);





</script>

</body>

</html>