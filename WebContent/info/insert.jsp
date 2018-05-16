<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>

	.tr{
		background-color: pink;

	}
	.td{
		display: inline-block;
		border: 3px solid purple; 
		width: 500px;
	}

</style>

<form action="InsertReg" method="post" enctype="multipart/form-data">
	<div class="table">
	
		<div class="tr">
			<div class="td">kind</div>
			<div class="td">${kind }
			<input type="hidden" name="kind" value="${kind }">
			
			</div>
		</div>
		
		<div class="tr">
			<div class="td">이름</div>
			<div class="td">
			<%=session.getAttribute("pname")%>
			<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
			</div>
		</div>
		<div class="tr">
			<div class="td">파일</div>
			<div class="td">
			<input type="file" name="upfile">
			</div>
		</div>
		<div class="tr">
			<div class="td">제목</div>
			<div class="td">
			<input type="text" name="title">
			</div>
		</div>
		<div class="tr">
			<div class="td">내용</div>
			<div class="td">
			<input type="text" name="content">
			</div>
		</div>
		
		<div class="tr">
			<div class="td">
			<input type="submit" value="입력">
			</div>
		</div>
	</div>
</form>	