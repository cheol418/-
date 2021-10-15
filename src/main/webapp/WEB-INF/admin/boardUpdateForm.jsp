<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"> 

<div class="bodyPart content" align="center">
	<div class="formDiv">

	<h2 align="center">게시판 글수정</h2>
	<form action="boardUpdate.ad" method="post" enctype="multipart/form-data">
	<input type="hidden" name=pageNumber value="${pageNumber }" >
	<input type="hidden" name=num value="${bean.num }" >
		<table class="table table-bordered table-hover wform">
		<tr>
			<th>카테고리</th> 
			<td>
			<select name="category">
				<option value="notice">공지사항
				<option value="qna">QnA
				<option value="club">동아리
			</select>
		</td>
		</tr>
		<tr>
			<th>작성자ID</th>
			<td>
			 <input type="text" name="writer" value="${bean.writer }">
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
			 <input type="text" name="title" value="${bean.title }">
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
			<img style="height:100px; width: 150px;" src="<%=request.getContextPath()%>/resources/board/${bean.image}"/><Br>
			<input type="file" name="upload" value="${bean.image }" >
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td>
			<textarea name="content" rows="15" cols="50" >${bean.content }</textarea>
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
			<input type="submit" value="작성하기"> &nbsp;
			<input type="reset" value="돌아가기" onclick="history.go(-1)">
		</td>
		</tr>


		</table>
	</form>
	
</div>
</div>
<%@ include file="../concert/footer.jsp"%>
