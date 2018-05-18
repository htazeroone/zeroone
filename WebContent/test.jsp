<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <style>
#table {display: table; width: 100%;}
.tr {
display: table-row;
background-color: blue;
}

.td {
display: table-cell; 
padding: 3px; 
border-bottom: 1px solid #DDD;
background-color: yellow;
}
.td1 {
 width: 20%;
 background-color: red;
 }
 
</style>

<div id="table">

	<div class="tr">
		<div class="td td1">
			asdasda
		</div>
		<div class="td td2">
			asdasda
		</div>
	</div>
	


</div> -->


<!-- <script type="text/javascript">

	function add_div(){
	    var div = document.createElement('div');
	    div.innerHTML = document.getElementById('room_type').innerHTML;
	    document.getElementById('field').appendChild(div);
	}



	function remove_div(obj){

		document.getElementById('field').removeChild(obj.parentNode);
	}

</script>


<input type="button" value="추가" onclick="add_div()"><br/>

	<div id="room_type">
	
		<div class="form-group">
		
			<label for="image">제목</label>
		
			<input type="text" id="title" name="title" class="form-control" ></input>
		
		</div>
		
		<input type="button" value="삭제" onclick="remove_div(this)">
	
	</div>

<div id="field"></div>
 -->
 
 <%-- <style>
	#table {display: table; width: 100%;}
	
	.tr {
		display: table-row;
		background-color: blue;
	}
	
	.td {
		display: table-cell; 
		padding: 3px; 
		border-bottom: 1px solid #DDD;
		background-color: yellow;
	}
	.td1 {
		 width: 20%;
		 background-color: red;
	 }
 
 .rrr {
		display: table-cell; 
		padding: 3px; 
		border-bottom: 1px solid #DDD;

	}
	
 .rere {
 
 	background-color: gray;
 }	
 
</style>

<div id="table">

<c:forEach items="${data }" var="dd">

	<script type="text/javascript">

	function add_div(){
	    var div = document.createElement('re'+${dd.id});
	    alert(div.tagName)
	    div.innerHTML = document.getElementById('rrr').innerHTML;
	    document.getElementById('table').appendChild(div);
	}



	function remove_div(obj){

		document.getElementById('field').removeChild(obj.parentNode);
	}

</script>


	<div class="tr">
		<div class="td td1">
			${dd.content }
			<input type="button" value="추가" onclick="add_div()"><br/>
		</div>
	</div>
			
	<div class="rere retemp" style="display: none;">
	
		<div id="rrr">
			<form action="Replyinsert">
	
				<div class="rinsert">
					<div class="ritd1">
						<textarea cols="100" name="content"></textarea>
					</div>
					<div class="ritd2">
						<input type="submit" value="등록">
					</div>
				</div>
			</form>
		</div>
	</div>
	
 </c:forEach>

</div>
 --%>
 
<style>
.rrr{
	background-color: blue;
	display: none;
}
 .reply9{

	background-color: yellow;
	display: block;
  }

</style> 

<c:forEach items="${data}" var="dd">
	<div class="rrr reply${dd.id }">
		아디 : reply${dd.id }
	
	</div>



</c:forEach>



<!-- <script>

function re(){
	alert("asdsadsa");
}

</script>


<button onclick="re()">뀨</button> -->