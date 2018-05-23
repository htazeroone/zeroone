<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table border="">
	<tr>
		<td>챕터</td>
		<td>${chapName }</td>
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
		<td colspan="2" align="right">
		 <c:choose>
		 	<c:when test="${param.head != 0}"> <!--말머리로 들어왔을 때-->
		 		<a href="List?subject=${param.subject }">목록으로</a>
		 	</c:when>
		 	<c:otherwise>
		 		<a href="List?id=${data.id}&page=${param.page}&subject=${param.subject }">목록으로</a>
		 	</c:otherwise>
		 </c:choose>
		 	
			<c:if test="${sessionScope.pid == 'admin'}">
				<a href="DeleteForm?id=${data.id }&head=${data.head}&subject=${param.subject }">삭제</a>
				<a href="ModifyForm?id=${data.id }&head=${data.head}&subject=${param.subject }">수정</a>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<a href="Detail?pid=${sessionScope.pid }&id=${data.id }&page=${param.page }&head=${data.head}&subject=${param.subject}">학습완료 체크</a>
		</td>
	</tr>
</table>
