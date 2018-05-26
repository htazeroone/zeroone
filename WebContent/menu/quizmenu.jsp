<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<style type="text/css">

#subject {
	width: 100%;
	height: 10%;
	position: relative;
	background-color: lightblue;
	text-align: center;
}

#ch1 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: yellow;
	text-align: center;
}

#ch2 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: pink;
	text-align: center;
}
#ch3 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: orange;
	text-align: center;
}
#ch4 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: lightgreen;
	text-align: center;
}
#ch5 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: pink;
	text-align: center;
}
#ch6 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: lightyellow;
	text-align: center;	
}
#ch7 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: skyblue;
	text-align: center;
}
#ch8 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: orange;
	text-align: center;
}
#ch9 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: lightgreen;
	text-align: center;	
}
#ch10 {
	width: 100%;
	height: 9%;
	position: relative;
	background-color: pink;
	text-align: center;
}
</style>
</head>

<div id=subject>${subname }</div>
<c:forEach items="${sub }" var="ss">
	<c:if test="${ss.head!=0 }">
	<div id="ch${ss.head }">
		<a href="../quizbox/Chapter?num=${ss.head}&subject=${subname}&chname=${ss.title}">Ch.${ss.head } ${ss.title }</a>
	</div>
	</c:if>
</c:forEach>


