<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<table border="" width="100%" height="100%">
<tr>
<td>
<a href="../lecture/List">이론</a>
</td>

<td>
<a href="../quizbox/QuizMain">퀴즈</a>
</td>

<td>
<a href="../info/Qnalist">QnA</a>
<a href="../info/Notice">Notice</a>
<a href="../info/About">About us</a>
</td>

<td>
<%
	if(session.getAttribute("pname")!=null){
		%>
		<%=session.getAttribute("pname") %>님 오늘도 즐코!<br>
		<a href="../login/Logout">로그아웃</a><br>
		<!-- <a href="../mypage/Achieve">학습성취도</a><br> -->
		<form action="Achieve" method="post">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="submit" value="학습성취도">
		</form>
		<a href="../mypage/ModifyPwForm">비밀번호변경</a><br>
		<a href="../mypage/OutForm">회원탈퇴</a><br>
		<%
	}else{
		%>
		<a href="../login/LoginForm">로그인</a>
		<a href="../login/JoinForm">회원가입</a>
		<%
	}
%>
</td>

</tr>

</table>