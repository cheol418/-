<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"> 

 <style>
	.err{
		font-size:9pt;
		color:red;
		font-weight: bold;
	}
</style>  

<div class="bodyPart content" align="center">
	<div class="formDiv">
<form:form commandName="bean" action="memberUpdate.ad" method="post" enctype="multipart/form-data">
	<input type="hidden" name=pageNumber value="${pageNumber }" >
	<input type="hidden" name=num value="${bean.num }" >
	<table class="table table-bordered table-hover wform">
		<caption style="font-size: 24" >회원 정보 수정</caption>
	<tr>
		<th>회원번호</th>
		<td>${bean.num }</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>
		<input type="text" name="id" value=${bean.id }>
		<form:errors cssClass="err" path="id"/>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="text" name="passwd" value=${bean.passwd }>
		<form:errors cssClass="err" path="passwd"/>
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
		<input type="radio" name="gender" value="남자" <c:if test="${bean.gender eq '남자' }" > checked </c:if> >남자
		<input type="radio" name="gender" value="여자" <c:if test="${bean.gender eq '여자' }" > checked </c:if> >여자
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value=${bean.name }>
		</td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="text" name="age" value=${bean.age }>
		</td>
	</tr>
	<tr>
		<th>사진</th>
		<td>
		<img style="height:100px; width: 150px;" src="<%=request.getContextPath()%>/resources/member/${bean.image}"/><Br>
		<input type="file" name="upload" value="">
		<input type="hidden" name="upload_old" value=${bean.image }>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" value=${bean.phone }>
		</td>
	</tr>
	<tr>
		<th>지역</th>
		<td><input type="text" name="area" value=${bean.area }>
		</td>
	</tr>
	<tr>
		<th>포인트</th>
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
</div>
</div>
<%@ include file="../concert/footer.jsp"%>
