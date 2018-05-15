<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>

<c:choose>
	<c:when test="${data==null }">
		<div>
		게시물이 없습니다.
		</div>
	</c:when>


	<c:otherwise>
		<c:forEach var="dd" items="${data }">
		
		<div style="position: static;background-color: yellow;">
			${dd.kind }
			${dd.id }
			${dd.gid}
			${dd.seq}
			${dd.lev}
			${dd.cnt}
			${dd.rec}
			${dd.reg_date}
			${dd.pname}
			${dd.title}
			${dd.content}
			${dd.upfile}
			
		</div>
		</c:forEach>
	</c:otherwise>
</c:choose>




</div>


</body>
</html>