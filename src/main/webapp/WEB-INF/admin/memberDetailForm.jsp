<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"> 

<div class="bodyPart content" align="center">

<form action="memberUpdate.ad" method="get">
<input type="hidden" name="num" value=${bean.num }>
<input type="hidden" name="pageNumber" value=${pageNumber }>

<table class="table table-bordered table-hover wform tableThdMidle">

<caption style="font-size: 24" >회원 정보</caption>
	<tr>
		<th class="txtCenter">회원번호</th>
		<td>${bean.num }</td>
	</tr>
	<tr>
		<th class="txtCenter">아이디</th>
		<td>
		${bean.id }
		</td>
	</tr>
	<tr>
		<th class="txtCenter">비밀번호</th>
		<td>
		${bean.passwd }
		</td>
	</tr>
	<tr>
		<th class="txtCenter">성별</th>
		<td>
		${bean.gender}
		</td>
	</tr>
	<tr>
		<th class="txtCenter">이름</th>
		<td>
		${bean.name }
		</td>
	</tr>
	<tr>
		<th class="txtCenter">나이</th>
		<td>${bean.age }
		</td>
	</tr>
	<tr>
		<th class="txtCenter">사진</th>
		<td>
		<img style="height:150px; width: 240px;" src="<%=request.getContextPath()%>/resources/userImg/${bean.image}"/><Br>
		</td>
	</tr>
	<tr>
		<th class="txtCenter">전화번호</th>
		<Td>${bean.phone }
		</td>
	</tr>
	<tr>
		<th class="txtCenter">지역</th>
		<td>${bean.area }
		</td>
	</tr>
	<tr>
		<th class="txtCenter">포인트</th>
		<td>${bean.point }
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input class="btn btn-outline-dark logBtn" type="submit" value="수정하기"> 
		<input class="btn btn-outline-dark logBtn" type="button" value="돌아가기" onclick="location.href='memberList.ad?pageNumber=${pageNumber}'"> 
		</td>
	</tr>
</table>
</form>

</div>
</body>