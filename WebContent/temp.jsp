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
width: 30%;
height: 100%;
margin-top : 8%;
position: absolute;
background-color: blue;

}

#smain{
width: 100%;
height: 100%;
margin-left : 30%;
margin-top : 8%;
position: absolute;
background-color: green;
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
<jsp:include page="inc/top.jsp"/>

</div>

<div id = "bb">
<c:choose>
	<c:when test="${menu!=null }">
		<div id="smenu">
			<jsp:include page="menu/${menu }"/>
		</div>
		
		<div id="smain">
			<jsp:include page="${main }"/>
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