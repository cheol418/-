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
	

<div width=600 align="center">	
clubInsertForm.jsp<br>
<h2>동아리 추가</h2>
<form action="clubInsert.ad" method="post" name="myform">

<p>
	동아리명 <input type="text" name="name">
</p>
	
<input type="submit" value="추가하기">

</form>
</div>


