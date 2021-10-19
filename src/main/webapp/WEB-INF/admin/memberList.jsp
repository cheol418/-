<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">

<Script type="text/javascript"> 
	function insert() {
		location.href = "memberInsert.ad";
	}
</Script>

<div class="bodyPart content" align="center">

	<h2 align="center">회원 목록</h2>

	<div class="input-group ">
		<Form action="memberList.ad" method="get" style="margin: auto">
			<div class="input-group-prepend">
				<select name="whatColumn" class="custom-select selectMinBox">
					<option value="all">선택</option>
					<option value="id">ID</option>
					<option value="name">이름</option>
				</select> <input type="text" class="form-control adminTopInput"
					name="keyword"> <input
					class="btn btn-outline-dark logBtn adminTopInput" type="submit"
					value="검색">
			</div>
		</Form>
	</div>
	<div class="conDiv">
		<table class="table table-bordered table-hover mainboard">
			<tr>
				<td colspan="6" align="right"><input
					class="btn btn-outline-dark logBtn" type="button" value="회원 추가"
					onclick="insert()"></td>
			</tr>
			<tr>
				<th width="81" class="txtCenter">회원번호</th>
				<th class="txtCenter">아이디</th>
				<th class="txtCenter">비밀번호</th>
				<th class="txtCenter">이름</th>
				<th width="81" class="txtCenter">회원삭제</th>
				<th width="81" class="txtCenter">정보수정</th>
			</tr>
			<c:forEach var="member" items="${lists}">

				<tr>
					<td class="txtCenter">${member.num }</td>
					<td class="txtCenter">
						<a href="memberDetail.ad?num=${member.num }&pageNumber=${pageInfo.pageNumber}">${member.id }</a>
					</td>
					<td class="txtCenter">${member.passwd}</td>
					<td class="txtCenter">${member.name }</td>
					<td class="txtCenter">
						<a href="memberDelete.ad?num=${member.num}&pageNumber=${pageInfo.pageNumber}">삭제</a>
					</td>
					<td class="txtCenter">
						<a href="memberUpdate.ad?num=${member.num}&pageNumber=${pageInfo.pageNumber}">수정</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		${pageInfo.pagingHtml }
	</div>
</div>
<%@ include file="../concert/footer.jsp"%>