<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/concert.css"> 
<script>
	function initMap(){
	var mark = { lat: ${concert.Y} ,lng: ${concert.X} };
	var map = new google.maps.Map(
        document.getElementById('map'), {
          zoom: 15,
          center: mark
	});
	
	new google.maps.Marker({
		position: mark,
		map: map
	});
	}
</script>
<style>
</style>
<%@ include file="../concert/header.jsp" %>
<table class="table table-bordered concertDetailTable" align="center">
	<tr>
		<td class="imgTd" rowspan="6" align="center" width="200" height="200">
			<img class="conDetailImg" src="${concert.IMGURL}">
		</td>
		<td width="130">제목</td>
		<td width="500">${concert.SVCNM}</td>
		<td width="110">지역</td>
		<td>${concert.AREANM}</td>
	</tr>
	<tr>
		<td>대분류[소분류]</td>
		<td>${concert.MAXCLASSNM}[ ${concert.MINCLASSNM} ]</td>
		<td>접수 상태</td>
		<td>${concert.SVCSTATNM}</td>
	</tr>
	<tr>
		<td>장소</td>
		<td>${concert.PLACENM}</td>
		<td>결제방법</td>
		<td>${concert.PAYATNM}</td>
	</tr>
	<tr>
		<td>접수시작일</td>
		<td>
			<fmt:parseDate value="${concert.RCPTBGNDT}" var="pRcptbgndt" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${pRcptbgndt}" var="fRcptbgndt" pattern="yyyy-MM-dd"/>
			${fRcptbgndt}
		</td>
		<td>접수종료일</td>
		<td>
			<fmt:parseDate value="${concert.RCPTENDDT}" var="pRcptenddt" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${pRcptenddt}" var="fRcptenddt" pattern="yyyy-MM-dd"/>
			${fRcptenddt}
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${concert.TELNO}</td>
		<td>이용시간</td>
		<td>${concert.V_MIN}~${concert.V_MAX}</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<a href="${concert.SVCURL}" target="_blank">
				예약하기
			</a><br/>
			<input type="button" value="같이가 모집하기" onClick="location.href='<%=request.getContextPath()%>/clubBoardMakeForm.bd?uid=son&SVCID=${concert.SVCID}'"><br/>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			${concert.DTLCONT}
		</td>
	</tr>
	<tr>
		<td colspan="5" align="center">
			<a href="${concert.SVCURL}" target="_blank">
				예약하기
			</a>
		</td>
	</tr>
</table>
<table class="table table-bordered concertDetailMap" align="center" border="1">
	<tr>
		<td>오시는 길</td>
		<td>
			<div id="map">
				<script async
				    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVVvjWSIjTYymU9Xkhcmq7oJ09y_HixZc&callback=initMap">
				</script>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<a href="main.do">목록보기</a>
		</td>
	</tr>
</table>
<%@ include file="../concert/footer.jsp" %>