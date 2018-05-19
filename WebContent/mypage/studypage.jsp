<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
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
}
</style>

</head>
<body>

<form name="frm" method="post">
<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
<input type="hidden" value="${chid }" name="chid">
	<div class="part">
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
	</div>
	
</form>



<form action="Note" method="post">
<div class="part">

<!-- res : id, ox, answer, input 을 가지고있다   -->
	<c:if test="${!empty res }">
		<div> <번호> <체크> <정오답 결과> <정답> <내가 틀렸던 답> </div>
		<c:forEach var="a" items="${res }">
			<div>${a.id }<input type="radio" name="aa${a.id }" value="1"> 
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
		<div>체크한 문제를 학습 노트에 저장할 수 있습니다.</div>
		<div><input type="submit" value="학습 노트에 저장"></div>
	</c:if>
</div>
</form>	
</body>
</html>