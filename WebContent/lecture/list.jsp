<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function listCate(){
		document.frm.submit();
	}

</script>

<table border="">
	<tr>
		<td colspan="5" align="center">
			${subject}게시판
		</td>
	</tr>
	<tr>
		<td>말머리</td>
		<td>
			<form name="frm" action="?">
				<select name="head" onchange="listCate()">
					<c:forEach var="i" items="${chapList}" varStatus="no">
						<c:choose>
							<c:when test="${no.index == head}">
								<option value="${no.index }" selected="selected">${i }</option>
							</c:when>
							<c:otherwise>
								<option value="${no.index }">${i }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<input type="hidden" name="subject" value="${subject }">
			</form>
		</td>
	</tr>
	<tr>
		<th>번호</th><th>제목</th><th>글쓴이</th><th>등록일</th><th>조회수</th><th>내 학습여부</th>
	</tr>
	
<c:choose>
<c:when test="${data.size() == 0 }">
	<tr><td colspan="5">글이 없습니다. 새 글을 등록하세요.</td></tr>
</c:when>

<c:otherwise>
	<c:forEach var="i" items="${data }" varStatus="no">
		
		<tr>
			<td>${no.index + start }</td>
			<td>
				
				<a href="Detail?id=${i.id}&page=${page}&subject=${subject}">${i.title}</a>
			</td>
			
			<td>${i.pname }</td>
			<td><fmt:formatDate value="${i.reg_date }" pattern="yyyy-MM-dd(EE)"/></td>
			<td>${i.cnt}</td>
			
			
		<c:if test="${readList.size() != 0}">
			<td>
				<c:forEach var="num" items="${readList }">
					<c:choose>
					<c:when test="${num == i.id}">
						학습완료
					</c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
				</c:forEach>
			</td>	
		</c:if>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6" align="center">
			<c:if test="${startPage > 1 }">
				<a href="List?page=1&head=${head}&subject=${subject}">[처음]</a>
				<a href="List?page=${startPage -1 }&head=${head}&subject=${subject}">◀</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${i == page }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="List?page=${i }&head=${head}&subject=${subject}">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<a href="List?page=${endPage + 1 }&head=${head}&subject=${subject}">▶</a>
				<a href="List?page=${totalPage }&head=${head}&subject=${subject}">[마지막]</a>
			</c:if>
		</td>
	</tr>
	
</c:otherwise>

</c:choose>

	<c:if test="${sessionScope.pid == 'admin'}">
	<tr>
		<td colspan="6" align="right">
			<a href="InsertForm?page=${page }&head=${head}&subject=${subject}">글쓰기</a>
		</td>
	</tr>
	</c:if>	
</table>
