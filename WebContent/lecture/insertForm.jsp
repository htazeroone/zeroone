<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../../nse_files/js/HuskyEZCreator.js" charset="utf-8">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이론게시판 글 작성 폼</title>
</head>
<body>

<form name="nse" action="InsertReg" method="post">

<table border="">

	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="pname"></td>
	</tr>
	<tr>
		<td>이론설명</td>
		<td  width="600" height="200"
		
		><textarea name="content" id="ir1" class="nse_content">text editor야 되어라</textarea>
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
		<td colspan="2" align="right">
			<input type="submit" value="글 등록" onclick="submitContents(this)"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>