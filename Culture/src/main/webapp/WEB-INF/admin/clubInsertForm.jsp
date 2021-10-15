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

<h2>동아리 추가</h2>
<form action="clubInsert.ad" method="post" name="myform">
<table class="table table-bordered table-hover wform">
	<tr>
	<th>
	동아리명</th>
	<td> <input type="text" name="name">
</td>
</tr>
	<tr>
	<td colspan="2" align="center">
<input type="submit" value="추가하기"></td>
	</tr>
</table>
</form>
</div>

<%@ include file="../concert/footer.jsp"%>

