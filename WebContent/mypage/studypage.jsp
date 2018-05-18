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
		<div>${q.id }.${q.question }정답률:${q.correction/q.total }</div>
		<div><input type="radio" name="${q.id }" value="1"> ${q.s1 }</div>
		<div><input type="radio" name="${q.id }" value="2"> ${q.s2 }</div>
		<div><input type="radio" name="${q.id }" value="3"> ${q.s3 }</div>
		<div><input type="radio" name="${q.id }" value="4"> ${q.s4 }</div>
		<div><input type="radio" name="${q.id }" value="5"> ${q.s5 }</div>
	</c:forEach>
	<div><input type="button" onclick="allChk()" value="정답 확인"></div>
	</div>
	
</form>




<div class="part">
정답들 
</div>

</body>
</html>