<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top.css" />
<title>Insert title here</title>

<!-- <style type="text/css">

.lec {
	overflow:hidden;
}
.main{
	position:relative;
	float:left;
	width: 200px;
	height: 23px;
	overflow: hidden;
}
.add {
	float:left;
}
.sub{
	position:relative;
	width: 85px;
	height: 20px;
	line-height: 20px;
	font-size: 20px;
	margin-left: 5px;
}

</style> -->

</head>
<body>



<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('.main').each(function() {
		$(this).attr('data-flag',0);
	});

	$('.main').click(
		function() {
			var hh = [$(this).find('.sub').length*27+30+"px", "30px"];
			var flag = eval($(this).attr('data-flag'));

			$(this).stop().animate( {height: hh[flag]}, 200, 'easeOutBounce');

			$(this).attr('data-flag', (++flag)%2);
		}
	);
});

</script>


<body>

<nav>
	<ul>
		<li><a href="../main/Main">Home</a></li>
		<li><a href="#">이론게시판</a>
			<ul>
			<%
				DAO dao = new DAO();
				ArrayList<String> subjects = dao.getSubjects();

				dao.close();

				for(int i = 0; i<subjects.size(); i++) { %>

					<li><a href="../lecture/List?subject=<%=subjects.get(i)%>"><%=subjects.get(i)%></a></li>


			<% }%>
					<c:if test="${sessionScope.pid == 'admin'}">
					<li><a href="../lecture/AddLectureForm">과목 추가하기</a></li>
					<li><a href="../lecture/DeleteLectureForm">과목 삭제하기</a></li>
					</c:if>
			</ul>
		</li>
		<li><a href="../quizbox/QuizMain">퀴즈</a></li>
		<li><a href="#">Info</a>
			<ul>
				<li><a href="../info/Qna">QnA</a></li>
				<li><a href="../info/Notice">Notice</a></li>
				<li><a href="../info/About">About us</a></li>
			</ul>
		</li>

<%
	if(session.getAttribute("pname")!=null){
		%>
		<!-- <li><a href="#">마이페이지</a> -->
		<li><a href="#"><%=session.getAttribute("pname")%>님 페이지</a>
			<ul>
				<li><a href="../login/Logout">로그아웃</a></li>
				<li><a href="../mypage/Achieve" >학습성취도</a></li>
				<li><a href="../mypage/Note" >학습노트</a></li>
				<li><a href="../mypage/IncorrectNote" >오답노트</a></li>

				<li><a href="../mypage/ModifyPwForm">비밀번호변경</a></li>
				<li><a href="../mypage/OutForm">회원탈퇴</a></li>
			</ul>
		</li>


		<!-- <li><a href="../login/Logout">로그아웃</a></li> -->

		<%
	}else{
		%>

		<li><a href="../login/LoginForm">로그인</a></li>
		<%
	}
%>
	</ul>

</nav>


</body>

<%-- <table border="" width="100%" height="100%">
	<tr>
		<td>
			<div class="lec">
				<div class="main">
					이론게시판
					<%
						DAO dao = new DAO();
						ArrayList<String> subjects = dao.getSubjects();

						dao.close();

						for(int i = 0; i<subjects.size(); i++) { %>
							<div class="sub">
								<a href="../lecture/List?subject=<%=subjects.get(i)%>"><%=subjects.get(i)%></a>
							</div>
					<% }%>

				</div>
				<div class="add">
					<c:if test="${sessionScope.pid == 'admin'}">
						<a href="../lecture/AddLectureForm">과목 추가하기</a>
						<a href="../lecture/DeleteLectureForm">과목 삭제하기</a>
					</c:if>
				</div>
			</div>
		</td>
<td>
<a href="../quizbox/QuizMain">퀴즈</a>
</td>

<td>
<a href="../info/Qna">QnA</a>
<a href="../info/Notice">Notice</a>
<a href="../info/About">About us</a>
</td>

<td>
<%
	if(session.getAttribute("pname")!=null){
		%>
		<%=session.getAttribute("pname") %>님 오늘도 즐코!<br>
		<a href="../login/Logout">로그아웃</a><br>

		<form action="../mypage/Achieve" method="post">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="submit" value="학습성취도">
		</form>
		<form action="../mypage/Note" method="post">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="submit" value="학습노트">
		</form>
		<a href="../mypage/Achieve" >학습성취도</a><br>
		<a href="../mypage/Note" >학습노트</a><br>

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
</table> --%>
