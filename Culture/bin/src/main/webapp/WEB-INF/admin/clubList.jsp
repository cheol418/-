<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>

<Script type="text/javascript">
	function insert() {
		location.href = "clubInsert.ad";
	}
</Script>

<body>


	<h2 align="center">관리자 - 동아리 리스트 화면</h2>

	<center>
		<Form action="clubList.ad" method="get">
			<select name="whatColumn">
				<option value="all">전체검색</option>
				<option value="name">동아리명</option>
				<option value="cdate">생성일</option>
			</select> <input type="text" name="keyword" value="검색어를 입력하세요"> <input
				type="submit" value="검색">
		</Form>
	</center>
	<br>

	<table border="1" align="center">
		<tr>
			<td colspan="5" align="right"><input type="button"
				value="동아리 추가" onclick="insert()"></td>
		</tr>
		<tr>
			<th>동아리번호</th>
			<th>동아리명</th>
			<th>생성일</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<c:forEach var="club" items="${lists}">

			<tr>
				<td>${club.num }</td>
				<td>${club.name }</td>
				<td><fmt:parseDate value="${club.cdate }" pattern="yyyy-MM-dd"
						var="RegDate" /> <fmt:formatDate value="${RegDate}"
						pattern="yyyy-MM-dd" var="RegDate" /> ${RegDate}</td>
				<td align="center"><a
					href="clubDelete.ad?num=${club.num}&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
				<td align="center"><a
					href="clubUpdate.ad?num=${club.num}&pageNumber=${pageInfo.pageNumber}">수정</a></td>

			</tr>
		</c:forEach>

	</table>

	<center>${pageInfo.pagingHtml }</center>
</body>
</html>