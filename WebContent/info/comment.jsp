<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
<style>

	#dd{
		margin: 0 auto;
		width: 800px;
		height: 500px;
	
	}

</style>

<form action="Comreg" method="post" enctype="multipart/form-data">

	<div id="dd">
	
		<table class="table">
			<tr>
				<td>kind</td>
				<td>${data.kind }
				<input type="hidden" name="kind" value="${data.kind }">
				<input type="hidden" name="id" value="${data.id }">
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
				<td>제목</td>
				<td>
				<input type="text" name="title" value="${data.title }">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<input type="text" name="content" value="${data.content }">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="submit" value="입력">
					<a href="Detail?id=${data.id }&page=${page}">뒤로</a>
				</td>
			</tr>
		</table>
	</div>	
</form>	

<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>