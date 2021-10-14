<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>

<style type="text/css">
body {
	align: center;
	text-align: center;
}
</style>

<script type="text/javascript">
	function boardWrite() {
		location.href = "boardWrite.ad";
	}
</script>

<h2 align="center">관리자 - 게시판 리스트</h2>

			
				<a href="boardList.ad?">전체보기 </a> &nbsp;
				<a href="boardList.ad?category=notice">공지사항 </a> &nbsp;
				<a href="boardList.ad?category=qna">QnA</a> &nbsp;
				<a href="boardList.ad?category=club">동아리</a> <br>

			<form action="boardList.ad" method="get">
				<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber}"> 
				
				<c:if test="${category != null }" >
				<input type="hidden" name="category" value="${category}"> 
				</c:if>
				
				<select name="whatColumn">
					<option value="선택">선택
					<option value="title">제목
					<option value="writer">작성자
				</select> <input type="text" name="keyword"> 
				
				<input type="submit"
					value="검색">
			</form>

			<table border="1" width="700" align="center">
				<tr>
					<td colspan="7" align="right">
					<input type="button" value="글쓰기" onclick="boardWrite()"></td>
				</tr>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>삭제</th>
					<th>수정</th>
					
				</tr>
				<c:forEach var="board" items="${boardLists}">
					<tr>
						<td><c:if test="${board.relevel > 0}">
								<c:set value="${board.relevel * 30}" var="width" />
								<img
									src="<%=request.getContextPath()%>/resources/images/level.gif"
									width="${width}" height="15">
								<img src="<%=request.getContextPath()%>/resources/images/re.gif">
							</c:if> <a
							href="boardDetail.ad?num=${board.num}&pageNumber=${pageInfo.pageNumber}">
								${board.title} </a></td>
						<td>${board.writer}</td>
						<td><fmt:parseDate value="${board.regdate}"
								pattern="yyyy-MM-dd" var="pRegDate" /> <fmt:formatDate
								value="${pRegDate}" pattern="yyyy/MM/dd" var="fRegDate" />
							${fRegDate}</td>
						<td>${board.readcount}</td>
						<td><a href="boardDelete.ad?num=${board.num }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
						<td><a href="boardUpdate.ad?num=${board.num }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
					</tr>
				</c:forEach>
</table>

	<center>${pageInfo.pagingHtml }</center>
