<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style type="text/css">
.ox {
	width: 20%;
	height: 90%;
	position: absolute;
	background-color: lightblue;
}

.answer {
	width: 20%;
	height: 90%;
	margin-left: 20%;
	position: absolute;
	background-color: lightgreen;
}

.check {
	width: 20%;
	height: 90%;
	margin-left: 40%;
	position: absolute;
	background-color: lightyellow;
}

.save {
	width: 20%;
	height: 90%;
	margin-left: 60%;
	position: absolute;
	background-color: pink;
}

.button {
	width: 80%;
	height: 143.2px;
	margin-top: 96.9%;
	position: relative;
	background-color: gray;
}

.section {
	width: 100%;
	height: 80px;
	position: relative;
	background-color: lightyellow;
}

.a1 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: lightgreen;
}

.a2 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: lightyellow;
}

.a3 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: pink;
}

.a4 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: white;
}
</style>
</head>

 <div class=ox>
	<div class=section>정답 유무</div>
	<c:forEach varStatus="no" items="${result }" var="rs">
		<div class="a${no.count }">정답: ${rs.ox }</div>
	</c:forEach>
</div>

<div class=answer>
	<div class=section>문제 정답</div>
	<c:forEach varStatus="no" items="${problem }" var="qq">
		<div class="a${no.count }">정답: ${qq.answer }</div>
	</c:forEach>
</div>

<div class=check>
	<div class=section>선택한 답</div>
	<c:forEach varStatus="no" items="${result }" var="rs">
		<div class="a${no.count }">정답: ${rs.input }</div>
	</c:forEach>
</div>

<div class=save>
	<div class=section>학습노트 저장</div>
	<form action= "ProblemSave" method="post">
	<c:forEach varStatus="no" items="${problem }" var="qq">
			<div class="a${no.count }">문제 ${qq.id}번 
		<input type= "hidden" name="id${no.count }" value="${qq.id }">
		<input type = "checkbox" name= "save${no.count }" value = ${no.count }><br>
			</div>
	</c:forEach>
			<div>
		<input type = "submit" value ="저장하기">
			</div>
		</form>
</div>