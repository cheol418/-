<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/board.css"> 


<script type="text/javascript">
	
	function insert(){
		
		//location.href="boardInsert.bd?category="+ok+"&pageNumber=${pageInfo.pageNumber}";
		
		location.href="boardInsert.bd?category=${CT}&pageNumber=${pageInfo.pageNumber}&writer=${board.writer}";
	}	
</script>

<%@ include file="../concert/header.jsp" %>
<div class="body bodypart">


	<h2 align="center">QnA 게시판 </h2>
		<form align="center" action="qnaBoardList.bd" method="post">
				<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber}">		
				<input type="hidden" name="CT" value="${CT}">
				<select name="whatColumn">
					<option value="선택">선택
					<option value="title">제목
					<option value="writer">작성자
				</select>
				<input type="text" name="keyword">
				<input type="submit" value="검색">
		</form>				
	
	<div align="center">
		글목록(전체 글:${pageInfo.totalCount})
	</div>
	
	<table align="center" class="table table-bordered table-hover mainboard">
	
		<tr align="center">			
			<td>번호</td>
			<td>카테고리</td>
			<td>글 제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>			
		</tr>
	
		<c:forEach items="${boardLists}" var="board">
		<tr>
			<td align="center" class="nboardNum">
					${board.num}
				
			</td>
			<td class="nboardCT">				
					${board.category}				
			</td>							
			<td align="left" class="nboardTitle">
				<c:if test="${board.relevel > 0}">
					<c:set value="${board.relevel * 30}" var="width"/> 
					<img src="images/level.gif" width="${width}" height="15">  
					<img src="<%=request.getContextPath()%>/resources/images/re.gif">
				</c:if>
				<a href="boardDetail.bd?num=${board.num}&category=${board.category}&pageNumber=${pageInfo.pageNumber}">
					${board.title}
				</a>
			</td>
			<td align="center" class="nboardWriter">${board.writer}</td>
			<td align="center" class="nboardRegdate">
				<fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd" var="pRegDate"/>
				<fmt:formatDate value="${pRegDate}" pattern="yyyy/MM/dd" var="fRegDate"/>
				${fRegDate}
			</td>
			<td align="center" class="nboardCount">${board.readCount}</td>			
		</tr>
		</c:forEach>				
	</table>
	
	<div class="tailBoardSearch">
		<div style="float:left" >		
		<form  action="qnaBoardList.bd" method="post">
				<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber}">		
				<input type="hidden" name="CT" value="${CT}">
				<select name="whatColumn">
					<option value="선택">선택
					<option value="title">제목
					<option value="writer">작성자
				</select>
				<input type="text" name="keyword">
				<input type="submit" value="검색">
		</form>				
		
		</div>
		<div style="float:right; margin-right=50px;">
			<input type="button" value="글쓰기" onclick="insert()">
		</div>		
	</div>
	
	
	
	<div class="tailBoardPaging">
		<div align="center">
			${pageInfo.pagingHtml}
		</div>
	</div>
</div>

	

<%@ include file="../concert/footer.jsp" %>
