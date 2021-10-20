<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript">
	function goList(pn){
		location.href="${board.category}BoardList.bd?pageNum="+pn;
	}
	
	function goDelete(num,pn){
		location.href="boardDelete.bd?num="+num+"&pageNumber="+pn;
	}
	
	function goUpdate(id,num,pn){
		location.href="boardUpdate.bd?id="+id+"&num="+num+"&pageNumber="+pn;
	}
	
	$(".replyWriteBtn").on("click", function(){	  
		var formObj = $("form[name='replyForm']");
		 formObj.attr("action", "/replyWrite.bd");
		 formObj.submit();
	});

</script>
<style>
      div {
        width: 600px;        
      }
      img {
  		max-width: 100%;
      }
</style>


<center>	  
	<h2>게시물 확인</h2>
	<table border="1" width="500" align="center"> 
		<tr>
			<td align="center">카테고리</td> 
			<td align="center">${board.category}</td>
			<td align="center">글번호</td> 
			<td align="center">${board.num}</td>
			<td align="center">조회수</td>
			<td align="center">${board.readCount}</td>
		</tr>
	 
		<tr>
			<td align="center">작성자</td>
			<td align="center">${board.writer}</td>
			<td align="center">작성일</td>
			<td colspan="3"align="center">
				<fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd" var="pRegDate"/>
				<fmt:formatDate value="${pRegDate}" pattern="yyyy/MM/dd" var="fRegDate"/>
				${fRegDate}
			</td>
		</tr>
	
		<tr>
			<td width="100" align="center">글제목</td>
			<td align="center" colspan="5">${board.title}</td>
		</tr>
		
		<!-- 
		<tr height="50">
			<td align="center">삽입된 그림</td>
			<td align="center" colspan="3"><image style="height:150px; width:150px;" src="<%=request.getContextPath()%>/resources/${board.image}"/></td>
		</tr>
		 -->
	
		<tr height="50">
			<td width="100" align="center">글내용</td>
			<td colspan="5"><div align="center"><image src="<%=request.getContextPath()%>/resources/images/${board.image}"/></div><br clear="left">${board.content}</td>
		</tr>
	
		<tr>
			<td colspan="6" align="center">
				<form name="deleteForm" action="delete.bd" method="post">
			  		
			  		<input type="hidden" id="bno" name="bno" value="${board.num}" />
			  		<input type="hidden" id="wid" name="wid" value="${board.writer}" />			  		
			  		<input type="hidden" id="pageNumber" name="pageNumber" value="${pageNumber}">
			  		
			  		<!-- 		
					<input type="button" value="글수정" onClick="goUpdate(${board.writer},${board.num},${pageNumber})">
					 -->
					
					<input type="button" value="글수정" onClick="location.href='<%=request.getContextPath()%>/boardUpdate.bd?wid=${board.writer}&num=${board.num}&pageNumber=${pageNumber}'">
					 										
					<input type="button" value="글삭제" onClick="location.href='<%=request.getContextPath()%>/boardDelete.bd?num=${board.num}&category=${board.category}&pageNumber=${pageNumber}'">				
					
					<input type="button" value="글목록" onClick="location.href='<%=request.getContextPath()%>/${board.category}BoardList.bd?pageNumber=${pageNumber}'">
				</form>				 
			</td>
		</tr>
		
		<tr>
			<td colspan="6" align="center">
				<!-- 댓글 -->
				<div id="reply">
				  <ol class="replyList">
				    <c:forEach items="${boardReplyLists}" var="boardReplyLists">
				      <li>
				        <p>
				        작성자 : ${boardReplyLists.writer}<br />
				        작성 날짜 :  <fmt:formatDate value="${boardReplyLists.regdate}" pattern="yyyy-MM-dd" />
				        </p>
				
				        <p>[댓글 내용]: ${boardReplyLists.content}</p>
				      </li>
				    </c:forEach>   
				  </ol>
				</div>
			</td>
		</tr>		
	</table>
	<form name="replyForm" action="replyWrite.bd" method="post">
		  <input type="hidden" id="bno" name="bno" value="${board.num}" />
		  <input type="hidden" id="wid" name="wid" value="${board.writer}" />
		  <input type="hidden" id="category" name="category" value="${board.category}" />
		  <input type="hidden" id="pageNumber" name="pageNumber" value="${pageNumber}">		
		  
		  <div>
		    <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
		    <br/>
		    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
		  </div>
		  <div>
		 	 <button type="submit">작성</button>
		  </div>
	</form>
</center>
