<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css" />

<title>Insert title here</title>

</head>
<body>

  <div class="site__container">

    <div class="grid__container">
	
	<form action="../login/LoginReg" method="post"  class="form form--login">
		
		 <div class="form__field">		 
          <label class="fontawesome-user" for="login__username"><span class="hidden">Username</span></label>
          <input id="login__username" name="pid" type="text" class="form__input" placeholder="Username" required>
        </div>
        
         <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" name="pw" type="password" class="form__input" placeholder="Password" required>
        </div>

        <div class="form__field">
          <input type="submit" value="LOGIN">
        </div>
		
	</form>
	
	 <p class="text--center">회원이 아니신가요? <span class="fontawesome-arrow-right"></span><a href="../login/JoinForm"> JOIN</a> </p>

    </div>

  </div>
</body>
</html>