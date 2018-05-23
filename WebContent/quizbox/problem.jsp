<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style type="text/css">

.chapter {
	width: 100%;
	height: 80px;
	position: relative;
	background-color: lightyellow;
}

.q1 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: lightgreen;
}

.q2 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: lightyellow;
}

.q3 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: pink;
}

.q4 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: white;
}

.checkAnswer {
	width: 100%;
	height: 143.2px;
	position: relative;
	background-color: yellow;
	text-align: center;
}

</style>
</head>
		<div class=chapter>chapter${sessionScope.num}</div>

<form action="Answer" method="post">
    
	<c:forEach varStatus="no" items="${problem }" var="qq">
		<input type="hidden" name="id${no.count }" value="${qq.id }">
		<div class="q${no.count }">Q.${qq.id} ${qq.question }<br>
			<input type = "radio" name = "selection${no.count }" value ="1">${qq.s1}<br>
			<input type = "radio" name = "selection${no.count }" value ="2">${qq.s2}<br>
			<input type = "radio" name = "selection${no.count }" value ="3">${qq.s3}<br>
			<input type = "radio" name = "selection${no.count }" value ="4">${qq.s4}<br>
			<input type = "radio" name = "selection${no.count }" value ="5">${qq.s5}<br>
		</div>
	</c:forEach>

		<div class="checkAnswer">
			<input type ="submit" value="정답 확인하기">
		</div>
</form>    

