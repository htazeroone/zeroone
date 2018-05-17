<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>

<table border="">
	<tr>
		<td>챕터</td>
		<td><ct:parseTag>${data.head}</ct:parseTag></td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${data.title}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${data.pname}</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td><fmt:formatDate value="${data.reg_date }" pattern="yyyy-MM-dd(E) HH:mm"/></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${data.cnt}</td>
	</tr>
	
	<tr>
		<td>이론내용</td>
		<td>${data.content}</td>
		
	</tr>	
	<tr>
		<td colspan="2" align="center">
		 <c:choose>
		 	<c:when test="${data.head != 0}">
		 		<a href="List">목록으로</a>
		 	</c:when>
		 	
		 	<c:otherwise>
		 		<a href="List?id=${data.id}">목록으로</a>
		 	</c:otherwise>
		 </c:choose>
		 	
			<c:if test="${sessionScope.pid == 'admin'}">
				<a href="DeleteForm?id=${data.id }&head=${data.head}">삭제</a>
				<a href="ModifyForm?id=${data.id }&head=${data.head}">수정</a>
			</c:if>
		</td>
	</tr>
</table>
