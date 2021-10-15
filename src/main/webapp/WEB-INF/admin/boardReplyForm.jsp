<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">

<div class="bodyPart content" align="center">
	<div class="formDiv">
	<h2 align="center">관리자 - 게시판 답글쓰기</h2>
	<form action="boardReply.ad" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value=${bean.num }> 
		<input type="hidden" name="pageNumber" value=${pageNumber }> 
		<input type="hidden" name="category" value=${bean.category }>
		<input type="hidden" name="ref" value=${bean.ref }>
		<input type="hidden" name="restep" value=${bean.restep }>
		<input type="hidden" name="relevel" value=${bean.relevel }>
		
		<table class="table table-bordered table-hover wform">
				<tr>
					<th>게시판 카테고리</th>
					<td>${bean.category }</td>
				</tr>
				<tr>
					<th>글번호</th>
					<td>${bean.num }</td>
				</tr>
				<tr>
					<th>작성자ID</th>
					<td><input type="text" name="writer" value="">
					</td>
				</tr>
				<tr>
					<th>답글제목</th>
					<td><input type="text" name="title">
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="upload" value="" >
					</td>
				</tr>
				<tr>
					<th>글 내용</th>
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
	</div>
</div>
<%@ include file="../concert/footer.jsp"%>