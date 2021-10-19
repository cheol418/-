<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style type="text/css">
	body{
		align:center;
		text-align: center;
	}
</style>


<script type="text/javascript">
	
	function insert(){
		
		//location.href="boardInsert.bd?category="+ok+"&pageNumber=${pageInfo.pageNumber}";
		
		location.href="boardInsert.bd?category=${CT}&pageNumber=${pageInfo.pageNumber}&writer=${board.writer}";
	}	
</script>

<head>
	<meta charset="UTF-8">
	<title>Free_Board</title>
</head>

<body>
	<h2>자유 게시판 목록보기</h2>
	<form action="freeBoardList.bd" method="post">
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
	
	<div>
		글목록(전체 글:${pageInfo.totalCount})
	</div>
	
	<table border="1" width="700" align="center">
	
		<tr>
			<td colspan="6" align="right"> 
				<input type="button" value="추가하기" onclick="insert()">
			</td>
		</tr>
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
			<td align="center">${board.num}</td>
			<td align="center">${board.category}</td>				
			<td align="left">
				<c:if test="${board.relevel > 0}">
					<c:set value="${board.relevel * 30}" var="width"/> 
					<img src="<%=request.getContextPath()%>/resources/images/level.gif" width="${width}" height="15">  
					<img src="<%=request.getContextPath()%>/resources/images/re.gif">
				</c:if>
				<a href="boardDetail.bd?num=${board.num}&category=${board.category}&pageNumber=${pageInfo.pageNumber}">
					${board.title}
				</a>
			</td>
			<td align="center">${board.writer}</td>
			<td align="center">
				<fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd" var="pRegDate"/>
				<fmt:formatDate value="${pRegDate}" pattern="yyyy/MM/dd" var="fRegDate"/>
				${fRegDate}
			</td>
			<td align="center">${board.readCount}</td>
			
		</tr>
		</c:forEach>		
	</table>
	${pageInfo.pagingHtml}

</body>

</html>