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
height: 100%; 
/*  width: 1024px;
height: 768px;  */
}

#top{
width: 100%;
height: 15%;
position: relative;
z-index: 300;
}


#bb{

position: relative;
margin-top: 10px;
}

	#main{
	width: 100%;
	height: 80%;
	z-index: 100;
	}
	
	#smenu{
	width: 20%;
	height: 80%;
	position: relative;
	display: inline-block;
	margin-left: 5%;
	}
	
	#smain1{
	width: auto;
	height: 100%;
	top : 0px;
	position: absolute;
	display: inline-block;
	overflow-x :hidden;
	overflow-y: scroll;
	}

#footer{
	width: 50%;
	height: 10%;
	position : relative;
	margin-top : 100px;
	margin-left: 23%;
}

</style>
</head>

<body>

<div id="top">
<!-- 로그인 성공 시 pname 값이 생기니까 top 메뉴를 바꿔주고 session 값에 pname을 넣는다.
로그아웃 성공 시 session 값을 삭제 한다
-->
<%
	String pname = null;
	String pid = null;
  

	if(request.getAttribute("pid")!=null){
		session.setAttribute("pid", request.getAttribute("pid"));
		pid = (String)session.getAttribute("pid");

		session.setAttribute("pname", request.getAttribute("pname"));
		pname = (String)session.getAttribute("pname");
	}


	if(request.getAttribute("logout")!=null){
		session.removeAttribute("pname");
		session.removeAttribute("pid");
	}

%>

		<jsp:include page="inc/top.jsp"/>
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
	</c:when>

	<c:otherwise>
		<div id="main">
			<jsp:include page="${main }"/>
		</div>
	</c:otherwise>
</c:choose>
</div>



<div id = "footer" align="center">
	<hr>
	<h3>이론게시판 : 김경민		퀴즈 : 류승진		info : 박찬		마이페이지 : 류지아</h3>

</div>

</body>
</html>