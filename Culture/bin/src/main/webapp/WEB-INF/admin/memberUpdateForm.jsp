<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
 <style>
	.err{
		font-size:9pt;
		color:red;
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

<h2>회원 정보 수정</h2>
<form:form commandName="bean" action="memberUpdate.ad" method="post" enctype="multipart/form-data">
	<input type="hidden" name=pageNumber value="${pageNumber }" >
	<input type="hidden" name=num value="${bean.num }" >
<table border="1"> 
	<tr>
		<td>회원번호</td>
		<td>${bean.num }</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
		<input type="text" name="id" value=${bean.id }>
		<form:errors cssClass="err" path="id"/>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="passwd" value=${bean.passwd }>
		<form:errors cssClass="err" path="passwd"/>
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
		<input type="radio" name="gender" value="남자" <c:if test="${bean.gender eq '남자' }" > checked </c:if> >남자
		<input type="radio" name="gender" value="여자" <c:if test="${bean.gender eq '여자' }" > checked </c:if> >여자
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value=${bean.name }>
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age" value=${bean.age }>
		</td>
	</tr>
	<tr>
		<td>사진</td>
		<td>
		<img style="height:100px; width: 150px;" src="<%=request.getContextPath()%>/resources/${bean.image}"/><Br>
		<input type="file" name="upload">
		<input type="hidden" name="upload_old" value=${bean.image }>
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="phone" value=${bean.phone }>
		</td>
	</tr>
	<tr>
		<td>지역</td>
		<td><input type="text" name="area" value=${bean.area }>
		</td>
	</tr>
	<tr>
		<td>포인트</td>
		<td><input type="text" name="point" value=${bean.point }>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="수정하기"> 
		<input type="button" value="돌아가기" onclick="location.href='memberList.ad?pageNumber=${pageNumber}'"> 
		</td>
	</tr>
</table>
</form:form>

</body>
</html>