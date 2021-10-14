<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">

<body>
	<div align="center" width="600">

		boardDetailForm.jsp<br>
		<form action="boardReply.ad" method="get" >
			<input type="hidden" name="num" value=${bean.num }> 
			<input type="hidden" name="pageNumber" value=${pageNumber }> 
			<input type="hidden" name="category" value=${bean.category }>
			<input type="hidden" name="ref" value=${bean.ref }>
			<input type="hidden" name="restep" value=${bean.restep }>
			<input type="hidden" name="relevel" value=${bean.relevel }>

			<h2>게시판 글 세부정보</h2>
			<table border=1 width=400>
				<tr>
					<td>게시판 카테고리</td>
					<td>${bean.category }</td>
				</tr>
				<tr>
					<td>글번호</td>
					<td>${bean.num }</td>
				</tr>
				<tr>
					<td>작성자ID</td>
					<td>${bean.writer }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${bean.title }</td>
				</tr>
				<tr>
					<td>사진</td>
					<td><img style="height: 150px; width: 240px;"
						src="<%=request.getContextPath()%>/resources/board/${bean.image}" /><Br>
					</td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td>${bean.content }</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="답글달기">
					<input type="button" value="돌아가기" onclick="location.href='boardList.ad?pageNumber=${pageNumber}'">
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>