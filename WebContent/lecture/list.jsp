<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<script type="text/javascript">
	function listCate(){
		document.frm.submit();
	}
</script>

<%
	String[] chaps = {"", "자바 시작하기", "변수와 타입", "연산자", "조건문과 반복문", "참조타입", 
					"클래스", "상속", "인터페이스", "예외처리", "기본API클래스"};
%>

<table border="">
	<tr>
		<td>챕터</td>
		<td>
			<form name="frm" action="?">
				<table>
					<tr>
						<td>
							<select id="chapter" name="head" onchange="listCate()">	
								<c:forEach var="i" begin="0" end="10" varStatus="no">
								
									<c:choose>
										<c:when test="${no.index == head}">
											<option value="${no.index }" selected="selected"><ct:parseTag>${no.index}</ct:parseTag></option>
										</c:when>
										
										<c:otherwise>
											<option value="${no.index }" ><ct:parseTag>${no.index}</ct:parseTag></option>
										</c:otherwise>
									
									</c:choose>
								
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
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
			<td><a href="Detail?id=${i.id }">${i.title}</a></td>
			<td>${i.pname }</td>
			<td><fmt:formatDate value="${i.reg_date }" pattern="yyyy-MM-dd(EE)"/></td>
			<td>${i.cnt}</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6" align="center">
			<c:if test="${startPage > 1 }">
				<a href="List?page=1">[처음]</a>
				<a href="List?page=${startPage -1 }">◀</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${i == page }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="List?page=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<a href="List?page=${endPage + 1 }">▶</a>
				<a href="List?page=${totalPage }">[마지막]</a>
			</c:if>
		</td>
	</tr>
</c:otherwise>
</c:choose>

	<tr>
		<td colspan="6" align="right">
			<a href="InsertForm?page=${page }">글쓰기</a>
		</td>
	</tr>
</table>
