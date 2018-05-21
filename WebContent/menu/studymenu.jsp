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

<!-- for문  -->
<c:forEach var="ch" items="${chList }">
<%-- 	<form action="Note" method="post">
		<input type="hidden" value="${ch.chid }" name="chid">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="submit" value="${ch.chname }">
	</form> --%>
	<a href="Note?chid=${ch.chid }">${ch.chname }</a><br>
</c:forEach>

</body>
</html>