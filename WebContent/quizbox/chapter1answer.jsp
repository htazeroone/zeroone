<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style type="text/css">
#ox {
	width: 20%;
	height: 90%;
	position: absolute;
	background-color: lightblue;
}

#answer {
	width: 20%;
	height: 90%;
	margin-left: 20%;
	position: absolute;
	background-color: lightgreen;
}

#check {
	width: 20%;
	height: 90%;
	margin-left: 40%;
	position: absolute;
	background-color: lightyellow;
}

#last {
	width: 20%;
	height: 90%;
	margin-left: 60%;
	position: absolute;
	background-color: pink;
}

#save {
	width: 20%;
	height: 90%;
	margin-left: 80%;
	position: absolute;
	background-color: white;
}

#button {
	width: 100%;
	height: 10%;
	margin-top: 106.5%;
	position: relative;
	background-color: gray;
}

#section {
	width: 100%;
	height: 11%;
	position: relative;
	background-color: lightyellow;
}

#a1 {
	width: 100%;
	height: 22%;
	position: relative;
	background-color: lightgreen;
}

#a2 {
	width: 100%;
	height: 22.5%;
	position: relative;
	background-color: lightyellow;
}

#a3 {
	width: 100%;
	height: 22.5%;
	position: relative;
	background-color: pink;
}

#a4 {
	width: 100%;
	height: 22.5%;
	position: relative;
	background-color: white;
}
</style>
</head>

<div id=ox>정답 유무</div>

<div id=answer>
<div id=section>문제 정답</div>
<c:forEach varStatus="no" items="${problem }" var="qq">
<div id="a${no.count }">정답: ${qq.answer }</div>
</c:forEach>
</div>

<div id=check>선택한 답</div>

<div id=last>지난번에 선택한 답</div>

<div id=save>학습노드 저장</div>

<div id=button>정답수정 및 학습노트에 저장하기</div>