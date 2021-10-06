<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
 <style>
	.err{
		font-size:9pt;
		color:red;
		font-weight: bold;
	}
</style>  
	
memberInsertForm.jsp<br>

<h1>회원 추가 화면</h1>
<form:form commandName="memberBean" action="memberInsert.ad" method="post" name="myform" enctype="multipart/form-data">

<p>
	*ID <input type="text" name="id" value="${memberBean.id }">
	<form:errors cssClass="err" path="id"/>
	
</p>

<p>
	*비밀번호 <input type="text" name="passwd" value="${memberBean.passwd }">
	<form:errors cssClass="err" path="passwd"/>
	
</p>

<p>
	*이름 <input type="text" name="name" value="${memberBean.name }">
	
</p>

<p>
	*사진 
	<input type="file" name="upload" value="${memberBean.image }" >
	
</p>

<p>
	<input type="radio" name="gender" value="남자">남자
	<input type="radio" name="gender" value="여자">여자
</p>

<p>
	*나이 <input type="text" name="age" value="${memberBean.age}">
	
</p>

<p>
	*이메일 <input type="text" name="email" value="${memberBean.email }">
	
</p>
<p>
	*전화번호 <input type="text" name="phone" value="${memberBean.phone }">
	
</p>

<p>
	*지역 <input type="text" name="area" value="${memberBean.area }">
	
</p>
	
<input type="submit" value="추가하기">

</form:form>


