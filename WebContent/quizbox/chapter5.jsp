<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style type="text/css">

#chapter {
	width: 100%;
	height: 10%;
	position: relative;
	background-color: lightyellow;
}

#q1 {
	width: 100%;
	height: 20%;
	position: relative;
	background-color: lightgreen;
}

#q2 {
	width: 100%;
	height: 20%;
	position: relative;
	background-color: lightyellow;
}

#q3 {
	width: 100%;
	height: 20%;
	position: relative;
	background-color: pink;
}

#q4 {
	width: 100%;
	height: 20%;
	position: relative;
	background-color: white;
}

#checkAnswer {
	width: 100%;
	height: 10%;
	position: relative;
	background-color: yellow;
	text-align: center;
}

</style>
</head>
    
<div id=chapter>chapter${sessionScope.num}</div>

<c:forEach varStatus="no" items="${problem }" var="qq">

<div id="q${no.count }">Q.${qq.id}${qq.question }</div>

</c:forEach>
<div id=checkAnswer>
<form action="Chapter5Answer" >
	<table>
		<tr>
		<td align="center">
		<input type ="submit" value="정답 확인하기">
		</td>
		</tr>
	</table>
</form>
</div>
    

