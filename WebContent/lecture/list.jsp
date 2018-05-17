<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>

<script type="text/javascript">
	function listCate(){
		document.frm.submit();
	}
	
	function findLecture() {
		document.sch.submit();
	}
</script>

<table border="">
	<tr>
		<td>말머리</td>
		<td>
			<form name="frm" action="?">
				<select name="head" onchange="listCate()">
					<c:forEach var="i" begin="0" end="10" varStatus="no">
						<c:choose>
							<c:when test="${no.index == head}">
								<option value="${no.index }" selected="selected"><ct:parseTag>${no.index}</ct:parseTag></option>
							</c:when>
							<c:otherwise>
								<option value="${no.index }"><ct:parseTag>${no.index}</ct:parseTag></option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</form>
		</td>
		<td colspan="3" align="right">
			<form name="sch" action="?">
				<select></select>
				<input type="text" name="find">
				<input type="submit" value="찾기" onclick="findLecture()">
			</form>
		</td>
	</tr>
	<tr>
		<th>번호</th><th>제목</th><th>글쓴이</th><th>등록일</th><th>조회수</th>
	</tr>
	
<c:choose>
<c:when test="${data.size() == 0 }">
	<tr><td>글이 없습니다.</td></tr>
</c:when>

<c:otherwise>
	<c:forEach var="i" items="${data }" varStatus="no">
		<tr>
			<td>${no.index + start }</td>
			<td>[<ct:parseTag>${i.head}</ct:parseTag>]<a href="Detail?id=${i.id }&head=${head}">${i.title}</a></td>
			<td>${i.pname }</td>
			<td><fmt:formatDate value="${i.reg_date }" pattern="yyyy-MM-dd(EE)"/></td>
			<td>${i.cnt}</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6" align="center">
			<c:if test="${startPage > 1 }">
				<a href="List?page=1&head=${head}">[처음]</a>
				<a href="List?page=${startPage -1 }&head=${head}">◀</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${i == page }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="List?page=${i }&head=${head}">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<a href="List?page=${endPage + 1 }&head=${head}">▶</a>
				<a href="List?page=${totalPage }&head=${head}">[마지막]</a>
			</c:if>
		</td>
	</tr>
</c:otherwise>
</c:choose>
	
	<!-- 관리자인 경우에만~~~~ -->
	<c:if test="${sessionScope.pid == 'admin'}">
	<tr>
		<td colspan="6" align="right">
			<a href="InsertForm?page=${page }&head=${head}">글쓰기</a>
		</td>
	</tr>
	</c:if>
	
</table>
