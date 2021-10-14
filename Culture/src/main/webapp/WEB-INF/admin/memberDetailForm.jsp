<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 

<body>
<div align="center" width="600">
memberDetailForm.jsp<br>

<form action="memberUpdate.ad" method="get">
<input type="hidden" name="num" value=${bean.num }>
<input type="hidden" name="pageNumber" value=${pageNumber }>

<h2>회원 정보</h2>
<table border=1 width=400>
	<tr>
		<td>회원번호</td>
		<td>${bean.num }</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
		${bean.id }
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
		${bean.passwd }
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
		${bean.gender}
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
		${bean.name }
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${bean.age }
		</td>
	</tr>
	<tr>
		<td>사진</td>
		<td>
		<img style="height:150px; width: 240px;" src="<%=request.getContextPath()%>/resources/member/${bean.image}"/><Br>
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<Td>${bean.phone }
		</td>
	</tr>
	<tr>
		<td>지역</td>
		<td>${bean.area }
		</td>
	</tr>
	<tr>
		<td>포인트</td>
		<td>${bean.point }
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="수정하기"> 
		<input type="button" value="돌아가기" onclick="location.href='memberList.ad?pageNumber=${pageNumber}'"> 
		</td>
	</tr>
</table>
</form>

</div>
</body>