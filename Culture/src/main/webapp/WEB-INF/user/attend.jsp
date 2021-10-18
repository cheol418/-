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
</script>
<div class="bodyPart content">
	<div class="userPageConDiv">
		<h4>출석체크</h4>
		<table class="table">
			<tr>
				<td>
					<div class="alert alert-secondary">
						<input type="text" name="">
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="../concert/footer.jsp" %>