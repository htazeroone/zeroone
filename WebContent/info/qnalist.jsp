<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#dd{
	margin: 0 auto;
	width: 800px;
	height: 500px;
	background-color: blue;
}
table {
	background-color: white;
	height: 100%;
	width: 100%;
	text-align: center;
}
</style>


</head>
<body>
<!-- =====================================테이블로~~============================================ -->
<div id="dd">
	<table border="">
		<tr>
			<th>종류</th>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>추천수</th>
			<th>조회수</th>
		</tr>
		
		<c:choose>
			<c:when test="${data==null }">
				<tr>
					<td colspan="7">게시물이 없습니다.</td>
				</tr>
			</c:when>
		
		
			<c:otherwise>
			
				<c:forEach items="${data }" var="dd" varStatus="no">
		
					
				<tr>
				
					<td>${dd.kind }</td>
					<td>${no.index+start }</td>
					<td><a href="Detail?id=${dd.id }&page=${page}">${dd.title}</a></td>
					<td>${dd.pname}</td>
					<td>${dd.reg_date}</td>
					<td>${dd.rec }</td>
					<td>${dd.cnt}</td>
		
				</tr>
				
				</c:forEach>
				
				
				
				
				<tr>
					<td colspan="7"> 
						<a href="List?page=1&kind=${kind }">[처음]</a>
						<c:if test="${startpage > 1 }">
							<a href="List?page=${startpage-1 }&kind=${kind }">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<c:choose>
								<c:when test="${i==page }">
									[${i }]
								</c:when>	
								<c:otherwise>
									<a href="List?page=${i }&kind=${kind }">${i }</a>
								</c:otherwise>
							</c:choose>		
						</c:forEach>
						
						<c:if test="${endpage<totalpage }">
							<a href="List?page=${endpage+1 }&kind=${kind }">다음</a>					
						</c:if>
						
						<a href="List?page=${totalpage }&kind=${kind }">마지막</a>				
						
					</td>
				</tr>
				
			</c:otherwise>
		</c:choose>
		
		<tr>
			<td colspan="7"><a href="Insert?kind=${kind }&page=${page}">글쓰기</a></td>
		</tr>
	
	</table>
</div>

</body>
</html>