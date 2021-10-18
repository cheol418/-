<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
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
<form:form commandName="memberBean" action="memberInsert.ad" method="post" name="myform" enctype="multipart/form-data">
	<table class="table table-bordered table-hover wform">
		<caption style="font-size: 24" >회원 추가</caption>

<tr>
	<th>ID</th>
	<td> <input type="text" name="id" value="${memberBean.id }">
	<form:errors cssClass="err" path="id"/></td>
	
</tr>

<tr>
	<th>비밀번호</th>
	<td> <input type="text" name="passwd" value="${memberBean.passwd }">
	<form:errors cssClass="err" path="passwd"/> </td>
	
</tr>

<tr>
	<th>이름</th>
	<td> <input type="text" name="name" value="${memberBean.name }"> </td>
	
</tr>

<tr>
	<th>사진 </th>
	<td><input type="file" name="upload" value="${memberBean.image }" ></td>
	
</tr>

<tr>
	<th>성별</th>
	<td><input type="radio" name="gender" value="남자">남자
	<input type="radio" name="gender" value="여자">여자</td>
</tr>

<tr>
	<th>나이</th>
	<td> <input type="text" name="age" value="${memberBean.age}"></td>
	
</tr>

<tr>
	<th>이메일</th>
	<td> <input type="text" name="email" value="${memberBean.email }"> </td>
	
</tr>
<tr>
	<th>전화번호</th>
	<td> <input type="text" name="phone" value="${memberBean.phone }"></td>
	
</tr>

<tr>
	<th>지역 </th>
	<td> <input type="text" name="area" value="${memberBean.area }"> </td>
	
</tr>
	<tr>
	<td colspan=2 align="center">
<input type="submit" value="추가하기"></td>
	</tr>
</table>
	</form:form>
	</div>
</div>

