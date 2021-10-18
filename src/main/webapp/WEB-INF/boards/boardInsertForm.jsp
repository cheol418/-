<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<style type="text/css">
	body{
		align:center;
		text-align: center;
	}
	.err{
		font-size:9pt;
		color:red;
		font-weight:bold;
	}
</style>
 <script type="text/javascript">
	
 	function goList(){
		location.href="${fCategory}BoardList.bd?pageNumber=${pageInfo.pageNumber}";
	}
 	
</script>
<b>글쓰기</b> <br>
<form:form commandName="board" method="post" action="boardInsert.bd" enctype="multipart/form-data" >
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<table border="1" width="450" align="center">
		<tr>
			<td colspan="2" align="right">
				<a href="${fCategory}BoardList.bd?pageNumber=${pageInfo.pageNumber}">글목록</a>
			</td>
		</tr>
		<tr>
			<td width="100">이름</td>
			<td width="350">
				<input type="text" name="writer" value="${board.writer}">
				<form:errors cssClass="err" path="writer"/>
			</td>
		</tr>
		
		<tr>
			<td width="100">카테고리</td>
			<td width="350">
				<input type="text" name="category" value="${fCategory}" readonly/>
				<form:errors cssClass="err" path="category"/>
			</td>
		</tr>		
		
		<tr>
			<td width="100">제목</td>
			<td width="350">
				<input type="text" name="title" value="${board.title}">
				<form:errors cssClass="err" path="title"/>
			</td>
		</tr>
				 
		<tr>
			<td width="100">사진</td>
			<td width="350">
				<input type="file" name="pic">
				<form:errors cssClass="err" path="image"/>
			</td>					
		</tr>
				
		<tr>
			<td width="100">내용</td>
			<td width="350">
				<textarea name="content" rows="15" cols="50">${board.content}</textarea>
				<form:errors cssClass="err" path="content"/>
			</td>
		</tr>
		
		
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="goList()">
			</td>
		</tr>
	</table>
</form:form>