<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script>
function allChk(){

	var frm = document.frm;	
	'<c:forEach var="q" items="${qInfo}" varStatus="no">'

		var id = ${q.id};
		var chk = $('input:radio[name='+${q.id}+']').is(':checked');
		
		if(!chk){
			alert('문제를 빠짐없이 풀어주세요');
			return;
		}		
	'</c:forEach>'
		frm.action = "Note";
		frm.submit();
}

</script>
<style type="text/css">
.part{
	float:left;
	width : 50%;
}

/* #next_out{
	width:100%;
	text-align : center;
}

#next_in{
	display : inline-block;
} */
</style>

</head>
<body>

<!-- 문제 출력 부분  -->
<div class="part">
<div>pid:<%=session.getAttribute("pid") %></div>
<div>페이지번호:${page } 총페이지번호:${totalPage }</div>
<c:choose>
	<c:when test="${!empty idAndInput }">
		<form name="frm" method="post">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="hidden" value="${chid }" name="chid">
		<input type="hidden" value="${page }" name="page">
		
		<c:forEach var="in" items="${idAndInput }">
			<div>${in.id }.${in.question }<br>
			정답률:${in.correction/in.total*100 }%</div>
			
				<c:choose>
					<c:when test="${in.input==(no.index+1) }">
					<div><input type="radio" name="${in.id }" value="1"checked="checked" > ${in.s1 }</div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="1"> ${in.s1 }</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${in.input==(no.index+2) }">
					<div><input type="radio" name="${in.id }" value="2" checked="checked" > ${in.s2 }</div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="2"> ${in.s2 }</div>
					</c:otherwise>
				</c:choose>
								<c:choose>
					<c:when test="${in.input==(no.index+3) }">
					<div><input type="radio" name="${in.id }" value="3" checked="checked" > ${in.s3 }</div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="3"> ${in.s3 }</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${in.input==(no.index+4) }">
					<div><input type="radio" name="${in.id }" value="4" checked="checked" > ${in.s4 }</div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="4"> ${in.s4 }</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${in.input==(no.index+5) }">
					<div><input type="radio" name="${in.id }" value="5" checked="checked" > ${in.s5 }</div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="5"> ${in.s5 }</div>
					</c:otherwise>
				</c:choose>			
			</c:forEach>
			<div><input type="button" onclick="allChk()" value="정답 확인"></div>
		</form>
	</c:when>
	
	<c:otherwise>
	
	
	<form name="frm" method="post">
	<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
	<input type="hidden" value="${chid }" name="chid">
	<input type="hidden" value="${page }" name="page">
		
		<c:if test="${!empty qInfo }">
		<c:forEach var="q" items="${qInfo }">
			<div>${q.id }.${q.question }<br>
			정답률:${q.correction/q.total*100 }%</div>
			<div><input type="radio" name="${q.id }" value="1"> ${q.s1 }</div>
			<div><input type="radio" name="${q.id }" value="2"> ${q.s2 }</div>
			<div><input type="radio" name="${q.id }" value="3"> ${q.s3 }</div>
			<div><input type="radio" name="${q.id }" value="4"> ${q.s4 }</div>
			<div><input type="radio" name="${q.id }" value="5"> ${q.s5 }</div>
		</c:forEach>
		<div><input type="button" onclick="allChk()" value="정답 확인"></div>
			</c:if>
	</form>

	
	</c:otherwise>
</c:choose>
</div>

<!-- 정답 확인 결과 부분  -->

<div class="part">
	<form action="Note?page=${page}" method="post">
	<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
	<input type="hidden" value="${chid }" name="chid">
<!-- res : id, ox, answer, input 을 가지고있다   -->
	<c:if test="${!empty res }">
		<div>pid:<%=session.getAttribute("pid") %></div>
		<div>페이지번호:${page } 총페이지번호:${totalPage }</div>
		<div> <번호> <체크> <정오답 결과> <정답> <내가 틀렸던 답> </div>
		<c:forEach var="a" items="${res }">
			<div>${a.id }<input type="checkbox" name="deleteId" value="${a.id }"> 
			<c:choose>
				<c:when test="${a.ox eq '1' }">
				O
				</c:when>
				<c:otherwise>
				X
				</c:otherwise>
			</c:choose>
			${a.answer } ${a.input }			
			</div>
		</c:forEach>
		<div>체크한 문제를 학습 노트에서 삭제할 수 있습니다. 페이지번호:${page } 총페이지번호:${totalPage }</div>
		<div><input type="submit" value="학습 노트에서 삭제"></div>
	</form>	
	
	<form action="Note?page=${page+1}" method="post">
	<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
	<input type="hidden" value="${chid }" name="chid">
		<!-- 다음 문제 풀기  -->
		<c:if test="${page<totalPage }">
		<c:set var="nextPage" value="${page+1 }" />
		<div>다음페이지번호:${page+1 } 
		<%-- <a onclick="location.href='Note?page=${nextPage}'" style="cursor:pointer">다음 문제 풀기</a> --%>
		<input type="submit" value="다음문제풀기">
		</div>
		</c:if>
	</c:if>
	</form>
	
</div>

</body>
</html>