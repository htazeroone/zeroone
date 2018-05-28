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
width: 1024px;
height: 768px;
}

#top{
width: 100%;
height: 15%;
position: absolute;
z-index: 300;
}

#smenu{
width: 20%;
height: 80%;
margin-top : 12%;
position: absolute;

}

#smain1{
width: 40%;
height: 80%;
margin-left : 20%;
margin-top : 12%;
position: absolute;
}

#smain2{
width: 40%;
height: 80%;
margin-left : 60%;
margin-top : 12%;
position: absolute;
}

#bb{

margin-top: 10px;

}

#main{
width: 100%;
height: 80%;
margin-top : 12%;
position: absolute;
z-index: 100;
}

#footer{
	width: 100%;
	height: 10%;
	margin-top : 52%;
	position: absolute;
	z-index: 100;
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

		<!-- 지아 주석 : 학습 노트의 경우 메인페이지가 하나만 필요해서 수정했습니다 -->
		<c:choose>
			<c:when test="${menu eq 'studymenu.jsp' }">
				<div id="smain1">
					<jsp:include page="${main1 }"/>
				</div>
			</c:when>
			<c:otherwise>
				<div id="smain1">
					<jsp:include page="${main1 }"/>
				</div>
				<div id="smain2">
					<jsp:include page="${main2 }"/>
				</div>
			</c:otherwise>
		</c:choose>
	</c:when>

	<c:otherwise>
		<div id="main">
			<jsp:include page="${main }"/>
		</div>
	</c:otherwise>	
</c:choose>
	<div id = "footer">
		안녕하세요 저는 뿌터에여~~ 내용을 입력해주세요 뀨루뀨뀨~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	</div>
</div>


</body>
</html>