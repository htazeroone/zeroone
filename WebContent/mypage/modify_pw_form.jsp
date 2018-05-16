<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function pwChk(){
		var frm = document.frm;
		var newpw1 = frm.newpw1;
		var newpw2 = frm.newpw2;

        if(newpw1.value==''|| !(/^(?=.*[a-zA-Z])(?=.*[0-9]).{7,20}$/.test(newpw1.value))){
        	alert('비밀번호 규칙을 확인해주세요');
        	newpw1.value='';
        	newpw2.value='';
        	newpw1.focus();
            return;
        }

		if(newpw1.value!=newpw2.value){
			alert('새비밀번호가 일치하지 않습니다.');
			newpw1.value='';
			newpw2.value='';
			newpw1.focus();
			return;
		}

		frm.action="ModifyPwReg";
		frm.submit();
	}
</script>

</head>
<body>

<div>
* 비밀번호는 영대소문자, 숫자조합으로 7자 이상 20자 이하입니다
</div>

<form name="frm" method="post">
<!-- 비밀번호 변경을 위해 pw와 pid을 보낸다  -->
<input type="hidden" name="pid" value="<%=session.getAttribute("pid") %>" />
	<div>
	회원 탈퇴를 위해 기존비밀번호를 입력해주세요.
	</div>
	<div>
	기존 비밀번호 입력:<input type="password" name="oldpw" />
	</div>
	<div>
	새 비밀번호를 입력해주세요.
	</div>
	<div>
	새 비밀번호 입력:<input type="password" name="newpw1" />
	</div>
	<div>
	새 비밀번호 확인:<input type="password" name="newpw2" />
	</div>
	<div>
	<input type="button" onclick="pwChk()" value="비밀번호변경" />
	</div>
</form>
</body>
</html>