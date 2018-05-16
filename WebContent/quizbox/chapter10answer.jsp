<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style type="text/css">

#ox {
	width: 20%;
	height: 80%;
	position: absolute;
	background-color: lightblue;
}

#answer {
	width: 20%;
	height: 80%;
	margin-left: 20%;
	position: absolute;
	background-color: lightgreen;
}

#check {
	width: 20%;
	height: 80%;
	margin-left: 40%;
	position: absolute;
	background-color: lightyellow;
}

#last {
	width: 20%;
	height: 80%;
	margin-left: 60%;
	position: absolute;
	background-color: pink;
}

#save {
	width: 20%;
	height: 80%;
	margin-left: 80%;
	position: absolute;
	background-color: white;
}

#button {
	width: 100%;
	height: 23.75%;
	margin-top : 90%;
	position: absolute;
	background-color: gray;
}

</style>
</head>

<div id=ox>정답 유무</div>

<div id=answer>문제 정답</div>

<div id=check>선택한 답</div>

<div id=last>지난번에 선택한 답</div>

<div id=save>학습노드 저장</div>

<div id=button>정답수정 및 학습노트에 저장하기</div>