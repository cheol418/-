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
	<tr class="bold6">
		<td class="imgTd" rowspan="6" align="center" width="200" height="200">
			<img class="conDetailImg" src="${concert.IMGURL}">
		</td>
		<td width="140">제목</td>
		<td width="490">${concert.SVCNM}</td>
		<td width="110">지역</td>
		<td>${concert.AREANM}</td>
	</tr>
	<tr class="bold6">
		<td>대분류[소분류]</td>
		<td>${concert.MAXCLASSNM}[ ${concert.MINCLASSNM} ]</td>
		<td>접수 상태</td>
		<td>${concert.SVCSTATNM}</td>
	</tr>
	<tr class="bold6">
		<td>장소</td>
		<td>${concert.PLACENM}</td>
		<td>결제방법</td>
		<td>${concert.PAYATNM}</td>
	</tr>
	<tr class="bold6">
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
	<tr class="bold6">
		<td>전화번호</td>
		<td>${concert.TELNO}</td>
		<td>이용시간</td>
		<td>${concert.V_MIN}~${concert.V_MAX}</td>
	</tr>
	<tr class="bold6">
		<td colspan="4" align="center" class="btnArea">
			<input type="button" class="btn btn-light" value="예약하기" onclick="window.open('${concert.SVCURL}','_blank')">
			<input type="button" class="btn btn-info" value="같이가!" onClick="location.href='<%=request.getContextPath()%>/clubBoardMakeForm.bd?SVCID=${concert.SVCID}'">
		</td>
	</tr>
	<tr>
		<td colspan="5">
			${concert.DTLCONT}
		</td>
	</tr>
	<tr>
		<td colspan="5" align="center" class="btnArea">
			<input type="button" class="btn btn-light" value="예약하기" onclick="window.open('${concert.SVCURL}','_blank')">
			<input type="button" class="btn btn-info" value="같이가!" onClick="location.href='<%=request.getContextPath()%>/clubBoardMakeForm.bd?uid=son&SVCID=${concert.SVCID}'">
		</td>
	</tr>
</table>
<table class="table table-bordered concertDetailMap" align="center" border="1">
	<tr class="bold6">
		<td class="txtCenter">오시는 길</td>
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
			<input type="button" class="btn btn-secondary" value="뒤로가기" onclick="javascript:history.back()">
			<input type="button" class="btn btn-secondary" value="목록보기" onclick="location.href='list.do?pageNumber=1&miniclass=${miniclass}'">
		</td>
	</tr>
</table>
<%@ include file="../concert/footer.jsp" %>