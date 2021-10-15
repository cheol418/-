<%@page import="user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function gologout(){
		location.href="logout.ur";
	}
	function goMypage(){
		location.href="main.do";
	}
</script>
    
<%@ include file="../common/common.jsp" %>
<div class="bodyPart headerDiv">
	<div class="userDiv">

<%-- <%
	UserVo uVo = (UserVo)session.getAttribute("loginInfo");
%>
	<%=uVo.getName()%> 님 환영합니다. --%>
	
		<input class="btn btn-outline-dark logBtn" type="button" value="메인페이지" onclick="goMypage()">
		<input class="btn btn-outline-dark logBtn" type="button" value="로그아웃" onclick="gologout()">
	</div>
	
	<div class="menuDiv">
		<a href="main.do" class="logoA">
			<img src="resources/images/temp_logo.png"/>
		</a>
		<div class="menuNav">
			<a class="menuBtn" href="memberList.ad">회원 관리</a> / 
			<a class="menuBtn" href="clubList.ad">동아리 관리</a> / 
			<a class="menuBtn" href="boardList.ad">게시판 관리</a> 
		</div>

</div>

</div>