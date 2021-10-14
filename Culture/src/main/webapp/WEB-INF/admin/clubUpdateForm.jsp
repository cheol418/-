<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<style>
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>동아리 정보 수정</h2>
	<form action="clubUpdate.ad" method="post">
		<input type="hidden" name=pageNumber value="${pageNumber }">
		<input type="hidden" name=num value="${bean.num }">
		<table border="1">
			<tr>
				<td>동아리번호</td>
				<td><input type="text" name="num" value=${bean.num } disabled="disabled"></td>
			</tr>
			<tr>
				<td>동아리이름</td>
				<td><input type="text" name="name" value=${bean.name }></td>
			</tr>
			<tr>
				<td>생성일</td>
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

</body>
</html>