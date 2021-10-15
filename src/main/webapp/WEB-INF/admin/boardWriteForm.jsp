<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"> 

<div class="bodyPart content" align="center">
	<div class="formDiv">
	<form action="boardWrite.ad" method="post" enctype="multipart/form-data">
		<table class="table table-bordered table-hover wform">
		<caption style="font-size: 24" >게시판 글쓰기</caption>
		<tr>
			<th>
			카테고리</th>
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
			<td><input type="text" name="writer" value="" size="20"></td>
			<!-- 로그인시 아이디 session 받아와서 사용 -->
		</tr>
		<tr>
			<th>제목</th>
			<td> <input type="text" name="title" size="20"> </td>
		</tr>
		<tr>
			<th>사진 </th>	
			<Td><input type="file" name="upload" value="${boardBean.image }" ></Td>
		</tr>

		<tr>
			<th>글내용</th> 
			<td><textarea name="content" rows="15" cols="60"></textarea></td>
		</tr>
		<tr>
			<td colspan=2 align="center">
			<input class="btn btn-outline-dark logBtn" type="submit" value="작성하기"> 
			<input class="btn btn-outline-dark logBtn" type="reset" value="돌아가기"> </td>
		</tr>
	</table>
	</form>
	</div>
</div>
<%@ include file="../concert/footer.jsp"%>
