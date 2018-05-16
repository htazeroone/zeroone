<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.tr{
		background-color: pink;

	}
	.td{
		display: inline-block;
		border: 3px solid purple; 
		width: 200px;
	}
</style>

<form action="DeleteReg" method="post">
<input type="hidden" name="id" value="${param.id }" >

	<div>
	
		<div class="tr">
			<div class="td">암호</div>
			<div class="td">
			<input type="password" name ="pw">
			</div>
		</div>
		<div class="tr">
			<div class="td">
				<input type="submit" value="삭제">
			</div>

		</div>
	</div>
</form>