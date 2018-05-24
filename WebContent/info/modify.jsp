<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
<style>

	#dd{
		margin: 0 auto;
		width: 800px;
		height: 500px;

	}

</style>

<form action="ModifyReg" method="post" enctype="multipart/form-data">
	<div id="dd">
		<input type="hidden" name="id" value="${data.id }">
		
		<table class="table">
				
			<tr>
				<td>kind</td>
				<td>${data.kind }</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>
				<input type="text" name="pname" value="${data.pname }">
				</td>
			</tr>
			
			<c:if test="${data.upfile!=null }">
				<tr>
					<td>파일</td>
					<td>
						${data.upfile }
					<input type="hidden" name="upfile" value="${data.upfile }">
					</td>
				</tr>
			</c:if>
		
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
				<td colspan="2">
					<input type="submit" value="수정">
					<a href="Detail?id=${data.id }&page=${page}">뒤로</a>
				</td>
			</tr>
		</table>
	</div>	
</form>	
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>