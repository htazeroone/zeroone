<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style type="text/css">
.chapter {
	width: 100%;
	height: 80px;
	position: relative;
	background-color: lightyellow;
}

.q1 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: lightgreen;
}

.q2 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: lightyellow;
}

.q3 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: pink;
}

.q4 {
	width: 100%;
	height: 143.5px;
	position: relative;
	background-color: white;
}

.checkAnswer {
	width: 100%;
	height: 143.2px;
	position: relative;
	background-color: yellow;
	text-align: center;
}
</style>
</head>
<div class=chapter>chapter${sessionScope.num}</div>

<form action="Answer" method="post">
<input type = "hidden" name = "page" value ="${param.page }"> 
	<c:choose>
		<c:when test="${problem.size()==0 }">
    		학습할 문제가 없습니다.
    		</c:when>
		<c:otherwise>
			<c:forEach varStatus="no" items="${problem }" var="qq">
				<input type="hidden" name="id${qq.id }" value="${qq.id }">
				<div class="q${no.count }">
					Q.${qq.id} ${qq.question }
					<c:if test="${sessionScope.pid == 'admin'}">
						<a href="../quizbox/ModifyProblemForm?id=${qq.id }">[문제 수정]</a>
					</c:if><br> 
					<input type="radio" name="selection${qq.id }" value="1">${qq.s1}<br> 
					<input type="radio" name="selection${qq.id }" value="2">${qq.s2}<br>
					<input type="radio" name="selection${qq.id }" value="3">${qq.s3}<br>
					<input type="radio" name="selection${qq.id }" value="4">${qq.s4}<br>
					<input type="radio" name="selection${qq.id }" value="5">${qq.s5}<br>
			
				</div>
			</c:forEach>

			<div class="checkAnswer">
				<input type="submit" value="정답 확인하기">

				<c:if test="${startPage > 1 }">
					<a href="Chapter${sessionScope.num}?page=${startPage-1 }">[이전 페이지]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${i!=page }">
							<a href="Chapter${sessionScope.num}?page=${i }">[다음 페이지]</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<a href="Chapter${sessionScope.num}?page=${endPage+1 }">[다음	페이지]</a>
				</c:if>
				<c:if test="${sessionScope.pid == 'admin'}">
					<a href="../quizbox/AddProblemForm">[문제 추가]</a>
				</c:if>
			</div>
		</c:otherwise>
	</c:choose>
</form>

