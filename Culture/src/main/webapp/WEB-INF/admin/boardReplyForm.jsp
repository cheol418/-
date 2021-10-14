<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>

<body>
<center>

	<h2 align="center">관리자 - 게시판 답글쓰기</h2>
	<form action="boardReply.ad" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value=${bean.num }> 
		<input type="hidden" name="pageNumber" value=${pageNumber }> 
		<input type="hidden" name="category" value=${bean.category }>
		<input type="hidden" name="ref" value=${bean.ref }>
		<input type="hidden" name="restep" value=${bean.restep }>
		<input type="hidden" name="relevel" value=${bean.relevel }>
		
		<table border=1 width=600 align=center>
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
					<td><input type="text" name="writer" value="">
					</td>
				</tr>
				<tr>
					<td>답글제목</td>
					<td><input type="text" name="title">
					</td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="upload" value="" >
					</td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><textarea name="content" rows="15" cols="50"></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="답글달기">
					<input type="button" value="돌아가기" onclick="location.href='boardDetail.ad?num=${bean.num}&pageNumber=${pageNumber }'">
					</td>
				</tr>
			</table>
			
	</form>
	</center>
</body>
