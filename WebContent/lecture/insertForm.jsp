<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] cps = {};
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../../nse_files/js/HuskyEZCreator.js" charset="utf-8">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이론게시판 글 작성 폼</title>
</head>
<body>
<form name="nse" action="InsertReg" method="post" enctype="multipart/form-data">
<table border="">
	<tr>
		<td>챕터</td>
		<td><select name="head">
				<option value="1" selected="selected">자바 시작하기</option>
				<option value="2">변수와 타입</option>
				<option value="3">연산자</option>
				<option value="4">조건문과 반복문</option>
				<option value="5">참조타입</option>
				<option value="6">클래스</option>
				<option value="7">상속</option>
				<option value="8">인터페이스</option>
				<option value="9">예외처리</option>
				<option value="10">기본API클래스</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="pname" value="관리자"></td>
	</tr>

	<tr>
		<td>이론설명</td>
			<td  width="600" height="200">
			<textarea name="content" id="ir1" class="nse_content">text editor야 되어라</textarea>
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
			<input type="submit" value="글 등록" onclick="submitContents(this)"/>
			<a href="List?page=${param.page }">뒤로</a>
		</td>
	</tr>

</table>

</form>

</body>
</html>