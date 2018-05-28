<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script> 
var cnt =4;

function view(){

	var id = 'chapNum'+cnt;
	document.getElementById(id).style.display='block';
	cnt++;
}
</script>

<style>


.hide{

	display: none;
}

#dd{
	margin: 0 auto;
	width: 800px;
	height: 500px;
}
</style>

<div id ="dd">
<form action="AddLectureReg" method="post"> 
<table border="" style="width: 70%;" class="table">
	<tr>
		<td>새로운 과목명: 
		<input type="text" name="boardName"></td>
	</tr>	
	<c:forEach var="i" begin="1" end="3">
		<tr>
			<td>챕터 ${i } 이름: 
			<input type="text" name="chapNum${i }"></td>
		</tr>
	</c:forEach>	
	<c:forEach var="i" begin="4" end="20">
		<tr class="hide" id="chapNum${i }">
			<td>챕터 ${i } 이름: 
			<input type="text" name="chapNum${i }"></td>
		</tr>
	</c:forEach>	

	<tr>
		<td colspan="2">
			<input type="submit" value="새 게시판 만들기">
			<button type="button" onclick="view()">과목 추가</button>
		</td>
	</tr>
</table>
</form>
</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>