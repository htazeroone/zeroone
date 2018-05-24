<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="">
	<tr>
		<td>아이디</td><td>성명</td><td>학습성취도</td><td>회원관리</td>
	</tr>
	<c:forEach var="i" items="${memberList}" varStatus="no">
	<tr>
		<td>${i.pid }</td>
		<td>${i.pname }</td>
		<td><a href="Achieve?pid=${i.pid }">학습성취도 보기</a></td>
		<td><a href="KickOut?pid=${i.pid }">강퇴</a></td>
	</tr>
	</c:forEach>

</table>