<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/user.css"> 
<%
	UserVo userInfo = (UserVo)session.getAttribute("loginInfo");
%>
<%@ include file="../concert/header.jsp" %>
<script type="text/javascript">
	function editProfile(){
		location.href="userEdit.ur";
	}
	function attendChk(){
		location.href="attendChk.ur";
	}
</script>
<div class="bodyPart content">
	<div class="userPageConDiv">
		<h4>나의 정보</h4>
		<table class="table table-bordered mpTable">
			<tr>
				<td rowspan="3" colspan="2">
					<img class="mpImg" src="<%=request.getContextPath()%>/resources/userImg/<%=userInfo.getImage()%>">
				</td>
				<td>이름</td>
				<td><%=userInfo.getName()%></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=userInfo.getGender()%></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=userInfo.getAge()%></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=userInfo.getEmail()%></td>
				<td>전화번호</td>
				<td><%=userInfo.getPhone()%></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><%=userInfo.getArea()%></td>
				<td>포인트</td>
				<td class="">
					<%=userInfo.getPoint()%> 점
					<c:if test="${attend}">
						<input type="button" class="btn btn-outline-primary btnAttend" value="출석" onclick="attendChk()">
					</c:if>
					<c:if test="${!attend}">
						<input type="button" class="btn btn-secondary btnAttend delHover" value="출석완료">
					</c:if>
				</td>
			</tr>
		</table>
		<input type="button" class="btn btn-outline-dark" value="정보수정" onclick="editProfile()">
	</div>
</div>
<%@ include file="../concert/footer.jsp" %>