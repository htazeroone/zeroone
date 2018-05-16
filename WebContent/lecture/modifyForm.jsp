<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../../nse_files/js/HuskyEZCreator.js" charset="utf-8">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이론게시판 글 작성 폼</title>
</head>
<body>

<form name="nse" action="ModifyReg" method="post">
<input type="hidden" name="id" value="${data.id }">

<table border="">
	<tr>
		<td>챕터</td>
		<td><select name="head">	
			<%
			String[] chaps = {"자바 시작하기", "변수와 타입", "연산자", "조건문과 반복문", "참조타입", 
					"클래스", "상속", "인터페이스", "예외처리", "기본API클래스"};
			for(String chap : chaps) { %>
				<option value="<%=chap %>"><%=chap %></option>
			<% }%>
			
			</select>
		</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${data.title }"></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="pname" value="${data.pname }"></td>
	</tr>

	<tr>
		<td>이론설명</td>
			<td  width="600" height="200">
			<textarea name="content" id="ir1" class="nse_content">${data.content }</textarea>
			<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				sSkinURI : "../../nse_files/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
			
			function submitContents(elClickedObj) {
				// 에디터의 내용이 textarea에 적용됩니다.
				oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
				try {
					elClickedObj.form.submit();
				} catch (e) {
				}
			}
		</script>
		</td>			
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정하기" onclick="submitContents(this)"/>
			<a href="ModifyForm?id=${data.id }">초기화</a>
			<a href="List?id=${data.id }">목록</a>
			<a href="Detail?id=${data.id }">뒤로</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>