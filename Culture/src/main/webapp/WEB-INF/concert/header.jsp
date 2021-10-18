<%@page import="user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function gologin(){
		location.href="login.ur";
	}
	function gologout(){
		location.href="logout.ur";
	}
	function goMypage(){
		location.href="mypage.ur";
	}
	function goAdmin(){
		location.href="memberList.ad";
	}
</script>
<%
	UserVo uVo = (UserVo)session.getAttribute("loginInfo");
%>
<div class="bodyPart headerDiv">
	<div class="userDiv">
	<%if(uVo != null){
			if(uVo.getId().equals("admin")){
	%>
				<input class="btn btn-outline-dark logBtn" type="button" value="관리자페이지" onclick="goAdmin()">
	<% 		}else{%>			
				<%=uVo.getName()%>님 환영합니다.
	<%		}%>
		<input class="btn btn-outline-dark logBtn" type="button" value="마이페이지" onclick="goMypage()">
		<input class="btn btn-outline-dark logBtn" type="button" value="로그아웃" onclick="gologout()">
	<%		
		}else{
	%>
		<input class="btn btn-outline-dark logBtn" type="button" value="로그인" onclick="gologin()">
	<%
		}
	%>		
	</div>
	<div class="menuDiv">
		<a href="main.do" class="logoA">
			<img src="resources/images/temp_logo.png"/>
		</a>
		<div class="menuNav">
			<a class="menuBtn" href="main.do">메인</a> / 
			<a class="menuBtn" href="list.do?pageNumber=1&miniclass=">공연목록</a> / 
			<a class="menuBtn" href="">공지사항</a> / 
			<a class="menuBtn" href="">동아리</a> / 
			<a class="menuBtn" href="">게시판</a>
		</div>
	</div>
</div> 