<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>

<body align=center>
	<h2 align="center">관리자 - 게시판 글수정</h2>
	<form action="boardUpdate.ad" method="post" enctype="multipart/form-data">
	<input type="hidden" name=pageNumber value="${pageNumber }" >
	<input type="hidden" name=num value="${bean.num }" >
	<table>
		<tr>
			<td>카테고리</td> 
			<td>
			<select name="category">
				<option value="notice">공지사항
				<option value="qna">QnA
				<option value="club">동아리
			</select>
		</td>
		</tr>
		<tr>
			<td>작성자ID</td>
			<td>
			 <input type="text" name="writer" value="${bean.writer }">
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
			 <input type="text" name="title" value="${bean.title }">
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>
			<img style="height:100px; width: 150px;" src="<%=request.getContextPath()%>/resources/board/${bean.image}"/><Br>
			<input type="file" name="upload" value="${bean.image }" >
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td>
			<textarea name="content" rows="15" cols="50" >${bean.content }</textarea>
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</td>
		</tr>
		
		<tr>
		<td colspan="2">
			<input type="submit" value="작성하기"> &nbsp;
			<input type="reset" value="돌아가기">
		</td>
		</tr>


		</table>
	</form>
	
</body>
