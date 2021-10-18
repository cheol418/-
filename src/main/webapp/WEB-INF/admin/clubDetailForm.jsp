<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"> 

<style>
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>

<div class="bodyPart content" align="center">
	<div class="formDiv">

	<form action="clubDetail.ad" method="post">
		<input type="hidden" name=pageNumber value="${pageNumber }">
		<input type="hidden" name=num value="${bean.num }">
		<table class="table table-bordered table-hover wform">
		<caption style="font-size: 24" >동아리 수정</caption>
			<tr>
				<th>동아리번호</th>
				<td><input type="text" name="num" value=${bean.num } disabled="disabled"></td>
			</tr>
			<tr>
				<th>동아리이름</th>
				<td><input type="text" name="name" value=${bean.name } disabled="disabled"></td>
			</tr>
			<tr>
				<th>생성일</th>
				<td><fmt:parseDate value="${bean.cdate}" pattern="yyyy-MM-dd"
						var="pRegDate" /> <fmt:formatDate value="${pRegDate}"
						pattern="yyyy/MM/dd" var="fRegDate" />
						<input type="text" name="cdate" value="${fRegDate}" disabled="disabled">
						</td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="수정하기"> <input type="button" value="돌아가기"
					onclick="location.href='memberList.ad?pageNumber=${pageNumber}'">
				</td>
			</tr>
		</table>
	</form>
			
			<div class="formDiv">
		
		<table class="table table-bordered table-hover mainboard">
			<tr>
			<td>댓글창</td>
			
			</tr>
		</table>
		</div>
		
	</div>
	</div>
