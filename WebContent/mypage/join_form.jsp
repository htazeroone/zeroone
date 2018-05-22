<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css" />
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

  <div class="site__container">
  <p class="text--center">아이디 <span class="fontawesome-arrow-right"></span> 영대소문자, 숫자 사용가능하며 7자 이상 20자 이하입니다<br>
		비밀번호 <span class="fontawesome-arrow-right"></span> 영대소문자, 숫자조합으로 7자 이상 20자 이하입니다 </p>
    <div class="grid__container">
	
	<form name="frm" method="post"  class="form form--login">
	<input type="hidden" name="pid" value="<%=session.getAttribute("pid") %>" />
        
        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">ID</span></label>
          <input id="login__username" name="pid" type="text" class="form__input" placeholder="ID" required>
        </div>
        
         <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">Name</span></label>
          <input id="login__username" name="pname" type="text" class="form__input" placeholder="Username" required>
        </div>
        
         <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">PW</span></label>
          <input id="login__password" name="pw1" type="password" class="form__input" placeholder="Password" required>
        </div>
        
         <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">PW</span></label>
          <input id="login__password" name="pw2" type="password" class="form__input" placeholder="Password 확인" required>
        </div>

        <div class="form__field">
          <input type="button" onclick="regChk()" value="JOIN" />
        </div>

	</form>

    </div>

  </div>
  
</body>
</html>