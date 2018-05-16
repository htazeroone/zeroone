<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
* 회원탈퇴를 위해 비밀번호를 입력해주세요.
</div>
<form action="../mypage/OutReg" method="post">
<input type="hidden" name="pid" value="<%=session.getAttribute("pid") %>" />
	<table border="">
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="회원탈퇴" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>