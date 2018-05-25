<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
<%
    String chk = (String)session.getAttribute("pname");
%>


<script>
var getout = <%=chk %>
    if(getout==null){
        alert('로그인해주세요')
        location.href="../main/Main"
    }
</script>    
<style>
	#dd{
		margin: 0 auto;
		width: 800px;
		height: 500px;
	
	}

</style>
<form action="InsertReg" method="post" enctype="multipart/form-data">
<table id="dd" border="">
	<tr>
		<td>종류</td>
		<td>
			${kind }
			<input type="hidden" name="kind" value="${kind }">
			<input type="hidden" name="page" value="${page }">
		</td>
	</tr>
	
	<tr>
		<td>이름</td>
		<td>
		<%=session.getAttribute("pname")%>
		<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
		</td>
	</tr>
	<tr>
		<td>파일</td>
		<td>
		<input type="file" name="upfile">
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
		<input type="text" name="title">
		</td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td>
		<input type="text" name="content">
		</td>
	</tr>
		
	<tr>
		<td colspan="2">
			<input type="submit" value="입력">
		</td>
	</tr>
</table>
</form>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>