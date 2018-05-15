<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

html{
width: 100%;
height: 100%
}
#top{
width: 100%;
height: 15%;
position: absolute;
background-color: yellow;
}

#smenu{
width: 20%;
height: 100%;
margin-top : 8%;
position: absolute;
background-color: blue;

}

#smain1{
width: 40%;
height: 100%;
margin-left : 20%;
margin-top : 8%;
position: absolute;
background-color: green;
}

#smain2{
width: 40%;
height: 100%;
margin-left : 60%;
margin-top : 8%;
position: absolute;
background-color: red;
}

#bb{

margin-top: 10px;

}

#main{
width: 100%;
height: 100%;

margin-top : 10%;
position: absolute;
background-color: green;
}
</style>
</head>

<body>

<div id="top">
<!-- 로그인 성공 시 pname 값이 생기니까 top 메뉴를 바꿔준다 -->
<c:choose>
	<c:when test="${pname==null }">
		<jsp:include page="inc/top.jsp"/>
		<%
		session.removeAttribute("pname");
		%>
	</c:when>
	<c:otherwise>
		<%
		String pname = (String)request.getAttribute("pname");
		session.setAttribute("pname", pname);
		%>
	<jsp:include page="inc/top_login.jsp"/>
	</c:otherwise>
</c:choose>
</div>

<div id = "bb">
<c:choose>
	<c:when test="${menu!=null }">
		<div id="smenu">
			<jsp:include page="menu/${menu }"/>
		</div>
		
		<div id="smain1">
			<jsp:include page="${main1 }"/>
		</div>
		
		<div id="smain2">
			<jsp:include page="${main2 }"/>
		</div>
	</c:when>
	<c:otherwise>
		<div id="main">
			<jsp:include page="${main }"/>
		</div>
	</c:otherwise>
</c:choose>
</div>


</body>
</html>