<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>


<script type="text/javascript">

            function regChk(){
                var frm = document.frm;
                var pid = frm.pid;
                var pw1 = frm.pw1;
                var pw2 = frm.pw2;

                if(pid.value==''|| !(/^[a-zA-Z0-9]{7,20}$/.test(pid.value))){
                    alert("아이디 규칙을 확인해주세요")
                    pid.value='';
                    pid.focus();
                    return;
                }
                /* || !(/^(?=.*[a-zA-Z])(?=.*[0-9]).{7,20}$/.test(pw1.value)) */
                if(pw1.value==''|| !(/^(?=.*[a-zA-Z])(?=.*[0-9]).{7,20}$/.test(pw1.value))){
                	alert('비밀번호 규칙을 확인해주세요');
                    pw1.value='';
                    pw2.value='';
                    pw1.focus();
                    return;
                }

                if(pw1.value!=pw2.value){
                	alert('비밀번호가 일치하지 않습니다.');
                    pw1.value='';
                    pw2.value='';
                    pw1.focus();
                	return;
                }
                frm.action="JoinReg";
                frm.submit();
            }
</script>

</head>
<body>

<div>
* 아이디는 영대소문자, 숫자 사용가능하며 7자 이상 20자 이하입니다
</div>

<div>
* 비밀번호는 영대소문자, 숫자조합으로 7자 이상 20자 이하입니다
</div>

<form name="frm" method="post">
	<table border="">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="pid" /></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="pname" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw1" /></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input type="password" name="pw2" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" onclick="regChk()" value="회원가입" />
			</td>
		</tr>
	</table>
</form>

</body>
</html>