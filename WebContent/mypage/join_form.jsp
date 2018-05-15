<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

<form action="../login/JoinReg" method="post">
	<table border="">
		<tr>
			<td>id</td>
			<td><input type="text" name="pid" /></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="pname" /></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="password" name="pw1" /></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="password" name="pw2" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="회원가입" />
			</td>
		</tr>
	</table>
</form>

</body>
</html>