<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form action ="ModifyProblemReg" method="post">
	<input type ="hidden" name="chid" value="${problem.chid }">
	<input type ="hidden" name="id" value="${problem.id }">
	<table border="">
		<tr>
			<td>Question</td>
			<td><textarea name="question" rows="1" cols="22">${problem.question }</textarea></td>
		</tr>	
		<tr>
			<td>선택지 1</td>
			<td><textarea name="s1" rows="1" cols="22">${problem.s1 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 2</td>
			<td><textarea name="s2" rows="1" cols="22">${problem.s2 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 3</td>
			<td><textarea name="s3" rows="1" cols="22">${problem.s3 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 4</td>
			<td><textarea name="s4" rows="1" cols="22">${problem.s4 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 5</td>
			<td><textarea name="s5" rows="1" cols="22">${problem.s5 } </textarea></td>
		</tr>
		<tr>
			<td>정답</td>
			<td><textarea name="answer" rows="1" cols="22">${problem.answer }</textarea></td>
		</tr>								
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정" />
				<input type ="reset" value="초기화" />
				<a href="QuizMain">[돌아가기]</a>
			</td>			
		</tr>				
	</table>
</form>    