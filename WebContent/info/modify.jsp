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

<form action="ModifyReg" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${data.id }">
	<div class="table">
			
		<div class="tr">
			<div class="td">kind</div>
			<div class="td">${data.kind }</div>
		</div>
		
		<div class="tr">
			<div class="td">이름</div>
			<div class="td">
			<input type="text" name="pname" value="${data.pname }">
			</div>
		</div>
		
		<c:if test="${data.upfile!=null }">
			<div class="tr">
				<div class="td">파일</div>
				<div class="td">
					${data.upfile }
				<input type="hidden" name="upfile" value="${data.upfile }">
				</div>
			</div>
		</c:if>
	
		<div class="tr">
			<div class="td">제목</div>
			<div class="td">
			<input type="text" name="title" value="${data.title }">
			</div>
		</div>
		<div class="tr">
			<div class="td">내용</div>
			<div class="td">
			<input type="text" name="content" value="${data.content }">
			</div>
		</div>
		
		<div class="tr">
			<div class="td">
			<input type="submit" value="수정">
			</div>
		</div>
	</div>
</form>	