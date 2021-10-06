<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript">
	function goList(pn){
		location.href="${board.category}BoardList.bd?pageNum="+pn;
	}
	function goReply(ref,restep,relevel,num,pn){
		location.href="boardReply.bd?ref="+ref+"&restep="+restep+"&relevel="+relevel+"&num="+num+"&pageNumber="+pn;
	}
	function goDelete(num,pn){
		location.href="boardDelete.bd?num="+num+"&pageNumber="+pn;
	}
	function goUpdate(num,pn){
		location.href="boardUpdate.bd?num="+num+"&pageNumber="+pn;
	}
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
	<h2>글내용 보기</h2>
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
			<td align="center">
				<fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd" var="pRegDate"/>
				<fmt:formatDate value="${pRegDate}" pattern="yyyy/MM/dd" var="fRegDate"/>
				${fRegDate}
			</td>
		</tr>
	
		<tr>
			<td align="center">글제목</td>
			<td align="center" colspan="3">${board.title}</td>
		</tr>
		
		<!-- 
		<tr height="50">
			<td align="center">삽입된 그림</td>
			<td align="center" colspan="3"><image style="height:150px; width:150px;" src="<%=request.getContextPath()%>/resources/${board.image}"/></td>
		</tr>
		 -->
	
		<tr height="50">
			<td align="center">글내용</td>
			<td colspan="3"><div align="center"><image  src="<%=request.getContextPath()%>/resources/${board.image}"/></div><br clear="left">${board.content}</td>
		</tr>
	
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="글수정" onClick="goUpdate(${board.num},${pageNumber})">
				<input type="button" value="글삭제" onClick="goDelete(${board.num},${pageNumber})">
				<input type="button" value="답글쓰기" onClick="goReply(${board.ref},${board.restep},${board.relevel},${board.num},${pageNumber})">
				<input type="button" value="글목록" onClick="location.href='<%=request.getContextPath()%>/noticeBoardList.bd?pageNumber=${pageNumber}'">
				
				 
			</td>
		</tr>
	</table>
</center>