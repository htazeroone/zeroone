<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    String chk = (String)session.getAttribute("pname");
%>

<script>
var getout = <%=chk %>
    if(getout==null){
        alert('getout')
        location.href="../main/Main"
    }

</script>

<style>
	.tr{
		background-color: pink;

	}
	.td{
		display: inline-block;
		border: 3px solid purple; 
		width: 70px;
	}
</style>
<div>
	<div class="tr">
		<div class="td">kind</div>
		<div class="td">id</div>
		<div class="td">gid</div>
		<div class="td">seq</div>
		<div class="td">lev</div>
		<div class="td">cnt</div>
		<div class="td">rec</div>
		<div class="td">reg_date</div>
		<div class="td">pname</div>
		<div class="td">title</div>
		<div class="td">content</div>
		<div class="td">upfile</div>
	</div>

	<div class="tr">
		<div class="td">${data.kind }</div>
		<div class="td">${data.id }</div>
		<div class="td">${data.gid }</div>
		<div class="td">${data.seq }</div>
		<div class="td">${data.lev }</div>
		<div class="td">${data.cnt }</div>
		<div class="td">${data.rec }</div>
		<div class="td">${data.reg_date }</div>
		<div class="td">${data.pname }</div>
		<div class="td">${data.title }</div>
		<div class="td">${data.content }</div>
		<div class="td">${data.upfile }</div>
		<div class="td">${data.id==pname }</div>
	</div>

	<c:if test="${data.pname==pname }">
	<div class="tr">
		<div class="td">
		<a href="Modify?id=${data.id }">수정</a>
		<a href="Delete?id=${data.id }&kind=${data.kind}">삭제</a>
		<a href="List?kind=${data.kind }&page=${page}">목록으로</a>
		</div>
	</div>
	</c:if>

</div>