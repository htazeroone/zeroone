<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/study.css" />
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
		frm.action = "Note?subject=${subject}&chid=${chid}";
		frm.submit();
}

function ddQuiz(){
	var frm = document.delete_quiz;
	var chkArr = new Array();
	var msg = "";
	var size = $('input:checkbox[name=deleteId]').length;
	
	'<c:forEach var="a" items="${res }">'
		
		var id = ${a.id}; 
		var chk = $('input:checkbox[id='+${a.id}+']').prop('checked');
		id += '';
		
		if(chk){
			msg += id+'번 '
		}
				
	'</c:forEach>'
		msg += '문제를 삭제합니다.'
	
	alert(msg)
	frm.action = "Note?subject=${subject}&chid=${chid}";
	frm.submit();
	
}
</script>
<style type="text/css">
.part{
	float:left;
	width : 50%;
}

</style>

</head>
<body>

<!-- 문제 출력 부분  -->
<div class="part">
<c:choose>
	<c:when test="${!empty idAndInput }">
		<form name="frm" method="post">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="hidden" value="${chid }" name="chid">
		<input type="hidden" value="${subject }" name="subject">
		
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
			<div><input type="button" onclick="allChk()" value="정답 확인" class="myButton"></div>
		</form>
			
	</c:when>
	
	<c:otherwise>

	<form name="frm" method="post">
	<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
	<input type="hidden" value="${chid }" name="chid">
	<input type="hidden" value="${subject }" name="subject">
		<c:if test="${!empty qInfo }">
		<c:forEach var="q" items="${qInfo }">
		<table class="question">
			<tr id="qheader"><td class="qtd">${q.id }.${q.question }</td></tr>
			<tr><td>정답률:${q.correction/q.total*100 }%</td></tr>
			<tr><td><input type="radio" name="${q.id }" value="1"> ${q.s1 }</td></tr>
			<tr><td><input type="radio" name="${q.id }" value="2"> ${q.s2 }</td></tr>
			<tr><td><input type="radio" name="${q.id }" value="3"> ${q.s3 }</td></tr>
			<tr><td><input type="radio" name="${q.id }" value="4"> ${q.s4 }</td></tr>
			<tr><td><input type="radio" name="${q.id }" value="5"> ${q.s5 }</td></tr>
		</table>
		</c:forEach>
		<div ><input type="button" onclick="allChk()" value="정답 확인" class="myButton"></div>
			</c:if>
	</form>

	</c:otherwise>
</c:choose>
</div>

<!-- 정답 확인 결과 부분  -->

<div class="part">

	<form action="delete_quiz" method="post">
	<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
	<input type="hidden" value="${chid }" name="chid">
	<input type="hidden" value="${subject }" name="subject">
	
<!-- res : id, ox, answer, input 을 가지고있다   -->
	<c:if test="${!empty res }">
		<table class="answer">
		<tr id="aheader" class="atr" >
		<td id="atd_left">번호</td>
		<td>체크</td><td>정오답 결과</td><td>정답</td><td id="atd_right">내가 틀렸던 답</td></tr>
		
		<c:forEach var="a" items="${res }">
			<tr class="atr" >
			<td>${a.id }</td>
			<td><input type="checkbox" name="deleteId" value="${a.id }" id="${a.id }"></td>

			<td>
			<c:choose>
				<c:when test="${a.ox eq '1' }">
				O
				</c:when>
				<c:otherwise>
				X
				</c:otherwise>
			</c:choose>
			</td>
			<td>${a.answer }</td><td>${a.input }</td>
			</tr>
		</c:forEach>

		</table>

		<div>체크한 문제를 학습 노트에서 삭제할 수 있습니다.</div>
		<div><input type="button" onclick="ddQuiz()" value="선택 문제 삭제" class="myButton"></div>
	</form>	

	</c:if>
</div>

</body>
</html>