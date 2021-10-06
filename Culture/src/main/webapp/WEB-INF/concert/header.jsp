<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function gologin(){
		location.href="login.ur";
	}
</script>
<div class="bodyPart headerDiv">
	<div class="userDiv">
		<input class="btn " type="button" value="로그인" onclick="gologin()">
	</div>
	<div class="menuDiv">
		<a href="main.do" class="logoA">
			<img src="resources/images/temp_logo.png"/>
		</a>
		<div class="menuNav">
			<a class="menuBtn" href="main.do">메인</a> / 
			<a class="menuBtn" href="list.do?pageNumber=1">공연목록</a> / 
			<a class="menuBtn" href="">공지사항</a> / 
			<a class="menuBtn" href="">동아리</a> / 
			<a class="menuBtn" href="">게시판</a>
		</div>
	</div>
</div>