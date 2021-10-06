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
	div {
        width: 600px;        
    }
    img {
  		max-width: 100%;
    }
</style>
 <script type="text/javascript">
	function goList(){
		location.href="${board.title}boardList.bd?pageNumber="${pageInfo.pageNumber};
	}
</script>
<b>글수정</b> <br>
<form:form commandName="board" method="post" action="boardUpdate.bd" enctype="multipart/form-data">
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<input type="hidden" name="num" value="${board.num}">
	<table border="1" width="450" align="center">
		<tr>
			<td width="100">이름</td>
			<td width="350">
				<input type="text" name="writer" value="${board.writer}">
				<form:errors cssClass="err" path="writer"/>
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
			<td width="100">카테고리</td>
			<td width="350">
				<input type="text" name="category" value="${board.category}" readonly/>
				<form:errors cssClass="err" path="category"/>
			</td>
		</tr>		
		
		<tr height="50">
			<td align="center">삽입된 그림</td>
			<td colspan="3">
				<div align="center">
					<image src="<%=request.getContextPath()%>/resources/${board.image}"/>
				</div>
				<br clear="left">
				<input type="file" name="pic">
				<input type="hidden" name="pic_old" value="${bean.image}" >
				<form:errors cssClass="err" path="image" />
			</td>			
		</tr>
		
		<tr>
			<td width="100">내용</td>
			
			<td>
				<div>
					<textarea name="content" rows="15" cols="50">${board.content}</textarea>
				</div>
					<form:errors cssClass="err" path="content"/>				
			</td>
			
		</tr>		
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="goList()">
			</td>
		</tr>
	</table>
</form:form>