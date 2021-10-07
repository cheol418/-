<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %> 
<%@ include file="adminTop.jsp" %> 
 
<Script type="text/javascript">
function insert(){
	location.href="memberInsert.ad"; 
}

</Script>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- <div align="right">
<a href="">사용자 페이지</a> &nbsp;
<a href="">로그아웃</a> &nbsp;
</div>

<div align="center">
<a href="memberList.ad">회원 관리</a> &nbsp;
<a href="clubList.ad">동아리 관리</a> &nbsp;
<a href="gradeList.ad">등급 관리</a> &nbsp;
<br> 
</div> -->

<h2 align="center">관리자 - 회원 리스트 화면</h2>

<center>
<Form action="memberList.ad" method="get">
	<select name="whatColumn">
		<option value="all">전체검색</option>
		<option value="id">ID</option>
		<option value="name">이름</option>
	</select>
	<input type="text" name="keyword" value="검색어" >
	<input type="submit" value="검색" >
</Form>

</center><br>

<table border="1" align="center">
<tr>
	<td colspan="11 	" align="right">
		<input type="button" value="회원 추가" onclick="insert()">
	</td>
</tr>
<tr>
	<th>회원번호</th>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>성별</th>
	<th>나이</th>
	<th>전화번호</th>
	<th>지역</th>
	<th>포인트</th>
	<th>회원삭제</th>
	<th>정보수정</th>
</tr>
<c:forEach var="member" items="${lists}">
	
	<tr>
		<td>${member.num }</td>
		<td>${member.id }</td>
		<td>${member.passwd }</td>
		<td>${member.name }</td>
		<td>${member.gender }</td>
		<td>${member.age }</td>
		<td>${member.phone }</td>
		<td>${member.area }</td>
		<td>${member.point }</td>
		<td align="center"><a href="memberDelete.ad?num=${member.num}&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
		<td align="center"><a href="memberUpdate.ad?num=${member.num}&pageNumber=${pageInfo.pageNumber}">수정</a></td>
		
	</tr>
</c:forEach>


</table>

<center>
${pageInfo.pagingHtml }
</center>
</body>
</html>