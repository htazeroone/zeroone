<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style type="text/css">

.checkAnswer {
	width: 100%;
	height: 76px;
	position: relative;
	background-color: yellow;
	text-align: center;
}
</style>
</head>
<div class=chapter>chapter${num }.${chname }</div>

<form action="Answer" method="post">
	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="subject" value="${subname }">
	<input type="hidden" name="chname" value="${chname }">
	<c:choose>
		<c:when test="${problem.size()==0 }">
    		학습할 문제가 없습니다.
    		</c:when>
		<c:otherwise>
			<c:forEach varStatus="no" items="${problem }" var="qq">
				<input type="hidden" name="qqid" value="${qq.id }">
				<table border="">
					<tr>
						<td>Q.${qq.id} ${qq.question }
						<c:if test="${sessionScope.pid == 'admin'}">
							<a href="../quizbox/ModifyProblemForm?num=${num}&page=${page }&subject=${subname }&chname=${chname}&id=${qq.id }">[문제 수정]</a>
						</c:if>
						</td>
					</tr>
					<tr>
						<td><input type="radio" name="selection${qq.id }" value="1">${qq.s1}</td>
					</tr>
					<tr>
						<td><input type="radio" name="selection${qq.id }" value="2">${qq.s2}</td>	
					</tr>
					<tr>
						<td><input type="radio" name="selection${qq.id }" value="3">${qq.s3}</td>
					</tr>
					<tr>
						<td><input type="radio" name="selection${qq.id }" value="4">${qq.s4}</td>
					</tr>
					<tr>
						<td><input type="radio" name="selection${qq.id }" value="5">${qq.s5}</td>
					</tr>
				</table>
			</c:forEach>

			<div class="checkAnswer">
				<input type="submit" value="정답 확인하기">

				<c:if test="${startPage > 1 }">
					<a href="Chapter?num=${num}&page=${startPage-1 }&subject=${subname }&chname=${chname}">[이전 페이지]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${i!=page }">
							<a href="Chapter?num=${num}&page=${i }&subject=${subname }&chname=${chname}">[다음 페이지]</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<a href="Chapter?num=${num}&page=${endPage+1 }&subject=${subname }&chname=${chname}">[다음 페이지]</a>
				</c:if>
				</div>
					</c:otherwise>
			</c:choose>	
				<c:if test="${sessionScope.pid == 'admin'}">
					<a href="../quizbox/AddProblemForm?num=${num}&page=${page+1 }&subject=${subname }&chname=${chname}">[문제 추가]</a>
				</c:if>
			
</form>

