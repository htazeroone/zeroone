<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">

<%
    String chk = (String)session.getAttribute("pname");
%>


<script>
var getout = <%=chk %>
    if(getout==null){
        alert('getout')
        location.href="../main/Main"
    }

function re(a){
	
	var b = 'rd'+a;
	
 	rehide();
 
	document.getElementById(b).style.display='inline';

}    

function rehide(){
	var abc = document.getElementsByClassName('rediv');

	for(var i=0;i<abc.length;i++){
		abc.item(i).style.display='none'
	}
	
}

</script>

<style>

	.rediv{
	
		background-color: gray;
		display: none; 
	}

	#dd{
		margin: 0 auto;
		width: 800px;
		height: 500px;
	
	}
	
	textarea {
		margin: 10px
}
</style>


<div id="dd">
	<table class="table">
		<tr>
		
			<td>번호</td>
			<td>${data.id }</td>
			
			<td>종류</td>
			<td>${data.kind }</td>
		
			<td>글쓴이</td>
			<td>${data.pname }</td>
			
			<td>등록일</td>
			<td>${data.reg_date }</td>
	
			<td>추천수</td>
			<td>${data.rec }</td>
		
			<td>조회수</td>
			<td>${data.cnt }</td>
	
		</tr>	

		<c:if test="${data.upfile!='' }">
			<tr>
				<td>파일</td>
				<td colspan="11">
				<a href="FileDown?file=${data.upfile}&kind=${data.kind }">${data.upfile }</a>
				</td>
			</tr>
		</c:if>
		
		<tr>	
			<td>제목</td>
			<td colspan="10">${data.title }</td>
			<td>
				<input type="button" value="추천" onclick="location.href='Rec?id=${data.id}&page=${page }'">
			</td>
		</tr>	
		
		<tr height="370px">	
			<td colspan="12">${data.content }</td>
		</tr>
	
		<tr>
			<td colspan="12">댓글</td>
		</tr>
	<!-- ========================================================댓글리스트 tr -->	
		<tr>
			<c:choose>
				<c:when test="${reply.size()==0 }">
					<td colspan="12">댓글이없습니다.</td>
				
				</c:when>
			
				<c:otherwise>
					<td colspan="12">
						<table border="" width="100%">
							<c:forEach var="rr" items="${reply }">
								<tr>
								
									<td bgcolor="#DAD9FF">
										${rr.pname }
									</td>
									<td bgcolor="#DAD9FF">
									
										<c:if test="${rr.lev>0 }">
									
											<c:forEach begin="1" end="${rr.lev }">
											&nbsp;&nbsp;
											</c:forEach>
											
											
										</c:if>
										
										${rr.content }
										<button onclick="re(${rr.id})">댓글</button>
										
										<!-- <button onclick="rehide()">댓글안보이기</button> -->
									</td>
									<td bgcolor="#DAD9FF">

										<c:if test="${rr.pname==pname }">
										
											<form action="Recdelete">
												<input type="hidden" name="id" value="${rr.id }">
												<input type="hidden" name="orid" value="${data.id }">
												<input type="hidden" name="page" value="${page }">
												<input type="submit" value="댓글삭제">
											</form>
							
										</c:if>
									</td>
								</tr>
								
		<!-- ========================================================/댓글리스트 tr -->		
		<!-- ========================================================대댓글숨기기 tr -->							
	
								<tr>
									<td colspan="2">
										<table class="rediv" id = "rd${rr.id }" width="100%" height="100%">
											<tr>
												<td bgcolor="#DAD9FF">
													<form action="Rereinsert" id="rrinfrm${rr.id }">
														<textarea cols="90px" name="rrcontent" style="resize: none;"></textarea>
														<input type="hidden" name="orid" value="${data.id }">
														<input type="hidden" name="id" value = "${rr.id }">
														<input type="hidden" name="gid" value = "${rr.gid }">
														<input type="hidden" name="seq" value = "${rr.seq }">
														<input type="hidden" name="lev" value = "${rr.lev }">
														<input type="hidden" name="page" value="${page }">
														<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
													</form>
												</td>	
												
												
												<td bgcolor="#DAD9FF">
													<button style="width: 100%" onclick="document.getElementById('rrinfrm${rr.id}').submit()">댓글달기</button>
												</td>
											</tr>
										
										</table>
					
										
									</td>
								</tr>
		<!-- ==========================================================/대댓글숨기기 tr -->							
							</c:forEach>		
						</table>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
	<!-- 댓글달수있는 창 -->
		<tr>
	
			<td colspan="11">
				<form action="Replyinsert" id="rinsert">
				<textarea cols="100" name="content" style="resize: none;"></textarea>
				<input type="hidden" name="id" value="${data.id }">
				<input type="hidden" name="page" value="${page }">
				<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
				</form>
			</td>
			<td>	
				<button  onclick="document.getElementById('rinsert').submit()">등록</button>
			</td>
			
			
		</tr>
		
	<!-- ========================================================수정삭제 tr -->		
		<tr>
		
			<c:choose>
				<c:when test="${data.pname==pname||pname=='admin' }">
					<td align="left">
						<a href="Modify?id=${data.id }&kind=${data.kind }&page=${page}">수정</a>
						<a href="Delete?id=${data.id }&kind=${data.kind}">삭제</a>
					</td>
					<td colspan="9"></td>
				</c:when>
				
				<c:otherwise>
					<td colspan="10"></td>	
					
				</c:otherwise>
		
			</c:choose>
					<td colspan="2" align="right">
					<a href="List?kind=${data.kind }&page=${page}">목록으로</a>
					<a href="Cominsert?id=${data.id }&page=${page}">답글</a>
			</td>
		</tr>
		
	<!-- ========================================================/수정삭제 tr -->		
	</table>
	<!-- /댓글달수있는 창 -->

</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>