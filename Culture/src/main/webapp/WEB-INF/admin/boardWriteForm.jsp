<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>

<body align=center>
	<h2 align="center">관리자 - 게시판 글쓰기</h2>
	<form action="boardWrite.ad" method="post" enctype="multipart/form-data">
	
		<p>
			카테고리 
			<select name="category">
				<option value="notice">공지사항
				<option value="qna">QnA
				<option value="club">동아리
			</select>
		</p>
		
		<p>
			작성자ID <input type="text" name="writer" value="">
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</p>
		<p>
			제목 <input type="text" name="title">
		</p>
		<p>
			사진 	
			<input type="file" name="upload" value="${boardBean.image }" >
		</p>

		<p>
			글내용 <textarea name="content" rows="15" cols="50"></textarea>
		</p>
		<p>
			<input type="submit" value="작성하기"> &nbsp;
			<input type="reset" value="돌아가기">
		</p>




	</form>
</body>
