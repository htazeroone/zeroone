<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="AddLectureReg" method="post"> 
<table border="">
	<tr>
		<td>새로운 과목명: </td>
		<td><input type="text" name="boardName"></td>
	</tr>	
	<c:forEach var="i" begin="1" end="10">
		<tr>
			<td>챕터 ${i } 이름: </td>
			<td><input type="text" name="chapNum${i }"></td>
		</tr>
	</c:forEach>	
	<tr>
		<td colspan="2">
			<input type="submit" value="새 게시판 만들기">
		</td>
	</tr>
</table>
</form>
