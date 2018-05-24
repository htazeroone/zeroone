<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	if(confirm(<%=request.getAttribute("pid")%>+ "님을 정말로 강퇴시키겠습니까?")) {
		alert('${msg}');
		
	}
	request.setAttribute("memberList", dao.getMembers());
	location.href='${url}';
	
</script>