<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<table border="" width="100%" height="100%">
<tr>
<td>
<a href="../info/About">이론</a>
</td>

<td>
<a href="../quizbox/Java">퀴즈</a>
</td>

<td>
<a href="../lecture/Java">인포</a>
</td>

<td>
<%
	if(session.getAttribute("pname")!=null){
		%>
		<%=session.getAttribute("pname") %>님 오늘도 즐코!<br>
		<a href="../login/Logout">로그아웃</a><br>
		<a href="../mypage/ModifyPwForm">비밀번호변경</a><br>
		<a href="../mypage/OutForm">회원탈퇴</a><br>
		<%
	}else{
		%>	
		<a href="../login/LoginForm">로그인</a>
		<a href="../login/LoginForm">회원가입</a>
		<%
	}
%>
</td>

</tr>

</table>