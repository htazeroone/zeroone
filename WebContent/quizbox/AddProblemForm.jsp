<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action ="AddProblemReg" method="post">
	<table border="">
		<tr>
			<td>Chapter Number</td>
			<td>
				<select name ="chid">
						<option value = "" selected = "selected"> 챕터 선택하기 </option>				
						<option value = "1" > Chapter 1. 자바 시작하기 </option>
						<option value = "2" > Chapter 2. 변수와 타입 </option>
						<option value = "3" > Chapter 3. 연산자 </option>
						<option value = "4" > Chapter 4. 조건문과 반복문 </option>
						<option value = "5" > Chapter 5. 참조타입 </option>
						<option value = "6" > Chapter 6. 클래스 </option>						
						<option value = "7" > Chapter 7. 상속 </option>
						<option value = "8" > Chapter 8. 인터페이스 </option>
						<option value = "9" > Chapter 9. 예외처리 </option>
						<option value = "10" > Chapter 10. 기본 API 클래스 </option>
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