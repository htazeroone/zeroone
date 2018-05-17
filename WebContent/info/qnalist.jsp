<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.head{ 
		background-color : white;
		display: inline-block;
		border: 3px solid purple; 
		width: 100px;
	}
	.tr{
		background-color: pink;

	}
	
	.td{
		display: inline-block;
		border: 3px solid purple; 
		width: 100px;
	}

</style>


</head>
<body>


<div>

	<div>
			<div class="head">kind</div>
			<div class="head">id</div>
			<div class="head">gid</div>
			<div class="head">seq</div>
			<div class="head">lev</div>
			<div class="head">cnt</div>
			<div class="head">rec</div>
			<div class="head">reg_date</div>
			<div class="head">pname</div>
			<div class="head">title</div>
			<div class="head">content</div>
			<div class="head">upfile</div>
			
	</div>
	
	<c:choose>
		<c:when test="${data==null }">
			<div>
			게시물이 없습니다.
			</div>
		</c:when>
	
	
		<c:otherwise>
		
			<c:forEach items="${data }" var="dd" >
	
				
			<div  class="tr">
				<div class="td">${dd.kind }</div>
				<div class="td">${dd.id }</div>
				<div class="td">${dd.gid}</div>
				<div class="td">${dd.seq}</div>
				<div class="td">${dd.lev}</div>
				<div class="td">${dd.cnt}</div>
				<div class="td">${dd.rec}</div>
				<div class="td">${dd.reg_date}</div>
				<div class="td">${dd.pname}</div>
				<div class="td"><a href="Detail?id=${dd.id }">${dd.title}</a></div>
				<div class="td">${dd.content}</div>
				<div class="td">${dd.upfile}</div>
				
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	

	<div>
		<div>
		<a href="Insert?kind=${kind }">글쓰기</a>
		</div>
	</div>
</div>


</body>
</html>