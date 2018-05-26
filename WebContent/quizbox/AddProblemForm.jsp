<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<form action ="AddProblemReg" method="post">
	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="subject" value="${subname }">
	<input type="hidden" name="chname" value="${chname }">
	<table border="">
		<tr>
			<td>Chapter Number</td>
			<td>
				<select name ="chid">
						<option value = ""> 챕터 선택하기 </option>
						<c:forEach items="${sub }" var="ss">
							<c:if test="${ss.head!=0 }">			
						<option value = "${ss.head}" > Ch.${ss.head } ${ss.title } </option>
						</c:if>
						
						</c:forEach>
				</select>			
			</td>
		</tr>
		<tr>
			<td>Question</td>
			<td><textarea name="question" rows="1" cols="22"></textarea></td>
		</tr>	
		<tr>
			<td>선택지 1</td>
			<td><textarea name="s1" rows="1" cols="22">1. </textarea></td>
		</tr>
		<tr>
			<td>선택지 2</td>
			<td><textarea name="s2" rows="1" cols="22">2. </textarea></td>
		</tr>
		<tr>
			<td>선택지 3</td>
			<td><textarea name="s3" rows="1" cols="22">3. </textarea></td>
		</tr>
		<tr>
			<td>선택지 4</td>
			<td><textarea name="s4" rows="1" cols="22">4. </textarea></td>
		</tr>
		<tr>
			<td>선택지 5</td>
			<td><textarea name="s5" rows="1" cols="22">5. </textarea></td>
		</tr>
		<tr>
			<td>정답</td>
			<td><textarea name="answer" rows="1" cols="22"></textarea></td>
		</tr>								
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="작성" />
				<input type ="reset" value="초기화" />
				<a href="QuizMain">[돌아가기]</a>
			</td>			
		</tr>				
	</table>
</form>