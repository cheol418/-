<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"> 


<style type="text/css">
 .box1 {
  float:left; width:140px; height:180px; background-color:#234234; margin: 50px 0px;}

 .box2 {
  display:inline-block; width:1000px; height:100px; margin-left:10px; }  
	
</style>

<script type="text/javascript">
	function boardWrite() {
		location.href = "boardWrite.ad";
	}
</script>

<div class="bodyPart content" align="center">

<h2 align="center">게시판 목록</h2>

			<form action="boardList.ad" method="get">
				<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber}"> 
				
				<c:if test="${category != null }" >
				<input type="hidden" name="category" value="${category}"> 
				</c:if>
				
				<select name="whatColumn">
					<option value="all">선택
					<option value="title">제목
					<option value="writer">작성자
				</select> <input type="text" name="keyword"> 
				
				<input  class="btn btn-outline-dark logBtn" type="submit"
					value="검색">
			</form>
			
<div class="list-group box1">
  <a href="boardList.ad" class="list-group-item list-group-item-action">전체보기</a>
  <a href="boardList.ad?category=notice" class="list-group-item list-group-item-action">공지사항</a>
  <a href="boardList.ad?category=qna" class="list-group-item list-group-item-action">QnA</a>
  <a href="boardList.ad?category=club" class="list-group-item list-group-item-action">동아리</a>
  <a href="boardList.ad?category=free" class="list-group-item list-group-item-action">자유게시판</a>
</div>

			
<div class="conDiv box2">
		<table class="table table-bordered table-hover mainboard">
				<tr>
					<td colspan="7" align="right">
					<input  class="btn btn-outline-dark logBtn" type="button" value="글쓰기" onclick="boardWrite()"></td>
				</tr>
				<tr>
					<th width=20%>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>삭제</th>
					<th>수정</th>
					
				</tr>
				<c:forEach var="board" items="${boardLists}">
					<tr>
						<td ><c:if test="${board.relevel > 0}">
								<c:set value="${board.relevel * 30}" var="width" />
								<img
									src="<%=request.getContextPath()%>/resources/images/level.gif"
									width="${width}" height="15">
								<img src="<%=request.getContextPath()%>/resources/images/re.png">
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
		</div>
	</div>
<%@ include file="../concert/footer.jsp"%>
