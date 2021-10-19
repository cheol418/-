<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"> 

<div class="bodyPart content" align="center">

	<div class="formDiv">
	
		<form action="boardReply.ad" method="get" >
			<input type="hidden" name="num" value=${bean.num }> 
			<input type="hidden" name="pageNumber" value=${pageNumber }> 
			<input type="hidden" name="category" value=${bean.category }>
			<input type="hidden" name="ref" value=${bean.ref }>
			<input type="hidden" name="restep" value=${bean.restep }>
			<input type="hidden" name="relevel" value=${bean.relevel }>

			<h2>게시판 세부정보</h2>
			<table class="table table-bordered table-hover wform tableThdMidle">
				<tr>
					<th class="txtCenter" width=25%>게시판 카테고리</th>
					<td width=75%>${bean.category }</td>
				</tr>
				<tr>
					<th class="txtCenter">글번호</th>
					<td>${bean.num }</td>
				</tr>
				<tr>
					<th class="txtCenter">작성자ID</th>
					<td>${bean.writer }</td>
				</tr>
				<tr>
					<th class="txtCenter">제목</th>
					<td>${bean.title }</td>
				</tr>
				<tr>
					<th class="txtCenter">사진</th>
					<td><img style="height: 150px; width: 240px;"
						src="<%=request.getContextPath()%>/resources/board/${bean.image}" /><Br>
					</td>
				</tr>
				<tr>
					<th class="txtCenter">글 내용</th>
					<td>${bean.content }</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
					<input class="btn btn-outline-dark logBtn" type="submit" value="답글달기">
					<input class="btn btn-outline-dark logBtn" type="button" value="수정하기" onclick="location.href='boardUpdate.ad?pageNumber=${pageNumber}&num=${bean.num }'">
					<input class="btn btn-outline-dark logBtn" type="button" value="돌아가기" onclick="location.href='boardList.ad?pageNumber=${pageNumber}'">
					</td>
				</tr>
			</table>
		</form>

		</div>
	</div>
<%@ include file="../concert/footer.jsp"%>
	